package applicationModel

import java.util.List
import domain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import repos.RepoProyecciones
import domain.Proyeccion
import java.util.ArrayList
import domain.Funcion
import domain.Tiket

@Accessors
@Observable
class ModeloBusqueda {
	String valorBusqueda
	List<Proyeccion> resultados
	Proyeccion proyeccionSeleccionada
	Funcion funcionSeleccionada
	Tiket tiketSeleccionado
	Usuario usuario
	List<Tiket> carrito = new ArrayList<Tiket>

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

	def agregarAlCarrito() {
		carrito.add(new Tiket => [
			funcion = funcionSeleccionada
			pelicula = proyeccionSeleccionada
		])
	}

	def sacarDelCarrito() {
		carrito.remove(tiketSeleccionado)
	}

	def void limpiarCarrito() {
		carrito.clear
	}

	def finalizarCompra() {
		carrito.forEach[x|usuario.comprarPelicula(x.pelicula)]
		limpiarCarrito()
	}
}
