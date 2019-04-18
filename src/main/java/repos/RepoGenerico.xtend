package repos

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import domain.Entidad
import javax.persistence.EntityManagerFactory
import javax.persistence.Persistence
import javax.persistence.PersistenceException
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

@Accessors
@TransactionalAndObservable
abstract class RepoGenerico<T extends Entidad> {

	List<T> elementos = newArrayList()

	int proximoId = 0

	abstract def List<T> search(String value)

	def void actualizarDatos(T t, T t2)

	def void update(T objectViejo, T objectNuevo) {
		objectNuevo.validateCreate
		this.actualizarDatos(objectViejo, objectNuevo)
	}

	def void delete(T object) {
		elementos.remove(object)
	}

	def T searchById(int id) {
		elementos.findFirst[elem|elem.id == id]
	}

	def boolean existeId(T object) {
		elementos.exists[elemento|elemento.id == object.id]
	}

	def limpiar() {
		elementos.clear
		proximoId = 0
	}

	def match(Object expectedValue, Object realValue) {
		if (expectedValue === null) {
			return true
		}
		if (realValue === null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}

	// ///////////////////  **********************************************************////////////////////////////////
	static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Joyts")

	abstract def void generateWhere(CriteriaBuilder criteria, CriteriaQuery<T> query, Root<T> camposCandidato, T t)

	abstract def Class<T> getEntityType()

	def getEntityManager() {
		entityManagerFactory.createEntityManager
	}

	def create(T t) {
		val entityManager = this.entityManager
		try {
			entityManager => [
				transaction.begin
				persist(t)
				transaction.commit
			]
		} catch (PersistenceException e) {
			e.printStackTrace
			entityManager.transaction.rollback
			throw new RuntimeException("Ocurrió un error, la operación no puede completarse", e)
		} finally {
			entityManager?.close
		}
	}

	def searchByExample(T t) {
		val entityManager = this.entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val from = query.from(entityType)
			query.select(from)
			generateWhere(criteria, query, from, t)
			entityManager.createQuery(query).resultList
		} finally {
			entityManager?.close
		}
	}

}
