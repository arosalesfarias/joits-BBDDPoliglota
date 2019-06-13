package applicationModel

import domain.Ticket
import domain.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.commons.model.utils.ObservableUtils
import reposHibernate.RepoUsuarios
import RepoJedis.Carrito
import reposNeo4j.RepositorioUsuarios

@Observable
@Accessors
class FinalizarCompraModel {
	List<Ticket> carrito = new ArrayList<Ticket>
	Usuario usuario
	Ticket tiketSeleccionado

	new(Usuario usu, List<Ticket> carri) {
		usuario = usu
		carrito = carri
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

	def sacarDelCarrito() {
		Carrito.instance.eliminarDeCarrito(usuario, tiketSeleccionado)
		println(tiketSeleccionado.pelicula)
		carrito.remove(tiketSeleccionado)
		this.actualizarListas
	}

	def void limpiarCarrito() {
		Carrito.instance.vaciarCarrito(usuario)
		carrito.clear
		this.actualizarListas
	}

	def finalizarCompra() {
		if(totalCarrito > usuario.saldo) throw new UserException("No posee saldo suficiente")
		carrito.forEach [ ticket |
			usuario.comprarTicket(ticket)
		]
		RepoUsuarios.instance.update(usuario)
		limpiarCarrito()
	}

	def actualizarListas() {
		tiketSeleccionado = null
		ObservableUtils.firePropertyChanged(this, "carrito")
	}
}
