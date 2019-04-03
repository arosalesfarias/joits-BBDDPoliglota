package ui

import domain.Ticket
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import applicationModel.FinalizarCompraModel

class FinalizarCompraWindows extends SimpleWindow<FinalizarCompraModel> {

	new(WindowOwner parent, FinalizarCompraModel model) {
		super(parent, model)
		title = "Jpits - Finalizar compra"
	}

	override protected createFormPanel(Panel mainPanel) {

		val Panel panelUsuario = new Panel(mainPanel).layout = new HorizontalLayout()

		new Label(panelUsuario).text = "Usuario: "
		new Label(panelUsuario) => [
			value <=> "usuario.nombre"
		]

		new Label(mainPanel).text = "Pelis en el carrito"

		new Table<Ticket>(mainPanel, typeof(Ticket)) => [
			items <=> "carrito"
			value <=> "tiketSeleccionado"
			numberVisibleRows = 6
			new Column<Ticket>(it) => [
				title = "pelicula"
				fixedSize = 300
				bindContentsToProperty("pelicula.titulo")
			]
		]
	}

	override protected addActions(Panel mainPanel) {

		mainPanel.layout = new ColumnLayout(2)

		new Label(mainPanel).text = "Entradas"
		new Label(mainPanel) => [
			value <=> "cantidadTicketsAComprar"
		]

		new Label(mainPanel).text = "Total: "
		new Label(mainPanel) => [
			value <=> "totalCarrito"
		]

		new Button(mainPanel) => [
			caption = "Limpiar carrito"
			onClick[|modelObject.limpiarCarrito]
			enabled <=> "carritoNoEstaVacio"
		]

		new Button(mainPanel) => [
			caption = "EliminarItem"
			onClick[|(modelObject.sacarDelCarrito())]
			bindEnabled(new NotNullObservable("tiketSeleccionado"))
		]

		new Button(mainPanel) => [
			caption = "Finalizar compra"
			onClick[|modelObject.finalizarCompra]
			enabled <=> "carritoNoEstaVacio"
			this.close
		]

		new Button(mainPanel) => [
			caption = "Volver atras"
			onClick[|this.close]
		]
	}
}
