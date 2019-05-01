package repos

import domain.Ticket
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoTickets extends RepoGenerico<Ticket> {

	static RepoTickets repoTikets

	def static RepoTickets getInstance() {
		if (repoTikets === null) {
			repoTikets = new RepoTickets
		}
		repoTikets
	}

	private new() {
	}

	override search(String value) {
	}

	override actualizarDatos(Ticket t, Ticket t2) {
	}

	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Ticket> query, Root<Ticket> camposTiket,
		Ticket ticket) {
		if (ticket.pelicula !== null && ticket.funcion !== null) {
			query.where(criteria.equal(camposTiket.get("id"), ticket.id))
		}
	}

	override generateWhereString(CriteriaBuilder criteria, CriteriaQuery<Ticket> query, Root<Ticket> camposCandidato,
		Ticket t, String str) {
	}

	override getEntityType() {
		Ticket
	}

}