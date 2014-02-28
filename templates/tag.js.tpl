jQuery(function(){
	var basepath = $('html').attr('data-basepath');
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
							var reg = new RegExp(this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&'));
							return  (
									reg.test(item.name)
									|| reg.test(item.prefix)
									|| reg.test(item.tld)
									|| reg.test(item.tlddescr)
									|| reg.test(item.prefix+':'+item.name)
								)
						},
						sorter: function(items) {
							$(this.$menu).width($(this.$element).outerWidth()+"px");
							var r = items.sort(function(a, b){
								if(a.prefix > b.prefix) {
									return a;
								}
								if (a.prefix < b.prefix) {
									return b;
								}
								if (a.name > b.name) {
									return a
								}
								if (a.name < b.name) {
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
