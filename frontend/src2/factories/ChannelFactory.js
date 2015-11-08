module.exports = function($http, config, Q, Upload) {
	//Since we don't have name avaible for the function, we need to refer as this
	var publicApi = config.publicApi;

	this.get = function(options) {
		options = options || {};
		
		return $http.get( publicApi + 'channel', options );
	};

	this.getEpisodes = function(channelId, options) {
		options = options || {};
		
		return $http.get( publicApi + 'channel/episodes/'+channelId, options );
	};

	return this;
};