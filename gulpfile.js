var gulp = require('gulp');
var sass = require('gulp-sass');
var uglify = require('gulp-uglify');
var cleanCSS = require('gulp-clean-css');
var autoprefixer = require('gulp-autoprefixer');
var svgo = require('gulp-svgo');
var livereload = require('gulp-livereload');
var webpackStream = require('webpack-stream');
var sort = require('gulp-sort');
var concat = require('gulp-concat');
var rename = require('gulp-rename');
var gutil = require('gulp-util');
var imagemin = require('gulp-imagemin');
var sourcemaps = require('gulp-sourcemaps');
var export_sass = require('node-sass-export');
var dedupe = require('gulp-dedupe');
var gzip = require('gulp-gzip');
var zip = require('gulp-zip');
var gulpIgnore = require('gulp-ignore');
var stripCssComments = require('gulp-strip-css-comments');
var strip = require('gulp-strip-comments')
var gulpCopy = require('gulp-copy')
var trimlines = require('gulp-trimlines');
var deleteLines = require('gulp-delete-lines');
var removeEmptyLines = require('gulp-remove-empty-lines');
var htmlmin = require('gulp-htmlmin');
var replace = require('gulp-replace');

var SASS_FILES = ['style/*.scss'];
var JS_FILES = ['js/lib/{,**/}*.js', '!js/lib/{,**/}*.min.js'];
var JS_ES6_FILES = ['js/es6/{,**/}*.js'];
var JS_DEST = 'js/live';

var LIVE_GFX_DEST = 'live/gfx/pol';
var LIVE_TPL_DEST = 'live/smarty_templates';

var FILES_TO_RELOAD = [ //only js in lib folder
  '../../mysite/{,**/}*.*',
  'js/lib/{,**/}*.js', '!js/lib/{,**/}*.min.js',
  'tpl/{,**/}*.tpl',
  'images/**'
]

/** TODO
 * 1. require('pixrem')(), // add fallbacks for rem units
 */

gulp.task('sass', [], function () {
  return gulp.src(SASS_FILES)
    .pipe(sourcemaps.init())
    .pipe(sass(
      {
        functions: export_sass('.')
      }
    ).on('error', sass.logError))
    // .pipe(autoprefixer({                                 //todo: only to fix *.map 
    //   browsers: ['last 2 versions'],
    //   cascade: false
    // }))
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('css/'))
    .pipe(livereload())
});


// uruchamia wszystkie taski poniżej
gulp.task('live', ['sass', 'shop-css', 'shop-js'], function () {
  return gulp.src(['iai/**'])
    .pipe(gulpIgnore.exclude('*.zip'))
    .pipe(zip('ArchiveALL.zip'))
    .pipe(gulp.dest('dist'))
})
// tworzy css gzip
gulp.task('shop-css', function () {
  return gulp.src('css/index.css')
    .pipe(stripCssComments('css/index.css'))
    .pipe(rename('style.css'))
    .pipe(cleanCSS({ compatibility: 'ie8', debug: true }, (details) => {
      console.log(`${details.name}: ${details.stats.originalSize}`);
      console.log(`${details.name}: ${details.stats.minifiedSize}`);
    }))
    .pipe(gulp.dest('iai/gfx/pol/'))
    .pipe(gzip({ extension: 'gzip' }))
    .on('error', function (err) { gutil.log(gutil.colors.red('[Error]'), err.toString()); })
    .pipe(gulp.dest('iai/gfx/pol/'));
});
// tworzy plik shop.js i tworzy shop.js.gzip
gulp.task('shop-js', function () {
  return gulp.src('js/shop.js')
    .pipe(dedupe())
    .pipe(gulp.dest('iai/gfx/pol/'))
    .pipe(rename('shop.js'))
    .pipe(gzip({ extension: 'gzip' }))
    .on('error', function (err) { gutil.log(gutil.colors.red('[Error]'), err.toString()); })
    .pipe(gulp.dest('iai/gfx/pol/'));
});
// pakuje tylko xlst
gulp.task('zip-tpl', function () {
  return gulp.src(['iai/**', '!iai/gfx/**'])
    .pipe(gulpIgnore.exclude('*.zip'))
    .pipe(zip('tpl.zip'))
    .pipe(gulp.dest('dist'))
});

// pakuje wszystko
gulp.task('zip-all', function () {
  return gulp.src(['iai/*'])
    .pipe(gulpIgnore.exclude('*.zip'))
    .pipe(zip('ArchiveALL.zip'))
    .pipe(gulp.dest('dist'))
});

gulp.task('dev-watch', ['sass'], function () {
  livereload.listen();
  gulp.watch(['style/**/*.scss'], ['sass']);
  gulp.watch(JS_ES6_FILES, ['es6']);
  gulp.watch(FILES_TO_RELOAD).on('change', function (e) { console.log(e); livereload.reload() });
});



// DEV TASK
gulp.task('default', ['dev-watch']);

