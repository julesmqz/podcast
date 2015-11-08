module.exports = [{
	'key': 'MainCtrl',
	'fn': ['$timeout', '$mdSidenav', '$log',require('./main/controller')]
},{
	'key': 'MenuCtrl',
	'fn': [require('./menu/controller')]
},{
	'key': 'HomeCtrl',
	'fn': ['channelFactory','config', '$location',require('./home/controller')]
},{
	'key': 'ChannelCtrl',
	'fn': ['channelFactory','config','$location','$routeParams',require('./channel/controller')]
}];