
   			// BRIGHTNESS FILTER IN SAFARI

			var oldBrightnessModel = $("<div/>").css("-webkit-filter","brightness(120%)").css("-webkit-filter")==""?true:false;
			var browserVersion = jQuery.browser.version.substring(0,jQuery.browser.version.indexOf('.'));
			if ( oldBrightnessModel ) {
				$('.img-gray-hover').removeClass('img-gray-hover').addClass('img-gray-hover-old');	
				$('img.gray-hover').removeClass('gray-hover').addClass('gray-hover-old');	
				$('.img-gray').removeClass('img-gray').addClass('img-gray-old');	
				$('img.gray').removeClass('gray').addClass('gray-old');	
			} else {
				$('.img-gray-hover').removeClass('img-gray-hover').addClass('img-gray-hover-new');	
				$('img.gray-hover').removeClass('gray-hover').addClass('gray-hover-new');	
				$('.img-gray').removeClass('img-gray').addClass('img-gray-new');	
				$('img.gray').removeClass('gray').addClass('gray-new');	
			}
			
  !function ($) {
  	
	  	(function($){
	 
	    $.fn.shuffle = function() {
	 
	        var allElems = this.get(),
	            getRandom = function(max) {
	                return Math.floor(Math.random() * max);
	            },
	            shuffled = $.map(allElems, function(){
	                var random = getRandom(allElems.length),
	                    randEl = $(allElems[random]).clone(true)[0];
	                allElems.splice(random, 1);
	                return randEl;
	           });
	 
	        this.each(function(i){
	            $(this).replaceWith($(shuffled[i]));
	        });
	 
	        return $(shuffled);
	 
	    };
 
	})(jQuery);
    
    $(function(){

		// CAROUSEL

		$('.carousel').carousel({
		  interval: 7000,
		  pause:''
		});
		
		centerImage();

		function removeLoader() {
			$('.carousel-loader').remove();
		}
		
		function shuffleElements(){
			$('.carousel-shuffle .item:not(.active)').shuffle();
			$('.carousel-shuffle').removeClass('carousel-shuffle');
		}

		function centerImage() {
			var imageWidth, imageHeight, wrapperWidth, wrapperHeight, overlap;
			var container = $('.carousel .item');
			wrapperHeight = $('.carousel').height();
		        wrapperWidth = $('.carousel').width();
			$( '.carousel .item img' ).each(function( index, elem ) {
				// this: the current, raw DOM element
				// index: the current element's index in the selection
				// elem: the current, raw DOM element (same as this)
				imageHeight = $( elem ).height();
				imageWidth = $( elem ).width();
				if(imageHeight == 0){
					$( elem ).parent().addClass('measuring');
					imageHeight = $( elem ).height();
					imageWidth = $( elem ).width();
					$( elem ).parent().removeClass('measuring');
				}
				var imageAspect = imageHeight / imageWidth;
				var wrapperAspect = wrapperHeight / wrapperWidth;
				if (imageAspect > wrapperAspect){
                                            $( elem ).removeClass('horisontal-center');
                                            $( elem ).addClass('vertical-center');
            	                        imageHeight = $( elem ).height();
    	                                imageWidth = $( elem ).width();
                                        if(imageHeight == 0){
                            	                $( elem ).parent().addClass('measuring');
                    	                        imageHeight = $( elem ).height();
            	                                imageWidth = $( elem ).width();
    	                                        $( elem ).parent().removeClass('measuring');
                                        }
					overlap = (wrapperHeight - imageHeight) / 2;
					$( elem ).css('margin-top', overlap);
					$( elem ).css('margin-left','');
				} else {
                                            $( elem ).removeClass('vertical-center');
                                            $( elem ).addClass('horisontal-center');
					overlap = (wrapperWidth - imageWidth) / 2;
					imageHeight = $( elem ).height();
                                            imageWidth = $( elem ).width();
                                            if(imageHeight == 0){
                                                    $( elem ).parent().addClass('measuring');
                                                    imageHeight = $( elem ).height();
                                                    imageWidth = $( elem ).width();
                                                    $( elem ).parent().removeClass('measuring');
                                            }
					$( elem ).css('margin-top', '');
                                        $( elem ).css('margin-left', overlap);
				}
			});
		}
		
		$(document).ready(function() {
			
			$(window).on("load resize", centerImage);
			
			$(window).on("load", shuffleElements);
			
			
			$('.carousel').on("slid", centerImage);
			$('.carousel').on("slid", removeLoader);
			
			centerImage();


			function hideAddressBar(){
			  if(!window.location.hash && /iPhone|iPad|iPod/i.test(navigator.userAgent)){
			      if(document.height < window.outerHeight){
			          document.body.style.height = (window.outerHeight + 50) + 'px';
      			      }
 			      setTimeout( function(){ window.scrollTo(0, 1); }, 50 );
			  }
			}
 
			window.addEventListener("load", function(){ if(!window.pageYOffset){ hideAddressBar(); } } );
			window.addEventListener("orientationchange", hideAddressBar );

			// TAG TOOLTIPS
			
			$("a.tag[rel=tooltip]")
	      	.tooltip({
	      		delay: { show: 100, hide: 500 }
	      	})
	      	.click(function(e) {
	      		if($(this).hasClass('in')){
	      			$(this).removeClass('in');
	      		} else {
		      		$("a.tag[rel=tooltip].in").removeClass('in').tooltip('hide');
		      		$( this ).addClass('in');
	      		}
	      		//this.popover('show');
	      		e.preventDefault()
	      	})
	      	.mouseenter(function(){
	      		var tag = $(this).data('tag');
	      		$("a.tag[data-tag='"+ tag +"']").fadeTo('fast',1.0);
	      	})
	      	.mouseleave(function(){
	      		var tag = $(this).data('tag');
	      		$("a.tag[data-tag='"+ tag +"']").fadeTo('slow',0.4);
	      	});
		
			// VIDEO resizing
			
			$(function() {
			    
			    var $allVideos = $("iframe[src^='http://player.vimeo.com'], iframe[src^='http://www.youtube.com'], object, embed");
				    	
				$allVideos.each(function() {
				
				  $(this)
				    // jQuery .data does not work on object/embed elements
				    .attr('data-aspectRatio', this.height / this.width)
				    .removeAttr('height')
				    .removeAttr('width');
				
				});
				
				$(window).resize(function() {
				
				  $allVideos.each(function() {
					var newWidth = $(this).parent().width();
				    var $el = $(this);
				    $el
				        .width(newWidth)
				        .height(newWidth * $el.attr('data-aspectRatio'));
				  
				  });
				
				}).resize();
			
			});
						
		});
	})
		
  }(window.jQuery)
