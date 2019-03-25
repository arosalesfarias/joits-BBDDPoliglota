package ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import applicationModel.Login

class LoginWindow extends SimpleWindow<Login>{
	
	new(WindowOwner parent) {
		super(parent, new Login)
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