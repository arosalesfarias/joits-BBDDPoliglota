package reposNeo4j

import domain.Usuario

class RepositorioUsuarios extends AbstractRepoNeo4J<Usuario> {

	static RepositorioUsuarios instance

	def static RepositorioUsuarios getInstance() {
		if (instance === null) {
			instance = new RepositorioUsuarios
		}
		instance
	}

	override Usuario getById(Usuario usuario) {
		session.load(typeof(Usuario), usuario.clave, BUSQUEDA_ELEMENTO_RELACIONES)
	}

	override getEntityType() {
		Usuario
	}
}
