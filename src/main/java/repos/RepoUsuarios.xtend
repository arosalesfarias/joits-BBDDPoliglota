package repos

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Usuario
import org.uqbar.commons.model.exceptions.UserException

@Accessors
class RepoUsuarios extends RepoGenerico<Usuario> {

	static RepoUsuarios repoUsuarios

	def static RepoUsuarios getInstance() {
		if (repoUsuarios === null) {
			repoUsuarios = new RepoUsuarios
		}
		repoUsuarios
	}

	private new() {
	}

	override List<Usuario> search(String buscar) {
		elementos.filter [ usu |
			this.match(buscar, usu.nombre) || this.match(buscar, usu.apellido) || this.match(buscar, usu.usuario)
		].toList
	}

	def buscarPersonas(Usuario usuario, String buscar) {
		search(buscar).filter[persona|!usuario.amigos.exists[amigo|amigo === persona] && persona !== usuario].toList
	}

	override void actualizarDatos(Usuario usuarioViejo, Usuario usuarioNuevo) {
		usuarioViejo => [
			usuarioViejo.nombre = usuarioNuevo.nombre
			usuarioViejo.apellido = usuarioNuevo.apellido
			usuarioViejo.edad = usuarioNuevo.edad
			usuarioViejo.saldo = usuarioNuevo.saldo
			usuarioViejo.usuario = usuarioNuevo.usuario
			usuarioViejo.login = usuarioNuevo.login
		]
	}

	def devolverUsuario(String usr) {
		elementos.findFirst[u|u.usuario.equals(usr)]
	}

	def coincide(String usr, String pass) {
		val usuario = devolverUsuario(usr)
		if (usuario === null || !usuario.login.equals(pass))
			throw new UserException("Usuario o contraseña incorrectos.")
	}

}
