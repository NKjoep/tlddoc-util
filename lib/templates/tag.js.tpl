jQuery(function(){

var basepath = $('html').attr('data-basepath');
	var taglibs = [
		{{#processedTagLib}}
		{{#tag}}
				{
					name: "{{js-string name}}",
					prefix: "{{js-string ../short-name}}",
					tld: "{{js-string ../display-name}}" ,
					tlddescr: "{{js-string description}}",
					url: "{{js-string ../short-name}}_{{scrollspySanitazer ../tlib-version}}-{{js-string name}}"
				},
		{{/tag}}
		{{#function}}
				{
					name: "{{js-string name}}",
					prefix: "{{js-string ../short-name}}",
					tld: "{{js-string ../display-name}}" ,
					tlddescr: "{{js-string description}}",
					url: "{{js-string ../short-name}}_{{scrollspySanitazer ../tlib-version}}-{{js-string name}}"
				},
		{{/function}}
		{{/processedTagLib}}
		{
			name: '',
			prefix: '',
			tld: '',
			tlddescr: '',
			url: ''
		}
	];


					$('.typeahead').typeahead({
						source: taglibs,
						matcher: function(item) {
							var reg = new RegExp(this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/gi, '\\$&'));
							return  (
									reg.test(item.prefix.toLowerCase()+':'+item.name.toLowerCase())
									//|| reg.test(item.tld.toLowerCase())
									//|| reg.test(item.tlddescr.toLowerCase())
								)
						},
						sorter: function(items) {
							$(this.$menu).width($(this.$element).outerWidth()+"px");
							var items = items.sort(function(a, b){
								if(a.prefix.toLowerCase()+":"+a.name.toLowerCase() > b.prefix.toLowerCase()) {
									return 1;
								}
								if(a.prefix.toLowerCase()+":"+a.name.toLowerCase() < b.prefix.toLowerCase()) {
									return -1;
								}
								return 0;
							});
							return items;
						},
						highlighter: function(item) {
							var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&');
							var regexp = new RegExp('(' + query + ')', 'ig');

							return ''
							+ (item.prefix+':'+item.name).replace(regexp, function($1, match){ return '<strong class="bg-primary">' + match + '</strong>' })
							+'';
						},
						updater: function(item) {
							window.location.href=basepath+item.url;
						},
						items: 'all'
					})
});
