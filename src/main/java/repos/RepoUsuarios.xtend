package repos

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Usuario
import org.uqbar.commons.model.exceptions.UserException
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import javax.persistence.criteria.Predicate

@Accessors
class RepoUsuarios extends RepoGenerico<Usuario> {

	Usuario usuarioLogueado

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
		searchByString(usuario, buscar)
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
		usuarioLogueado = devolverUsuario(usu)
		if (usuarioLogueado === null || !usuarioLogueado.login.equals(usu.login))
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
		Usuario usuario, String str) {
		val idAmigos = usuario.amigos.map[x|x.id].toList
		val List<Predicate> condiciones = newArrayList(criteria.not(camposUsuario.in(idAmigos)),
			criteria.notEqual(camposUsuario.get("id"), usuario.id))
		println(idAmigos)
		if (str !== null) {
			condiciones.addAll(
				criteria.or(
					criteria.like(camposUsuario.get("nombre"), stringBusqueda(str)),
					criteria.like(camposUsuario.get("apellido"), stringBusqueda(str)),
					criteria.like(camposUsuario.get("usuario"), stringBusqueda(str))
				)
			)
		}
		if(usuario !== null) query.where(condiciones)
	}

	def Usuario searchById(Long id) {
		val entityManager = entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val camposUsuario = query.from(entityType)
			camposUsuario.fetch("amigos")
			camposUsuario.fetch("tickets")
			query.select(camposUsuario)
			query.where(criteria.equal(camposUsuario.get("id"), id))
			entityManager.createQuery(query).singleResult
		} finally {
			entityManager.close
		}
	}
}
