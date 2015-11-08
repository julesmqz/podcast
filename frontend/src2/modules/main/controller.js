module.exports = function($timeout, $mdSidenav, $log) {
	var vm = this;
	this.openMenu = buildDelayedToggler('left');
	this.isMenuOpen = function() {
		return $mdSidenav('left').isOpen();
	};

	this.closeMenu = function() {
			$mdSidenav('left').close()
				.then(function() {
					$log.debug("close LEFT is done");
				});
		}
		/**
		 * Supplies a function that will continue to operate until the
		 * time is up.
		 */
	function debounce(func, wait, context) {
		var timer;
		return function debounced() {
			var context = vm,
				args = Array.prototype.slice.call(arguments);
			$timeout.cancel(timer);
			timer = $timeout(function() {
				timer = undefined;
				func.apply(context, args);
			}, wait || 10);
		};
	}
	/**
	 * Build handler to open/close a SideNav; when animation finishes
	 * report completion in console
	 */
	function buildDelayedToggler(navID) {
		return debounce(function() {
			$mdSidenav(navID)
				.toggle()
				.then(function() {
					$log.debug("toggle " + navID + " is done");
				});
		}, 200);
	}

	function buildToggler(navID) {
		return function() {
			$mdSidenav(navID)
				.toggle()
				.then(function() {
					$log.debug("toggle " + navID + " is done");
				});
		}
	}

	this.song = {
		id: 2,
		title: 'Title',
		artist: 'Me',
		url: '/podcast/audios/audio.mp3',
		image: '/podcast/images/image20151011031734.png' || 'http://placehold.it/200x200'
	};
};