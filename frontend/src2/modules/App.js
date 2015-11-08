var angular = require('angular');
require('angular-route');
require('ng-file-upload');
require('angular-material');
require('../soundmanager/');
require('../config/config');

function App(options) {
	var vm = this;
	this.name = options.name || 'genericApp';

	this.module = angular.module(this.name, ['ngRoute','ngFileUpload','ngMaterial','angularSoundManager','appConfig']);
	if (options.hasOwnProperty('routes') && typeof options.routes == 'function') {
		this.setRoutes(options.routes);
	}

	options.controllers.forEach(function(Controller) {
		vm.setController(Controller.key, Controller.fn);
	});

	options.factories.forEach(function(Factory) {
		vm.setFactory(Factory.key, Factory.fn);
	});

	options.directives.forEach(function(Directive) {
		vm.setDirectives(Directive.key, Directive.fn);
	});

	/*
	options.services.forEach(function(Service) {
		vm.setService(Service.key, Service.fn);
	});*/
}

App.prototype.setRoutes = function(routes) {
	this.module.config(['$routeProvider', routes]);
};

App.prototype.setController = function(key, controller) {
	this.module.controller(key, controller);
};

App.prototype.setFactory = function(key, factory) {
	// console.log('setting factory', key, factory);
	this.module.factory(key, factory);
};

App.prototype.setDirectives = function(key, directive) {
	// console.log('setting factory', key, factory);
	this.module.directive(key, directive);
};

App.prototype.start = function() {
	var appName = this.name;
	angular.element(document).ready(function() {
		angular.bootstrap(document, [appName]);
	});
};

module.exports = App;