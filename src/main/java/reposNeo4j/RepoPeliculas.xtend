package reposNeo4j

import domain.Proyeccion
import domain.Usuario
import java.util.HashMap
import java.util.List
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Collections

@Accessors
class RepoPeliculas extends AbstractRepoNeo4J<Proyeccion> {

	static RepoPeliculas instance

	def static RepoPeliculas getInstance() {
		if (instance === null) {
			instance = new RepoPeliculas
		}
		instance
	}

	override Proyeccion searchById(Long id) {
		session.load(typeof(Proyeccion), id, BUSQUEDA_ELEMENTO_RELACIONES)
	}

	override getEntityType() {
		Proyeccion
	}

	def List<Proyeccion> getRecomendados(Usuario usuario) {
		var String consulta = "match (u :Usuario {usuario: '" + usuario.usuario +
			"'}) - [:EsAmigoDe] -> () - [:COMPRO] -> (pelicula:Proyeccion) where not (u :Usuario {usuario: '" +
			usuario.usuario + "'}) - [:COMPRO] -> (pelicula) return pelicula"
//		var Map<String, Object> params = new HashMap()
//		params.put("usuario", usuario)
		val resul = session.query(typeof(Proyeccion), consulta, Collections.EMPTY_MAP)
		return resul.toList
	}

}
