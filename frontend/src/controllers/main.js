appCtrls.controller('MainCtrl', ['$scope', "$location", 'userFactory',
	function($scope, $location, User) {
		var self = this;

		this.init = function() {
			self.user = null;
			self.currentUrl = $location.path();
			self.checkUser();
		}

		this.checkUser = function() {
			var currentUrl = $location.path();
			// console.log('currentUrl',currentUrl);
			if (currentUrl != '/login') {
				User.check();
				var user = User.get();

				user.then(function(res) {
					self.user = res;
				});
			}
			else
			{
				User.destroy();
				self.user = null;
			}
		}

		$scope.$on('$locationChangeSuccess', function() {
			self.currentUrl = $location.path();
			self.checkUser();
			// console.log('routerUpdate');
		});

		this.init();



	}
]);