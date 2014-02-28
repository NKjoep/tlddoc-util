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

var processedTagLib = [];

var processTagLib = function(filepath, cb, index) {
	var xml = fs.readFileSync(filepath);
	//processedTagLib.push(tlInfo);

	var tag = function(tagjson) {
		var tlInfo = extractTlInfo(tagjson);
		createTagIndex(tlInfo);

		_.each(tagjson.taglib.tag, function(tag, index, list){
			createTag(tlInfo, tag);
		});

		_.each(tagjson.taglib['function'], function(fn, index, list){
			createFn(tlInfo, fn);
		});

		cb(tlInfo, index);
	};

	var extractTlInfo = function (tagjson) {
		return tagjson.taglib;
	}

	var createTagIndex = function (tlInfo) {
		var templateSource = fs.readFileSync("templates/tl-index.tpl", {encoding: 'utf-8'});
		var template = handlebars.compile(templateSource);
		var compiledString = template(tlInfo);
		try { fs.mkdirSync(outputfolder); } catch (e) {}
		try { fs.mkdirSync(outputfolder+'/'+tlInfo['short-name']+'-'+tlInfo['tlib-version']); } catch (e) {}
		fs.writeFileSync(outputfolder+'/'+tlInfo['short-name']+'-'+tlInfo['tlib-version']+'/index-'+tlInfo['short-name']+'.html', compiledString, {flag: 'w'});
	}

	var createTag = function (tlInfo, tag) {
		var templateSource = fs.readFileSync("templates/tag.tpl", {encoding: 'utf-8'});
		var template = handlebars.compile(templateSource);
		var compiledString = template(_.extend(tag, {tl: tlInfo}));
		try { fs.mkdirSync(outputfolder); } catch (e) {}
		fs.writeFileSync(outputfolder+'/'+tlInfo['short-name']+'-'+tlInfo['tlib-version']+'/'+tag.name+'.html', compiledString, {flag: 'w'});
	}

	var createFn = function (tlInfo, fn) {
		var templateSource = fs.readFileSync("templates/function.tpl", {encoding: 'utf-8'});
		var template = handlebars.compile(templateSource);
		var compiledString = template(_.extend(fn, {tl: tlInfo}));
		try { fs.mkdirSync(outputfolder); } catch (e) {}
		fs.writeFileSync(outputfolder+'/'+tlInfo['short-name']+'-'+tlInfo['tlib-version']+'/'+fn.name+'.html', compiledString, {flag: 'w'});
	}

	var extractValueFromJson = function(jsonVal) {
		var v = jsonVal;
		if (v===undefined) return null;
		if (typeof v == 'string') return v;
		return v.toString();
	}

	parseString(xml, function (err, result) {
			tag(result);
	});

};

var createMainIndex = function() {
	var templateSource = fs.readFileSync("templates/index.tpl", {encoding: 'utf-8'});
	var template = handlebars.compile(templateSource);
	processedTagLib = processedTagLib.sort(function(a, b){
		if ((a['short-name']).toString().toLowerCase() > (b['short-name']).toString().toLowerCase()) {
			return 1;
		}
		if ((a['short-name']).toString().toLowerCase() < (b['short-name']).toString().toLowerCase()) {
			return -1;
		}
		return 0;
	});
	var compiledString = template({processedTagLib: processedTagLib});
	try { fs.mkdirSync(outputfolder); } catch (e) {}
	fs.writeFileSync(outputfolder+'/index.html', compiledString, {flag: 'w'});

	templateSource = fs.readFileSync("templates/tag.js.tpl", {encoding: 'utf-8'});
	template = handlebars.compile(templateSource);
	compiledString = template({processedTagLib: processedTagLib});
	fs.writeFileSync(outputfolder+'/tag.js', compiledString, {flag: 'w'});
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







