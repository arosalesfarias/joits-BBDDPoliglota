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

}
