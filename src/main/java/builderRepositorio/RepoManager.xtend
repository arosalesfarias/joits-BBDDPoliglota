package builderRepositorio

import domain.Proyeccion
import domain.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import reposNeo4j.RepositorioUsuarios
import reposHibernate.RepoUsuarios
import reposNeo4j.RepoPeliculas
import reposMorphia.RepoProyecciones
import reposHibernate.AbstractRepoHibernate
import org.uqbar.commons.applicationContext.ApplicationContext
import reposNeo4j.AbstractRepoNeo4J
import reposMorphia.AbstractRepository

@Accessors
class RepoManager {

	AbstractRepoNeo4J<Usuario> repoUsariosNeo4J = ApplicationContext.instance.getSingleton(RepositorioUsuarios)

	AbstractRepoHibernate<Usuario> repoUsuariosHibernate = ApplicationContext.instance.getSingleton(RepoUsuarios)

	AbstractRepoNeo4J<Proyeccion> repoProyeccionesNeo4j = ApplicationContext.instance.getSingleton(RepoPeliculas)

	AbstractRepository<Proyeccion> repoProyeccionesMorphia = ApplicationContext.instance.getSingleton(RepoProyecciones)

	List<RepoGenerico<Proyeccion>> repositoriosPeliculas = new ArrayList

	List<RepoGenerico<Usuario>> repositoriosUsuarios = new ArrayList

	static RepoManager repoManager

	def static RepoManager getInstance() {
		if (repoManager === null) {
			repoManager = new RepoManager
			repoManager.inicializar
		}
		repoManager
	}

	def void inicializar() {
		repositoriosUsuarios.addAll(repoUsariosNeo4J) // agregar el repo de usuarios de hibernate una vez solucionado el error
		repositoriosPeliculas.addAll(repoProyeccionesNeo4j, repoProyeccionesMorphia)
	}

	def void persistirUsuario(Usuario usuario) {
		repositoriosUsuarios.forEach[repo|repo.createIfNotExists(usuario)]
	}

	def void persistirProyeccion(Proyeccion proyeccion) {
		repositoriosPeliculas.forEach[repo|repo.createIfNotExists(proyeccion)]
	}

	def void actualizarUsuario(Usuario usuario) {
		repositoriosUsuarios.forEach[repo|repo.update(usuario)]
	}

}
