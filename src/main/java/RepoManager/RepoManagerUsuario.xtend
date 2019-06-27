package RepoManager

import domain.Usuario
import java.util.ArrayList
import java.util.List
import org.uqbar.commons.applicationContext.ApplicationContext
import reposHibernate.AbstractRepoHibernate
import reposHibernate.RepoUsuarios
import reposNeo4j.AbstractRepoNeo4J
import reposNeo4j.RepositorioUsuarios

class RepoManagerUsuario {

	AbstractRepoNeo4J<Usuario> repoUsariosNeo4J = ApplicationContext.instance.getSingleton(RepositorioUsuarios)

	AbstractRepoHibernate<Usuario> repoUsuariosHibernate = ApplicationContext.instance.getSingleton(RepoUsuarios)

	List<RepoGenerico<Usuario>> repositoriosUsuarios = new ArrayList

	static RepoManagerUsuario repoManagerUsuario

	def static RepoManagerUsuario getInstance() {
		if (repoManagerUsuario === null) {
			repoManagerUsuario = new RepoManagerUsuario
			repoManagerUsuario.inicializar
		}
		repoManagerUsuario
	}

	def void inicializar() {
		repositoriosUsuarios.addAll(repoUsariosNeo4J, repoUsuariosHibernate)
	}

	def void persistirUsuario(Usuario usuario) {
		repositoriosUsuarios.forEach[repo|repo.createIfNotExists(usuario)]
	}

	def void actualizarUsuario(Usuario usuario) {
		repoUsariosNeo4J.update(usuario)
		val usuaActualizado = repoUsariosNeo4J.searchById(usuario.id)
		repoUsuariosHibernate.update(usuaActualizado)
	}
}
