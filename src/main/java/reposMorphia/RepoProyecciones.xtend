package reposMorphia

import domain.Proyeccion
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoProyecciones extends AbstractRepository<Proyeccion> {

	static RepoProyecciones repoProyecciones

	def static RepoProyecciones getInstance() {
		if (repoProyecciones === null) {
			repoProyecciones = new RepoProyecciones
		}
		repoProyecciones
	}

	override getEntityType() {
		Proyeccion
	}

	override searchByExample(Proyeccion proyeccion) {
		ds.createQuery(entityType).field("titulo").containsIgnoreCase(proyeccion.titulo ?: "").asList
	}

	override defineUpdateOperations(Proyeccion proyeccion) {
		ds.createUpdateOperations(entityType).set("titulo", proyeccion.titulo).set("añoRodaje", proyeccion.añoRodaje).
			set("puntaje", proyeccion.puntaje).set("genero", proyeccion.genero)
	}

	override Proyeccion searchById(Proyeccion proyeccion) {
		ds.get(entityType, proyeccion.id)
	}

}
