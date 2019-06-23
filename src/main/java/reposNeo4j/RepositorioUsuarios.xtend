package reposNeo4j

import domain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.Map
import java.util.HashMap

@Accessors
class RepositorioUsuarios extends AbstractRepoNeo4J<Usuario> {

static RepositorioUsuarios instance

def static RepositorioUsuarios getInstance() {
	if (instance === null) {
		instance = new RepositorioUsuarios
	}
	instance
}

override Usuario getById(Usuario usuario) {
	session.load(typeof(Usuario), usuario.id, BUSQUEDA_ELEMENTO_RELACIONES)
}

def List<Usuario> getRecomendados(Usuario usuario) {
		var String consulta = "match (u :Usuario {usuario: '"+usuario.usuario+"'}) - [:COMPRO] -> () <- [:COMPRO] - (otro :Usuario) where not ((u :Usuario {usuario: '"+usuario.usuario+"'}) - [:EsAmigoDe] -> (otro)) and (otro.nombre <> u.nombre) return distinct otro"
		var Map<String, Object> params = new HashMap()
		params.put("usuario", usuario)
		val resul = session.query(typeof(Usuario), consulta, params)
		return resul.toList
	}

	override getEntityType() {
		Usuario
	}
}
