jQuery(function(){

var basepath = $('html').attr('data-basepath');
	var taglibs = [
		
		
				{
					name: "catch",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "Catches any Throwable that occurs in its body and optionally exposes it.",
					url: "c_11-catch"
				},
		
				{
					name: "choose",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "Simple conditional tag that establishes a context for mutually exclusive conditional operations, marked by &lt;when&gt; and &lt;otherwise&gt;",
					url: "c_11-choose"
				},
		
				{
					name: "if",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "Simple conditional tag, which evalutes its body if the supplied condition is true and optionally exposes a Boolean scripting variable representing the evaluation of this condition",
					url: "c_11-if"
				},
		
				{
					name: "import",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "Retrieves an absolute or relative URL and exposes its contents to either the page, a String in \&#x27;var\&#x27;, or a Reader in \&#x27;varReader\&#x27;.",
					url: "c_11-import"
				},
		
				{
					name: "forEach",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "The basic iteration tag, accepting many different collection types and supporting subsetting and other functionality",
					url: "c_11-forEach"
				},
		
				{
					name: "forTokens",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "Iterates over tokens, separated by the supplied delimeters",
					url: "c_11-forTokens"
				},
		
				{
					name: "out",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "Like &lt;%= ... &gt;, but for expressions.",
					url: "c_11-out"
				},
		
				{
					name: "otherwise",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "Subtag of &lt;choose&gt; that follows &lt;when&gt; tags and runs only if all of the prior conditions evaluated to \&#x27;false\&#x27;",
					url: "c_11-otherwise"
				},
		
				{
					name: "param",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "Adds a parameter to a containing \&#x27;import\&#x27; tag\&#x27;s URL.",
					url: "c_11-param"
				},
		
				{
					name: "redirect",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "Redirects to a new URL.",
					url: "c_11-redirect"
				},
		
				{
					name: "remove",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "Removes a scoped variable (from a particular scope, if specified).",
					url: "c_11-remove"
				},
		
				{
					name: "set",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "Sets the result of an expression evaluation in a \&#x27;scope\&#x27;",
					url: "c_11-set"
				},
		
				{
					name: "url",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "Creates a URL with optional query parameters.",
					url: "c_11-url"
				},
		
				{
					name: "when",
					prefix: "c",
					tld: "JSTL core" ,
					tlddescr: "Subtag of &lt;choose&gt; that includes its body if its condition evalutes to \&#x27;true\&#x27;",
					url: "c_11-when"
				},
		
		
		
		
				{
					name: "requestEncoding",
					prefix: "fmt",
					tld: "JSTL fmt" ,
					tlddescr: "Sets the request character encoding",
					url: "fmt_11-requestEncoding"
				},
		
				{
					name: "setLocale",
					prefix: "fmt",
					tld: "JSTL fmt" ,
					tlddescr: "Stores the given locale in the locale configuration variable",
					url: "fmt_11-setLocale"
				},
		
				{
					name: "timeZone",
					prefix: "fmt",
					tld: "JSTL fmt" ,
					tlddescr: "Specifies the time zone for any time formatting or parsing actions nested in its body",
					url: "fmt_11-timeZone"
				},
		
				{
					name: "setTimeZone",
					prefix: "fmt",
					tld: "JSTL fmt" ,
					tlddescr: "Stores the given time zone in the time zone configuration variable",
					url: "fmt_11-setTimeZone"
				},
		
				{
					name: "bundle",
					prefix: "fmt",
					tld: "JSTL fmt" ,
					tlddescr: "Loads a resource bundle to be used by its tag body",
					url: "fmt_11-bundle"
				},
		
				{
					name: "setBundle",
					prefix: "fmt",
					tld: "JSTL fmt" ,
					tlddescr: "Loads a resource bundle and stores it in the named scoped variable or the bundle configuration variable",
					url: "fmt_11-setBundle"
				},
		
				{
					name: "message",
					prefix: "fmt",
					tld: "JSTL fmt" ,
					tlddescr: "Maps key to localized message and performs parametric replacement",
					url: "fmt_11-message"
				},
		
				{
					name: "param",
					prefix: "fmt",
					tld: "JSTL fmt" ,
					tlddescr: "Supplies an argument for parametric replacement to a containing &lt;message&gt; tag",
					url: "fmt_11-param"
				},
		
				{
					name: "formatNumber",
					prefix: "fmt",
					tld: "JSTL fmt" ,
					tlddescr: "Formats a numeric value as a number, currency, or percentage",
					url: "fmt_11-formatNumber"
				},
		
				{
					name: "parseNumber",
					prefix: "fmt",
					tld: "JSTL fmt" ,
					tlddescr: "Parses the string representation of a number, currency, or percentage",
					url: "fmt_11-parseNumber"
				},
		
				{
					name: "formatDate",
					prefix: "fmt",
					tld: "JSTL fmt" ,
					tlddescr: "Formats a date and/or time using the supplied styles and pattern",
					url: "fmt_11-formatDate"
				},
		
				{
					name: "parseDate",
					prefix: "fmt",
					tld: "JSTL fmt" ,
					tlddescr: "Parses the string representation of a date and/or time",
					url: "fmt_11-parseDate"
				},
		
		
		
		
		
				{
					name: "contains",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Tests if an input string contains the specified substring.",
					url: "fn_11-contains"
				},
		
				{
					name: "containsIgnoreCase",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Tests if an input string contains the specified substring in a case insensitive way.",
					url: "fn_11-containsIgnoreCase"
				},
		
				{
					name: "endsWith",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Tests if an input string ends with the specified suffix.",
					url: "fn_11-endsWith"
				},
		
				{
					name: "escapeXml",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Escapes characters that could be interpreted as XML markup.",
					url: "fn_11-escapeXml"
				},
		
				{
					name: "indexOf",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Returns the index withing a string of the first occurrence of a specified substring.",
					url: "fn_11-indexOf"
				},
		
				{
					name: "join",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Joins all elements of an array into a string.",
					url: "fn_11-join"
				},
		
				{
					name: "length",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Returns the number of items in a collection, or the number of characters in a string.",
					url: "fn_11-length"
				},
		
				{
					name: "replace",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Returns a string resulting from replacing in an input string all occurrences of a \&quot;before\&quot; string into an \&quot;after\&quot; substring.",
					url: "fn_11-replace"
				},
		
				{
					name: "split",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Splits a string into an array of substrings.",
					url: "fn_11-split"
				},
		
				{
					name: "startsWith",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Tests if an input string starts with the specified prefix.",
					url: "fn_11-startsWith"
				},
		
				{
					name: "substring",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Returns a subset of a string.",
					url: "fn_11-substring"
				},
		
				{
					name: "substringAfter",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Returns a subset of a string following a specific substring.",
					url: "fn_11-substringAfter"
				},
		
				{
					name: "substringBefore",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Returns a subset of a string before a specific substring.",
					url: "fn_11-substringBefore"
				},
		
				{
					name: "toLowerCase",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Converts all of the characters of a string to lower case.",
					url: "fn_11-toLowerCase"
				},
		
				{
					name: "toUpperCase",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Converts all of the characters of a string to upper case.",
					url: "fn_11-toUpperCase"
				},
		
				{
					name: "trim",
					prefix: "fn",
					tld: "JSTL functions" ,
					tlddescr: "Removes white spaces from both ends of a string.",
					url: "fn_11-trim"
				},
		
		
		
				{
					name: "transaction",
					prefix: "sql",
					tld: "JSTL sql" ,
					tlddescr: "Provides nested database action elements with a shared Connection, set up to execute all statements as one transaction.",
					url: "sql_11-transaction"
				},
		
				{
					name: "query",
					prefix: "sql",
					tld: "JSTL sql" ,
					tlddescr: "Executes the SQL query defined in its body or through the sql attribute.",
					url: "sql_11-query"
				},
		
				{
					name: "update",
					prefix: "sql",
					tld: "JSTL sql" ,
					tlddescr: "Executes the SQL update defined in its body or through the sql attribute.",
					url: "sql_11-update"
				},
		
				{
					name: "param",
					prefix: "sql",
					tld: "JSTL sql" ,
					tlddescr: "Sets a parameter in an SQL statement to the specified value.",
					url: "sql_11-param"
				},
		
				{
					name: "dateParam",
					prefix: "sql",
					tld: "JSTL sql" ,
					tlddescr: "Sets a parameter in an SQL statement to the specified java.util.Date value.",
					url: "sql_11-dateParam"
				},
		
				{
					name: "setDataSource",
					prefix: "sql",
					tld: "JSTL sql" ,
					tlddescr: "Creates a simple DataSource suitable only for prototyping.",
					url: "sql_11-setDataSource"
				},
		
		
		
		
				{
					name: "fake",
					prefix: "tt",
					tld: "TestLibrary" ,
					tlddescr: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
					url: "tt_00-fake"
				},
		
				{
					name: "fake2",
					prefix: "tt",
					tld: "TestLibrary" ,
					tlddescr: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
					url: "tt_00-fake2"
				},
		
		
		
		
				{
					name: "action",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Build the URL to call a jsp or a functionality of a servlet defined within the system.&lt;br/&gt; This tag can use the ParameterTag sub-tag to add url parameters.",
					url: "wp_22-action"
				},
		
				{
					name: "buildPage",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Builds a page generating the output.",
					url: "wp_22-buildPage"
				},
		
				{
					name: "categories",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Return the list of the system categories on SelectItem objects.",
					url: "wp_22-categories"
				},
		
				{
					name: "checkHeadInfoOuputter",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "This sub-tag verifies the availability of the information to display.&lt;br/&gt; This sub-tag can be used &lt;b&gt;only&lt;/b&gt; in a page model, in conjunction with \&#x27;outputHeadInfo\&#x27;.",
					url: "wp_22-checkHeadInfoOuputter"
				},
		
				{
					name: "contentNegotiation",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Performs the Content Negotiation, trying to serve the specified mimeType with the given charset. If the mimeType is not accepted by the User Agent it returns the default text/html.",
					url: "wp_22-contentNegotiation"
				},
		
				{
					name: "cssURL",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Extension of the ResourceURL tag. It returns the URL of the css files.",
					url: "wp_22-cssURL"
				},
		
				{
					name: "currentPage",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Returns the requested information held by the current page bean.",
					url: "wp_22-currentPage"
				},
		
				{
					name: "currentWidget",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Returns informations about the widget where the tag resides. To obtain information about a widget placed in a frame other than the current, use the \&quot;frame\&quot; attribute.",
					url: "wp_22-currentWidget"
				},
		
				{
					name: "currentShowlet",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "&lt;b&gt;DEPRECATED&lt;/b&gt;; Since Entando 4.0.0, use \&quot;currentWidget\&quot; instead.&lt;br /&gt;Returns informations about the widget where the tag resides. To obtain information about a widget placed in a frame other than the current, use the \&quot;frame\&quot; attribute.",
					url: "wp_22-currentShowlet"
				},
		
				{
					name: "execWidget",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Triggers the preliminary execution of the widgets.&lt;br/&gt;It can be used &lt;b&gt;&lt;b&gt;only&lt;/b&gt;&lt;/b&gt; in the main.jsp.",
					url: "wp_22-execWidget"
				},
		
				{
					name: "execShowlet",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "&lt;b&gt;DEPRECATED&lt;/b&gt;; Since Entando 4.0.0, use \&quot;execWidget\&quot; instead.&lt;br /&gt;Triggers the preliminary execution of the widgets.&lt;br/&gt; It can be used &lt;b&gt;&lt;b&gt;only&lt;/b&gt;&lt;/b&gt; in the main.jsp.",
					url: "wp_22-execShowlet"
				},
		
				{
					name: "headInfo",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Declares the information to insert in the header of the HTML page. The information can be passed as an attribute or, in an indirect manner, through a variable of the page context.&lt;br/&gt; It is mandatory to specify the type of the information.",
					url: "wp_22-headInfo"
				},
		
				{
					name: "i18n",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Return the string associated to the given key in the specified language. This string is either returned (and rendered) or can be optionally placed in a page context variable.",
					url: "wp_22-i18n"
				},
		
				{
					name: "ifauthorized",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Toggles the visibility of the elements contained in its body, depending on user permissions.",
					url: "wp_22-ifauthorized"
				},
		
				{
					name: "imgURL",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Extension of the ResourceURL tag. It returns the URL of the images to display as static content outside the cms.",
					url: "wp_22-imgURL"
				},
		
				{
					name: "info",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Returns the information of the desired system parameter.",
					url: "wp_22-info"
				},
		
				{
					name: "internalServlet",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Tag for the \&quot;Internal Servlet\&quot; functionality.&lt;br/&gt; Publishes a function served by an internal Servlet; the servlet is invoked from a path specified in the attribute \&quot;actionPath\&quot; or by the widget parameter sharing the same name.&lt;br/&gt; This tag can be used &lt;b&gt;only&lt;/b&gt; in a widgets.",
					url: "wp_22-internalServlet"
				},
		
				{
					name: "externalFramework",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Tag for the \&quot;External Framework\&quot; widget. &lt;br/&gt;&lt;b&gt;DEPRECATED&lt;/b&gt;; use \&quot;internalServlet\&quot; instead.",
					url: "wp_22-externalFramework"
				},
		
				{
					name: "nav",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Generates through successive iterations the so called \&quot;navigation\&quot; list.&lt;br/&gt; For every target/page being iterated (inserted in the page context) are made available the page code, the title (in the current language) and the link. Is it also possible to check whether the target page is empty -that is, with no configured positions- or not.",
					url: "wp_22-nav"
				},
		
				{
					name: "outputHeadInfo",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Iterates over various information in HTML header displaying them; this tag works in conjunction with other specific sub-tags.&lt;br/&gt; Please note that the body can contain &lt;b&gt;only&lt;/b&gt; a sub-tag, or information, at once.&lt;br/&gt; This tag must be used &lt;b&gt;only&lt;/b&gt; in a page model.",
					url: "wp_22-outputHeadInfo"
				},
		
				{
					name: "pageInfo",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Returns the information of the specified page. This tag can use the sub-tag \&quot;ParameterTag\&quot; to add url parameters if the info attribute is set to \&#x27;url\&#x27;.",
					url: "wp_22-pageInfo"
				},
		
				{
					name: "pager",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "List pager.",
					url: "wp_22-pager"
				},
		
				{
					name: "parameter",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "This tag can be used to parameterise other tags.&lt;br/&gt; The parameter value can be added through the \&#x27;value\&#x27; attribute or the body tag. When you declare the param tag, the value can be defined in either a value attribute or as text between the start and the ending of the tag.",
					url: "wp_22-parameter"
				},
		
				{
					name: "printHeadInfo",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Returns the information to display.&lt;br/&gt; This sub-tag must be used &lt;b&gt;only&lt;/b&gt; in a page model, in conjunction with \&#x27;outputHeadInfo\&#x27;.",
					url: "wp_22-printHeadInfo"
				},
		
				{
					name: "resourceURL",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Returns URL of the resources.",
					url: "wp_22-resourceURL"
				},
		
				{
					name: "show",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Defines the position of inclusion of a widget.&lt;br/&gt; This tag can be used &lt;b&gt;only&lt;/b&gt; in a page model.",
					url: "wp_22-show"
				},
		
				{
					name: "url",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Generates the complete URL of a portal page.&lt;br/&gt; The URL returned is either returned (and rendered) or placed in the given variable.&lt;br/&gt; To insert parameters in the query string the sub-tag \&quot;ParameterTag\&quot; is provided.",
					url: "wp_22-url"
				},
		
				{
					name: "urlPar",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "This is the sub-tag of the \&quot;url\&quot; tag.&lt;br/&gt; Adds a parameter in the URL query string generated. &lt;br/&gt;&lt;b&gt;DEPRECATED&lt;/b&gt;; use ParameterTag instead .",
					url: "wp_22-urlPar"
				},
		
				{
					name: "pageWithWidget",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Search and return the page (or the list of pages) with the given widget type. When \&quot;filterParamName\&quot; and \&quot;filterParamValue\&quot; attributes are present, the returned list will be filtered by a specific widget configuration.",
					url: "wp_22-pageWithWidget"
				},
		
				{
					name: "currentUserProfileAttribute",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "Current User Profile tag. Return a attribute value of the current user profile.",
					url: "wp_22-currentUserProfileAttribute"
				},
		
				{
					name: "userProfileAttribute",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "User Profile tag. Return a attribute value from the profile givea an username.",
					url: "wp_22-userProfileAttribute"
				},
		
				{
					name: "fake",
					prefix: "wp",
					tld: "Aps Core Tag Library" ,
					tlddescr: "",
					url: "wp_22-fake"
				},
		
		
		
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
