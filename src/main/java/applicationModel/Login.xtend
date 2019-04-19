package applicationModel

import repos.RepoUsuarios
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import domain.Usuario

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
		repoUsr.devolverUsuario(new Usuario() =>[
			usuario = usuarioIngresado
		])
	}

	def autenticar() {
		repoUsr.coincide( new Usuario() =>[
			usuario = usuarioIngresado
			login =  contraseña
		]
		)
	}

}
