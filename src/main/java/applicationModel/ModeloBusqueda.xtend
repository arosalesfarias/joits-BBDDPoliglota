package applicationModel

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import repos.RepoProyecciones
import domain.Proyeccion
import java.util.ArrayList
import domain.Funcion
import org.uqbar.commons.model.annotations.Dependencies
import domain.Ticket
import org.uqbar.commons.model.exceptions.UserException

@Accessors
@Observable
class ModeloBusqueda extends BuscaSugiereModel<Proyeccion> {
	Funcion funcionSeleccionada
	Ticket tiketSeleccionado
	List<Ticket> carrito = new ArrayList<Ticket>

	override void search() {
		lista = RepoProyecciones.instance.search(valorBusqueda)
		sugeridos = RepoProyecciones.instance.elementos
	}

	def void clearUsuario() {
		usuario = null
	}

	@Dependencies("carrito")
	def getCarritoNoEstaVacio() {
		!carrito.isEmpty
	}

	@Dependencies("carrito")
	def getCantidadTicketsAComprar() {
		carrito.size
	}

	@Dependencies("carrito")
	def getTotalCarrito() {
		carrito.fold(0.0, [total, pelicula|total + pelicula.precio]).floatValue
	}

	def agregarAlCarrito() {
		carrito.add(new Ticket => [
			funcion = funcionSeleccionada
			pelicula = entidadSeleccionada
		])
		clearSeleccionados()
	}

	def clearSeleccionados() {
		clearEntity
		funcionSeleccionada = null
	}

	def sacarDelCarrito() {
		carrito.remove(tiketSeleccionado)
	}

	def void limpiarCarrito() {
		carrito.clear
	}

	def finalizarCompra() {
		if(totalCarrito > usuario.saldo) throw new UserException("No posee saldo suficiente")
		carrito.forEach[ticket|usuario.comprarTicket(ticket)]
		limpiarCarrito()
	}
}
