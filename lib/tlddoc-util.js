#!/usr/bin/env node

/*
 * tlddoc-util
 * https://github.com/NKjoep/tlddoc-util
 *
 * Copyright (c) 2014 Andrea Dessì
 * Licensed under the MIT license.
 */


var _ = require('underscore');
var argv = require('minimist')(process.argv.slice(2));
var fs = require('fs');
var handlebars = require('handlebars');
var parseString = require('xml2js').parseString;
var p = require('xml2js').parseString;
var util = require('util');
var path = require('path');

var basepath = __dirname;

var files = argv._;
var usage = function(){
	console.log("\nUsage:");
	console.log("\ttlddoc-util.js [-o outputfolder] [--output=outputfolder] file [<file> ...]");
	process.exit();
}

var outputfolder = 'generated-docs';

if(argv.o || argv.output) {
	outputfolder = argv.o||argv.output;
}

if (files.length==0||argv.h||argv.help) {
	usage();
	process.exit(1);
}

handlebars.registerHelper("js-string", function(string) {
	if(string===undefined) return ""
	if (util.isArray(string)) string = string.join('');
	return string.toString().replace(/\n/g, '').replace(/\r/g, '').replace(/'/g, "\\'").replace(/"/g, '\\"').replace(/\s+/g, " ").replace(/^\s+/g, '').replace(/\s+$/g, '');
});

handlebars.registerHelper("cleanString", function(string) {
	if(string===undefined) return ""
	if (util.isArray(string)) string = string.join('');
	return string.toString().replace(/\n/g, '').replace(/\r/g, '').replace(/\s+/g, " ").replace(/^\s+/g, '').replace(/\s+$/g, '');
});

handlebars.registerHelper("scrollspySanitazer", function(string) {
	if(string===undefined) return ""
	if (util.isArray(string)) string = string.join('');
	return string.toString().replace(/\n/g, '').replace(/\r/g, '').replace(/\s+/g, " ").replace(/^\s+/g, '').replace(/\s+$/g, '').replace(/\./g, '');
});

var processedTagLib = [];

var processTagLib = function(filepath, callbackExecutor, index) {
	var xml = fs.readFileSync(filepath);

	parseString(xml, function (err, result) {
			if(err) {
				console.log('error processing: '+filepath);
				return;
			}
			var extractedTaglibrary = result.taglib;
			callbackExecutor(extractedTaglibrary, index);
	});

};

var createMainIndex = function() {
	processedTagLib = processedTagLib.sort(function(a, b){
		if ((a['short-name']).toString().toLowerCase() > (b['short-name']).toString().toLowerCase()) {
			return 1;
		}
		if ((a['short-name']).toString().toLowerCase() < (b['short-name']).toString().toLowerCase()) {
			return -1;
		}
		return 0;
	});
	console.log('sorted tag libraries...');
	try { fs.mkdirSync(outputfolder); } catch (e) {}

	templateSource = fs.readFileSync(basepath+"/templates/tag.js.tpl", {encoding: 'utf-8'});
	template = handlebars.compile(templateSource);
	compiledString = template({processedTagLib: processedTagLib});
	fs.writeFileSync(outputfolder+'/tag.js', compiledString, {flag: 'w'});
	console.log('generated javascript helper...');

	templateSource = fs.readFileSync(basepath+"/templates/index.html.tpl", {encoding: 'utf-8'});
	template = handlebars.compile(templateSource);
	compiledString = template({processedTagLib: processedTagLib});
	fs.writeFileSync(outputfolder+'/index.html', compiledString, {flag: 'w'});
	console.log('created index.html...');
	console.log('finish! Your documentation is ready at: ' + fs.realpathSync(path.normalize(outputfolder + '/index.html')));
	process.exit(0);
}

var reach = function(taglib, index) {
	processedTagLib.push(taglib);
	if(files.length-1==index) {
		createMainIndex();
	}
}

_.each(files, function(item, index) {
	console.log('parsing: '+item + ' ...')
	processTagLib(item, reach, index);
});
