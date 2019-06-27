package RepoManager

import domain.Usuario
import java.util.ArrayList
import java.util.List
import reposHibernate.RepoUsuarios
import reposNeo4j.AbstractRepoNeo4J
import reposNeo4j.RepositorioUsuarios

class RepoManagerUsuario {

	RepositorioUsuarios repoUsariosNeo4J = RepositorioUsuarios.instance

	RepoUsuarios repoUsuariosHibernate = RepoUsuarios.instance

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
	
	def login(Usuario usuario) {
		repoUsuariosHibernate.coincide(usuario)
	}
	def usuarioLogueado(){
		repoUsuariosHibernate.usuarioLogueado
	}
	
}
