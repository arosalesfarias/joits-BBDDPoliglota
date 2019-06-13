package reposNeo4j

import domain.Proyeccion
import domain.Usuario
import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.neo4j.helpers.collection.MapUtil

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
		session.load(typeof(Proyeccion), proyeccion.clave,BUSQUEDA_ELEMENTO_RELACIONES)
	}
	
	override getEntityType() {
		Proyeccion
	}
	
	def List<Proyeccion> getRecomendados(Usuario usuario){
		var Map <String, Object> params = MapUtil.map("usuario", usuario.usuario)
		val resul = session.query(typeof(Proyeccion), "match (u :Usuario {usuario: 'alezcano'}) - [:EsAmigoDe] -> () - [:COMPRO] -> (pelicula:Proyeccion) where not (u :Usuario {usuario: 'alezcano'}) - [:COMPRO] -> (pelicula) return pelicula.titulo", params)
		return resul.toList
	}

}
