package reposNeo4j

import domain.Proyeccion
import domain.Usuario
import java.util.HashMap
import java.util.List
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoPeliculas extends AbstractRepoNeo4J<Proyeccion> {

	static RepoPeliculas instance

	def static RepoPeliculas getInstance() {
		if (instance === null) {
			instance = new RepoPeliculas
		}
		instance
	}

	override Proyeccion getById(Proyeccion proyeccion) {
		session.load(typeof(Proyeccion), proyeccion.clave, BUSQUEDA_ELEMENTO_RELACIONES)
	}

	override getEntityType() {
		Proyeccion
	}

	def List<Proyeccion> getRecomendados(Usuario usuario) {
		var String consulta = "match (u :Usuario {usuario: '" + usuario.usuario +
			"'}) - [:EsAmigoDe] -> () - [:COMPRO] -> (pelicula:Proyeccion) where not (u :Usuario {usuario: '" +
			usuario.usuario + "'}) - [:COMPRO] -> (pelicula) return pelicula"
		var Map<String, Object> params = new HashMap()
		params.put("usuario", usuario.usuario)
		val resul = session.query(typeof(Proyeccion), consulta, params)
		return resul.toList
	}

}
