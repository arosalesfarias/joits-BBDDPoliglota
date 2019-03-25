package ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import applicationModel.Login
import org.uqbar.arena.widgets.Button

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class LoginWindow extends SimpleWindow<Login> {

	new(WindowOwner parent) {
		super(parent, new Login)
		title = "Login"
		taskDescription = "Ingrese Usuario y Contraseña"
	}

	override protected addActions(Panel actionsPanel) {
	}

	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Usuario"
		new TextBox(mainPanel) => [
			value <=> "usuario"
		]
		new Label(mainPanel).text = "Contraseña"
		new TextBox(mainPanel) => [
			value <=> "contraseña"
		]
		new Button(mainPanel) => [
			caption = "Enter"
			onClick([|modelObject.validaLogin()])
		// bindEnabled()
		]
	}
}
