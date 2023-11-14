// vite.config.js
import { defineConfig } from 'vite';

export default defineConfig({
  base: './',
  define: {
    'window.jQuery': 'jQuery'
  },
  css: {
    preprocessorOptions: {
      scss: {
      }
    },
    sourceMap: true, // to włączy generowanie sourcemaps
  },
  build: {


    cssSourceMap: true,
    rollupOptions: {
      external: ['jquery'],
      output: {
        globals: {
          jquery: 'jQuery'
        },
        assetFileNames: 'assets/[name][extname]',
        entryFileNames: 'main.js',
        chunkFileNames: '[name].js',
      },
    },
  },

});
