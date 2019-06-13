package builderRepositorio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import reposMorphia.RepoProyecciones
import reposNeo4j.RepoPeliculas
import reposNeo4j.RepositorioUsuarios
import reposMorphia.AbstractRepository
import domain.Proyeccion
import domain.Usuario
import reposNeo4j.AbstractRepoNeo4J
import reposHibernate.RepoUsuarios

@Accessors
class BuilderRepo {

	AbstractRepository<Proyeccion> repoProyecciones = ApplicationContext.instance.getSingleton(typeof(RepoProyecciones))

	AbstractRepoNeo4J<Proyeccion> repoPelis = ApplicationContext.instance.getSingleton(typeof(RepoPeliculas))

	AbstractRepoNeo4J<Usuario> repoClientes = ApplicationContext.instance.getSingleton(typeof(RepositorioUsuarios))
	
	def void inicializar() {
		ApplicationContext.instance.configureSingleton(typeof(RepoProyecciones), new RepoProyecciones)
		ApplicationContext.instance.configureSingleton(typeof(RepoPeliculas), new RepoPeliculas)
		ApplicationContext.instance.configureSingleton(typeof(RepositorioUsuarios), new RepositorioUsuarios)
	}


	def void persistirPeliculas(Proyeccion proyeccion) {
		repoProyecciones.createIfNotExists(proyeccion)
	}

	def void persistirUsuarioNeo4J(Usuario usuario) {
		repoClientes.crear(usuario)
	}

	def void persistirProyeccionNeo4J(Proyeccion proyeccion) {
		repoPelis.crear(proyeccion)
	}
	
	def void persistirUsuario(Usuario usuario) {
		val repoUsuarios = RepoUsuarios.instance
		val listaUsuarios = repoUsuarios.searchByExample(usuario)
		if (listaUsuarios.isEmpty) {
			repoUsuarios.create(usuario)
			println("Usuario " + usuario.usuario + " creado")
		} else {
			val usuarioBD = listaUsuarios.head
			usuario.id = usuarioBD.id
			repoUsuarios.update(usuario)
		}
	}
}
