<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to Grails</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}
            
			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 2em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
		<g:injectCss themeName="default" ImagesPath="true" />
	</head>
	<body>

		<div id="status" role="complementary">
			<h1>Application Status</h1>
			<ul>
				<li>App version: <g:meta name="app.version"/></li>
				<li>Grails version: <g:meta name="app.grails.version"/></li>
				<li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
				<li>JVM version: ${System.getProperty('java.version')}</li>
				<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>
				<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
				<li>Domains: ${grailsApplication.domainClasses.size()}</li>
				<li>Services: ${grailsApplication.serviceClasses.size()}</li>
				<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
			</ul>
			<h1>Installed Plugins</h1>
			<ul>
				<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
					<li>${plugin.name} - ${plugin.version}</li>
				</g:each>
			</ul>
		</div>
		<div id="page-body" role="main">
			<h1> Examples of dynamic-themes plugin</h1>
			<p>This application is an example of using the plugin "dynamic-themes". This plugin allows you to display different dynamically compiled gsp outside location.</p>
			<p>This application already contains three themes: default, default2 and default3.</p>
			<p>You can upload your own themes, Download example zip theme and don't forget rename it to see the structure</p>
			<p>Once loaded you can select it to be injected into the current page</p>
			<p>If selected in the combo "gsp" one of the available templates you can view the content of gsp parsing is injected into the current page</p>
			<p>Normally you will want to show your css associated gsp, this should change the combo "css" to point to your css file </p>
			<p>Click Apply when you have selected the desired theme and css.</p>
			<p>For example you can select css non-selected template and see how it behaves.</p>
			
			<h2>Examples of use</h2>
			<ul>
				<li>Application for uploading and apply themes.</li>
				<li>Application that allows you to load new content dynamically.</li> 
			</ul>
			See default.html in the plugin for an example of sections
			</p>

			
			<div id="controller-list" role="navigation">
				<h2>Available Examples:</h2>
				<ul>
					<li><g:link class="controller" controller="example" action="index">Themes selector</g:link></li>
					<li><g:link class="controller" controller="example" action="css">CSS selector</g:link></li>					
				</ul>
			</div>
		</div>
	</body>
</html>
