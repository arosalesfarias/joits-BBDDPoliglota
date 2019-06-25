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

@Accessors
class RepoManager {

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
		repositoriosUsuarios.addAll(RepositorioUsuarios.instance, RepoUsuarios.instance)
		repositoriosPeliculas.addAll(RepoPeliculas.instance, RepoProyecciones.instance)
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
