package RepoManager

import domain.Proyeccion
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import reposMorphia.AbstractRepository
import reposMorphia.RepoProyecciones
import reposNeo4j.AbstractRepoNeo4J
import reposNeo4j.RepoPeliculas

@Accessors
class RepoManagerProyeccion {

	AbstractRepoNeo4J<Proyeccion> repoProyeccionesNeo4j = ApplicationContext.instance.getSingleton(RepoPeliculas)

	AbstractRepository<Proyeccion> repoProyeccionesMorphia = ApplicationContext.instance.getSingleton(RepoProyecciones)

	List<RepoGenerico<Proyeccion>> repositoriosPeliculas = new ArrayList

	static RepoManagerProyeccion repoManagerProyeccion

	def static RepoManagerProyeccion getInstance() {
		if (repoManagerProyeccion === null) {
			repoManagerProyeccion = new RepoManagerProyeccion
			repoManagerProyeccion.inicializar
		}
		repoManagerProyeccion
	}

	def void inicializar() {
		repositoriosPeliculas.addAll(repoProyeccionesNeo4j, repoProyeccionesMorphia)
	}

	def void persistirProyeccion(Proyeccion proyeccion) {
		repositoriosPeliculas.forEach[repo|repo.createIfNotExists(proyeccion)]
	}

}
