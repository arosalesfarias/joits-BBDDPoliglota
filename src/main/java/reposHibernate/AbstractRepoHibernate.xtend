package reposHibernate

import RepoManager.RepoGenerico
import java.util.List
import javax.persistence.EntityManagerFactory
import javax.persistence.Persistence
import javax.persistence.PersistenceException
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
abstract class AbstractRepoHibernate<T> implements RepoGenerico<T> {

	List<T> elementos = newArrayList()

	int proximoId = 0

	abstract def List<T> search(String value)

	def void actualizarDatos(T t, T t2)

	def match(Object expectedValue, Object realValue) {
		if (expectedValue === null) {
			return true
		}
		if (realValue === null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}

	def limpiar() {
		elementos.clear
		proximoId = 0
	}

	// ///////////////////  **********************************************************////////////////////////////////
	static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Joyts")

	abstract def void generateWhere(CriteriaBuilder criteria, CriteriaQuery<T> query, Root<T> camposEntidad, T t)

	abstract def void generateWhereString(CriteriaBuilder criteria, CriteriaQuery<T> query, Root<T> camposCandidato,
		T t, String str)

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

	def searchByString(T t, String str) {
		val entityManager = this.entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val from = query.from(entityType)
			query.select(from)
			generateWhereString(criteria, query, from, t, str)
			entityManager.createQuery(query).resultList
		} finally {
			entityManager?.close
		}
	}

	def List<T> allInstances() {
		val entityManager = this.entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val from = query.from(entityType)
			query.select(from)
			val result = entityManager.createQuery(query).resultList
			result
		} finally {
			entityManager?.close
		}
	}

	def List<T> allTopInstances(int num) {
		val entityManager = this.entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val from = query.from(entityType)
			query.select(from)
			val result = entityManager.createQuery(query).setMaxResults(num).resultList
			result
		} finally {
			entityManager?.close
		}
	}

	override update(T t) {
		val entityManager = this.entityManager
		try {
			entityManager => [
				transaction.begin
				merge(t)
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

	def List<T> listaSugeridos(int n) {
		allTopInstances(n) // TODO: que el query me traiga los tres y no tener que filtrar trayendo todos
	}

	def String stringBusqueda(String str) {
		"%" + str + "%"
	}

	override delete(T t) {}
}
