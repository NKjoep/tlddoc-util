var _ = require('underscore');
var argv = require('minimist')(process.argv.slice(2));
var fs = require('fs');
var handlebars = require('handlebars');
var parseString = require('xml2js').parseString;
var p = require('xml2js').parseString;
var util = require('util');

var files = argv._;
var usage = function(){
	console.log("\nUsage:");
	console.log("\tnode tlddoc-util.js [-o outputfolder] [--output=outputfolder] file [<file> ...]");
	process.exit();
}

var outputfolder = 'generated-docs';

if(argv.o || argv.output) {
	outputfolder = argv.o||argv.output;
}

if (files.length==0||argv.h||argv.help) {
	usage();
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
			if(err) return;
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
	try { fs.mkdirSync(outputfolder); } catch (e) {}

	templateSource = fs.readFileSync("templates/tag.js.tpl", {encoding: 'utf-8'});
	template = handlebars.compile(templateSource);
	compiledString = template({processedTagLib: processedTagLib});
	fs.writeFileSync(outputfolder+'/tag.js', compiledString, {flag: 'w'});

	templateSource = fs.readFileSync("templates/index.html.tpl", {encoding: 'utf-8'});
	template = handlebars.compile(templateSource);
	compiledString = template({processedTagLib: processedTagLib});
	fs.writeFileSync(outputfolder+'/index.html', compiledString, {flag: 'w'});
}

var reach = function(taglib, index) {
	processedTagLib.push(taglib);
	if(files.length-1==index) {
		createMainIndex();
	}
}

_.each(files, function(item, index) {
	processTagLib(item, reach, index);
});
