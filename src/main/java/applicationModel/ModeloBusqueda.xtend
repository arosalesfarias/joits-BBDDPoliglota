package applicationModel

import java.util.List
import domain.Usuario
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
class ModeloBusqueda {
	String valorBusqueda
	List<Proyeccion> resultados
	Proyeccion proyeccionSeleccionada
	Funcion funcionSeleccionada
	Ticket tiketSeleccionado
	Usuario usuario
	List<Ticket> carrito = new ArrayList<Ticket>

	new(Usuario _usuario) {
		usuario = _usuario
	}

	def void search() {
		resultados = RepoProyecciones.instance.search(valorBusqueda)
	}

	def void clearUsuario() {
		usuario = null
	}

	def clearBusqueda() {
		valorBusqueda = ""
	}

	@Dependencies("carrito")
	def getCarritoNoEstaVacio() {
		!carrito.isEmpty
	}

	@Dependencies("carrito")
	def getCantidadPeliculasAComprar() {
		carrito.size
	}

	@Dependencies("carrito")
	def getTotalCarrito() {
		carrito.fold(0.0, [total, pelicula|total + pelicula.precio]).floatValue
	}

	def agregarAlCarrito() {
		carrito.add(new Ticket => [
			funcion = funcionSeleccionada
			pelicula = proyeccionSeleccionada
		])
		clearSeleccionados()
	}

	def clearSeleccionados() {
		proyeccionSeleccionada = null
		funcionSeleccionada = null
	}

	def sacarDelCarrito() {
		carrito.remove(tiketSeleccionado)
	}

	def void limpiarCarrito() {
		carrito.clear
	}

	def finalizarCompra() {
		if (totalCarrito > usuario.saldo) throw new UserException("No posee saldo suficiente")
		carrito.forEach[ticket|usuario.comprarTicket(ticket)]
		limpiarCarrito()
	}
}
