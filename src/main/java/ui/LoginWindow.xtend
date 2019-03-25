package ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import repos.RepoUsuarios
import org.uqbar.arena.widgets.TextBox

class LoginWindow extends SimpleWindow<RepoUsuarios>{
	
	new(WindowOwner parent) {
		super(parent, RepoUsuarios.instance)
	}
	
	override protected addActions(Panel actionsPanel) {

	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = "Login"
		
		new Label(mainPanel).text = "Usuario"
		new TextBox(mainPanel)
		new Label(mainPanel).text = "Contraseña"
		new TextBox(mainPanel)
	}
}