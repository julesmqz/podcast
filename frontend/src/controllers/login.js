appCtrls.controller('LoginCtrl', ['$scope', '$http', '$location','config','userFactory',
	function($scope, $http, $location,config,User) {
		
		this.send = function() {
			var vm = this;
			this.error = null;
			var post = {
				user: this.user,
				pass: this.pass
			}
			User.login(post).then(function(res) {
				console.log('success', res);
				User.set(res.data.session_id);
				// redirect to home list
				$location.path('/channels');
			}, function(res) {
				console.log('failed', res);
				vm.error = 'La combinación de user y password es incorrecta.';
			});
		};
	}
]);