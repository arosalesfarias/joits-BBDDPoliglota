package ui

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
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import applicationModel.BuscaSugiereModel
import org.uqbar.arena.windows.Window
import java.util.List

abstract class BusquedaMainWindow extends Window<BuscaSugiereModel<?>> {
	List<String> lista

	new(WindowOwner parent, BuscaSugiereModel<?> model, List<String> _lista) {
		super(parent, model)
		lista = _lista
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

	def void extra(Panel panel)

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
		this.lista.forEach [ columna |
			new Column<Usuario>(table) => [
				title = columna.toFirstUpper
				fixedSize = 200
				bindContentsToProperty(columna)
			]
		]
	}

	def espacio(Panel panel) {
		new Label(panel).text = ""
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}

}
