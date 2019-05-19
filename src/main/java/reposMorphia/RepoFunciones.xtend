package reposMorphia

import org.eclipse.xtend.lib.annotations.Accessors
import domain.Funcion

@Accessors
class RepoFunciones extends AbstractRepository<Funcion> {

	override getEntityType() {
		typeof(Funcion)
	}

	override searchByExample(Funcion funcion) {
		ds.createQuery(entityType).field("sala").equal(funcion.sala).asList
	}

	override defineUpdateOperations(Funcion funcion) {
		ds.createUpdateOperations(entityType).set("hora", funcion.hora).set("sala", funcion.sala)
	}

}
