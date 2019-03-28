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
	List<Usuario> sugeridos

	new(Usuario _usuario) {
		usuario = _usuario
	}

	def void search() {
		resultados = usuario.buscarPersonas(valorBusqueda)
		sugeridos = RepoUsuarios.instance.elementos
	}

	def void agregarAmigo() {
		usuario.agregarAmigo(usuarioSeleccionado)
		clearBusqueda()
		search()
		clearUsuario()
	}

	def void clearUsuario() {
		usuarioSeleccionado = null
	}

	def clearBusqueda() {
		valorBusqueda = ""
	}
}
