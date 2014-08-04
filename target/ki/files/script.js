// jQuery Plugins

/*!
jQuery Waypoints - v1.1.7
Copyright (c) 2011-2012 Caleb Troughton
Dual licensed under the MIT license and GPL license.
https://github.com/imakewebthings/jquery-waypoints/blob/master/MIT-license.txt
https://github.com/imakewebthings/jquery-waypoints/blob/master/GPL-license.txt
*/

/*
Waypoints is a small jQuery plugin that makes it easy to execute a function
whenever you scroll to an element.

GitHub Repository: https://github.com/imakewebthings/jquery-waypoints
Documentation and Examples: http://imakewebthings.github.com/jquery-waypoints

Changelog:
	v1.1.7
		- Actually fix the post-load bug in Issue #28 from v1.1.3.
	v1.1.6
		- Fix potential memory leak by unbinding events on empty context elements.
	v1.1.5
		- Make plugin compatible with Browserify/RequireJS. (Thanks @cjroebuck)
	v1.1.4
		- Add handler option to give alternate binding method. (Issue #34)
	v1.1.3
		- Fix cases where waypoints are added post-load and should be triggered
		  immediately. (Issue #28)
	v1.1.2
		- Fixed error thrown by waypoints with triggerOnce option that were
		  triggered via resize refresh.
	v1.1.1
		- Fixed bug in initialization where all offsets were being calculated
		  as if set to 0 initially, causing unwarranted triggers during the
		  subsequent refresh.
		- Added onlyOnScroll, an option for individual waypoints that disables
		  triggers due to an offset refresh that crosses the current scroll
		  point. (All credit to @knuton on this one.)
	v1.1
		- Moved the continuous option out of global settings and into the options
		  object for individual waypoints.
		- Added the context option, which allows for using waypoints within any
		  scrollable element, not just the window.
	v1.0.2
		- Moved scroll and resize handler bindings out of load.  Should play nicer
		  with async loaders like Head JS and LABjs.
		- Fixed a 1px off error when using certain % offsets.
		- Added unit tests.
	v1.0.1
		- Added $.waypoints('viewportHeight').
		- Fixed iOS bug (using the new viewportHeight method).
		- Added offset function alias: 'bottom-in-view'.
	v1.0
		- Initial release.
	
Support:
	- jQuery versions 1.4.3+
	- IE6+, FF3+, Chrome 6+, Safari 4+, Opera 11
	- Other versions and browsers may work, these are just the ones I've looked at.
*/

(function($, wp, wps, window, undefined){
	'$:nomunge';
	
	var $w = $(window),
	
	// Keeping common strings as variables = better minification
	eventName = 'waypoint.reached',
	
	/*
	For the waypoint and direction passed in, trigger the waypoint.reached
	event and deal with the triggerOnce option.
	*/
	triggerWaypoint = function(way, dir) {
		way.element.trigger(eventName, dir);
		if (way.options.triggerOnce) {
			way.element[wp]('destroy');
		}
	},
	
	/*
	Given a jQuery element and Context, returns the index of that element in the waypoints
	array.  Returns the index, or -1 if the element is not a waypoint.
	*/
	waypointIndex = function(el, context) {
		if (!context) return -1;
		var i = context.waypoints.length - 1;
		while (i >= 0 && context.waypoints[i].element[0] !== el[0]) {
			i -= 1;
		}
		return i;
	},
	
	// Private list of all elements used as scrolling contexts for waypoints.
	contexts = [],
	
	/*
	Context Class - represents a scrolling context.  Properties include:
		element: jQuery object containing a single HTML element.
		waypoints: Array of waypoints operating under this scroll context.
		oldScroll: Keeps the previous scroll position to determine scroll direction.
		didScroll: Flag used in scrolling the context's scroll event.
		didResize: Flag used in scrolling the context's resize event.
		doScroll: Function that checks for crossed waypoints. Called from throttler.
	*/
	Context = function(context) {
		$.extend(this, {
			element: $(context),
			oldScroll: 0,
			
			/*
			List of all elements that have been registered as waypoints.
			Each object in the array contains:
				element: jQuery object containing a single HTML element.
				offset: The window scroll offset, in px, that triggers the waypoint event.
				options: Options object that was passed to the waypoint fn function.
			*/
			'waypoints': [],
			
			didScroll: false,
			didResize: false,
	
			doScroll: $.proxy(function() {
				var newScroll = this.element.scrollTop(),
				
				// Are we scrolling up or down? Used for direction argument in callback.
				isDown = newScroll > this.oldScroll,
				that = this,

				// Get a list of all waypoints that were crossed since last scroll move.
				pointsHit = $.grep(this.waypoints, function(el, i) {
					return isDown ?
						(el.offset > that.oldScroll && el.offset <= newScroll) :
						(el.offset <= that.oldScroll && el.offset > newScroll);
				}),
				len = pointsHit.length;
				
				// iOS adjustment
				if (!this.oldScroll || !newScroll) {
					$[wps]('refresh');
				}

				// Done with scroll comparisons, store new scroll before ejection
				this.oldScroll = newScroll;

				// No waypoints crossed? Eject.
				if (!len) return;

				// If several waypoints triggered, need to do so in reverse order going up
				if (!isDown) pointsHit.reverse();

				/*
				One scroll move may cross several waypoints.  If the waypoint's continuous
				option is true it should fire even if it isn't the last waypoint.  If false,
				it will only fire if it's the last one.
				*/
				$.each(pointsHit, function(i, point) {
					if (point.options.continuous || i === len - 1) {
						triggerWaypoint(point, [isDown ? 'down' : 'up']);
					}
				});
			}, this)
		});
		
		// Setup scroll and resize handlers.  Throttled at the settings-defined rate limits.
		$(context).bind('scroll.waypoints', $.proxy(function() {
			if (!this.didScroll) {
				this.didScroll = true;
				window.setTimeout($.proxy(function() {
					this.doScroll();
					this.didScroll = false;
				}, this), $[wps].settings.scrollThrottle);
			}
		}, this)).bind('resize.waypoints', $.proxy(function() {
			if (!this.didResize) {
				this.didResize = true;
				window.setTimeout($.proxy(function() {
					$[wps]('refresh');
					this.didResize = false;
				}, this), $[wps].settings.resizeThrottle);
			}
		}, this));
		
		$w.load($.proxy(function() {
			/*
			Fire a scroll check, should the page be loaded at a non-zero scroll value,
			as with a fragment id link or a page refresh.
			*/
			this.doScroll();
		}, this));
	},
	
	/* Returns a Context object from the contexts array, given the raw HTML element
	for that context. */
	getContextByElement = function(element) {
		var found = null;
		
		$.each(contexts, function(i, c) {
			if (c.element[0] === element) {
				found = c;
				return false;
			}
		});
		
		return found;
	},
	
	// Methods exposed to the effin' object 
	methods = {
		/*
		jQuery.fn.waypoint([handler], [options])
		
		handler
			function, optional
			A callback function called when the user scrolls past the element.
			The function signature is function(event, direction) where event is
			a standard jQuery Event Object and direction is a string, either 'down'
			or 'up' indicating which direction the user is scrolling.
			
		options
			object, optional
			A map of options to apply to this set of waypoints, including where on
			the browser window the waypoint is triggered. For a full list of
			options and their defaults, see $.fn.waypoint.defaults.
			
		This is how you register an element as a waypoint. When the user scrolls past
		that element it triggers waypoint.reached, a custom event. Since the
		parameters for creating a waypoint are optional, we have a few different
		possible signatures. Let’s look at each of them.

		someElements.waypoint();
			
		Calling .waypoint with no parameters will register the elements as waypoints
		using the default options. The elements will fire the waypoint.reached event,
		but calling it in this way does not bind any handler to the event. You can
		bind to the event yourself, as with any other event, like so:

		someElements.bind('waypoint.reached', function(event, direction) {
		   // make it rain
		});
			
		You will usually want to create a waypoint and immediately bind a function to
		waypoint.reached, and can do so by passing a handler as the first argument to
		.waypoint:

		someElements.waypoint(function(event, direction) {
		   if (direction === 'down') {
		      // do this on the way down
		   }
		   else {
		      // do this on the way back up through the waypoint
		   }
		});
			
		This will still use the default options, which will trigger the waypoint when
		the top of the element hits the top of the window. We can pass .waypoint an
		options object to customize things:

		someElements.waypoint(function(event, direction) {
		   // do something amazing
		}, {
		   offset: '50%'  // middle of the page
		});
			
		You can also pass just an options object.

		someElements.waypoint({
		   offset: 100  // 100px from the top
		});
			
		This behaves like .waypoint(), in that it registers the elements as waypoints
		but binds no event handlers.

		Calling .waypoint on an existing waypoint will extend the previous options.
		If the call includes a handler, it will be bound to waypoint.reached without
		unbinding any other handlers.
		*/
		init: function(f, options) {
			// Register each element as a waypoint, add to array.
			this.each(function() {
				var cElement = $.fn[wp].defaults.context,
				context,
				$this = $(this);

				// Default window context or a specific element?
				if (options && options.context) {
					cElement = options.context;
				}

				// Find the closest element that matches the context
				if (!$.isWindow(cElement)) {
					cElement = $this.closest(cElement)[0];
				}
				context = getContextByElement(cElement);

				// Not a context yet? Create and push.
				if (!context) {
					context = new Context(cElement);
					contexts.push(context);
				}
				
				// Extend default and preexisting options
				var ndx = waypointIndex($this, context),
				base = ndx < 0 ? $.fn[wp].defaults : context.waypoints[ndx].options,
				opts = $.extend({}, base, options);
				
				// Offset aliases
				opts.offset = opts.offset === "bottom-in-view" ?
					function() {
						var cHeight = $.isWindow(cElement) ? $[wps]('viewportHeight')
							: $(cElement).height();
						return cHeight - $(this).outerHeight();
					} : opts.offset;

				// Update, or create new waypoint
				if (ndx < 0) {
					context.waypoints.push({
						'element': $this,
						'offset': null,
						'options': opts
					});
				}
				else {
					context.waypoints[ndx].options = opts;
				}
				
				// Bind the function if it was passed in.
				if (f) {
					$this.bind(eventName, f);
				}
				// Bind the function in the handler option if it exists.
				if (options && options.handler) {
					$this.bind(eventName, options.handler);
				}
			});
			
			// Need to re-sort+refresh the waypoints array after new elements are added.
			$[wps]('refresh');
			
			return this;
		},
		
		
		/*
		jQuery.fn.waypoint('remove')
		
		Passing the string 'remove' to .waypoint unregisters the elements as waypoints
		and wipes any custom options, but leaves the waypoint.reached events bound.
		Calling .waypoint again in the future would reregister the waypoint and the old
		handlers would continue to work.
		*/
		remove: function() {
			return this.each(function(i, el) {
				var $el = $(el);
				
				$.each(contexts, function(i, c) {
					var ndx = waypointIndex($el, c);

					if (ndx >= 0) {
						c.waypoints.splice(ndx, 1);

						if (!c.waypoints.length) {
							c.element.unbind('scroll.waypoints resize.waypoints');
							contexts.splice(i, 1);
						}
					}
				});
			});
		},
		
		/*
		jQuery.fn.waypoint('destroy')
		
		Passing the string 'destroy' to .waypoint will unbind all waypoint.reached
		event handlers on those elements and unregisters them as waypoints.
		*/
		destroy: function() {
			return this.unbind(eventName)[wp]('remove');
		}
	},
	
	/*
	Methods used by the jQuery object extension.
	*/
	jQMethods = {
		
		/*
		jQuery.waypoints('refresh')
		
		This will force a recalculation of each waypoint’s trigger point based on
		its offset option and context. This is called automatically whenever the window
		(or other defined context) is resized, new waypoints are added, or a waypoint’s
		options are modified. If your project is changing the DOM or page layout without
		doing one of these things, you may want to manually call this refresh.
		*/
		refresh: function() {
			$.each(contexts, function(i, c) {
				var isWin = $.isWindow(c.element[0]),
				contextOffset = isWin ? 0 : c.element.offset().top,
				contextHeight = isWin ? $[wps]('viewportHeight') : c.element.height(),
				contextScroll = isWin ? 0 : c.element.scrollTop();
				
				$.each(c.waypoints, function(j, o) {
					/* $.each isn't safe from element removal due to triggerOnce.
					Should rewrite the loop but this is way easier. */
					if (!o) return;

					// Adjustment is just the offset if it's a px value
					var adjustment = o.options.offset,
					oldOffset = o.offset;
					
					// Set adjustment to the return value if offset is a function.
					if (typeof o.options.offset === "function") {
						adjustment = o.options.offset.apply(o.element);
					}
					// Calculate the adjustment if offset is a percentage.
					else if (typeof o.options.offset === "string") {
						var amount = parseFloat(o.options.offset);
						adjustment = o.options.offset.indexOf("%") ?
							Math.ceil(contextHeight * (amount / 100)) : amount;
					}

					/* 
					Set the element offset to the window scroll offset, less
					all our adjustments.
					*/
					o.offset = o.element.offset().top - contextOffset
						+ contextScroll - adjustment;

					/*
					An element offset change across the current scroll point triggers
					the event, just as if we scrolled past it unless prevented by an
					optional flag.
					*/
					if (o.options.onlyOnScroll) return;

					if (oldOffset !== null && c.oldScroll > oldOffset && c.oldScroll <= o.offset) {
						triggerWaypoint(o, ['up']);
					}
					else if (oldOffset !== null && c.oldScroll < oldOffset && c.oldScroll >= o.offset) {
						triggerWaypoint(o, ['down']);
					}
					/* For new waypoints added after load, check that down should have
					already been triggered */
					else if (!oldOffset && c.element.scrollTop() > o.offset) {
						triggerWaypoint(o, ['down']);
					}
				});
				
				// Keep waypoints sorted by offset value.
				c.waypoints.sort(function(a, b) {
					return a.offset - b.offset;
				});
			});
		},
		
		
		/*
		jQuery.waypoints('viewportHeight')
		
		This will return the height of the viewport, adjusting for inconsistencies
		that come with calling $(window).height() in iOS. Recommended for use
		within any offset functions.
		*/
		viewportHeight: function() {
			return (window.innerHeight ? window.innerHeight : $w.height());
		},
		
		
		/*
		jQuery.waypoints()
		
		This will return a jQuery object with a collection of all registered waypoint
		elements.

		$('.post').waypoint();
		$('.ad-unit').waypoint(function(event, direction) {
		   // Passed an ad unit
		});
		console.log($.waypoints());
		
		The example above would log a jQuery object containing all .post and .ad-unit
		elements.
		*/
		aggregate: function() {
			var points = $();
			$.each(contexts, function(i, c) {
				$.each(c.waypoints, function(i, e) {
					points = points.add(e.element);
				});
			});
			return points;
		}
	};

	
	/*
	fn extension.  Delegates to appropriate method.
	*/
	$.fn[wp] = function(method) {
		
		if (methods[method]) {
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		}
		else if (typeof method === "function" || !method) {
			return methods.init.apply(this, arguments);
		}
		else if (typeof method === "object") {
			return methods.init.apply(this, [null, method]);
		}
		else {
			$.error( 'Method ' + method + ' does not exist on jQuery ' + wp );
		}
	};
	
	
	/*
	The default options object that is extended when calling .waypoint. It has the
	following properties:
	
	context
		string | element | jQuery*
		default: window
		The context defines which scrollable element the waypoint belongs to and acts
		within. The default, window, means the waypoint offset is calculated with relation
		to the whole viewport.  You can set this to another element to use the waypoints
		within that element.  Accepts a selector string, *but if you use jQuery 1.6+ it
		also accepts a raw HTML element or jQuery object.
	
	continuous
		boolean
		default: true
		If true, and multiple waypoints are triggered in one scroll, this waypoint will
		trigger even if it is not the last waypoint reached.  If false, it will only
		trigger if it is the last waypoint.
		
	handler
		function
		default: undefined
		An alternative way to bind functions to the waypoint, without using the function
		as the first argument to the waypoint function.

	offset
		number | string | function
		default: 0
		Determines how far the top of the element must be from the top of the browser
		window to trigger a waypoint. It can be a number, which is taken as a number
		of pixels, a string representing a percentage of the viewport height, or a
		function that will return a number of pixels.
		
	onlyOnScroll
		boolean
		default: false
		If true, this waypoint will not trigger if an offset change during a refresh
		causes it to pass the current scroll point.
		
	triggerOnce
		boolean
		default: false
		If true, the waypoint will be destroyed when triggered.
	
	An offset of 250 would trigger the waypoint when the top of the element is 250px
	from the top of the viewport. Negative values for any offset work as you might
	expect. A value of -100 would trigger the waypoint when the element is 100px above
	the top of the window.

	offset: '100%'
	
	A string percentage will determine the pixel offset based on the height of the
	window. When resizing the window, this offset will automatically be recalculated
	without needing to call $.waypoints('refresh').

	// The bottom of the element is in view
	offset: function() {
	   return $.waypoints('viewportHeight') - $(this).outerHeight();
	}
	
	Offset can take a function, which must return a number of pixels from the top of
	the window. The this value will always refer to the raw HTML element of the
	waypoint. As with % values, functions are recalculated automatically when the
	window resizes. For more on recalculating offsets, see $.waypoints('refresh').
	
	An offset value of 'bottom-in-view' will act as an alias for the function in the
	example above, as this is a common usage.
	
	offset: 'bottom-in-view'
	
	You can see this alias in use on the Scroll Analytics example page.

	The triggerOnce flag, if true, will destroy the waypoint after the first trigger.
	This is just a shortcut for calling .waypoint('destroy') within the waypoint
	handler. This is useful in situations such as scroll analytics, where you only
	want to record an event once for each page visit.
	
	The context option lets you use Waypoints within an element other than the window.
	You can define the context with a selector string and the waypoint will act within
	the nearest ancestor that matches this selector.
	
	$('.something-scrollable .waypoint').waypoint({
	   context: '.something-scrollable'
	});
	
	You can see this in action on the Dial Controls example.
	
	The handler option gives authors an alternative way to bind functions when
	creating a waypoint.  In place of:
	
	$('.item').waypoint(function(event, direction) {
	   // make things happen
	});
	
	You may instead write:
	
	$('.item').waypoint({
	   handler: function(event, direction) {
	      // make things happen
	   }
	});
	
	*/
	$.fn[wp].defaults = {
		continuous: true,
		offset: 0,
		triggerOnce: false,
		context: window
	};
	
	
	
	
	
	/*
	jQuery object extension. Delegates to appropriate methods above.
	*/
	$[wps] = function(method) {
		if (jQMethods[method]) {
			return jQMethods[method].apply(this);
		}
		else {
			return jQMethods['aggregate']();
		}
	};
	
	
	/*
	$.waypoints.settings
	
	Settings object that determines some of the plugin’s behavior.
		
	resizeThrottle
		number
		default: 200
		For performance reasons, the refresh performed during resizes is
		throttled. This value is the rate-limit in milliseconds between resize
		refreshes. For more information on throttling, check out Ben Alman’s
		throttle / debounce plugin.
		http://benalman.com/projects/jquery-throttle-debounce-plugin/
		
	scrollThrottle
		number
		default: 100
		For performance reasons, checking for any crossed waypoints during a
		scroll event is throttled. This value is the rate-limit in milliseconds
		between scroll checks. For more information on throttling, check out Ben
		Alman’s throttle / debounce plugin.
		http://benalman.com/projects/jquery-throttle-debounce-plugin/
	*/
	$[wps].settings = {
		resizeThrottle: 200,
		scrollThrottle: 100
	};
	
	$w.load(function() {
		// Calculate everything once on load.
		$[wps]('refresh');
	});
})(jQuery, 'waypoint', 'waypoints', window);







/*
* hoverFlow - A Solution to Animation Queue Buildup in jQuery
* Version 1.00
*
* Copyright (c) 2009 Ralf Stoltze, http://www.2meter3.de/code/hoverFlow/
*/
(function( $ ){

	$.fn.hoverFlow = function(type, prop, speed, easing, callback) {
		// only allow hover events
		if ($.inArray(type, ['mouseover', 'mouseenter', 'mouseout', 'mouseleave']) == -1) {
			return this;
		}
	
		// build animation options object from arguments
		// based on internal speed function from jQuery core
		var opt = typeof speed === 'object' ? speed : {
			complete: callback || !callback && easing || $.isFunction(speed) && speed,
			duration: speed,
			easing: callback && easing || easing && !$.isFunction(easing) && easing
		};
		
		// run immediately
		opt.queue = false;
			
		// wrap original callback and add dequeue
		var origCallback = opt.complete;
		opt.complete = function() {
			// execute next function in queue
			$(this).dequeue();
			// execute original callback
			if ($.isFunction(origCallback)) {
				origCallback.call(this);
			}
		};
		
		// keep the chain intact
		return this.each(function() {
			var $this = $(this);
		
			// set flag when mouse is over element
			if (type == 'mouseover' || type == 'mouseenter') {
				$this.data('jQuery.hoverFlow', true);
			} else {
				$this.removeData('jQuery.hoverFlow');
			}
			
			// enqueue function
			$this.queue(function() {				
				// check mouse position at runtime
				var condition = (type == 'mouseover' || type == 'mouseenter') ?
					// read: true if mouse is over element
					$this.data('jQuery.hoverFlow') !== undefined :
					// read: true if mouse is _not_ over element
					$this.data('jQuery.hoverFlow') === undefined;
					
				// only execute animation if condition is met, which is:
				// - only run mouseover animation if mouse _is_ currently over the element
				// - only run mouseout animation if the mouse is currently _not_ over the element
				if(condition) {
					$this.animate(prop, opt);
				// else, clear queue, since there's nothing more to do
				} else {
					$this.queue([]);
				}
			});

		});
	};

})( jQuery );






/*
* jPreLoader - jQuery plugin
* Create a Loading Screen to preload images and content for you website
*
* Name:			jPreLoader.js
* Author:		Kenny Ooi - http://www.inwebson.com
* Date:			January 01, 2012		
* Version:		1.0
*	
*/
(function( $ ){

	var items = new Array(),
		errors = new Array(),
		onComplete = function() {},
		current = 0;
	
	var jpreOptions = {
		splashVPos: '35%',
		loaderVPos: '75%',
		splashID: '#jpreContent',
		showSplash: true,
		showPercentage: true,
		debugMode: false,
		splashFunction: function() {}
	}
	
	var getImages = function(element) {
		$(element).find('*:not(script)').each(function() {
			var url = "";

			if ($(this).css('background-image').indexOf('none') == -1) {
				url = $(this).css('background-image');
				if(url.indexOf('url') != -1) {
					var temp = url.match(/url\((.*?)\)/);
					url = temp[1].replace(/\"/g, '');
				}
			} else if ($(this).get(0).nodeName.toLowerCase() == 'img' && typeof($(this).attr('src')) != 'undefined') {
				url = $(this).attr('src');
			}
			
			if (url.length > 0) {
				items.push(url);
			}
		});
	}
	
	var preloading = function() {
		for (var i = 0; i < items.length; i++) {
			loadImg(items[i]);
		}
	}
	
	var loadImg = function(url) {
		var imgLoad = new Image();
		$(imgLoad)
		.load(function() {
			completeLoading();
		})
		.error(function() {
			errors.push($(this).attr('src'));
			completeLoading();
		})
		.attr('src', url);
	}
	
	var completeLoading = function() {
		current++;

		var per = Math.round((current / items.length) * 100);
		$(jBar).stop().animate({
			height: per + '%'
		}, 500, 'linear');
		
		if(jpreOptions.showPercentage) {
			$(jPer).text(per+"%");
		}
		
		if(current >= items.length) {
		
			current = items.length;
			
			if (jpreOptions.debugMode) {
				var error = debug();
				
			} 
			loadComplete();
		}
	}
	
	var loadComplete = function() {
		$(jBar).stop().animate({
			height: '100%'
		}, 500, 'linear', function() {
			$(jOverlay).animate({opacity: '0'},500, function() {
				$(jOverlay).remove();
				onComplete();
			});
		});	
	}
	
	var debug = function() {
		if(errors.length > 0) {
			var str = 'ERROR - IMAGE FILES MISSING!!!\n\r'
			str	+= errors.length + ' image files cound not be found. \n\r';	
			str += 'Please check your image paths and filenames:\n\r';
			for (var i = 0; i < errors.length; i++) {
				str += '- ' + errors[i] + '\n\r';
			}
			return true;
		} else {
			return false;
		}
	}
	
	// create the splash screen overlay
	var createContainer = function(tar) {

		jOverlay = $('<div></div>')
		.attr('id', 'jpreOverlay')
		.appendTo('body');
		
		if(jpreOptions.showSplash) {
			jContent = $('<div></div>')
			.attr('id', 'jpreSlide')
			.appendTo(jOverlay);
			
			var conWidth = $(window).width() - $(jContent).width();
			$(jContent).html($(jpreOptions.splashID).wrap('<div/>').parent().html());
			$(jpreOptions.splashID).remove();
			jpreOptions.splashFunction()			
		}
		
		jLoader = $('<div></div>')
		.attr('id', 'jpreLoader')
		.appendTo(jOverlay);
		
		jBar = $('<div></div>')
		.attr('id', 'jpreBar')
		.appendTo(jLoader);
		
		if(jpreOptions.showPercentage) {
			jPer = $('<div></div>')
			.attr('id', 'jprePercentage')
			.appendTo(jLoader)
			.html('Loading...');
		}
	}
	
	$.fn.jpreLoader = function(options, callback) {
        if(options) {
            $.extend(jpreOptions, options );
        }
		if(typeof callback == 'function') {
			onComplete = callback;
		}
		
		createContainer(this);
		getImages(this);
		preloading();
        return this;
    };

})( jQuery );




/*
 * jQuery Easing v1.3 - http://gsgd.co.uk/sandbox/jquery/easing/
 *
 * Uses the built in easing capabilities added In jQuery 1.1
 * to offer multiple easing options
 *
 * TERMS OF USE - jQuery Easing
 * 
 * Open source under the BSD License. 
 * 
 * Copyright Â© 2008 George McGinley Smith
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 * 
 * Redistributions of source code must retain the above copyright notice, this list of 
 * conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list 
 * of conditions and the following disclaimer in the documentation and/or other materials 
 * provided with the distribution.
 * 
 * Neither the name of the author nor the names of contributors may be used to endorse 
 * or promote products derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 *  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED 
 * AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
 * OF THE POSSIBILITY OF SUCH DAMAGE. 
 *
*/

// t: current time, b: begInnIng value, c: change In value, d: duration
jQuery.easing['jswing'] = jQuery.easing['swing'];

jQuery.extend( jQuery.easing,
{
	def: 'easeOutQuad',
	swing: function (x, t, b, c, d) {
		//alert(jQuery.easing.default);
		return jQuery.easing[jQuery.easing.def](x, t, b, c, d);
	},
	easeInQuad: function (x, t, b, c, d) {
		return c*(t/=d)*t + b;
	},
	easeOutQuad: function (x, t, b, c, d) {
		return -c *(t/=d)*(t-2) + b;
	},
	easeInOutQuad: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t + b;
		return -c/2 * ((--t)*(t-2) - 1) + b;
	},
	easeInCubic: function (x, t, b, c, d) {
		return c*(t/=d)*t*t + b;
	},
	easeOutCubic: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t + 1) + b;
	},
	easeInOutCubic: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t + b;
		return c/2*((t-=2)*t*t + 2) + b;
	},
	easeInQuart: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t + b;
	},
	easeOutQuart: function (x, t, b, c, d) {
		return -c * ((t=t/d-1)*t*t*t - 1) + b;
	},
	easeInOutQuart: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
		return -c/2 * ((t-=2)*t*t*t - 2) + b;
	},
	easeInQuint: function (x, t, b, c, d) {
		return c*(t/=d)*t*t*t*t + b;
	},
	easeOutQuint: function (x, t, b, c, d) {
		return c*((t=t/d-1)*t*t*t*t + 1) + b;
	},
	easeInOutQuint: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return c/2*t*t*t*t*t + b;
		return c/2*((t-=2)*t*t*t*t + 2) + b;
	},
	easeInSine: function (x, t, b, c, d) {
		return -c * Math.cos(t/d * (Math.PI/2)) + c + b;
	},
	easeOutSine: function (x, t, b, c, d) {
		return c * Math.sin(t/d * (Math.PI/2)) + b;
	},
	easeInOutSine: function (x, t, b, c, d) {
		return -c/2 * (Math.cos(Math.PI*t/d) - 1) + b;
	},
	easeInExpo: function (x, t, b, c, d) {
		return (t==0) ? b : c * Math.pow(2, 10 * (t/d - 1)) + b;
	},
	easeOutExpo: function (x, t, b, c, d) {
		return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b;
	},
	easeInOutExpo: function (x, t, b, c, d) {
		if (t==0) return b;
		if (t==d) return b+c;
		if ((t/=d/2) < 1) return c/2 * Math.pow(2, 10 * (t - 1)) + b;
		return c/2 * (-Math.pow(2, -10 * --t) + 2) + b;
	},
	easeInCirc: function (x, t, b, c, d) {
		return -c * (Math.sqrt(1 - (t/=d)*t) - 1) + b;
	},
	easeOutCirc: function (x, t, b, c, d) {
		return c * Math.sqrt(1 - (t=t/d-1)*t) + b;
	},
	easeInOutCirc: function (x, t, b, c, d) {
		if ((t/=d/2) < 1) return -c/2 * (Math.sqrt(1 - t*t) - 1) + b;
		return c/2 * (Math.sqrt(1 - (t-=2)*t) + 1) + b;
	},
	easeInElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return -(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
	},
	easeOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
	},
	easeInOutElastic: function (x, t, b, c, d) {
		var s=1.70158;var p=0;var a=c;
		if (t==0) return b;  if ((t/=d/2)==2) return b+c;  if (!p) p=d*(.3*1.5);
		if (a < Math.abs(c)) { a=c; var s=p/4; }
		else var s = p/(2*Math.PI) * Math.asin (c/a);
		if (t < 1) return -.5*(a*Math.pow(2,10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )) + b;
		return a*Math.pow(2,-10*(t-=1)) * Math.sin( (t*d-s)*(2*Math.PI)/p )*.5 + c + b;
	},
	easeInBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*(t/=d)*t*((s+1)*t - s) + b;
	},
	easeOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158;
		return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
	},
	easeInOutBack: function (x, t, b, c, d, s) {
		if (s == undefined) s = 1.70158; 
		if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
		return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
	},
	easeInBounce: function (x, t, b, c, d) {
		return c - jQuery.easing.easeOutBounce (x, d-t, 0, c, d) + b;
	},
	easeOutBounce: function (x, t, b, c, d) {
		if ((t/=d) < (1/2.75)) {
			return c*(7.5625*t*t) + b;
		} else if (t < (2/2.75)) {
			return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
		} else if (t < (2.5/2.75)) {
			return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
		} else {
			return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
		}
	},
	easeInOutBounce: function (x, t, b, c, d) {
		if (t < d/2) return jQuery.easing.easeInBounce (x, t*2, 0, c, d) * .5 + b;
		return jQuery.easing.easeOutBounce (x, t*2-d, 0, c, d) * .5 + c*.5 + b;
	}
});

/* 
* ImageLens
* A jQuery plug-in for Lens Effect Image Zooming
* http://www.dailycoding.com/Posts/imagelens__a_jquery_plugin_for_lens_effect_image_zooming.aspx
*/
(function ($) {
    $.fn.imageLens = function (options) {

        var defaults = {
            lensSize: 180,
            borderSize: 0,
            borderColor: "#FFF"
        };
        var options = $.extend(defaults, options);
        var lensStyle = "background-position: 0px 0px;width: " + String(options.lensSize) + "px;height: " + String(options.lensSize)
            + "px;float: left;display: none;border-radius: " + String(options.lensSize / 2 + options.borderSize)
            + "px;border: " + String(options.borderSize) + "px solid " + options.borderColor 
            + ";background-repeat: no-repeat;position: absolute;";

        return this.each(function () {
            var obj = $(this);

            var offset = $(this).offset();
            //console.log('offset left: ' + offset.left + ', offset top: ' + offset.top);

            // Creating lens
            var target = $("<div style='" + lensStyle + "' class='" + options.lensCss + "'>&nbsp;</div>").appendTo($(this).parent());
            var targetSize = target.size();

            // Calculating actual size of image
            var imageSrc = options.imageSrc ? options.imageSrc : $(this).attr("src");
            var imageTag = "<img style='display:none;' src='" + imageSrc + "' />";

            var widthRatio = 0;
            var heightRatio = 0;

            $(imageTag).load(function () {
                widthRatio = $(this).width() / obj.width();
                heightRatio = $(this).height() / obj.height();
            }).appendTo($(this).parent());

            target.css({ backgroundImage: "url('" + imageSrc + "')" });

            target.mousemove(setPosition);
            $(this).mousemove(setPosition);

            // Hide when user moves quickly off image
            target.mouseout(hideLens)
			$(this).mouseout(hideLens)
			$(window).scroll(hideLens);

			function hideLens() {
				target.hide();
			}

            function setPosition(e) {

                var offset = obj.offset();
				var leftPos = parseInt(e.pageX - offset.left);
                var topPos = parseInt(e.pageY - offset.top);
                //console.log('leftPos: ' + leftPos + ', topPos: ' + topPos);


                if (leftPos < 0 || topPos < 0 || leftPos > obj.width() || topPos > obj.height()) {
                    target.hide();
                }
                else {
                    target.show();

                    
                    // position background image inside target
                    leftPos = String(((e.pageX - offset.left) * widthRatio - (target.width() + options.borderSize * 2) / 2) * (-1));
                    topPos = String(((e.pageY - offset.top) * heightRatio - (target.height() + options.borderSize * 2) / 2) * (-1));
                    target.css({ backgroundPosition: leftPos + 'px ' + topPos + 'px' });

                    // position the target
                    leftPos = String((e.pageX - offset.left) - target.width() / 2);
					topPos = String((e.pageY - offset.top) - target.height() / 2);
					target.css({ left: leftPos + 'px', top: topPos + 'px' });
                }
            }
        });
    };
})(jQuery);


/* 
* Function to fade in image sprites on hover
*/
$.fn.fadeSprite = function() { 	

	this.mouseenter(function(e){

		$(this).find('a').hoverFlow(e.type, {opacity:1}, 300);
            
	}).mouseleave(function(e){

		$(this).find('a').hoverFlow(e.type, {opacity:0}, 300);

	});	
};


/* 
* Function to animate image thumbnail arrows on hover
*/
$.fn.hoverThumb = function() { 	
  	
	// only animate for large desktop browsers
  	if($(window).width() >= 1140){

	  	this.mouseenter(function(e){
		
			$(this).find('.arrow-r').hoverFlow(e.type, {opacity:1, right:15}, 500);
			//$(this).hoverFlow(e.type, {opacity:1}, 300).siblings().hoverFlow(e.type, {opacity:0.3}, 300);
			$(this).stop().animate({'opacity':'1'}, 300).siblings().stop().animate({'opacity':'0.4'}, 500);

		}).mouseleave(function(e){

			$(this).find('.arrow-r').hoverFlow(e.type, {opacity:0, right:0}, 500);

		});	 

		// once the mouse leaves the whole thumbs div
		$('#thumbs').mouseleave(function(e){

			// we reset the thumbs 
			$('#thumbs li').stop().animate({'opacity':'1'}, 500);

		});	

	}
};		

/* 
* Function to bring in portfolio gallery items one by one
*/
$.fn.animateGallery = function() { 	

	$(this).each(function(i){
		$(this).delay(i * 150).animate({'opacity':'1'}, 300, 'easeOutExpo');
	});
};

/* 
* Function to animate leaving a page
*/
$.fn.leavePage = function() { 	
  	
	this.click(function(event){

		event.preventDefault();
		linkLocation = this.href;

		$('#header').animate({'opacity':'0', 'top':'-92px'}, 500, 'easeOutExpo');
		$('body').fadeOut(500, function(){
			window.location = linkLocation;
		});      
	}); 
};

/* 
* Function to animate content details
*/
function animateContent() { 

	// show the rest of the content		
	$('#content-detail').css({'opacity':'0', 'top':'50px'}).stop().animate({'opacity':'1', 'top':'0px'}, 500, 'easeOutExpo');
	$('#footer').css({'opacity':'0', 'top':'50px'}).stop().animate({'opacity':'1', 'top':'0px'}, 500, 'easeOutExpo');
};

/* 
* Function to switch face on browser resize
*/
$.fn.resizeFace = function() { 

	$(window).resize(function() {

	  	// Show large face
	  	if($(window).width() >= 1140) {
	  		
	  		$('#designer-img').css({'opacity':'1'});
	  		$('#coder-img').css({'opacity':'1'});
	  		$('#designer-bg').css({'opacity':'1'});
	  		$('#coder-bg').css({'opacity':'1'});
	  		$('#designer').css({'opacity':'1'});
	  		$('#coder').css({'opacity':'1'});

	  	} else { // Show smaller face image

	  		$('#face-img').css({'opacity':'1'});
	  		$('#designer').css({'opacity':'1'});
	  		$('#coder').css({'opacity':'1'});
	  	}

	});
};

/* 
* Function to animate home page
*/
$.fn.animateHome = function() { 

	// only animate for large desktop browsers
	if($(window).width() >= 1140){

	      $('#content').animate({'opacity':'1'}, 500, 'easeOutExpo');
	      $('#designer-img').css({'left':'-500px'}).stop().animate({'opacity':'1', 'left':'100px'}, 1000, 'easeOutExpo');
	      $('#coder-img').css({'right':'-500px'}).stop().animate({'opacity':'1', 'right':'100px'}, 1000, 'easeOutExpo');
	      $('#designer-bg').css({'left':'-500px'}).stop().animate({'opacity':'1', 'left':'100px'}, 1500, 'easeOutBack');
	      $('#coder-bg').css({'right':'-500px'}).stop().animate({'opacity':'1', 'right':'100px'}, 1500, 'easeOutBack');
	      $('#designer').delay(1500).animate({'opacity':'1'}, 500, 'easeOutExpo');
	      $('#coder').delay(1500).animate({'opacity':'1'}, 500, 'easeOutExpo', function(){ animateFace(); });

	}else{
	    
	    $('#content').animate({'opacity':'1'}, 500, 'easeOutExpo');
	    $('#face-img').animate({'opacity':'1'}, 2000, 'easeOutExpo');
	    $('#designer').delay(1000).animate({'opacity':'1'}, 500, 'easeOutExpo');
	    $('#coder').delay(1000).animate({'opacity':'1'}, 500, 'easeOutExpo', function(){ animateContent(); });

	}
}; 


/* 
* Function to animate main section
*/
function animateMain() { 

	$('#text-main').css({'visibility':'visible', 'right':'50%'}).stop().delay(200).animate({'opacity':'1', 'right':'0%'}, 1000, 'easeOutExpo');
	$('#img-main').css({'visibility':'visible', 'left':'50%'}).stop().delay(300).animate({'opacity':'1', 'left':'0%'}, 1000, 'easeOutExpo');
	
	$('#snaps').css({'visibility':'visible', 'opacity':'1'});
	$('#snaps-1').css({'visibility':'visible', 'top':'50px'}).stop().delay(500).animate({'opacity':'1', 'top':'0px'}, 200, 'easeOutBack');
	$('#snaps-2').css({'visibility':'visible', 'top':'50px'}).stop().delay(700).animate({'opacity':'1', 'top':'0px'}, 200, 'easeOutBack');
	$('#snaps-3').css({'visibility':'visible', 'top':'50px'}).stop().delay(900).animate({'opacity':'1', 'top':'0px'}, 200, 'easeOutBack');
	$('#snaps-4').css({'visibility':'visible', 'top':'50px'}).stop().delay(1100).animate({'opacity':'1', 'top':'0px'}, 200, 'easeOutBack');
	$('#snaps-5').css({'visibility':'visible', 'top':'50px'}).stop().delay(1300).animate({'opacity':'1', 'top':'0px'}, 200, 'easeOutBack');
	$('#snaps-6').css({'visibility':'visible', 'top':'50px'}).stop().delay(1500).animate({'opacity':'1', 'top':'0px'}, 200, 'easeOutBack',  function(){ animateContent(); });

};


/* 
* Function to animate pages (e.g. single-portfolio.php)
*/
function animatePage() { 

	$('#text-main').css({'visibility':'visible', 'right':'50%'}).stop().delay(200).animate({'opacity':'1', 'right':'0%'}, 1000, 'easeOutExpo');
	$('#img-main').css({'visibility':'visible', 'left':'50%'}).stop().delay(300).animate({'opacity':'1', 'left':'0%'}, 1000, 'easeOutExpo', function(){ animateContent(); });
	
};

/* 
* Function to animate contact page
*/
function animateContact() { 

	var navi = $('#navi');

	navi.stop().delay(2000).animate({'opacity':'1'}, 1000, 'easeOutQuad', function(){ 
		
		if($(window).width() >= 1140){

			navi.imageLens({ imageSrc: "http://v2.adhamdannaway.com/wp-content/themes/ad/images/adham-dannaway-sky-people.jpg" });
		}
	});
	
};

/* 
* Function to animate about page
*/
function animateAbout() { 

	// Animate section 0 (if window height is small enough)
	if($(window).height() <= 880){

	    $('#img-0').waypoint(function(event, direction) {

		   $('#img-0').css({'visibility':'visible', 'top': '500px'}).stop().animate({'opacity':'1', 'top':'0px'}, 1000, 'easeOutExpo');

		}, {
		   offset: '80%',
		   triggerOnce: true
		});

	}else{

		$('#img-0').css({'visibility':'visible', 'opacity':'1'});
	}

    // Animate Section 1
    $('#img-1').waypoint(function(event, direction) {

		$('#img-1').css({'visibility':'visible', 'right': '50%'}).stop().animate({'opacity':'1', 'right':'0%'}, 1000, 'easeOutExpo');

	}, {
	   offset: '80%',
	   triggerOnce: true
	});

    // Animate Chart
    $('.bar-chart').waypoint(function(event, direction) {

       $('#aqua').css({'visibility':'visible', 'height': '0%'}).stop().delay(200).animate({'opacity':'1', 'height':'95%'}, 1000, 'easeOutExpo');
       $('#pink').css({'visibility':'visible', 'height': '0%'}).stop().delay(400).animate({'opacity':'1', 'height':'90%'}, 1000, 'easeOutExpo');
       $('#yellow').css({'visibility':'visible', 'height': '0%'}).stop().delay(600).animate({'opacity':'1', 'height':'80%'}, 1000, 'easeOutExpo');
       $('#brown').css({'visibility':'visible', 'height': '0%'}).stop().delay(800).animate({'opacity':'1', 'height':'75%'}, 1000, 'easeOutExpo');
       $('#red').css({'visibility':'visible', 'height': '0%'}).stop().delay(1000).animate({'opacity':'1', 'height':'40%'}, 1000, 'easeOutExpo');

	}, {
	   offset: '80%',
	   triggerOnce: true
	});

    // Animate Featured in
    $('#img-2').waypoint(function(event, direction) {

		$('#img-2').css({'visibility':'visible', 'left': '50%'}).stop().animate({'opacity':'1', 'left':'0%'}, 1000, 'easeOutExpo');

	}, {
	   offset: '80%',
	   triggerOnce: true
	});
};


/* 
* Function to animate featured page
*/
function animateFeatured() { 

	// Animate section 0 (if window height is small enough)
	if($(window).height() <= 880){

	    $('#img-0').waypoint(function(event, direction) {

		   $('#img-0').css({'visibility':'visible', 'right': '50%'}).stop().animate({'opacity':'1', 'right':'0%'}, 1000, 'easeOutExpo');

		}, {
		   offset: '80%',
		   triggerOnce: true
		});

	}else{

		$('#img-0').css({'visibility':'visible', 'opacity':'1'});
	}

	// Animate section 1
    $('#img-1').waypoint(function(event, direction) {

	   $('#img-1').css({'visibility':'visible', 'left': '50%'}).stop().animate({'opacity':'1', 'left':'0%'}, 1000, 'easeOutExpo');

	}, {
	   offset: '80%',
	   triggerOnce: true
	});

    // Animate section 2
    $('#icons').waypoint(function(event, direction) {

	   $('#icons').css({'visibility':'visible', 'top': '250px'}).stop().animate({'opacity':'1', 'top':'0px'}, 1000, 'easeOutExpo');

	}, {
	   offset: '80%',
	   triggerOnce: true
	});

};

/* 
* Function to animate face
*/
function animateFace() {

	var designerImg 	= $('#designer-img');
	var coderImg 		= $('#coder-img');
	var designerHover	= $('#designer');
	var coderHover		= $('#coder');
	var designerDesc	= $('#designer-desc');
	var coderDesc		= $('#coder-desc');	
	var designerArrow	= $('#designer-arrow');
	var coderArrow		= $('#coder-arrow');		
	var designerBg		= $('#designer-bg');
	var coderBg			= $('#coder-bg');
	var face 			= $('#face');
	var section 		= $('#section');
	var duration 		= 500;

	var mouseX = 0;
	var relMouseX = 520;
	var xp = 520;
	frameRate =  30;
	timeInterval = Math.round( 1000 / frameRate );		

	// Firstly animate the bottom content onto the page
	animateContent();

	section.mouseenter(function(e){

		// Get mouse position
		section.mousemove(function(e){

		   	// raw mouse position
		   	mouseX = e.pageX;

		   	// mouse position relative to face div
		   	relMouseX = mouseX - face.offset().left;

		});
		
		// Animate the face based on mouse movement
		loop = setInterval(function(){

			// zeno's paradox dampens the movement
			xp += (relMouseX - xp) / 12;

			designerImg.css({width:420 + (520 - xp) * 0.5, left: 100 + (520 - xp) * 0.1});
		    coderImg.css({width:420 + (xp - 520) * 0.5, right: 100 - (520 - xp) * 0.1});

		    designerBg.css({left: 100 + (520 - xp) * 0.05, opacity: ((1040 - xp)/520)});
		    coderBg.css({right:  100 + (xp - 520) * 0.05, opacity: (xp/520)});

		    designerDesc.css({opacity: ((1040 - xp)/520)});
		    coderDesc.css({opacity: (xp/520)});

		}, timeInterval );

	}).mouseleave(function(e){ 

		// reset the face to initial state
		clearInterval(loop);
		xp 			= 520;
		mouseX 		= 0;
		relMouseX 	= 520;

		designerImg.hoverFlow(e.type, {width: 420, left: 100}, duration, 'easeOutQuad');
		coderImg.hoverFlow(e.type, {width: 420, right: 100}, duration, 'easeOutQuad');
		coderDesc.hoverFlow(e.type, {opacity: 1}, duration, 'easeOutQuad');
		designerDesc.hoverFlow(e.type, {opacity: 1}, duration, 'easeOutQuad');
		coderBg.hoverFlow(e.type, {right:100, opacity: 1}, duration, 'easeOutQuad');
		designerBg.hoverFlow(e.type, {left:100, opacity: 1}, duration, 'easeOutQuad');

	}); 
	
}; 

/* 
* Function to detect IE
*/
// ----------------------------------------------------------
// A short snippet for detecting versions of IE in JavaScript
// without resorting to user-agent sniffing
// ----------------------------------------------------------
// If you're not in IE (or IE version is less than 5) then:
//     ie === undefined
// If you're in IE (>=5) then you can determine which version:
//     ie === 7; // IE7
// Thus, to detect IE:
//     if (ie) {}
// And to detect the version:
//     ie === 6 // IE6
//     ie > 7 // IE8, IE9 ...
//     ie < 9 // Anything less than IE9
// ----------------------------------------------------------
 
// UPDATE: Now using Live NodeList idea from @jdalton
 
var ie = (function(){
 
    var undef,
        v = 3,
        div = document.createElement('div'),
        all = div.getElementsByTagName('i');
 
    while (
        div.innerHTML = '<!--[if gt IE ' + (++v) + ']><i></i><![endif]-->',
        all[0]
    );
 
    return v > 4 ? v : undef;
 
}());



/* 
* Function to print IE page
*/
function ieMessage() {

	// define the HTML of the page
	var page  = "<div id='ie' class='clearfix'>";
	page 	 += "<section class='main nopad-b'>";
	page 	 += "<div class='row'>";
	page 	 += "<div class='col-5'>";
	page 	 += "<h1>网站加载失败</h1>";
	page 	 += "<p class='intro'>虽然你不是一个程序员，但也不能自暴自弃~您的浏览器版本 也太低了吧~</p>";
	page 	 += "<p>本网站的不支持的浏览器有ie 6, 7 ,8以及更早的版本。如果想要正常浏览网站，请使用以下比较强大的浏览器。</p>";
	page 	 += "<p>";
	page 	 += "<a href='http://www.google.com/chrome' target='_blank' class='icon-browser chrome'></a>";
	page 	 += "<a href='http://www.mozilla.org/en-US/firefox/new/' target='_blank' class='icon-browser firefox'></a>";
	page 	 += "<a href='http://www.apple.com/au/safari/'' target='_blank' class='icon-browser safari'></a>";
	page 	 += "</p>";
	page 	 += "</div>";
	page 	 += "<div class='col-7 last'>";
	page 	 += "<img class='major' src='/files/images/zpy.png' alt='zpy'>";
	page 	 += "</div>";
	page 	 += "</div>"
	page 	 += "</section>";
	page 	 += "</div>";		
	
	// Print the page
	//$('body').prepend(page);
	$('.content').replaceWith(page);

}



