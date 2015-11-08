function Routes($routeProvider) {
	$routeProvider.
	when('/', {
		templateUrl: 'modules/home/template.html',
		controller: 'HomeCtrl as home'
	}).
	when('/channel/:id', {
		templateUrl: 'modules/channel/template.html',
		controller: 'ChannelCtrl as channel'
	}).
	otherwise({
		redirectTo: '/'
	});
};

module.exports = Routes;