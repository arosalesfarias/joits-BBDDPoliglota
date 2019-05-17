package reposMorphia

import domain.Proyeccion
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoProyecciones extends AbstractRepository<Proyeccion> {

	override getEntityType() {
		Proyeccion
	}

	override searchByExample(Proyeccion proyeccion) {
		ds.createQuery(entityType).field("titulo").contains(proyeccion.titulo ?: "").asList
	}

	override defineUpdateOperations(Proyeccion proyeccion) {
		ds.createUpdateOperations(entityType)
		.set("titulo", proyeccion.titulo)
		.set("añoRodaje", proyeccion.añoRodaje)
		.set("puntaje", proyeccion.puntaje)
		.set("genero", proyeccion.genero)
	}

}
