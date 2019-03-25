package repos

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Usuario

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
		/*elementos.filter [ usuario |
			usuario.nombre == usuario.nombre.indexOf(buscar) || usuario.apellido == usuario.apellido.indexOf(buscar) ||
				usuario.nombreDeUsuario.equals(buscar)
		].toList*/
	}

	def void loadUser(Usuario usuario) {
		/*if (elementos.map(elem|elem.apellido + elem.nombre).contains(usuario.apellido + usuario.nombre)) {
			var Usuario usuarioViejo = elementos.filter [ elem |
				(elem.apellido == usuario.apellido && elem.nombre == usuario.nombre)
			].get(0)
			update(usuarioViejo, usuario) // si existe el nombre de la persona
		} else {
			create(usuario) // si no existe el nombre de la persona
		}*/
	}

	override void actualizarDatos(Usuario usuarioViejo, Usuario usuarioNuevo) {
		/*usuarioViejo => [
			usuarioViejo.nombreDeUsuario = usuarioNuevo.nombreDeUsuario
			usuarioViejo.nombre = usuarioNuevo.nombre
			usuarioViejo.apellido = usuarioNuevo.apellido
			usuarioViejo.fechaDeNacimiento = usuarioNuevo.fechaDeNacimiento
			usuarioViejo.email = usuarioNuevo.email
			usuarioViejo.direccion = usuarioNuevo.direccion
		]*/
	}

}
