var _ = require('underscore');
var argv = require('minimist')(process.argv.slice(2));
var fs = require('fs');
var handlebars = require('handlebars');
var parseString = require('xml2js').parseString;
var p = require('xml2js').parseString;

var files = argv._;
var usage = function(){
	console.log("\nUsage:");
	console.log("\tnode tlddoc-util.js file [<file> ...]");
	process.exit();
}

if (files.length==0||argv.h||argv.help) {
	usage();
}


var processedTagLib = [];

var processTagLib = function(filepath) {
	var data = fs.readFileSync(filepath);
	var xml = data;
	//processedTagLib.push(tlInfo);

	var tag = function(tagjson) {
		var tlInfo = extractTlInfo(tagjson);
		createTagIndex(tlInfo);

		_.each(tagjson.taglib.tag, function(tag, index, list){
			createTag(tlInfo, tag);
		});
	};

	var extractTlInfo = function (tagjson) {
		return tagjson.taglib;
	}

	var createTagIndex = function (tlInfo) {
		var templateSource = fs.readFileSync("templates/tl-index.tpl", {encoding: 'utf-8'});
		var template = handlebars.compile(templateSource);
		var compiledString = template(tlInfo);
		try { fs.mkdirSync("generated-docs"); } catch (e) {}
		try { fs.mkdirSync("generated-docs/"+tlInfo['short-name']+'-'+tlInfo['tlib-version']); } catch (e) {}
		fs.writeFileSync('generated-docs/'+tlInfo['short-name']+'-'+tlInfo['tlib-version']+'/'+tlInfo['short-name']+'.html', compiledString, {flag: 'w'});
	}

	var createTag = function (tlInfo, tag) {
		var templateSource = fs.readFileSync("templates/tag.tpl", {encoding: 'utf-8'});
		var template = handlebars.compile(templateSource);
		var compiledString = template(_.extend(tag, {tl: tlInfo}));
		try { fs.mkdirSync("generated-docs"); } catch (e) {}
		fs.writeFileSync('generated-docs/'+tlInfo['short-name']+'-'+tlInfo['tlib-version']+'/'+tag.name+'.html', compiledString, {flag: 'w'});
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

_.each(files, processedTagLib);

/* //todo
var templateSource = fs.readFileSync("templates/index.tpl", {encoding: 'utf-8'});
var template = handlebars.compile(templateSource);
var compiledString = template({processedTagLib: processedTagLib});
try { fs.mkdirSync("generated-docs"); } catch (e) {}
console.log(processedTagLib);
fs.writeFileSync('generated-docs/index.html', compiledString, {flag: 'w'});
*/





