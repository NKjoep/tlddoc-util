<!DOCTYPE html>
<html lang="en" data-basepath="../">
	<head>
		<title>
			{{name}} {{tl.display-name}} {{tl.tlib-version}} documentation
		</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->

		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css" />
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
		<style>
			.typeahead.dropdown-menu {
				text-align: left;
			}
			.text-monospace {
				font-family: monospace;
			}
		</style>
		<script src="http://dl.dropboxusercontent.com/u/1840263/bootstrap3-typeahead.min.js"></script>
		<script src="../tag.js"></script>
	</head>
	<body>
		<div class="navbar navbar-default">
			<div class="container-fluid">
				<form class="navbar-form pull-right" style="width: 60%" role="search">
						<input type="text" class="form-control typeahead" style="width: 100%" placeholder="Search" />
				</form>
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Tag Library Documentation <b class="caret"></b></a>
						<ul class="dropdown-menu" role="menu" id="menu">
							<li id="index-divider" class="divider"></li>
							<li><a href="../index.html">Tag Libraries Index</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
			<div class="container">
				<h1>
					{{#if tl.short-name}}<span class="label label-default">{{tl.short-name}}</span>&#32;{{/if}}
					{{name}}
				</h1>
				<hr />
<!--
  <function>
    <description>
      Tests if an input string contains the specified substring.
    </description>
    <name>contains</name>
    <function-class>org.apache.taglibs.standard.functions.Functions</function-class>
    <function-signature>boolean contains(java.lang.String, java.lang.String)</function-signature>
    <example>
      &lt;c:if test="${fn:contains(name, searchString)}">
    </example>
  </function>
-->
				{{#if description}}
					<p>{{{description}}}</p>
					<hr />
				{{/if}}

				<dl class="dl-horizontal">
					<dt>Tag Library</dt>
						<dd><a href="index-{{tl.short-name}}.html">{{tl.display-name}}{{#unless tl.display-name}}{{tl.uri}}{{/unless}} {{#if tl.tlib-version}}v{{tl.tlib-version}}{{/if}}&#32;<span class="glyphicon glyphicon-circle-arrow-right"></span></a></dd>
					<dt>function-class</dt>
						<dd><code>{{function-class}}</code></dd>
					{{#if function-signature}}
						<dt>function-signature</dt>
							<dd class="text-monospace">{{function-signature}}</dd>
					{{/if}}
				</dl>
				<div class="clearfix"></div>
				<hr />

				{{#if example}}
					<h2 class="h4">Example</h2>
					<pre class="well well-small">{{example}}</pre>
					<hr />
				{{/if}}

			</div>
	</body>
</html>

