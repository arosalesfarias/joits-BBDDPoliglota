package reposMorphia

import com.mongodb.MongoClient
import domain.Pelicula
import domain.Proyeccion
import domain.Saga
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.Datastore
import org.mongodb.morphia.Morphia
import org.mongodb.morphia.query.UpdateOperations
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
abstract class AbstractRepository<T> {

	static protected Datastore ds
	static Morphia morphia

	List<T> elementos = newArrayList()

	int proximoId = 0

	new() {
		if (ds === null) {
			val mongo = new MongoClient("localhost", 27017)
			morphia = new Morphia => [
				map(Proyeccion).map(Pelicula).map(Saga)
				ds = createDatastore(mongo, "test") // preguntar como cambiar si quiero usar otro que no sea test
				ds.ensureIndexes
			]
		}
	}

	def List<T> allInstances() {
		ds.createQuery(this.getEntityType()).asList
	}

	def List<T> searchByExample(T t)

	def T create(T t) {
		ds.save(t)
		t
	}

	// esto nose si lo usamos
	def T createIfNotExists(T t) {
		val entidadAModificar = getByExample(t)
		if (entidadAModificar !== null) {
			return entidadAModificar
		}
		create(t)
	}

	def void update(T t) {
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

	def void delete(T t) {
		ds.delete(t)
	}

	abstract def Class<T> getEntityType()

}
