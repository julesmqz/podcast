app.factory('channelFactory', ['$http', 'config', '$q', 'Upload', function($http, config, Q, Upload) {

	var urlBase = config.backUrl;
	var channelFactory = {};

	channelFactory.set = function(channel) {
		this.info = channel;
	};

	channelFactory.setList = function(list) {
		var sefl = this;
		if (typeof(list) == 'array') {
			self.list = list;
		} else {
			self.list = [list];
		}
	};

	channelFactory.get = function(id) {
		var promise = Q.defer();
		var self = this;
		if (self.info && self.info.id === id) {
			// console.log('from local');
			promise.resolve(self.info);
		} else {
			self.getFromApi(id).then(function(res) {
				self.set(res.data);
				promise.resolve(res.data);
			}, function(res) {
				promise.reject();
			});
		}

		return promise.promise;

	}

	channelFactory.getList = function() {
		var promise = Q.defer();
		var self = this;
		if (this.list) {
			// console.log('from local');
			promise.resolve(self.list);
		} else {
			this.getListFromApi().then(function(res) {

				var list;
				if (typeof(res.data) == 'array') {
					list = res.data;
				} else {
					list = [res.data];
				}
				self.setList(list);
				promise.resolve(list);
			}, function(res) {
				promise.reject();
			});
		}

		return promise.promise;

	}

	channelFactory.getFromApi = function(id) {
		return $http.get(urlBase + 'channel?id=' + id);
	};

	channelFactory.getListFromApi = function() {
		return $http.get(urlBase + 'channel');
	};

	channelFactory.save = function(channel) {

		if (channel.image != null && typeof channel.image != 'string' ) {
			return this.saveWithImage(channel);
		} else {
			// console.log( channel );
			return this.saveWithoutImage(channel);
		}
	};

	channelFactory.saveWithImage = function(channel) {
		return Upload.upload({
			url: urlBase + 'channel/image',
			data: channel
		});
	};

	channelFactory.saveWithoutImage = function(channel) {
		// rerconsole.log('putting');
		return $http.put( urlBase + 'channel', channel );
	};

	return channelFactory;
}]);