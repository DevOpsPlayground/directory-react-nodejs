var _ = require('lodash');
var packageJson = require('./package.json');

var setupNpmInstall = function setupNpmInstall(grunt) {
	grunt.config('exec', {
		npm_install: 'npm install'
	});
	
	grunt.registerTask('npm-install', 'exec:npm_install');
};

module.exports = function(grunt) {
//	setupNpmInstall(grunt);
	grunt.registerTask('build', ['clean']);
};