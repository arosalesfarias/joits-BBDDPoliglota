package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.Entity
import javax.persistence.Column

@Entity
@Accessors
@Observable
class Ticket {

	@Column
	Funcion funcion
	
	@Column
	Proyeccion pelicula // que puede ser pelicula o saga

	def float precio() {
		pelicula.precioBase + funcion.precioSegunDia
	}
	
	override toString(){
		pelicula.toString
	}

}
