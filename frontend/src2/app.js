var App = require('./modules/App');
var modules = require('./modules/');
var directives = require('./directives/');
var factories = require('./factories/');
var routes = require('./config/routes');

var options = {
	name: 'podcastApp',
	controllers: modules,
	directives: directives,
	factories: factories,
	routes: routes
};


var app = new App(options);

app.start();