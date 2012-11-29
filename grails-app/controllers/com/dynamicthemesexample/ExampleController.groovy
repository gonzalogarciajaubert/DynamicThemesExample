package com.dynamicthemesexample

import org.gonzalogarciajaubert.dynamicThemes.process.PreprocessorService
import org.codehaus.groovy.grails.web.context.ServletContextHolder

class ExampleController {
	PreprocessorService preprocessorService

    def index() {
		// Theme List
		def themes = getThemesList()		
		

		def themeName = (params?.themeSelect ? params?.themeSelect : "default")
		def cssName = themeName // (params?.cssSelect ? params?.cssSelect : themeName) You can use css from other themes!!
		
		def theme = getTheme(themeName)
		// Example of snapshot
		def snap = preprocessorService.getConfigParams(themeName ).urlSnapshot

		// return theme process
		[themes: themes, theme: theme, css: cssName, cssSelect: params?.cssSelect, themeSelect: params?.themeSelect, snapshot: snap]
	}
	

	
	def css() {
		// Theme List
		def themes = getThemesList()
		def cssName = (params?.cssSelect ? params?.cssSelect : "default")
		
		def themeName = "default"
		def theme = getTheme(themeName)
		// Example of snapshot
		def snap = preprocessorService.getConfigParams(themeName ).urlSnapshot

		// return theme process
		[themes: themes, theme: theme, css: cssName, cssSelect: params?.cssSelect, themeSelect: params?.themeSelect, snapshot: snap]
	}
	
	private getTheme(themeName) {
		// Example of sections replace
		def elements = "['Post 1', 'Post 2', 'Post 3']"
		def sections = ["#beginLoop#": """<g:each var="element" in="${elements}">""", """#endLoop#""": """</g:each>"""]
		// Example of model binding
		def elementsList = ['Post 1', 'Post 2', 'Post 3']
		def model = [ImagesPath: preprocessorService.getConfigParams(themeName ).urlFolderImages, elements:elementsList]
		// Process gsp
		def theme = preprocessorService.preprocess(themeName , sections, model)
		return theme
	}
	
	/**
	 * Upload zip files with themes
	 * 
	 * @return
	 */
	def save() {
		saveFile(request.getFile('themeFile'))
		redirect(action: "index")
	}
	
	/**
	 * See Bootstrap.groovy 
	 * 
	 * @param fichero
	 * @return
	 */
	 def saveFile (fichero) {
		 def uploadedFile = fichero
		 
		 def rutaBaseHTML = grailsApplication.config.dynamicThemes.preprocessor.fileSystemPath
		 def ruta = """${rutaBaseHTML}/${uploadedFile.originalFilename}"""
		 def file= new File(ruta).newOutputStream()
		 file << uploadedFile.bytes
		 file.close()
		 File ficheroZip = new File(ruta)
		 ficheroZip.unzip("${rutaBaseHTML}")
	 }
 
	 private getThemesList() {
		 def themes = []
		 def path = ""
		 if (grailsApplication.isWarDeployed()) {
			 path = ServletContextHolder.servletContext.getRealPath(grailsApplication.config.dynamicThemes.production.preprocessor.fileSystemPath).toString()
		 } else {
			 path = grailsApplication.config.dynamicThemes.development.preprocessor.fileSystemPath
		 }
		 try {
			 new File(path).eachDir { file ->
				 themes.add(file.getName())
			 }
		 }
		 catch (Exception ex) {
			 log.error "", ex
		 }
		 return themes
	 }
}
