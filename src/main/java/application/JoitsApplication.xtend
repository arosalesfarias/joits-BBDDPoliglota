package application

import org.uqbar.arena.Application
import org.uqbar.commons.applicationContext.ApplicationContext
import reposMorphia.RepoProyecciones
import reposNeo4j.RepoFuncionesNeo4J
import reposNeo4j.RepoPeliculas
import reposNeo4j.RepositorioUsuarios
import ui.LoginWindow
import reposHibernate.RepoUsuarios

class JoitsApplication extends Application {

	new(JoitsBootstrap bootstrap) {
		super(bootstrap)
	}

	override protected createMainWindow() {
		new LoginWindow(this)
	}

	static def void main(String[] args) {

		// me falta cambiar esto, tendria que ir (new BuilderRepo).inicializar, funcionaba pero ahora se rompio!!
		ApplicationContext.instance.configureSingleton(typeof(RepoProyecciones), new RepoProyecciones)
		ApplicationContext.instance.configureSingleton(typeof(RepoPeliculas), new RepoPeliculas)
		ApplicationContext.instance.configureSingleton(typeof(RepositorioUsuarios), new RepositorioUsuarios)
		ApplicationContext.instance.configureSingleton(typeof(RepoUsuarios), new RepoUsuarios)
		ApplicationContext.instance.configureSingleton(typeof(RepoFuncionesNeo4J), new RepoFuncionesNeo4J)

		new JoitsApplication(new JoitsBootstrap).start()
	}

}
