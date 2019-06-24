package reposMorphia

import builderRepositorio.RepoGenerico
import com.mongodb.MongoClient
import domain.Funcion
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.Datastore
import org.mongodb.morphia.Morphia
import org.mongodb.morphia.query.UpdateOperations

@Accessors
abstract class AbstractRepository<T> implements RepoGenerico<T> {

	static protected Datastore ds

	new() {
		if (ds === null) {
			val mongo = new MongoClient("localhost", 27017)
			new Morphia => [
				map(typeof(Funcion))
				ds = createDatastore(mongo, "Joyts") // preguntar como cambiar si quiero usar otro que no sea test
				ds.ensureIndexes
			]
			println("Conectado a MongoDB. Bases: " + ds.getDB.collectionNames)
		}
	}

	def List<T> allInstances() {
		ds.createQuery(this.getEntityType()).asList
	}

	abstract def List<T> searchByExample(T t)

	def T create(T t) {
		ds.save(t)
		t
	}

	// esto nose si lo usamos
	override createIfNotExists(T t) {
		val entidadAModificar = getByExample(t)
		if (entidadAModificar !== null) {
			return entidadAModificar
		}
		create(t)
	}

	override update(T t) {
		ds.update(t, this.defineUpdateOperations(t))
	}

	abstract def UpdateOperations<T> defineUpdateOperations(T t)

	def T getByExample(T valor) {
		val result = searchByExample(valor)
		if (result.isEmpty) {
			return null
		} else {
			return result.get(0)
		}
	}

	override delete(T t) {
		ds.delete(t)
	}

	abstract def Class<T> getEntityType()

	abstract def T searchById(T t)

}
