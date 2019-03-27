package ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

import domain.Usuario
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.bindings.NotNullObservable

class ControlPanelWindow extends SimpleWindow<Usuario> {

	new(WindowOwner parent, Usuario usu) {
		super(parent, usu)
		title = "Panel de Control"
	}

	override protected createFormPanel(Panel mainPanel) {
		val Panel PanelCentral = new Panel(mainPanel).layout = new ColumnLayout(2)
		val Panel PanelIzquierdo = new Panel(PanelCentral)
		val PanelDerecho = new Panel(PanelCentral)
		val PanelUsu = new Panel(PanelIzquierdo).layout = new HorizontalLayout()
		val PanelSaldo = new Panel(PanelDerecho).layout = new HorizontalLayout()
		new Label(PanelUsu).text = "Usuario: "
		new Label(PanelUsu) => [
			value <=> "nombre"
		]
		new Label(PanelSaldo).text = "Saldo: "
		new Label(PanelSaldo) => [
			value <=> "saldo"
		]
		val PanelEdad = new Panel(PanelIzquierdo).layout = new HorizontalLayout()
		val PanelCarga = new Panel(PanelDerecho).layout = new HorizontalLayout()
		new Label(PanelEdad).text = "Edad: "
		new Label(PanelEdad) => [
			value <=> "edad"
		]
		new Label(PanelCarga).text = "Cargar Saldo: "
		new NumericField(PanelCarga) => [
			value <=> "cantidad"
		]
		new Button(PanelCarga) => [
			caption = "Cargar"
			onClick[|modelObject.agregarSaldo()]
			bindEnabled(new NotNullObservable("cantidad"))
		]
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Aceptar"
			setAsDefault
		]
		new Button(actionsPanel) => [
			caption = "Cancelar"
			onClick[|this.close]
		]
	}

}
