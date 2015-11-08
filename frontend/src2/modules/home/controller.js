module.exports = function(Channel,Config, $location) {
	this.resourceUrl = Config.resourceUrl || '/';
	this.getChannels = function() {
		var channels = Channel.get();

		channels.then(function(res) {
			var response = res.data;
			if( typeof res.data != 'array' ){
				//wrap whatever we get in an array
				response = [ res.data ];
			}
			this.channels = response;
		}.bind(this));
	};

	this.goToChannel = function( id ){
		$location.path('/channel/' + id);
	}

	this.init = function() {
		this.getChannels();
	};

	this.init();
}