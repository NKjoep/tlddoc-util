<!DOCTYPE html>
<html lang="en">
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

		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
	</head>
	<body>
			<div class="container">
				<h1>{{name}}</h1>
				<p>{{{description}}}</p>
				<dl class="dl-horizontal">
					<dt>Tag Library</dt>
						<dd><a href="index-{{tl.short-name}}.html">{{tl.display-name}} v{{tl.tlib-version}}&#32;<span class="glyphicon glyphicon-circle-arrow-right"></span></a></dd>
					<dt title="The fully qualified name of the tag handler class.">tag-class</dt>
						<dd><code>{{tag-class}}</code></dd>
					<dt title="(optional) Subclass of javax.servlet.jsp.tagext.TagExtraInfo.">tei-class</dt>
						<dd>{{tei-class}}</dd>
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
					<dt title="Whether the tag supports additional attributes with dynamic names. Defaults to false. If true, the tag handler class must implement the javax.servlet.jsp.tagext.DynamicAttributes interface.">dynamic-attributes</dt>
						<dd>{{#if dynamic-attributes}}{{dynamic-attributes}}{{else}}false{{/if}}</dd>
					<dt title="(optional) Extensions that provide extra information about the tag for tools">tag-extension</dt>
						<dd>{{tag-extension}}</dd>
				</dl>

				{{#if example}}
					<h2 class="h4">Example</h2>
					<pre class="well well-small">{{example}}</pre>
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
				{{/if}}

			</div>
	</body>
</html>

