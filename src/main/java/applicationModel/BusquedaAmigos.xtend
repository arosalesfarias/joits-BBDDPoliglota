package applicationModel

import domain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import repos.RepoUsuarios
import java.util.List
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@Observable
class BusquedaAmigos extends BuscaSugiereModel {
	List<Usuario> lista
	List<Usuario> sugeridos
	Usuario entidadSeleccionada

	new(Usuario _usuario) {
		super(_usuario)
		sugeridos = RepoUsuarios.instance.listaSugeridos(3)
	}

	override search() {
		lista = usuario.buscarPersonas(valorBusqueda)
	}

	override agregar() {
		usuario.agregarAmigo(entidadSeleccionada)
		actualizarUsuario
		clearBusqueda()
		search()
		clearEntity
	}

	override void clearEntity() {
		entidadSeleccionada = null
	}

	@Dependencies("entidadSeleccionada")
	def getHayUnoSeleccionado() {
		entidadSeleccionada !== null
	}

	def actualizarUsuario() {
		ObservableUtils.firePropertyChanged(usuario, "amigos")
	}
}
