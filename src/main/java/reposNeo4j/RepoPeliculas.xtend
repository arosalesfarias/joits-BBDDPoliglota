package reposNeo4j

import domain.Proyeccion

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

}
