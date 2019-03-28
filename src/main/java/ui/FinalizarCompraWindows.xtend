package ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import applicationModel.ModeloBusqueda
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import domain.Tiket
import org.uqbar.arena.bindings.NotNullObservable

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
		new Label(mainPanel) => [
			value <=> "totalCarrito"
		]
		new Button(mainPanel) => [
			caption = "EliminarItem"
			onClick[|(modelObject.sacarDelCarrito())]
		]
		new Button(mainPanel) => [
			caption = "Limpiar carrito"
			onClick[|modelObject.limpiarCarrito]
		]
		new Button(mainPanel) => [
			caption = "Finalizar compra"
			onClick[|modelObject.finalizarCompra]
			bindEnabled(new NotNullObservable("carrito"))
		]
	}

	def tablaPeliculas(Panel mainPanel) {
		new Label(mainPanel).text = "Pelis en el carrito"
		val table = new Table<Tiket>(mainPanel, typeof(Tiket)) => [
			items <=> "carrito"
			numberVisibleRows = 6
		]
		new Column<Tiket>(table) => [
			title = "pelicula"
			fixedSize = 100
			bindContentsToProperty("pelicula.titulo")
		]

	}

}
