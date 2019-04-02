package ui

import applicationModel.BusquedaAmigos
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class BusquedaAmigosWindow extends BusquedaMainWindow {
	new(WindowOwner parent, BusquedaAmigos model) {
		super(parent, model, newArrayList("nombre","apellido"))
		title = "Busqueda de Personas"
	}

	override extra(Panel panel) {
		new Button(panel) => [
			caption = "Agregar Amigo"
			onClick[|modelObject.agregar()]
			setAsDefault
			enabled <=> "hayUnoSeleccionado"
		]
		new Button(panel) => [
			caption = "Volver"
			onClick[|this.close]
		]
	}
}
