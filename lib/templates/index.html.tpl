<!DOCTYPE html>
<html lang="en" data-basepath="#">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<meta name="generator" content="tlddoc-utils" />

		<title>{{title}}</title>

		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
		<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css" />

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->

		<style>
			.typeahead.dropdown-menu {
				text-align: left;
			}
			.typeahead.dropdown-menu li {
				overflow: hidden;
				text-overflow: ellipsis;
				font-size: 100%;
				white-space: nowrap;
			}
			.text-monospace {
				font-family: monospace;
			}
			body {
				padding-top: 70px;
			}
			#menu.affix {
				/*
				max-height: 80%;
				height: 80%;
				overflow: scroll;
				*/
			}
			#menu.affix-top {
			}
			#menu.affix-bottom {
			}
			.tag-index-item {
				overflow: hidden;
				white-space: nowrap;
				text-overflow: ellipsis;
			}
			.margin-none-top {
				margin-top: 0;
			}
			.taglib-spacer {
				margin-top: 8em;
			}
			.indexer {
				padding-top: 70px;
			}
		</style>
	</head>

	<body>

		<!-- Fixed navbar		-->
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">{{title}}</a>
					<div class="sr-only"><hr /></div>
					<span class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</span>
					<div class="sr-only"><hr /></div>
				</div>
				<div class="navbar-collapse collapse tagmenu">
					<ul class="nav navbar-nav">
						{{#each processedTagLib}}
							<li><a href="#{{short-name}}_{{scrollspySanitazer tlib-version}}">{{short-name}}</a></li>
						{{/each}}
						{{!--
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li class="dropdown-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul>
						</li>
						--}}
					</ul>
					<form class="navbar-form navbar-right">
						<input type="text" class="form-control typeahead" placeholder="Search tag...">
					</form>
				</div>
			</div>
		</div>


		<div class="container" id="main">

			<div class="row">
				<div class="col-md-12">
					{{#each processedTagLib}}
					<div class="indexer" id="{{short-name}}_{{scrollspySanitazer tlib-version}}">
						<div class="panel panel-info">
							<div class="panel-heading">
								<h2 class="panel-title">
									<!-- <span class="label label-default">{{short-name}}</span> -->
									<a href="#{{short-name}}_{{scrollspySanitazer tlib-version}}" class=""  title="Go to {{display-name}} details">
										<span class="icon glyphicon glyphicon-link"></span>&#32;{{display-name}} v{{tlib-version}}</a>
									<a data-toggle="collapse" data-target="#{{short-name}}-{{scrollspySanitazer tlib-version}}-info" href="#{{short-name}}-{{tlib-version}}-info" class="pull-right" title="Go to {{display-name}} details">
										<span class="glyphicon glyphicon-minus"></span></a>
									{{#if description}}
										&emsp;<small>{{description}}</small>
									{{/if}}
								</h2>
							</div>
							<div class="panel-body">
									{{#if description}}
											{{{description}}}<hr />
									{{/if}}
									<dl class="dl-horizontal collapse in" id="{{short-name}}-{{scrollspySanitazer tlib-version}}-info">
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
													<dd><span class="label label-default">{{short-name}}</dd>
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
									{{#each tag}}
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3 tag-index-item">
												<a class="" href="#{{../short-name}}_{{scrollspySanitazer ../tlib-version}}-{{name}}" title="&lt;{{cleanString ../short-name}}:{{cleanString name}}&gt;{{#if description}}: {{cleanString description}}{{/if}}">
													&lt;{{../short-name}}:{{name}}&gt;&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
												</a>
											</div>
									{{/each}}
									{{#each function}}
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3">
												<a class="" href="#{{../short-name}}_{{scrollspySanitazer ../tlib-version}}-{{name}}" title="&lt;{{cleanString ../short-name}}:{{cleanString name}}&gt;{{#if description}}: {{cleanString description}}{{/if}}">
													&lt;{{../short-name}}:{{name}}&gt;&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
												</a>
											</div>
									{{/each}}
							</div>
						</div>
					</div>
					{{/each}}


					{{#each processedTagLib}}
						<div class="clearfix" role="presentation"></div>
						<!--
						<div class="indexer" id="{{short-name}}_{{scrollspySanitazer tlib-version}}">
							<div class="well">
								<h1 class="margin-none-top">{{display-name}}{{#unless display-name}}{{uri}}{{/unless}}</h1>
								{{#if description}}
									<p>{{{description}}}</p>
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
												<dd><span class="label label-default">{{short-name}}</dd>
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
								{{#if validator}}
									<table class="table table-responsive table-striped">
										<caption class="h5 text-left">Validator</caption>
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
										<caption class="h5 text-left">Listeners</caption>
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
							</div>
						</div>
						-->

						{{#each tag}}
							<div id="{{../short-name}}_{{scrollspySanitazer ../tlib-version}}-{{name}}" class="indexer">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title" id="{{../short-name}}_{{scrollspySanitazer ../tlib-version}}-{{name}}">
											<a href="#{{../short-name}}_{{scrollspySanitazer ../tlib-version}}-{{name}}">
												<span class="icon glyphicon glyphicon-link"></span>
												&#32;
												&lt;<span class="short-name">{{../short-name}}</span>:{{name}}&gt;
											</a>
											<small class="pull-right label label-default">{{../display-name}}{{#unless ../display-name}}{{../uri}}{{/unless}}</small>
										</h3>
									</div>
									<div class="panel-body">
										{{#if description}}
											<p>{{{description}}}</p>
											<hr />
										{{/if}}

										<dl class="dl-horizontal">
											<dt>Tag Library</dt>
												<dd><a href="#{{../short-name}}_{{scrollspySanitazer ../tlib-version}}">{{../display-name}}{{#unless ../display-name}}{{../uri}}{{/unless}}&#32;{{../tlib-version}}&#32;<span class="glyphicon glyphicon-circle-arrow-right"></span></a></dd>
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

										{{#if example}}
											<h2 class="h6 text-muted">Example</h2>
											<pre class="bg-warning well well-small">{{example}}</pre>
										{{/if}}

										{{#if attribute}}
											<table class="table table-responsive table-striped table-hover">
												<caption class="h5 text-left">Attributes</caption>
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
															<td>
																{{#if required}}
																		{{required}}
																{{else}}
																	<span class="text-muted">false</span>
																{{/if}}
															</td>
															<td>{{#if rtexprvalue}}{{rtexprvalue}}{{else}}false{{/if}}</td>
															<td><code>{{#if type}}{{type}}{{else}}java.lang.String{{/if}}</code></td>
															<td>{{#if fragment}}{{fragment}}{{else}}false{{/if}}</td>
															<td>{{{description}}}</td>
														</tr>
													{{/attribute}}
											</table>
										{{/if}}
									</div><!-- panel-body -->
								</div>
							</div>
						{{/each}}
						{{#each function}}
							<div id="{{../short-name}}_{{scrollspySanitazer ../tlib-version}}-{{name}}" class="indexer">
								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">
											<a href="#{{../short-name}}_{{scrollspySanitazer ../tlib-version}}-{{name}}">
												<span class="icon glyphicon glyphicon-link"></span>
												&#32;
												&lt;<span class="short-name">{{../short-name}}</span>:{{name}}&gt;
											</a>
											<small class="pull-right label label-default">{{../display-name}}{{#unless ../display-name}}{{../uri}}{{/unless}}</small>
										</h3>
									</div>
									<div class="panel-body">
										{{#if description}}
											<p>{{{description}}}</p>
										{{/if}}
										<dl class="dl-horizontal">
											<dt>Tag Library</dt>
												<dd><a href="#{{../short-name}}_{{scrollspySanitazer ../tlib-version}}">{{../display-name}}{{#unless ../display-name}}{{../uri}}{{/unless}} {{#if ../tlib-version}}v{{../tlib-version}}{{/if}}&#32;<span class="glyphicon glyphicon-circle-arrow-right"></span></a></dd>
											<dt>function-class</dt>
												<dd><code>{{function-class}}</code></dd>
											{{#if function-signature}}
												<dt>function-signature</dt>
													<dd class="text-monospace">{{function-signature}}</dd>
											{{/if}}
										</dl>

										{{#if example}}
											<h3 class="h6">Example</h2>
											<pre class="bg-warning well well-small">{{example}}</pre>
										{{/if}}
									</div>
								</div>
							</div>
						{{/each}}

					{{/each}}
				</div>
				{{!--
				<div class="col-md-3">
					<div id="menu" class="tagmenu" data-spy="affix" data-offset-top="300px">
							<ul class="nav nav-pills nav-stacked" id="tagmenu">
								{{#each processedTagLib}}
									<li>
										<a href="#{{short-name}}_{{scrollspySanitazer tlib-version}}">[ {{short-name}} ]</a>
										<ul class="nav nav-pills nav-stacked">
											{{#each tag}}
												<li>
													<a href="#{{../short-name}}_{{scrollspySanitazer ../tlib-version}}-{{name}}">
														{{../short-name}}:{{name}}
													</a>
												</li>
											{{/each}}
											{{#each function}}
												<li>
													<a href="#{{../short-name}}_{{scrollspySanitazer ../tlib-version}}-{{name}}">
														{{../short-name}}:{{name}}
													</a>
												</li>
											{{/each}}
										</ul>
									</li>
								{{/each}}
							</ul>
					</div>
				</div>
				--}}
			</div>

			<hr />

			<div class="row">
				<div class="col-lg-12 text-right">
					<p class="small">Created with <a href="https://github.com/NKjoep/tlddoc-util">tlddoc-util</a></p>

				</div>
			</div>

		</div> <!-- /container -->



		<!-- Bootstrap core JavaScript
		================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
		<script>
			/*jQuery(function(){
				$('#menu').on('activate.bs.scrollspy', function () {
					$('#menu').animate({
						scrollTop: $('#menu li.active').offset().top
					}, 150);
				})
			})*/
		</script>
		<script src="http://dl.dropboxusercontent.com/u/1840263/bootstrap3-typeahead.min.js"></script>
		<script src="tag.js"></script>
	</body>
</html>
