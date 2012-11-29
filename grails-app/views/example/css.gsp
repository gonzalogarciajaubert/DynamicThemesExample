<html>

<head>
	<title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
	<meta name="layout" content="main" />
	<g:injectCss themeName="${css}" ImagesPath="true"/>
</head>

<body>
	<div class="container">
		<g:link absolute="true" uri="/">Back</g:link>
		<div class="row">
			<div class="span11">
				<h2>Select your css</h2>
				<g:form action="css">
					<g:select name="cssSelect" from="${themes}" value="${cssSelect}" />
					<g:actionSubmit value="Apply..." action="css"/>
				</g:form>
			</div>
		</div>		
		<hr>
		<h2>CSS applied</h2>
		<h3>The same theme with your css</h3>
			<g:injectGSP instance="${theme}"/>
		<hr>
		<div class="hero-unit">
			<h2>Snapshot for the theme. With original css</h2>
			<img src="${snapshot}" style="width:200px"/>
		</div>
		
		
	</div>
</body>