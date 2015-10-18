appDirectives.directive('tablePlayer',['config','angularPlayer',function(config, angularPlayer, $compile) {


		/*var getTemplate = function(contentType) {
			var template = '';

			switch (contentType) {
				case 'image':
					template = imageTemplate;
					break;
				case 'video':
					template = videoTemplate;
					break;
				case 'notes':
					template = bigTemplate;
					break;
				default:
					template = smallTemplate;
					break;
			}

			return template;
		}

		var link = function(scope, element, attrs) {
			// scope.rootDirectory = 'images/';

			element.html(getTemplate(scope.type)).show();

			$compile(element.contents())(scope);
		}*/
		var link = function(scope, element, attrs) {
			console.log(scope);

			scope.$on('track:progress', function(event, data) {
				if( data >= 100 ){
					console.log( 'finised' );
					angularPlayer.clearPlaylist();
					scope.togglePlaying(null,false);
				}
			});

			scope.togglePlaying = function(song, type) {
				// console.log( song );
				this.songs.forEach(function(song) {
					song.playing = false;
				});
				if( typeof song === 'object' && song !== null ){
					song.playing = type;
				}
				
			}
		}

		return {
			restrict: 'E',
			scope: {
				songs: '=',
				open: '&'
			},
			templateUrl: config.clientUrl + 'directives/table-player/table.html',
			link: link
		};
	}]
);