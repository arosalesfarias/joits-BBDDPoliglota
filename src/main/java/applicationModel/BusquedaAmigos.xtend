package applicationModel

import java.util.List
import domain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import repos.RepoUsuarios

@Accessors
@Observable
class BusquedaAmigos {
	String valorBusqueda
	List<Usuario> resultados
	Usuario usuarioSeleccionado
	Usuario usuario

	new(Usuario _usuario) {
		usuario = _usuario
	}

	def void search() {
		resultados = RepoUsuarios.instance.search(valorBusqueda)
	}

	def void clearUsuario() {
		usuario = null
	}

	def clearBusqueda() {
		valorBusqueda = ""
	}

}
