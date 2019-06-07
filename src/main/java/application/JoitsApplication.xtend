package application

import org.uqbar.arena.Application
import ui.LoginWindow
import reposMorphia.RepoProyecciones
import org.uqbar.commons.applicationContext.ApplicationContext
import reposNeo4j.RepoPeliculas
import reposNeo4j.RepositorioUsuarios

class JoitsApplication extends Application {

	new(JoitsBootstrap bootstrap) {
		super(bootstrap)
	}

	override protected createMainWindow() {
		new LoginWindow(this)
	}

	static def void main(String[] args) {
		ApplicationContext.instance.configureSingleton(typeof(RepoProyecciones), new RepoProyecciones)
		ApplicationContext.instance.configureSingleton(typeof(RepoPeliculas), new RepoPeliculas)
		ApplicationContext.instance.configureSingleton(typeof(RepositorioUsuarios), new RepositorioUsuarios)
		// ApplicationContext.instance.configureSingleton(typeof(RepoFunciones), new RepoFunciones)
		new JoitsApplication(new JoitsBootstrap).start()
	}

}
