package ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import applicationModel.ModeloBusqueda
import org.uqbar.arena.widgets.tables.Table
import domain.Proyeccion
import org.uqbar.arena.widgets.tables.Column

class FinalizarCompraWindows extends SimpleWindow<ModeloBusqueda> {

	new(WindowOwner parent, ModeloBusqueda busqueda) {
		super(parent, busqueda)
		title = "Jpits - Finalizar compra"
	}

	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "Usuario: "
		new Label(mainPanel) => [
			value <=> "usuario.nombre"
		]
	}

	override protected addActions(Panel mainPanel) {

		this.tablaPeliculas(mainPanel)

		new Button(mainPanel) => [
			caption = "EliminarItem"
			onClick[|(modelObject.sacarDelCarrito())]
		]

		new Button(mainPanel) => [
			caption = "Limpiar carrito"
			onClick[|modelObject.limpiarCarrito]
		]
	}

	def tablaPeliculas(Panel mainPanel) {
		new Label(mainPanel).text = "Pelis en el carrito"
		val table = new Table<Proyeccion>(mainPanel, typeof(Proyeccion)) => [
			items <=> "carrito"
			numberVisibleRows = 6
		]
		new Column<Proyeccion>(table) => [
			title = "Nombre"
			fixedSize = 100
			bindContentsToProperty("titulo")
		]

	}

}
