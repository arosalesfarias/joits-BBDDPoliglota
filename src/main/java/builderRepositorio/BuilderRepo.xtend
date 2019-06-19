package builderRepositorio

import domain.Proyeccion
import domain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import reposHibernate.RepoUsuarios
import reposMorphia.AbstractRepository
import reposMorphia.RepoProyecciones
import reposNeo4j.AbstractRepoNeo4J
import reposNeo4j.RepoPeliculas
import reposNeo4j.RepositorioUsuarios

@Accessors
class BuilderRepo {

	AbstractRepository<Proyeccion> repoProyecciones = ApplicationContext.instance.getSingleton(typeof(RepoProyecciones))

	AbstractRepoNeo4J<Proyeccion> repoPelis = ApplicationContext.instance.getSingleton(typeof(RepoPeliculas))

	AbstractRepoNeo4J<Usuario> repoClientes = ApplicationContext.instance.getSingleton(typeof(RepositorioUsuarios))

	def void persistirPelicula(Proyeccion proyeccion) {
		repoProyecciones.createIfNotExists(proyeccion)
	}

	def void persistirUsuario(Usuario usuario) {
		RepoUsuarios.instance.createIfNotExists(usuario)
	}

	def void persistirUsuarioNeo4J(Usuario usuario) {
		repoClientes.createIfNotExists(usuario)
	}

	def void persistirProyeccionNeo4J(Proyeccion proyeccion) {
		repoPelis.createIfNotExists(proyeccion)
	}

	def void actualizarUsuario(Usuario usuario) {
		RepoUsuarios.instance.update(usuario)
	}

	def void actualizarUsuarioNeo4J(Usuario usuario) {
		repoClientes.update(usuario)
	}
}
