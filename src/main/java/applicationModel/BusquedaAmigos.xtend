package applicationModel

import domain.Usuario
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils
import reposHibernate.RepoUsuarios
import reposNeo4j.RepositorioUsuarios

@Accessors
@Observable
class BusquedaAmigos extends BuscaSugiereModel {
	List<Usuario> lista
	List<Usuario> sugeridos
	Usuario entidadSeleccionada

	new(Usuario _usuario) {
		super(_usuario)
		sugeridos = this.amigosSugeridos
	}

	override search() {
		lista = RepoUsuarios.instance.buscarPersonas(usuario, valorBusqueda)
	}
	
	def amigosSugeridos(){
		(RepositorioUsuarios.instance.getRecomendados(usuario)).take(5).toList
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
