<!DOCTYPE html>
<html lang="en" data-basepath="../">
	<head>
		<title>
			{{display-name}} {{tlib-version}} documentation
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
			<h1>{{display-name}}{{#unless display-name}}{{uri}}{{/unless}}</h1>
			<hr />

			{{#if description}}
				<p>{{{description}}}</p>
				<hr />
			{{/if}}

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
						 		&lt;anyxmlelement xmlns:{{short-name}}{{#unless short-name}}prefix{{/unless}}="urn:jsptld:{{uri}}" /&gt;
						 </code>
				 	</dd>
			</dl>
			<hr />

			<h2 class="h3">Tag Library Information</h2>
			<dl class="dl-horizontal">
					{{#if display-name}}
						<dt>Display Name</dt>
							<dd>{{display-name}}</dd>
					{{/if}}
					{{#if tlib-version}}
						<dt>Version</dt>
							<dd>{{tlib-version}}</dd>
					{{/if}}
					{{#if short-name}}
						<dt>Short Name</dt>
							<dd><code class="text-info">{{short-name}}</code></dd>
					{{/if}}
					{{#if uri}}
						<dt>URI</dt>
							<dd><code>{{uri}}</code></dd>
					{{/if}}
					{{#if tag-exstension}}
						<dt>Tag Extension</dt>
							<dd>{{tag-exstension}}</dd>
					{{/if}}
					{{#if icon}}
						<dt>Icon</dt>
							<dd>{{icon}}</dd>
					{{/if}}
			</dl>
			<div class="clearfix"></div>
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
				<hr />
			{{/if}}

			{{#if validator}}
				<table class="table table-responsive table-striped">
					<caption class="h3 text-left">Validator</caption>
							<tr>
								<th style="white-space:nowrap;">validator-class</th>
								<th style="white-space:nowrap;">init-param</th>
							</tr>
						{{#each validator}}
							<tr>
								<td><code>{{validator-class}}</code></td>
								<td>{{init-param}}</td>
							</tr>
						{{/each}}
				</table>
				<hr />
			{{/if}}

			{{#if listener}}
				<table class="table table-responsive table-striped">
					<caption class="h3 text-left">Listeners</caption>
							<tr>
								<th style="white-space:nowrap;">class</th>
							</tr>
						{{#each listener}}
							<tr>
								<td><code>{{listener-class}}</code></td>
							</tr>
						{{/each}}
				</table>
				<hr />
			{{/if}}

			{{#if function}}
				<table class="table table-responsive table-striped">
					<caption class="h3 text-left">Functions</caption>
							<tr>
								<th style="white-space:nowrap;">name</th>
								<th>class</th>
								<th>signature</th>
							</tr>
						{{#each function}}
							<tr>
								<td><code>{{name}}</code></td>
								<td><code>{{function-class}}</code></td>
								<td><code>{{function-signature}}</code></td>
							</tr>
						{{/each}}
				</table>
				<hr />
			{{/if}}

		</div>
	</body>
</html>

