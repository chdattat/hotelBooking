 (function ($) {
    $.fn.bjqs = function (options) {
		
        var settings = {},
            defaults = {
				
                width: 960,
                height: 450,
				animation: 'fade',
                animationDuration: 450,
                automatic: true,
				rotationSpeed: 4000,
				hoverPause: true,
				showControls: true,
				centerControls: true,
				nextText: 'Next',
                prevText: 'Prev',
				showMarkers: true,
				centerMarkers: true,
				keyboardNav: true,
				useCaptions: true 
            },
            $container = this,
            $slider = $container.find('.bjqs'),
            slides = $slider.children('li'),
            slideCount = slides.length,
            animating = false,
            paused = false,
            current = 0,
            slidePosition = 1,
            next = 0,
            $active = slides.eq(current),
            forward = 'forward',
            back = 'backward';

        
        settings = $.extend({}, defaults, options);

        
        slides.css({
            'height': settings.height,
            'width': settings.width
        });
        $slider.css({
            'height': settings.height,
            'width': settings.width
        });
        $container.css({
            'height': settings.height,
            'width': settings.width
        });

        
        slides.addClass('bjqs-slide');

        
        if (settings.showControls && slideCount > 1) {

            
            var $controlContainer = $('<ul class="bjqs-controls"></ul>'),
                $next = $('<li><a href="#" class="bjqs-next" class="controls">' + settings.nextText + '</a></li>'),
                $previous = $('<li><a href="#" class="bjqs-prev" class="controls">' + settings.prevText + '</a></li>');

            
            $next.click(function (e) {
                e.preventDefault();
                if (!animating) {
                    bjqsGo(forward, false);
                }
            });

            $previous.click(function (e) {
                e.preventDefault();
                if (!animating) {
                    bjqsGo(back, false);
                }
            });

            
            $next.appendTo($controlContainer);
            $previous.appendTo($controlContainer);
            $controlContainer.appendTo($container);

            
            if (settings.centerControls) {

                var $control = $next.children('a'),
                    offset = ($container.height() - $control.height()) / 2;

                $next.children('a').css('top', offset).show();
                $previous.children('a').css('top', offset).show();
            }

        }

        
        if (settings.showMarkers && slideCount > 1) {

            var $markerContainer = $('<ol class="bjqs-markers"></ol>'),
                $marker, markers, offset;

            
            $.each(slides, function (key, value) {
                if (settings.animType === 'slide') {
                    if (key !== 0 && key !== slideCount - 1) {
                        $marker = $('<li><a href="#">' + key + '</a></li>');
                    }
                } else {
                    key++;
                    $marker = $('<li><a href="#">' + key + '</a></li>');
                }

                $marker.click(function (e) {
                    e.preventDefault();
                    if (!$(this).hasClass('active-marker') && !animating) {
                        bjqsGo(false, key);
                    }
                });

                $marker.appendTo($markerContainer);

            });

            markers = $markerContainer.children('li');
            markers.eq(current).addClass('active-marker');
            $markerContainer.appendTo($container);

            if (settings.centerMarkers) {
                offset = (settings.width - $markerContainer.width()) / 2;
                $markerContainer.css('left', offset);
            }

        }

        
        if (settings.keyboardNav && slideCount > 1) {

            $(document).keyup(function (event) {

                if (!paused) {
                    clearInterval(bjqsInterval);
                    paused = true;
                }

                if (!animating) {
                    if (event.keyCode === 39) {
                        event.preventDefault();
                        bjqsGo(forward, false);
                    } else if (event.keyCode === 37) {
                        event.preventDefault();
                        bjqsGo(back, false);
                    }
                }

                if (paused & settings.automatic) {
                    bjqsInterval = setInterval(function () {
                        bjqsGo(forward)
                    }, settings.rotationSpeed);
                    paused = false;
                }

            });
        }

        
        if (settings.useCaptions) {

            $.each(slides, function (key, value) {

                var $slide = $(value);
                var $slideChild = $slide.children('img:first-child');
                var title = $slideChild.attr('title');

                if (title) {
                    var $caption = $('<p class="bjqs-caption">' + title + '</p>');
                    $caption.appendTo($slide);
                }

            });

        }

        
        if (settings.hoverPause && settings.automatic) {

            $container.hover(function () {
                if (!paused) {
                    clearInterval(bjqsInterval);
                    paused = true;
                }
            }, function () {
                if (paused) {
                    bjqsInterval = setInterval(function () {
                        bjqsGo(forward)
                    }, settings.rotationSpeed);
                    paused = false;
                }
            });

        }


        
        if (settings.animation === 'slide' && slideCount > 1) {

            $first = slides.eq(0);
            $last = slides.eq(slideCount - 1);

            $first.clone().addClass('clone').removeClass('slide').appendTo($slider);
            $last.clone().addClass('clone').removeClass('slide').prependTo($slider);

            slides = $slider.children('li');
            slideCount = slides.length;

            $wrapper = $('<div class="bjqs-wrapper"></div>').css({
                'width': settings.width,
                'height': settings.height,
                'overflow': 'hidden',
                'position': 'relative'
            });

            $slider.css({
                'width': settings.width * slideCount,
                'left': -settings.width
            });

            slides.css({
                'float': 'left',
                'position': 'relative',
                'display': 'list-item'
            });

            $wrapper.prependTo($container);
            $slider.appendTo($wrapper);

        }

        
        var checkPosition = function (direction) {

                if (settings.animation === 'fade') {

                    if (direction === forward) {
                        !$active.next().length ? next = 0 : next++
                    } else if (direction === back) {
                        !$active.prev().length ? next = slideCount - 1 : next--
                    }

                }

                if (settings.animation === 'slide') {

                    if (direction === forward) {
                        next = slidePosition + 1;
                    }

                    if (direction === back) {
                        next = slidePosition - 1;
                    }
                }

                return next;
            }

            
        if (settings.automatic && slideCount > 1) {
            var bjqsInterval = setInterval(function () {
                bjqsGo(forward, false)
            }, settings.rotationSpeed);
        }

        	
        slides.eq(current).show();
        $slider.show();

        
        var bjqsGo = function (direction, position) {

                if (!animating) {

                    if (direction) {
                        next = checkPosition(direction);
                    } else if (position && settings.animation === 'fade') {
                        next = position - 1;
                    } else {
                        next = position;
                    }

                    animating = true;

                    if (settings.animation === 'fade') {

                        if (settings.showMarkers) {
                            markers.eq(current).removeClass('active-marker');
                            markers.eq(next).addClass('active-marker');
                        }

                        $next = slides.eq(next);

                        $active.fadeOut(settings.animationDuration);
                        $next.fadeIn(settings.animationDuration, function () {
                            $active.hide();
                            current = next;
                            $active = $next;
                            animating = false;
                        });
						
                    } else if (settings.animation === 'slide') {

                        if (settings.showMarkers) {

                            markers.eq(slidePosition - 1).removeClass('active-marker');

                            if (next === slideCount - 1) {
                                markers.eq(0).addClass('active-marker');
                            } else if (next === 0) {
                                markers.eq(slideCount - 3).addClass('active-marker');
                            } else {
                                markers.eq(next - 1).addClass('active-marker');
                            }

                        }

                        $slider.animate({
                            'left': -next * settings.width
                        }, settings.animationDuration, function () {

                            if (next === 0) {
                                slidePosition = slideCount - 2;
                                $slider.css({
                                    'left': -slidePosition * settings.width
                                });
                            } else if (next === slideCount - 1) {
                                slidePosition = 1;
                                $slider.css({
                                    'left': -settings.width
                                });
                            } else {
                                slidePosition = next;
                            }

                            animating = false;

                        });

                    }

                }

            }

        return this; 
    }
})(jQuery);