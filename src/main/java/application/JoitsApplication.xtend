package application

import org.uqbar.arena.Application
import org.uqbar.commons.applicationContext.ApplicationContext
import reposHibernate.RepoUsuarios
import reposMorphia.RepoProyecciones
import reposNeo4j.RepoPeliculas
import reposNeo4j.RepositorioUsuarios
import ui.LoginWindow

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
		ApplicationContext.instance.configureSingleton(typeof(RepoUsuarios), new RepoUsuarios)

		new JoitsApplication(new JoitsBootstrap).start()
	}

}
