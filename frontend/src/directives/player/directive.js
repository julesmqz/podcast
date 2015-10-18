appDirectives.directive('audioPlayer',
	function(config, $compile) {


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
		var link =  function(scope,element,attrs){
			console.log(scope);
		}

		return {
			restrict: 'E',
			scope: {
				song: '='
			},
			templateUrl: config.clientUrl + 'directives/player/small.html',
			link: link
		};
	}
);