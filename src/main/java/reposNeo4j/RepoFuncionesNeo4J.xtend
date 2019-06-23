package reposNeo4j

import domain.Funcion
import domain.Proyeccion
import java.util.Map
import java.util.HashMap

class RepoFuncionesNeo4J extends AbstractRepoNeo4J<Funcion> {

	override getEntityType() {
		Funcion
	}

	override getById(Funcion t) {
	}

	def getFunciones(Proyeccion proyeccion) {
		var String consulta = "match (p: Proyeccion {titulo: '" + proyeccion.titulo + "'}) -[] -> (f:Funcion) return f;"
		var Map<String, Object> params = new HashMap()
		params.put("titulo", proyeccion)
		val resul = session.query(typeof(Proyeccion), consulta, params)
		return resul.toList
	}

}
