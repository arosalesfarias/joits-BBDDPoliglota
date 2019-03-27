package application

import org.uqbar.arena.Application
import ui.LoginWindow

class JoitsApplication extends Application {

	new(JoitsBootstrap bootstrap) {
		super(bootstrap)
	}

	override protected createMainWindow() {
		new LoginWindow(this)
	}

	static def void main(String[] args) {
		new JoitsApplication(new JoitsBootstrap).start()
	}

}
