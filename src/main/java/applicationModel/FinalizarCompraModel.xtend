package applicationModel

import RepoJedis.Carrito
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
import reposNeo4j.RepositorioUsuarios
import builderRepositorio.RepoManager

@Observable
@Accessors
class FinalizarCompraModel {
	List<Ticket> carrito = new ArrayList<Ticket>
	Usuario usuario
	Ticket tiketSeleccionado
	RepoManager repoManger = new RepoManager

	new(Usuario usu, List<Ticket> carri) {
		usuario = usu
		carrito = carri
		repoManger.repositoriosUsuarios.addAll(RepositorioUsuarios.instance, RepoUsuarios.instance)
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
		repoManger.actualizarUsuario(usuario)
		limpiarCarrito()
	}

	def actualizarListas() {
		tiketSeleccionado = null
		ObservableUtils.firePropertyChanged(this, "carrito")
	}
}
