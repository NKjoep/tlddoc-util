#!/usr/bin/env node

/*
 * tlddoc-util
 * https://github.com/NKjoep/tlddoc-util
 *
 * Copyright (c) 2014 Andrea Dessì
 * Licensed under the MIT license.
 */

var _ = require('underscore'),
		argv = require('minimist')(process.argv.slice(2)),
		fs = require('fs'),
		handlebars = require('handlebars'),
		parseString = require('xml2js').parseString,
		p = require('xml2js').parseString,
		util = require('util'),
		path = require('path'),
		basepath = __dirname;

var usage = function(){
	console.log("\nUsage:");
	console.log('\ttlddoc-util [-t "doc title" | --title="doc title"] [-o outputfolder | --output=outputfolder] file [<file> ...]');
	process.exit();
};

var files = argv._;
if (files.length==0||argv.h||argv.help) {
	usage();
	process.exit(1);
}

files = _.uniq(files);

var	outputfolder = argv.o||argv.output||'generated-docs';
var title = argv.t || argv.title || 'Tag Library Documentation' ;

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
	if (fs.existsSync(filepath)) {
		var xml = fs.readFileSync(filepath);

		parseString(xml, function (err, result) {
				if(err) {
					console.log('skipping '+ filepath + ' ... (invalid file)');
					callbackExecutor(null,index);
					return;
				}
				var extractedTaglibrary = result.taglib;
				if (extractedTaglibrary===undefined) {
					console.log('skipping '+filepath+' ... (invalid file, no <taglib> root tag)');
					callbackExecutor(null,index);
					return;
				}
				if (extractedTaglibrary.uri === undefined) {
					console.log('skipping '+filepath+' ... (invalid file, no uri)');
					callbackExecutor(null,index);
					return;
				}
				console.log('parsing '+ filepath + ' ...')
				extractedTaglibrary['short-name'] = extractedTaglibrary['short-name'][0]||extractedTaglibrary['display-name'][0]||extractedTaglibrary['uri'][0]||('tag'+index);
				extractedTaglibrary['display-name'] = extractedTaglibrary['display-name'][0]||extractedTaglibrary['short-name'];

				var version = extractedTaglibrary['tlib-version'][0];
				extractedTaglibrary['tlib-version'] = (version.length > 0 ? version : 'Unknown');
				callbackExecutor(extractedTaglibrary, index);
		});
	}
	else {
		console.log('skipping '+filepath+' ... (file not found)');
		callbackExecutor(null,index);
	}
};

var createMainIndex = function() {
	processedTagLib = _.compact(processedTagLib);
	if (processedTagLib.length == 0) {
		console.log('no valid tag libraries files provided, exit.');
		process.exit(1);
	}
	processedTagLib = processedTagLib.sort(function(a, b){
		if ((a['short-name']||'').toString().toLowerCase() > (b['short-name']||'').toString().toLowerCase()) {
			return 1;
		}
		if ((a['short-name']||'').toString().toLowerCase() < (b['short-name']||'').toString().toLowerCase()) {
			return -1;
		}
		return 0;
	});
	console.log('sorted tag libraries ...');

	var folderMessage = '';
	try {
		fs.mkdirSync(outputfolder);
	} catch (e) {
		if (e.code == 'EEXIST') { folderMessage = '(folder already exists)'; }
		else {
			console.log(e);
			process.exist(1);
		}
	}
	console.log('creating outputfolder '+outputfolder + ' ... '+ folderMessage);

	try {
		var templateSource = fs.readFileSync(basepath+"/templates/tag.js.tpl", {encoding: 'utf-8'});
		var template = handlebars.compile(templateSource);
		var compiledString = template({processedTagLib: processedTagLib, title: title});
		fs.writeFileSync(outputfolder+'/tag.js', compiledString, {flag: 'w'});
		console.log('generated javascript helper ...');

		templateSource = fs.readFileSync(basepath+"/templates/index.html.tpl", {encoding: 'utf-8'});
		template = handlebars.compile(templateSource);
		compiledString = template({processedTagLib: processedTagLib, title: title});
		fs.writeFileSync(outputfolder+'/index.html', compiledString, {flag: 'w'});
		console.log('created index.html ...');
		console.log('...finish!\nYour documentation is ready at: ' + fs.realpathSync(path.normalize(outputfolder + '/index.html')));
		process.exit(0);
	}
	catch(e){
		console.log('unable to create file, exit. ('+e+')' );
		process.exit(1);
	}
};

var reach = function(taglib, index) {
	processedTagLib.push(taglib);
	if(files.length-1==index) {
		createMainIndex();
	}
};

_.each(files, function(item, index) {
	processTagLib(item, reach, index);
});
