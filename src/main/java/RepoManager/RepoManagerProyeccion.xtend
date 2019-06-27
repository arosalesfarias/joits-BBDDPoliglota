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
import domain.Usuario

@Accessors
class RepoManagerProyeccion {

	RepoPeliculas repoProyeccionesNeo4j = RepoPeliculas.instance

	RepoProyecciones repoProyeccionesMorphia = RepoProyecciones.instance

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
	
	def pelisSugeridas(Usuario usuario) {
		(repoProyeccionesNeo4j.getRecomendados(usuario)).take(5).toList
	}

}
