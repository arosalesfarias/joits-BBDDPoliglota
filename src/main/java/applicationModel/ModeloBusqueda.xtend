package applicationModel

import java.util.List
import domain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import repos.RepoProyecciones
import domain.Proyeccion

@Accessors
@Observable
class ModeloBusqueda {
	String valorBusqueda
	List<Proyeccion> resultados
	Proyeccion proyeccionSeleccionada
	Usuario usuario
	List<Proyeccion> carrito

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
		carrito.add(proyeccionSeleccionada)
	}

	def sacarDelCarrito() {
		carrito.remove(proyeccionSeleccionada)
	}

	def limpiarCarrito() {
		carrito.removeAll
	}

	def finalizarCompra() {
		usuario.comprarPelicula(carrito)
	}
}
