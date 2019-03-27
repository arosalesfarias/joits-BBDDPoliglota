package applicationModel

import repos.RepoUsuarios
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Login {

	RepoUsuarios repoUsr

	String usuarioIngresado
	String contraseña

	new() {
		repoUsr = RepoUsuarios.instance
	}

	def getUsuario() {
		repoUsr.devolverUsuario(usuarioIngresado)
	}

	def autenticar() {
		repoUsr.coincide(usuarioIngresado, contraseña)
	}

}
