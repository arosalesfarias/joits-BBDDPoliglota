package ui

import applicationModel.BusquedaAmigos
import domain.Usuario
import java.awt.Color
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.NotNullObservable

class BusquedaAmigosWindow extends SimpleWindow<BusquedaAmigos> {
	new(WindowOwner parent, Usuario usuario) {
		super(parent, new BusquedaAmigos(usuario))
		modelObject.search
	}

	override createMainTemplate(Panel mainPanel) {
		title = "Busqueda de amigos"
		super.createMainTemplate(mainPanel)
	}

	override protected createFormPanel(Panel mainPanel) {

		new Label(mainPanel).text = ""
		val columnas = new Panel(mainPanel).layout = new HorizontalLayout
		new Label(columnas) => [
			text = "Buscar Personas"
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
	}

	def protected createResultados(Panel mainPanel) {
		val resultadoPanel = new Panel(mainPanel)
		val LabelPanel = new Panel(resultadoPanel).layout = new HorizontalLayout
		new Label(LabelPanel) => [
			text = "Resultados: "
			foreground = Color.BLACK
		]
		val table = new Table<Usuario>(mainPanel, typeof(Usuario)) => [
			items <=> "resultados"
			value <=> "usuarioSeleccionado"
			numberVisibleRows = 4
			width = 100
		]
		this.columnasResultado(table)
	}

	def void columnasResultado(Table<Usuario> table) {
		new Column<Usuario>(table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("nombre")
		]
		new Column<Usuario>(table) => [
			title = "Apellido"
			fixedSize = 150
			bindContentsToProperty("apellido")
		]
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Agregar Amigo"
			onClick[|modelObject.agregarAmigo()]
			setAsDefault
			bindEnabled(new NotNullObservable("usuarioSeleccionado"))
		]
		new Button(actionsPanel) => [
			caption = "Volver"
			onClick[|this.close]
		]
	}

}
