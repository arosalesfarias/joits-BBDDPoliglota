package applicationModel

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Usuario

@Accessors
@Observable
abstract class BuscaSugiereModel {
	String valorBusqueda
	Usuario usuario

	new(Usuario _usuario) {
		usuario = _usuario
	}

	def void search()

	def clearBusqueda() {
		valorBusqueda = ""
	}

	def void agregar()

	def void clearEntity()
}
