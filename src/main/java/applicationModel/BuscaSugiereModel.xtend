package applicationModel

import domain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import reposHibernate.RepoUsuarios

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
	def getUser(){
		println(usuario.id)
		usuario = RepoUsuarios.instance.searchById(usuario.id)
	}
	def void agregar()

	def void clearEntity()
}
