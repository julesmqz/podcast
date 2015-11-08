module.exports = function(Channel, Config, $location, $routeParams) {
	this.resourceUrl = Config.resourceUrl || '/';
	this.getChannel = function() {
		var channel = Channel.get($routeParams.id);

		channel.then(function(res) {

			var response = res.data;
			this.info = response;
		}.bind(this));
	};

	this.getEpisodes = function() {
		var episodes = Channel.getEpisodes($routeParams.id);

		episodes.then(function(res) {
			console.log(res);
			var response = res.data;

			// console.log( typeof response );
			if ( !res.data.hasOwnProperty('length') || res.data.length <= 1) {
				response = [res.data];
			}
			var songs = [];
			response.forEach(function(ep) {
				var song = {
					id: ep.id,
					title: ep.title,
					artist: ep.author,
					url: '/audios/'+ep.fileName,
					image: ep.image ? '/images/'+ep.image : 'http://placehold.it/200x200'
				};
				songs.push(song);
			});
			this.episodes = songs;
		}.bind(this));
	}

	this.init = function() {
		this.getChannel();
		this.getEpisodes();
	};



	this.init();
}