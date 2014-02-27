<!DOCTYPE html>
<html lang="en">
	<head>
		<title>
			{{displayName}} {{version}} documentation
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
			<h1>{{display-name}}</h1>
			<p>{{description}}</p>

			<dl class="dl-horizontal">
				<dt>Standard Syntax</dt>
					 <dd>
					 	<code>
					 		&lt;%@ taglib prefix="{{short-name}}" uri="{{uri}}" %&gt;
					 	</code>
				 	</dd>
				<dt>XML Syntax</dt>
					 <dd>
						 <code>
						 		&lt;anyxmlelement xmlns:{{short-name}}="urn:jsptld:{{uri}}" /&gt;
						 </code>
				 	</dd>
			</dl>
			<hr />

			<h2 class="h3">Tag Library Information</h2>
			<dl class="dl-horizontal">
				<dt>Display Name</dt>
					<dd>{{display-name}}</dd>
				<dt>Version</dt>
					<dd><code>{{tlib-version}}</code></dd>
				<dt>Short Name</dt>
					<dd><code class="text-info">{{short-name}}</code></dd>
				<dt>URI</dt>
					<dd><code>{{uri}}</code></dd>
			</dl>
			<hr />
			{{#if tag}}
				<table class="table table-responsive table-striped">
					<caption class="h3 text-left">Tag Summary</caption>
						{{#tag}}
							<tr>
								<th style="white-space:nowrap;">
									<a href="{{name}}.html">
										{{../short-name}}:{{name}}
										&#32;
										<span class="glyphicon glyphicon-circle-arrow-right"></span>
									</a>
								</th>
								<td>{{{description}}}</td>
							</tr>
						{{/tag}}
				</table>
			{{/if}}
			{{#if validator}}
					<table class="table table-responsive table-striped">
						<caption class="h3 text-left">Validator</caption>
								<tr>
									<th style="white-space:nowrap;">validator-class</th>
									<th style="white-space:nowrap;">init-param</th>
								</tr>
							{{#validator}}
								<tr>
									<td><code>{{{validator-class}}}</code></td>
									<td>{{{init-param}}}</td>
								</tr>
							{{/validator}}
					</table>
			{{/if}}
		</div>
	</body>
</html>

