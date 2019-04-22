package repos

import domain.Funcion
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepoFunciones extends RepoGenerico<Funcion> {

	static RepoFunciones repoFunciones

	def static RepoFunciones getInstance() {
		if (repoFunciones === null) {
			repoFunciones = new RepoFunciones
		}
		repoFunciones
	}

	private new() {
	}

	override search(String value) {
	}

	override actualizarDatos(Funcion funcionVieja, Funcion funcionNueva) {
		funcionVieja => [
			funcionVieja.hora = funcionNueva.hora
			funcionVieja.sala = funcionNueva.sala
		]
	}

	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Funcion> query, Root<Funcion> camposFuncion,
		Funcion funcion) {
		if (funcion.hora !== null || funcion.sala !== null) {
			query.where(
				criteria.equal(camposFuncion.get("hora"), funcion.hora),
				criteria.and(criteria.equal(camposFuncion.get("sala"), funcion.sala))
			)
		}
	}

	override generateWhereString(CriteriaBuilder criteria, CriteriaQuery<Funcion> query, Root<Funcion> camposFuncion,
		Funcion funcion, String str) {
	}

	override getEntityType() {
		Funcion
	}

}
