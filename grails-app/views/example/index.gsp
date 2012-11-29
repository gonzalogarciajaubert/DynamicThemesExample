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
			<div class="span5">
				<h2>Select your theme</h2>
				<g:form action="index">
					<g:select name="themeSelect" from="${themes}" value="${themeSelect}"/>
					<g:actionSubmit value="Apply..." action="index"/>
					<!-- You can use the theme css or not:  -->
					<g:select name="cssSelect" from="${themes}" value="${cssSelect}" style='visibility: hidden;'/> 
				</g:form>
			</div>
			<div class="span6">
				<h2>Or upload a new one</h2>
				<g:uploadForm action="save" >
					<fieldset class="form">
						<input type="file" id="payload" name="themeFile"/><g:submitButton name="create" class="save" value="Upload" />
					</fieldset>
				</g:uploadForm>
				
				<span class="label label-info">Psst</span><g:link url="${resource(dir: 'images', file: 'default.zip')}"> Download example zip theme (don't forget rename it)</g:link>
			</div>
		</div>		
		<hr>
		<h2>Theme applied</h2>
		<h3>Gsp of current theme with variables, sections and css applied</h3>
			<g:injectGSP instance="${theme}"/>
		<hr>
		<div class="hero-unit">
			<h2>Snapshot for the theme</h2>
			<img src="${snapshot}" style="width:200px"/>
		</div>
		
		
	</div>
</body>