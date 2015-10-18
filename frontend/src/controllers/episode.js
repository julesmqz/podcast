appCtrls.controller('AddEpisodeCtrl', ['$scope', '$http', '$location', '$routeParams', 'config', 'Upload',
	function($scope, $http, $location, $routeParams, config, Upload) {
		var vm = this;
		this.new = {};

		this.goBack = function() {
			$location.path('/channel/' + $routeParams.channelId);
		};

		this.upload = function() {
			this.uploadError = null;
			if (this.audioFile) {
				var file = this.audioFile;
				file.upload = Upload.upload({
					url: config.backUrl + 'episode/audio',
					data: {
						audio: file
					}
				});

				file.upload.then(function(res) {
					// console.log('Success', res);
					vm.new.fileName = res.data.data.file_name;
					vm.new.fileType = res.data.data.file_type;
					vm.new.title = res.data.data.client_name;
					vm.new.pubDate = file.lastModifiedDate;
					vm.new.audioFilePath = config.backUrl + 'audios/' + vm.new.fileName;

					vm.song = {
						id: 1,
						title: vm.new.title,
						artist: vm.new.author,
						url: config.backUrl + 'audios/' + res.data.data.file_name
					};

					Upload.mediaDuration(file).then(function(durationInSeconds){
						vm.audio = {
							duration: durationInSeconds
						};
						vm.audioFile = null;
					});
					

					/*setTimeout(function() {
						var audio = document.getElementById('my-audio');
						console.log(audio.duration);
					}, 5000);*/
					// console.log( audio.duration );
				}, function(res) {
					console.log('Error', res);
					// if (response.status > 0)
					// $scope.errorMsg = response.status + ': ' + response.data;
				});

				file.upload.progress(function(evt) {
					// Math.min is to fix IE which reports 200% sometimes
					file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
				});
			} else {
				this.uploadError = "No file selected.";
			}

		};

		this.save = function() {
			// var audio = document.getElementById('my-audio');
			// console.log(audio.duration);
			var post = {
				title: vm.new.title,
				author: vm.new.author,
				subtitle: vm.new.subtitle,
				summary: vm.new.summary,
				pubDate: vm.new.pubDate,
				duration: vm.audio.duration,
				keywords: vm.new.keywords,
				fileName: vm.new.fileName,
				fileType: vm.new.fileType,
				channel_id: $routeParams.channelId
			};

			// console.log(post);

			$http.post(config.backUrl + 'episode', post).then(function(data, status) {
				// console.log(data,status);
				// logged, redirect to home
				// $location.path('/channels');
				vm.goBack();
			}, function(res) {
				console.log('failure', res);
				// not logged, nothing to do
				//$location.path('/login');
			});
		};

		this.cancel = function() {
			vm.song = null;
			vm.new = {};
		}

		this.songTest = {
			id: 2,
			title: 'Title',
			artist: 'Me',
			url: config.backUrl + 'audios/audio20151004045125.mp3'
		};


	}
]);