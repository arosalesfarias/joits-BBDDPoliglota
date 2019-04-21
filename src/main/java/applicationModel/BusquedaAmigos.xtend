package applicationModel

import domain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import repos.RepoUsuarios

@Accessors
@Observable
class BusquedaAmigos extends BuscaSugiereModel<Usuario> {

	new(Usuario _usuario) {
		super(_usuario)
		sugeridos = RepoUsuarios.instance.listaSugeridos
	}

	override search() {
		lista = usuario.buscarPersonas(valorBusqueda)
	}

	override agregar() {
		usuario.agregarAmigo(entidadSeleccionada)
		clearBusqueda()
		search()
		clearEntity
	}

}
