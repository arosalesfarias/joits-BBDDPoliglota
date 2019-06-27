package applicationModel

import domain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import reposHibernate.RepoUsuarios
import RepoManager.RepoManagerUsuario

@Observable
@Accessors
class Login {

	RepoManagerUsuario repoUsr

	Usuario login

	new() {
		repoUsr = RepoManagerUsuario.instance
		login = new Usuario()
	}

	def autenticar() {
		repoUsr.login(login)
	}

}
