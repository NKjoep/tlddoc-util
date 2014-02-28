<!DOCTYPE html>
<html lang="en" data-basepath="./">
	<head>
		<title>
			Taglibrary documentation
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
		<script src="tag.js"></script>
	</head>
	<body>
		<div class="navbar navbar-default">
			<div class="container-fluid">
				<div class="collapse navbar-collapse text-right">
					<form class="navbar-form" role="search">
							<input type="text" class="form-control typeahead" style="width: 40%" placeholder="Search">
					</form>
				</div>
			</div>
		</div>
		<div class="container">
			{{#processedTagLib}}
				<h2>
					<span class="label label-default">{{short-name}}</span>
					<a href="{{short-name}}-{{tlib-version}}/index-{{short-name}}.html">
						{{display-name}}
					</a>
				</h2>
				<div class="row">
					{{#tag}}
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3">
									<a class="" href="{{../short-name}}-{{../tlib-version}}/{{name}}.html" title="{{description}}">
										{{../short-name}}:{{name}}
										&#32;
										<span class="glyphicon glyphicon-circle-arrow-right"></span>
									</a>
									</div>
									&#32;
					{{/tag}}
				</div>
				<hr />
			{{/processedTagLib}}
		</div>
	</body>
</html>

