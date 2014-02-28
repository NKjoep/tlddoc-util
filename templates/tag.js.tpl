jQuery(function(){

var basepath = $('html').attr('data-basepath');
var menuEl = $('#index-divider');

{{#each processedTagLib}}
menuEl.before('<li><a href="'+basepath+'{{short-name}}-{{tlib-version}}/index-{{short-name}}.html">{{display-name}} {{tlib-version}}</a></li>');
{{/each}}

	var taglibs = [
		{{#processedTagLib}}{{#tag}}
				{
					name: "{{js-string name}}",
					prefix: "{{js-string ../short-name}}",
					tld: "{{js-string ../display-name}}" ,
					tlddescr: "{{js-string description}}",
					url: "{{js-string ../short-name}}-{{js-string ../tlib-version}}/{{js-string name}}.html"
				},
		{{/tag}}{{/processedTagLib}}
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
									reg.test(item.name.toLowerCase())
									|| reg.test(item.prefix.toLowerCase())
									|| reg.test(item.tld.toLowerCase())
									|| reg.test(item.tlddescr.toLowerCase())
									|| reg.test(item.prefix.toLowerCase()+':'+item.name.toLowerCase())
								)
						},
						sorter: function(items) {
							$(this.$menu).width($(this.$element).outerWidth()+"px");
							var r = items.sort(function(a, b){
								if(a.prefix.toLowerCase() > b.prefix.toLowerCase()) {
									return a;
								}
								if (a.prefix.toLowerCase() < b.prefix.toLowerCase()) {
									return b;
								}
								if (a.name.toLowerCase() > b.name.toLowerCase()) {
									return a
								}
								if (a.name.toLowerCase() < b.name.toLowerCase()) {
									return b
								}
								return a;
							});
							return r;
						},
						highlighter: function(item) {
							return '<span title="'+item.tlddescr+'" class="label label-default">'
							+item.tld
							+'</span> &lt'
							+ item.prefix
							+ ':'
							+ item.name
							+'&gt<span class="glyphicon glyphicon-circle-arrow-right pull-right"></span>';
						},
						updater: function(item) {
							window.location.href=basepath+item.url;
						},
						items: 'all'
					})
});
