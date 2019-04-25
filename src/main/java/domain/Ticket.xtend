package domain

import javax.persistence.Entity
import javax.persistence.OneToOne
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import exceptions.BusinessException

@Entity
@Accessors
@Observable
class Ticket extends Entidad {

	@OneToOne
	Funcion funcion

	@OneToOne
	Proyeccion pelicula // que puede ser pelicula o saga

	def float precio() {
		pelicula.precioBase + funcion.precioSegunDia
	}

	override toString() {
		pelicula.toString
	}

	override validateCreate() {
		if (funcion === null || pelicula === null) {
			throw new BusinessException("le falta campo pelicula o funcion")
		}
	}

}
