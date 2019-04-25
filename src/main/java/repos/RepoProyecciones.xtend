package repos

import domain.Proyeccion
import java.util.List
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoProyecciones extends RepoGenerico<Proyeccion> {

	static RepoProyecciones repoProyecciones

	def static RepoProyecciones getInstance() {
		if (repoProyecciones === null) {
			repoProyecciones = new RepoProyecciones
		}
		repoProyecciones
	}

	private new() {
	}

	override actualizarDatos(Proyeccion viejo, Proyeccion nuevo) {
		viejo => [
			viejo.titulo = nuevo.titulo
			viejo.añoRodaje = nuevo.añoRodaje
		]
	}

// /////////////////////////////*************************************************/////////////////////////////////
	override List<Proyeccion> search(String buscar) {
		elementos.filter[proyeccion|this.match(buscar, proyeccion.titulo)].toList
	}

	override getEntityType() {
		Proyeccion
	}

	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Proyeccion> query, Root<Proyeccion> camposProyeccion,
		Proyeccion proyeccion) {
		if (proyeccion.titulo !== null) {
			query.where(criteria.like(camposProyeccion.get("titulo"), stringBusqueda(proyeccion.titulo)))
		}
	}

	override generateWhereString(CriteriaBuilder criteria, CriteriaQuery<Proyeccion> query,
		Root<Proyeccion> camposProyeccion, Proyeccion proy, String str) {}

	def Proyeccion searchByIdPelicula(Long id) {
		val entityManager = entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val camposProyeccion = query.from(entityType)
			camposProyeccion.fetch("funciones")
			query.select(camposProyeccion)
			query.where(criteria.equal(camposProyeccion.get("id"), id))
			entityManager.createQuery(query).singleResult
		} finally {
			entityManager.close
		}
	}

	def searchByIdSaga(Long id) {
		val entityManager = entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val camposSaga = query.from(entityType)
			camposSaga.fetch("funciones")
			camposSaga.fetch("peliculas")
			query.select(camposSaga)
			query.where(criteria.equal(camposSaga.get("id"), id))
			entityManager.createQuery(query).singleResult
		} finally {
			entityManager?.close
		}
	}

}
