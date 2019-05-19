package application

import org.uqbar.arena.Application
import ui.LoginWindow
import reposMorphia.RepoProyecciones
import org.uqbar.commons.applicationContext.ApplicationContext
import reposMorphia.RepoFunciones

class JoitsApplication extends Application {

	new(JoitsBootstrap bootstrap) {
		super(bootstrap)
	}

	override protected createMainWindow() {
		new LoginWindow(this)
	}

	static def void main(String[] args) {
		ApplicationContext.instance.configureSingleton(typeof(RepoProyecciones), new RepoProyecciones)
		ApplicationContext.instance.configureSingleton(typeof(RepoFunciones), new RepoFunciones)
		new JoitsApplication(new JoitsBootstrap).start()
	}

}
