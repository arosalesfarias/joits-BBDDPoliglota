package ui

import applicationModel.BusquedaAmigos
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.Window
import domain.Usuario
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import java.awt.Color
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column

class BusquedaAmigosWindow extends Window<BusquedaAmigos> {
	new(WindowOwner parent, Usuario usuario) {
		super(parent, new BusquedaAmigos(usuario))
		title = "Busqueda de Personas"
		modelObject.search
	}

	override createContents(Panel mainPanel) {
		espacio(mainPanel)
		val columnas = new Panel(mainPanel).layout = new HorizontalLayout
		new Label(columnas) => [
			text = "Ingrese busqueda"
			foreground = Color.BLACK
		]
		new TextBox(columnas) => [
			width = 100
			value <=> "valorBusqueda"
		]
		new Button(columnas) => [
			caption = "Buscar"
			onClick [|this.modelObject.search]
			setAsDefault
			disableOnError
		]
		createResultados(mainPanel)
		extra(mainPanel)
	}

	def protected createResultados(Panel mainPanel) {
		this.crearTabla(mainPanel, "Resultados", "lista")
		this.crearTabla(mainPanel, "Sugeridos", "sugeridos")
	}

	def void crearTabla(Panel panel, String titulo, String lista) {
		espacio(panel)
		new Label(panel) => [
			text = titulo
			foreground = Color.BLACK
		]
		val table = new Table<Usuario>(panel, typeof(Usuario)) => [
			items <=> lista
			value <=> "entidadSeleccionada"
			numberVisibleRows = 4
			width = 300
		]
		crearColumna(panel, table, "nombre")
		crearColumna(panel, table, "apellido")
	}

	def void crearColumna(Panel panel, Table table, String string) {
		new Column<Usuario>(table) => [
			title = string.toFirstUpper
			fixedSize = 200
			bindContentsToProperty(string)
		]
	}

	def espacio(Panel panel) {
		new Label(panel).text = ""
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}

	def extra(Panel panel) {
		new Button(panel) => [
			caption = "Agregar Amigo"
			onClick[|modelObject.agregar()]
			enabled <=> "hayUnoSeleccionado"
		]
		new Button(panel) => [
			caption = "Volver"
			onClick[|this.close]
		]
	}
}
