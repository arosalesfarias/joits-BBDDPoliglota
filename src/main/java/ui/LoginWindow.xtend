package ui

import org.uqbar.arena.windows.SimpleWindow
import repos.RepoUsuario
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label

class LoginWindow extends SimpleWindow<RepoUsuario>{
	
	new(WindowOwner parent) {
		super(parent, RepoUsuario.instance)
	}
	
	override protected addActions(Panel actionsPanel) {

	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Login"
		
		new Label(mainPanel).text = "Bienvenido"
		
	}
}