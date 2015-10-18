var app = angular.module('podcastApp', [
	'ngRoute',
	'appCtrls',
	'appDirectives',
	'appConfig'
]);

app.config(['$routeProvider',
	function($routeProvider) {
		$routeProvider.
		when('/login', {
			templateUrl: 'views/login.html',
			controller: 'LoginCtrl as login'
		}).
		when('/channels', {
			templateUrl: 'views/listChannel.html',
			controller: 'ListChannelCtrl as lchannel'
		}).
		when('/channel/:channelId', {
			templateUrl: 'views/channel.html',
			controller: 'ChannelCtrl as channel'
		}).
		when('/channel/:channelId/episode/add', {
			templateUrl: 'views/addEpisode.html',
			controller: 'AddEpisodeCtrl as aepisode'
		}).
		when('/channel/:channelId/rss', {
			templateUrl: 'views/rss.html',
			controller: 'RssCtrl as rss'
		}).
		otherwise({
			redirectTo: '/login'
		});
	}
]);

app.filter('secondsToDateTime', [function() {
	return function(seconds) {
		return new Date(1970, 0, 1).setSeconds(seconds);
	};
}])

var appCtrls = angular.module('appCtrls', ['appConfig', 'ngFileUpload']);
var appDirectives = angular.module('appDirectives', ['appConfig', 'angularSoundManager']);