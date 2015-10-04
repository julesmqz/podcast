app.factory('userFactory', ['$http', '$location', 'config', '$q', function($http, $location, config, Q) {

	var urlBase = config.backUrl;
	var userFactory = {};

	userFactory.check = function() {
		$http.get(urlBase + 'login/check').then(function(res) {
			// $location.path('/channels');
			//return res.data;
		}, function(res) {
			$location.path('/login');
			/*console.log('not cool');
			return null;*/
		});
	};

	userFactory.login = function(post) {
		return $http.post(urlBase + 'login', post);
	};

	userFactory.set = function(user) {
		this.info = user;
	};

	userFactory.get = function() {
		var promise = Q.defer();
		var self = this;
		if (this.info) {
			// console.log('from local');
			promise.resolve(this.info);
		} else {
			this.getFromApi().then(function(res) {
				self.set( res.data );
				promise.resolve(res.data);
			}, function(res) {
				promise.reject();
			});
		}

		return promise.promise;

	}

	userFactory.getFromApi = function(cb) {
		return $http.get(urlBase + 'login/check');
	};

	userFactory.destroy = function(){
		return $http.get(urlBase + 'login/destroy');
	}

	return userFactory;
}]);