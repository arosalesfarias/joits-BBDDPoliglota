package applicationModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.exceptions.UserException
import repos.RepoUsuarios

@Accessors
@Observable
class ValidadorUsuarios {

	String nick = ""
	String contraseña = ""
	RepoUsuarios home = RepoUsuarios.instance

	def void validar() {
		if (home.searchByUser(nick) === null) {
			throw new UserException("El Usuario es inexistente")

		} else {
			if (this.contraseñaValida(nick)) {
				throw new UserException("La Contraseña es incorrecta")
			}
		}
	}
	
	def Boolean contraseñaValida(String pass){
		home.searchByUser(pass).login != contraseña
	}

	def getUsuario() {
		validar
		home.searchByUser(nick)
	}

}
