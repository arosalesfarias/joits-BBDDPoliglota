package ui

import applicationModel.ModeloBusqueda
import domain.Usuario
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Link
import java.awt.Color
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.windows.Dialog

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import domain.Proyeccion
import domain.Funcion

class BusquedaWindow extends SimpleWindow<ModeloBusqueda> {
	new(WindowOwner parent, Usuario usuario) {
		super(parent, new ModeloBusqueda(usuario))
		modelObject.search
	}

	override createMainTemplate(Panel mainPanel) {
		title = "Joits - Compra de tikets"

		super.createMainTemplate(mainPanel)
		val Panel main = new Panel(mainPanel).layout = new HorizontalLayout()
		createResultados(main)
		createFunciones(main)
		createAgregarCarrito(mainPanel)
	}

	def createFunciones(Panel panel) {
		new Label(panel) => [
			text = "Funciones: "
			foreground = Color.BLACK
		]
		new Table<Funcion>(panel, typeof(Funcion)) => [
			items <=> "proyeccionSeleccionada.funciones"
			value <=> "funcionSeleccionada"
			numberVisibleRows = 9
			bindEnabled(new NotNullObservable("proyeccionSeleccionada"))
			new Column<Funcion>(it) => [
				title = "Fecha"
				fixedSize = 200
				bindContentsToProperty("hora")
			]
			new Column<Funcion>(it) => [
				title = "Sala"
				fixedSize = 60
				bindContentsToProperty("sala")
			]
		]

	}

	override protected createFormPanel(Panel mainPanel) {

		val columnaUser = new Panel(mainPanel).layout = new ColumnLayout(4)
		new Label(columnaUser)
		val panelUser = new Panel(columnaUser).layout = new HorizontalLayout
		new Label(panelUser).text = "Usuario:"
		new Label(panelUser).value <=> "usuario.nombre"
		new Label(panelUser).text = "  "
		new Link(panelUser) => [
			caption = "Cerrar Sesión"
			onClick[|this.cerrarSesion]
		]
		val panelContenedor = new Panel(mainPanel)
		new Label(panelContenedor).text = ""
		val columnas = new Panel(panelContenedor).layout = new HorizontalLayout
		new Label(columnas) => [
			text = "Buscar pelicula"
			foreground = Color.BLACK
		]
		new TextBox(columnas) => [
			width = 250
			value <=> "valorBusqueda"
		]
		new Button(columnas) => [
			caption = "Buscar"
			onClick [|this.modelObject.search]
			setAsDefault
			disableOnError
		]
	}

	def protected createResultados(Panel mainPanel) {
		val resultadoPanel = new Panel(mainPanel)
		val LabelPanel = new Panel(resultadoPanel).layout = new HorizontalLayout
		new Label(LabelPanel) => [
			text = "Resultados: "
			foreground = Color.BLACK
		]
		val table = new Table<Proyeccion>(mainPanel, typeof(Proyeccion)) => [
			items <=> "resultados"
			value <=> "proyeccionSeleccionada"
			numberVisibleRows = 9
		]
		this.columnasResultado(table)
	}

	def void columnasResultado(Table<Proyeccion> table) {
		new Column<Proyeccion>(table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("titulo")
		]
		new Column<Proyeccion>(table) => [
			title = "Fecha"
			fixedSize = 150
			bindContentsToProperty("añoRodaje")
		]
		new Column<Proyeccion>(table) => [
			title = "Raiting"
			fixedSize = 60
			bindContentsToProperty("puntaje")
		]
		new Column<Proyeccion>(table) => [
			title = "Genero"
			fixedSize = 50
			bindContentsToProperty("genero")
		]
	}

	def createAgregarCarrito(Panel mainPanel) {
		val funcion = new NotNullObservable("funcionSeleccionada")
		val actionsPanel = new Panel(mainPanel).layout = new ColumnLayout(3)
		new Button(actionsPanel) => [
			caption = "Panel de Control"
			onClick [|abrirPanel]
		]
		new Button(actionsPanel) => [
			caption = "Agregar al carrito"
			onClick [modelObject.agregarAlCarrito]
			bindEnabled(funcion)
		]
		new Button(actionsPanel) => [
			caption = "Finalizar compra"
			onClick [|finalizarCompra]
		]
	}

	def finalizarCompra() {
		(new FinalizarCompraWindows(this, modelObject).open)
	}

	def abrirPanel() {
		(new ControlPanelWindow(this, modelObject.usuario).open)
	}

	def void cerrarSesion() {
		modelObject.clearUsuario
		this.close()
		(new LoginWindow(this)).open
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}

	override protected addActions(Panel actionsPanel) {
	}

}
