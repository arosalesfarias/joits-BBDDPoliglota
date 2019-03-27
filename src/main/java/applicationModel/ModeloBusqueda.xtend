package applicationModel

import java.util.List
import domain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class ModeloBusqueda {
	String valorBusqueda = ""
	List<GrillaPelicula> resultados = newArrayList
	GrillaPelicula peliculaSeleccionada
	Usuario usuario

	new(Usuario _usuario) {
		usuario = _usuario
	}

	def void search() {
		resultados.clear
		val temp = usuario.buscar(valorBusqueda)
		temp.forEach[p|resultados.add(new GrillaPelicula(p, usuario))]
	}

	def void clearUsuario() {
		usuario = null
	}

	def clearBusqueda() {
		valorBusqueda = ""
	}
}
