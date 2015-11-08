appCtrls.controller('ChannelCtrl', ['$scope', '$http', '$location', '$routeParams', 'config', 'channelFactory',
	function($scope, $http, $location, $routeParams, config, Channel) {
		var vm = this;

		this.config = config;

		function setChannel(rs) {
			if (rs.image == 'null') {
				rs.image = null;
			}
			vm.info = rs;
			vm._info = JSON.parse(JSON.stringify(vm.info));;
			if (!vm._info.hasOwnProperty('image')) {
				vm._info.image = null;
			}

			vm.cover = (typeof rs.image == 'string') ? config.resourceUrl + 'images/' + rs.image : null;
			// console.log(vm.cover);
		}

		var channel = Channel.get($routeParams.channelId);
		channel.then(function(rs) {
			setChannel(rs);
		});

		$http.get(config.backUrl + 'episode?channel_id=' + $routeParams.channelId).then(function(res) {
			// console.log('res.data', res.data);
			if (res.data.hasOwnProperty('length')) {
				vm.episodes = res.data;
			} else {
				vm.episodes = [res.data];
			}

			// console.log( vm.episodes );

			vm.episodes.forEach(function(episode) {
				episode.artist = episode.author;
				episode.url = config.resourceUrl + 'audios/' + episode.fileName;
			});

		}, function(res) {
			vm.episodes = null;
		});

		this.addEpisode = function() {
			$location.path('/channel/' + $routeParams.channelId + '/episode/add');
		}

		this.reset = function() {

			vm.info = JSON.parse(JSON.stringify(vm._info));
			vm.cover = (typeof vm.info.image == 'string') ? config.backUrl + 'images/' + vm.info.image : null;

			// console.log(vm.info, vm._info);
		}

		this.update = function() {
			// vm.info.id = $routeParams.channelId;
			// console.log( typeof vm.info.image );
			vm.updating = true;
			var update = Channel.save(vm.info);

			// console.log(update);

			if (update.hasOwnProperty('progress')) {
				update.progress(function(evt) {
					// Math.min is to fix IE which reports 200% sometimes
					vm.updateProgress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
					// console.log('loading bar');
					if (vm.updateProgress == 100) {
						vm.updateProgress = -1;
					}
				});
			}

			update.then(function(rs) {
				setChannel(rs.data);
				vm.updating = false;
			});


		}

		this.checkImage = function() {
			vm.cover = (typeof vm.info.image == 'string') ? config.resourceUrl + 'images/' + vm.info.image : null;
			// console.log(vm.cover);
		}

		this.openEpisode = function(episodeId) {
			console.log('episode', episodeId);
		}

	}
]);


appCtrls.controller('ListChannelCtrl', ['$scope', "$location", 'config', 'channelFactory',
	function($scope, $location, config, Channel) {
		var vm = this;

		var list = Channel.getList();

		list.then(function(rs) {
			vm.list = rs;
			vm.list.forEach(function(item) {
				if (item.image != 'null') {
					item.imageUrl = config.resourceUrl + 'images/' + item.image;
					console.log('item image', item.image, item.imageUrl);
				}
			})
		});

		this.openAdd = function() {
			$location.path('/channel/add');
		}

		this.openChannel = function(id) {
			$location.path('/channel/' + id);
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