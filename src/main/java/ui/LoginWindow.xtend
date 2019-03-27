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

	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Usuario"
		new TextBox(mainPanel) => [
			value <=> "usuarioIngresado"
		]
		new Label(mainPanel).text = "Contraseña"
		new TextBox(mainPanel) => [
			value <=> "contraseña"
		]
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick[|this.abrirBusqueda]
			setAsDefault
		]
		new Button(actionsPanel) => [
			caption = "Cancelar"
			onClick[|this.close]
		]
	}

	def abrirBusqueda() {
		modelObject.autenticar()
		this.close()
	//	(new BusquedaWindow(this, modelObject.getUser)).open
}
