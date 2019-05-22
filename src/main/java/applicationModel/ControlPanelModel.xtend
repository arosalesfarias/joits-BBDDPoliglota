package applicationModel

import domain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import reposHibernate.RepoUsuarios

@Accessors
@Observable
class ControlPanelModel {
	Usuario usuario
	float cantidad

	new(Usuario user) {
		usuario = user
	}

	def agregarSaldo() {
		usuario.saldo = usuario.saldo + cantidad
		cantidad = 0
	}

	def update() {
		RepoUsuarios.instance.update(usuario)
	}
}
