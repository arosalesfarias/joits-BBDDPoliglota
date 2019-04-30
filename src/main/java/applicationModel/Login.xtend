package applicationModel

import repos.RepoUsuarios
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import domain.Usuario

@Observable
@Accessors
class Login {

	RepoUsuarios repoUsr

	Usuario login

	new() {
		repoUsr = RepoUsuarios.instance
		login = new Usuario()
	}

	def autenticar() {
		repoUsr.coincide(login)
	}

}
