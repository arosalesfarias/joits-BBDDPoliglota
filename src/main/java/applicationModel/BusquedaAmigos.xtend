package applicationModel

import domain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import repos.RepoUsuarios

@Accessors
@Observable
class BusquedaAmigos extends BuscaSugiereModel<Usuario> {

	override search() {
		lista = usuario.buscarPersonas(valorBusqueda)
		sugeridos = RepoUsuarios.instance.elementos
	}

	def void agregarAmigo() {
		usuario.agregarAmigo(entidadSeleccionada)
		clearBusqueda()
		search()
		clearEntity
	}

}
