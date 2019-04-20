package ui

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

import domain.Usuario
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Spinner
import org.uqbar.arena.aop.windows.TransactionalDialog
import applicationModel.BusquedaAmigos
import repos.RepoUsuarios

class ControlPanelWindow extends TransactionalDialog<Usuario> {

	new(WindowOwner parent, Usuario usu) {
		super(parent, usu)
		title = "Panel de Control"
	}

	override protected createFormPanel(Panel mainPanel) {
		val Panel PanelDatos = new Panel(mainPanel).layout = new HorizontalLayout()
		val Panel PanelIzquierdo = new Panel(PanelDatos)
		val Panel PanelDerecho = new Panel(PanelDatos)
		val Panel PanelNombre = new Panel(PanelIzquierdo).layout = new HorizontalLayout()
		val Panel PanelEdad = new Panel(PanelIzquierdo).layout = new HorizontalLayout()
		val Panel PanelAmigos = new Panel(PanelIzquierdo)
		val Panel PanelSaldo = new Panel(PanelDerecho).layout = new HorizontalLayout()
		val Panel PanelCarga = new Panel(PanelDerecho).layout = new HorizontalLayout()
		val Panel PanelPeliculas = new Panel(PanelDerecho)
		new Label(PanelNombre).text = "Usuario: "
		new Label(PanelNombre) => [
			value <=> "nombre"
		]
		new Label(PanelSaldo).text = "Saldo: "
		new Label(PanelSaldo) => [
			value <=> "saldo"
		]
		new Label(PanelEdad).text = "Edad: "
		new Spinner(PanelEdad) => [
			value <=> "edad"
		]
		new Label(PanelCarga).text = "Cargar Saldo: "
		new Spinner(PanelCarga) => [
			value <=> "cantidad"
		]
		new Button(PanelCarga) => [
			caption = "Cargar"
			onClick[|modelObject.agregarSaldo()]
			bindEnabled(new NotNullObservable("cantidad"))
		]
		this.tablaAmigos(PanelAmigos)
		this.listaPeliculas(PanelPeliculas)
	}

	def listaPeliculas(Panel panel) {
		new Label(panel).text = "Pelis Vistas"
		new List(panel) => [
			items <=> "tickets"
			width = 220
			height = 80
		]
	}

	def tablaAmigos(Panel panel) {
		new Label(panel).text = "Amigos"
		val table = new Table<Usuario>(panel, typeof(Usuario)) => [
			items <=> "amigos"
			numberVisibleRows = 4
		]
		new Column<Usuario>(table) => [
			title = "Nombre"
			fixedSize = 100
			bindContentsToProperty("nombre")
		]
		new Column<Usuario>(table) => [
			title = "Apellido"
			fixedSize = 150
			bindContentsToProperty("apellido")
		]
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Buscar Amigos"
			onClick[|(new BusquedaAmigosWindow(this, new BusquedaAmigos(modelObject)).open)]
			setAsDefault
		]
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick[|this.aceptar]
			setAsDefault
		]
		new Button(actionsPanel) => [
			caption = "Cancelar"
			onClick[|this.close]
		]
	}

	def aceptar() {
		this.accept
		RepoUsuarios.instance.update(modelObject)
	}
}
