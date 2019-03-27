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
import applicationModel.GrillaPelicula
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.windows.Dialog

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class BusquedaWindow extends SimpleWindow<ModeloBusqueda> {
	new(WindowOwner parent, Usuario usuario) {
		super(parent, new ModeloBusqueda(usuario))
		modelObject.search
	}

	override createMainTemplate(Panel mainPanel) {
		title = "Joits - Compra de tikets"

		super.createMainTemplate(mainPanel)
		createResultados(mainPanel)
		createAccionesResultado(mainPanel)
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
			foreground = Color.CYAN
		]
		new TextBox(columnas) => [
			width = 250
			value <=> "valorBusqueda"
		]

		new Button(columnas) => [

			caption = "Buscar"
			onClick [|this.modelObject.search]
			setAsDefault
		]

	}

	def protected createResultados(Panel mainPanel) {
		val resultadoPanel = new Panel(mainPanel)
		val LabelPanel = new Panel(resultadoPanel).layout = new HorizontalLayout
		new Label(LabelPanel) => [
			text = "Resultados: "
			foreground = Color.CYAN
		]
		/*new Label(LabelPanel) => [
		 * 	value <=> "cantidadPeliculas"
		 * 	foreground = Color.RED
		 ]*/
		val table = new Table<GrillaPelicula>(mainPanel, typeof(GrillaPelicula)) => [
			items <=> "resultados"
			value <=> "peliculaSeleccionada"
			numberVisibleRows = 8
		]
		columnasResultado(table)

	}

	def void columnasResultado(Table<GrillaPelicula> table) {
		new Column<GrillaPelicula>(table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("nombre")
		]
		new Column<GrillaPelicula>(table) => [
			title = "Fecha"
			fixedSize = 150
			bindContentsToProperty("anioRodaje")
		]
		new Column<GrillaPelicula>(table) => [
			title = "Raiting"
			fixedSize = 60
			bindContentsToProperty("raiting")
		]
		new Column<GrillaPelicula>(table) => [
			title = "Genero"
			fixedSize = 50
			bindContentsToProperty("genero")
		]
	}

	def void createAccionesResultado(Panel mainPanel) {
		// Deshabilitar los botones si no hay ningún elemento seleccionado en la grilla.
		val seleccionado = new NotNullObservable("peliculaSeleccionada")

		val actionsPanel = new Panel(mainPanel).layout = new HorizontalLayout

		new Button(actionsPanel) => [
			caption = "Mostrar Datos"
			// onClick [|abrirPeli]
			bindEnabled(seleccionado)
		]

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
		// throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
