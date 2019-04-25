package repos

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Usuario
import org.uqbar.commons.model.exceptions.UserException
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

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
		print(usuario.amigos)
		searchByString(usuario, buscar).filter[persona|!usuario.amigos.exists[amigo|amigo.id === persona.id]].toList
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

	def devolverUsuario(Usuario usu) {
		repoUsuarios.searchByExample(usu).head
	}

	def coincide(Usuario usu) {
		val usuario = devolverUsuario(usu)
		if (usuario === null || !usuario.login.equals(usu.login))
			throw new UserException("Usuario o contraseña incorrectos.")
	}

	override getEntityType() {
		Usuario
	}

	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Usuario> query, Root<Usuario> camposUsuario,
		Usuario usuario) {
		if (usuario.nombre !== null) {
			query.where(criteria.equal(camposUsuario.get("nombre"), usuario.nombre))
		}
		if (usuario.usuario !== null) {
			query.where(criteria.equal(camposUsuario.get("usuario"), usuario.usuario))
		}
	}

	override generateWhereString(CriteriaBuilder criteria, CriteriaQuery<Usuario> query, Root<Usuario> camposUsuario,
		Usuario usuario, String str) { // TODO: Mejorar codigo
		if (usuario !== null && str !== null) {
			query.where(
				// criteria.isNotMember(usuario, camposUsuario.get("amigos")),
				criteria.notEqual(camposUsuario.get("id"), usuario.id),
				criteria.or(
					criteria.like(camposUsuario.get("nombre"), stringBusqueda(str)),
					criteria.like(camposUsuario.get("apellido"), stringBusqueda(str)),
					criteria.like(camposUsuario.get("usuario"), stringBusqueda(str))
				)
			)
		} else {
			query.where(
				// criteria.isNotMember(usuario, camposUsuario.get("amigos")),
				criteria.notEqual(camposUsuario.get("id"), usuario.id)
			)
		}
	}

}
