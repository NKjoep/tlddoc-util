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
		</style>
		<script src="http://dl.dropboxusercontent.com/u/1840263/bootstrap3-typeahead.min.js"></script>
		<script src="../tag.js"></script>
	</head>
	<body>
		<div class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-collapse text-right">
					<form class="navbar-form" role="search">
							<a class="btn btn-link pull-left" href="../index.html">Taglib Index</a>
							<input type="text" class="form-control typeahead" style="width: 40%" placeholder="Search">
					</form>
				</div>
			</div>
		</div>
			<div class="container">
				<h1>
					{{#if tl.short-name}}<span class="label label-default">{{tl.short-name}}</span>&#32;{{/if}}
					{{name}}
				</h1>
				<hr />

				{{#if description}}
					<p>{{{description}}}</p>
					<hr />
				{{/if}}

				<dl class="dl-horizontal">
					<dt>Tag Library</dt>
						<dd><a href="index-{{tl.short-name}}.html">{{tl.display-name}}{{#unless tl.display-name}}{{tl.uri}}{{/unless}} {{#if tl.tlib-version}}v{{tl.tlib-version}}{{/if}}&#32;<span class="glyphicon glyphicon-circle-arrow-right"></span></a></dd>
					<dt title="The fully qualified name of the tag handler class.">tag-class</dt>
						<dd><code>{{tag-class}}</code></dd>
					{{#if tei-class}}
						<dt title="(optional) Subclass of javax.servlet.jsp.tagext.TagExtraInfo.">tei-class</dt>
							<dd><code>{{tei-class}}</code></dd>
					{{/if}}
					{{#if body-content}}
						<dt title="The body content type.">body-content</dt>
							<dd>{{body-content}}</dd>
							{{#if variable}}
								{{#variable}}
								<dt title="(optional) Declares an EL variable exposed by the tag to the calling page.">variable</dt>
									<dd>
											<div class="clearfix clear-fix"></div>
											<dl class="dl-horizontal">
												<dt class="text-right">description</dt>
													<dd class="text-left">{{description}}</dd>
												<dt class="text-right">name-given</dt>
													<dd class="text-left">{{name-given}}</dd>
												<dt class="text-right">name-from-attribute</dt>
													<dd class="text-left">{{name-from-attribute}}</dd>
												<dt class="text-right">variable-class</dt>
													<dd class="text-left">{{variable-class}}</dd>
												<dt class="text-right">declare</dt>
													<dd class="text-left">{{declare}}</dd>
												<dt class="text-right">scope</dt>
													<dd class="text-left">{{scope}}</dd>
											</dl>
									</dd>
								{{/variable}}
							{{/if}}
					{{/if}}
					{{#if dynamic-attributes}}
						<dt title="Whether the tag supports additional attributes with dynamic names. Defaults to false. If true, the tag handler class must implement the javax.servlet.jsp.tagext.DynamicAttributes interface.">dynamic-attributes</dt>
							<dd>{{dynamic-attributes}}</dd>
					{{/if}}
					{{#if tag-extension}}
						<dt title="(optional) Extensions that provide extra information about the tag for tools">tag-extension</dt>
							<dd>{{tag-extension}}</dd>
					{{/if}}
				</dl>
				<div class="clearfix"></div>
				<hr />

				{{#if example}}
					<h2 class="h4">Example</h2>
					<pre class="well well-small">{{example}}</pre>
					<hr />
				{{/if}}

				{{#if attribute}}
					<table class="table table-responsive table-striped table-hover">
						<caption class="h3 text-left">Attributes</caption>
							<tr>
								<th>Name</th>
								<th><abbr title="Required">R</abbr></th>
								<th><abbr title="Rtexprvalue">Exp</abbr></th>
								<th>Type</th>
								<th>Fragment</th>
								<th>Description</th>
							</tr>
							{{#attribute}}
								<tr>
									<th><code>{{name}}</code></th>
									<td>{{#if required}}{{required}}{{else}}false{{/if}}</td>
									<td>{{#if rtexprvalue}}{{rtexprvalue}}{{else}}false{{/if}}</td>
									<td><code>{{#if type}}{{type}}{{else}}java.lang.String{{/if}}</code></td>
									<td>{{#if fragment}}{{fragment}}{{else}}false{{/if}}</td>
									<td>{{{description}}}</td>
								</tr>
							{{/attribute}}
					</table>
					<hr />
				{{/if}}

			</div>
	</body>
</html>

