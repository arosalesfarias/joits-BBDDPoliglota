package repos

import domain.Proyeccion
import java.util.List
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Saga
import domain.Pelicula

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

	def Proyeccion searchById(Proyeccion proy) {
		searchByProyeccion(proy)
	}

	def dispatch Saga searchByProyeccion(Saga saga) {
		val entityManager = entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(typeof(Saga))
			val camposProyeccion = query.from(typeof(Saga))
			camposProyeccion.fetch("funciones")
			camposProyeccion.fetch("peliculas")
			query.select(camposProyeccion)
			query.where(criteria.equal(camposProyeccion.get("id"), saga.id))
			entityManager.createQuery(query).singleResult
		} finally {
			entityManager.close
		}
	}

	def dispatch Pelicula searchByProyeccion(Pelicula peli) {
		val entityManager = entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(typeof(Pelicula))
			val camposProyeccion = query.from(typeof(Pelicula))
			camposProyeccion.fetch("funciones")
			query.select(camposProyeccion)
			query.where(criteria.equal(camposProyeccion.get("id"), peli.id))
			entityManager.createQuery(query).singleResult
		} finally {
			entityManager.close
		}
	}

}
