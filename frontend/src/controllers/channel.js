appCtrls.controller('ChannelCtrl', ['$scope', '$http', '$location', '$routeParams', 'config', 'channelFactory',
	function($scope, $http, $location, $routeParams, config, Channel) {
		var vm = this;

		var channel = Channel.get( $routeParams.channelId );
		channel.then(function(rs){
			vm.info = rs;
		});

		$http.get(config.backUrl + 'episode?channel_id=' + $routeParams.channelId).then(function(res) {
			// console.log('res.data', res.data);
			if (res.data.hasOwnProperty('length')) {
				vm.episodes = res.data;
				console.log('episodes', vm.episodes);
			} else {
				vm.episodes = [res.data];
			}

		}, function(res) {
			vm.episodes = null;
		});

		this.addEpisode = function() {
			$location.path('/channel/' + $routeParams.channelId + '/episode/add');
		}

	}
]);


appCtrls.controller('ListChannelCtrl', ['$scope', "$location", 'userFactory', 'channelFactory',
	function($scope, $location, User, Channel) {
		var vm = this;
		User.check();

		/*var user = User.get();

		user.then(function( rs ){
			console.log( rs );
		});*/



		var list = Channel.getList();

		list.then(function(rs) {
			vm.list = rs;
		});

		this.openAdd = function() {
			$location.path('/channel/add');
		}

		this.openChannel = function( id ) {
			$location.path('/channel/'+id);
		}
	}
]);

appCtrls.controller('RssCtrl', ['$scope', '$http', "$location", 'config', "$routeParams",
	function($scope, $http, $location, config, $routeParams) {
		var vm = this;
		$http.get(config.backUrl + 'login/check').then(function(data, status) {

		}, function(res) {
			// console.log('failure',res);
			// not logged, nothing to do
			$location.path('/login');
		});


		$http.get(config.backUrl + 'channel/rss.xml?id=' + $routeParams.channelId).then(function(res) {
			console.log(res);
			vm.xml = res.data;

		}, function(res) {
			vm.xml = null;
		});
	}
]);