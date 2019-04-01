package applicationModel

import domain.Entidad
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import domain.Usuario
import org.uqbar.commons.model.annotations.Dependencies

@Accessors
@Observable
class BuscaSugiereModel<T extends Entidad> {
	String valorBusqueda
	T entidadSeleccionada
	List<T> lista
	List<T> sugeridos
	Usuario usuario

	new(Usuario _usuario) {
		usuario = _usuario
	}

	def void search(){}

	def void clearEntity() {
		entidadSeleccionada = null
	}

	def clearBusqueda() {
		valorBusqueda = ""
	}

	@Dependencies("entidadSeleccionada")
	def getHayUnoSeleccionado() {
		entidadSeleccionada !== null
	}
	
	def void agregar(){}
}
