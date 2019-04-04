package applicationModel

import domain.Funcion
import domain.Proyeccion
import domain.Ticket
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import repos.RepoProyecciones

@Accessors
@Observable
class ModeloBusqueda extends BuscaSugiereModel<Proyeccion> {
	Funcion funcionSeleccionada
	List<Ticket> carrito = new ArrayList<Ticket>

	override void search() {
		lista = RepoProyecciones.instance.search(valorBusqueda)
		sugeridos = RepoProyecciones.instance.elementos
	}

	def void clearUsuario() {
		usuario = null
	}



	def clearSeleccionados() {
		clearEntity
		funcionSeleccionada = null
	}

	@Dependencies("carrito")
	def getCantidadTicketsAComprar() {
		carrito.size
	}

	@Dependencies("carrito")
	def getCarritoNoEstaVacio() {
		!carrito.isEmpty
	}
	
	override agregar() {
		carrito.add(new Ticket => [
			funcion = funcionSeleccionada
			pelicula = entidadSeleccionada
		])
		clearSeleccionados()
	}
	
}
