jQuery(document).ready(function($){

	$('body').on('click', '.kod_rabatowy_mundail', function(){
		copyToClipboard($(this).find('b').text());
		$('.kod_rabatowy_mundail').html('<i class="icon-check" aria-hidden="true"></i> Kod rabatowy "<b>'+$(this).find('b').text()+'</b>" został skopiowany').addClass('copied');
	});

	invertLogo()

	$('.ks-projects-container').on('scroll', function(){
		invertLogo()
	})

	function invertLogo(){
		if($('.ks-projects-container').scrollTop() > $(window).height() ){
			$('.konesso-logo').addClass('invert')
		}else{
			$('.konesso-logo').removeClass('invert')
		}
	}



	function copyToClipboard(element) {
		var $temp = $("<input>");
		$("body").append($temp);
		$temp.val(element).select();
		document.execCommand("copy");
		$temp.remove();
	}

	//cache DOM elements
	var projectsContainer = $('.ks-projects-container'),
		projectsPreviewWrapper = projectsContainer.find('.ks-projects-previews'),
		projectPreviews = projectsPreviewWrapper.children('li'),
		projects = projectsContainer.find('.ks-projects'),
		navigationTrigger = $('.ks-nav-trigger'),
		navigation = $('.ks-primary-nav'),
		//if browser doesn't support CSS transitions...
		transitionsNotSupported = ( $('.no-csstransitions').length > 0);

	var animating = false,
		//will be used to extract random numbers for projects slide up/slide down effect
		numRandoms = projects.find('li').length, 
		uniqueRandoms = [];

	if(!window.location.hash)
		window.location.hash = '#index';

	hashchange()

	$(window).on('hashchange', () => {
		
		hashchange()
	})

	function hashchange(){
		if(window.location.hash == '#konkurs'){
			navigationTrigger.add(projectsContainer).removeClass('project-open');
			closeProject();
			$('.lysy-content').addClass('hide')
			navigationTrigger.add(projectsContainer).addClass('project-open');
			closeProject();
			openProject($('li > a[href="#konkurs"]').parent('li'));
		} else if(window.location.hash == '#promocja'){
			navigationTrigger.add(projectsContainer).removeClass('project-open');
			closeProject();
			$('.lysy-content').addClass('hide')
			navigationTrigger.add(projectsContainer).addClass('project-open');
			openProject($('li > a[href="#promocja"]').parent('li'));
		} else {
			navigationTrigger.add(projectsContainer).removeClass('project-open');
			closeProject();
			$('.lysy-content').removeClass('hide')
		}
	}
	//open project
	projectsPreviewWrapper.on('click', 'a', function(event){
		
		event.preventDefault();

		window.location.hash = $(this).attr('href')

		// if( animating == false ) {
		// 	animating = true;
		// 	navigationTrigger.add(projectsContainer).addClass('project-open');
		// 	openProject($(this).parent('li'));
		// }
	});

	navigationTrigger.on('click', function(event){
		event.preventDefault();
		
		if( animating == false ) {
			animating = true;
			if( navigationTrigger.hasClass('project-open') ) {
				//close visible project
				window.location.hash = '#index';

			} else if( navigationTrigger.hasClass('nav-visible') ) {
				//close main navigation
				navigationTrigger.removeClass('nav-visible');
				navigation.removeClass('nav-clickable nav-visible');
				$('.lysy-content').removeClass('hide')
				if(transitionsNotSupported) projectPreviews.removeClass('slide-out');
				else slideToggleProjects(projectsPreviewWrapper.children('li'), -1, 0, false);
			} else {
				//open main navigation
				navigationTrigger.addClass('nav-visible');
				navigation.addClass('nav-visible');
				$('.lysy-content').addClass('hide')
				if(transitionsNotSupported) projectPreviews.addClass('slide-out');
				else slideToggleProjects(projectsPreviewWrapper.children('li'), -1, 0, true);
			}
		}	

		if(transitionsNotSupported) animating = false;
	});

	//scroll down to project info
	projectsContainer.on('click', '.scroll', function(){
		projectsContainer.animate({'scrollTop':$(window).height()}, 500); 
	});

	//check if background-images have been loaded and show project previews
	projectPreviews.children('a').bgLoaded({
	  	afterLoaded : function(){
	   		showPreview(projectPreviews.eq(0));
	  	}
	});

	function showPreview(projectPreview) {
		if(projectPreview.length > 0 ) {
			setTimeout(function(){
				projectPreview.addClass('bg-loaded');
				showPreview(projectPreview.next());
			}, 150);
		}
	}

	function openProject(projectPreview) {
		var projectIndex = projectPreview.index();
		projects.children('li').eq(projectIndex).add(projectPreview).addClass('selected');
		
		if( transitionsNotSupported ) {
			projectPreviews.addClass('slide-out').removeClass('selected');
			projects.children('li').eq(projectIndex).addClass('content-visible');
			animating = false;
		} else { 
			slideToggleProjects(projectPreviews, projectIndex, 0, true);
		}
	}

	function closeProject() {
		projects.find('.selected').removeClass('selected').on('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function(){
			$(this).removeClass('content-visible').off('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend');
			slideToggleProjects(projectsPreviewWrapper.children('li'), -1, 0, false);
		});

		//if browser doesn't support CSS transitions...
		if( transitionsNotSupported ) {
			projectPreviews.removeClass('slide-out');
			projects.find('.content-visible').removeClass('content-visible');
			animating = false;
		}
	}

	function slideToggleProjects(projectsPreviewWrapper, projectIndex, index, bool) {
		if(index == 0 ) createArrayRandom();
		if( projectIndex != -1 && index == 0 ) index = 1;

		var randomProjectIndex = makeUniqueRandom();
		if( randomProjectIndex == projectIndex ) randomProjectIndex = makeUniqueRandom();
		
		if( index < numRandoms - 1 ) {
			projectsPreviewWrapper.eq(randomProjectIndex).toggleClass('slide-out', bool);
			setTimeout( function(){
				//animate next preview project
				slideToggleProjects(projectsPreviewWrapper, projectIndex, index + 1, bool);
			}, 150);
		} else if ( index == numRandoms - 1 ) {
			//this is the last project preview to be animated 
			projectsPreviewWrapper.eq(randomProjectIndex).toggleClass('slide-out', bool).one('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function(){
				if( projectIndex != -1) {
					projects.children('li.selected').addClass('content-visible');
					projectsPreviewWrapper.eq(projectIndex).addClass('slide-out').removeClass('selected');
				} else if( navigation.hasClass('nav-visible') && bool ) {
					navigation.addClass('nav-clickable');
				}
				projectsPreviewWrapper.eq(randomProjectIndex).off('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend');
				animating = false;
			});
		}
	}

	//http://stackoverflow.com/questions/19351759/javascript-random-number-out-of-5-no-repeat-until-all-have-been-used
	function makeUniqueRandom() {
	    var index = Math.floor(Math.random() * uniqueRandoms.length);
	    var val = uniqueRandoms[index];
	    // now remove that value from the array
	    uniqueRandoms.splice(index, 1);
	    return val;
	}

	function createArrayRandom() {
		//reset array
		uniqueRandoms.length = 0;
		for (var i = 0; i < numRandoms; i++) {
            uniqueRandoms.push(i);
        }
	}
});

 /*
 * BG Loaded
 * Copyright (c) 2014 Jonathan Catmull
 * Licensed under the MIT license.
 */
 (function($){
 	$.fn.bgLoaded = function(custom) {
	 	var self = this;

		// Default plugin settings
		var defaults = {
			afterLoaded : function(){
				this.addClass('bg-loaded');
			}
		};

		// Merge default and user settings
		var settings = $.extend({}, defaults, custom);

		// Loop through element
		self.each(function(){
			var $this = $(this),
				bgImgs = $this.css('background-image').split(', ');
			$this.data('loaded-count',0);
			$.each( bgImgs, function(key, value){
				var img = value.replace(/^url\(["']?/, '').replace(/["']?\)$/, '');
				$('<img/>').attr('src', img).load(function() {
					$(this).remove(); // prevent memory leaks
					$this.data('loaded-count',$this.data('loaded-count')+1);
					if ($this.data('loaded-count') >= bgImgs.length) {
						settings.afterLoaded.call($this);
					}
				});
			});

		});
	};
})(jQuery);