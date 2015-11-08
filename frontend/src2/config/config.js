var angular = require('angular');
var basePath = window.basePath ? window.basePath : document.location.pathname.replace(/[^\/]*$/, "");
// console.log( basePath );
var config = angular.module('appConfig', []).value('config', {
	basePath: basePath,
	publicApi: "http://radiolavozdelangeldetusalud.mx/public_api/",
	resourceUrl: "http://radiolavozdelangeldetusalud.mx/"
});

module.exports = config;