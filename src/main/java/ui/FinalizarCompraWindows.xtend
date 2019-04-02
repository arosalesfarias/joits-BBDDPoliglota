package ui

import applicationModel.ModeloBusqueda
import domain.Ticket
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.VerticalLayout

class FinalizarCompraWindows extends SimpleWindow<ModeloBusqueda> {

	new(WindowOwner parent, ModeloBusqueda busqueda) {
		super(parent, busqueda)
		title = "Jpits - Finalizar compra"
	}

	override protected createFormPanel(Panel mainPanel) {

		val Panel panelUsuario = new Panel(mainPanel).layout = new HorizontalLayout()
		val Panel main = new Panel(mainPanel).layout = new HorizontalLayout()

		new Label(panelUsuario).text = "Usuario: "
		new Label(panelUsuario) => [
			value <=> "usuario.nombre"
		]

		val Panel panelPelis = new Panel(main)

		new Label(panelPelis).text = "Pelis en el carrito"

		val table = new Table<Ticket>(panelPelis, typeof(Ticket)) => [
			items <=> "carrito"
			value <=> "tiketSeleccionado"
			numberVisibleRows = 6
		]

		new Column<Ticket>(table) => [
			title = "pelicula"
			fixedSize = 300
			bindContentsToProperty("pelicula.titulo")
		]

	}

	override protected addActions(Panel mainPanel) {

		val Panel main = new Panel(mainPanel).layout = new HorizontalLayout()
		val Panel panelIzquierdo = new Panel(main)
		val Panel panelDerecho = new Panel(main)

		val Panel panelTotalEntradas = new Panel(panelIzquierdo).layout = new HorizontalLayout()
		val Panel panelLimpiar = new Panel(panelIzquierdo).layout = new HorizontalLayout()

		val Panel panelTotal = new Panel(panelDerecho).layout = new HorizontalLayout()
		val Panel panelEliminar = new Panel(panelDerecho).layout = new HorizontalLayout()
		val Panel panelFinalizar = new Panel(panelDerecho).layout = new HorizontalLayout()

		new Label(panelTotalEntradas) => [
			value <=> "totalEntradas"
		]
		new Label(panelTotalEntradas).text = "entradas"

		new Button(panelLimpiar) => [
			caption = "Limpiar carrito"
			onClick[|modelObject.limpiarCarrito]
			enabled <=> "carritoNoEstaVacio"
		]
		
		new Label(panelTotal).text = "Total: "
		new Label(panelTotal) => [
			value <=> "totalCarrito"
		]

		new Button(panelEliminar) => [
			caption = "EliminarItem"
			onClick[|(modelObject.sacarDelCarrito())]
			bindEnabled(new NotNullObservable("tiketSeleccionado"))
		]

		new Button(panelFinalizar) => [
			caption = "Finalizar compra"
			onClick[|modelObject.finalizarCompra]
			enabled <=> "carritoNoEstaVacio"
			this.close
		]
		
		new Button(panelFinalizar) => [
			caption = "Volver atras"
			onClick[|this.close]
		]
	}
}
