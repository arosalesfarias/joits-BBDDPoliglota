package applicationModel

import domain.Usuario
import repos.RepoUsuarios
import exceptions.BusinessException
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Login {

	RepoUsuarios repo = RepoUsuarios.instance

	String usuario
	String contraseña

	def void validaLogin() {
		if (!repo.existeUsuario(this.usuario)) {
			throw new BusinessException("usuario NO existe")
		}
		if (repo.searchByUser(this.usuario).login !== this.contraseña) {
			throw new BusinessException("password incorrecta")
		} //else
			//return repo.searchByUser(this.usuario)
	}
	def autenticar(){
		
	}
}
