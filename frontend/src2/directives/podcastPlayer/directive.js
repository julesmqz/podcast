module.exports = function(config, angularPlayer, $compile) {
	console.log(angularPlayer);
	var link = function(scope, element, attrs) {
		/*angularPlayer.init();
		// console.log(scope);

		scope.$watch('song', function(newSong, oldSong) {
			angularPlayer.clearPlaylist(function(data) {
				scope.isPlaying = angularPlayer.isPlayingStatus();
				scope.currentPlaying = null;
				console.log('cleared, ok now add to playlist');
				angularPlayer.addTrack( newSong );
				angularPlayer.play();
				scope.isPlaying = angularPlayer.isPlayingStatus();
				scope.currentPlaying = angularPlayer.currentTrackData();
				// console.log( scope.currentPlaying );

			});
		});

		scope.play = function(){
			angularPlayer.play();
			scope.isPlaying = angularPlayer.isPlayingStatus();
		}

		scope.pause = function(){
			console.log('PAUSING');
			angularPlayer.pause();
			scope.isPlaying = angularPlayer.isPlayingStatus();
		}*/


	}

	return {
		restrict: 'E',
		scope: {
			song: '='
		},
		templateUrl: config.basePath + 'directives/podcastPlayer/template.html',
		link: link
	};
}