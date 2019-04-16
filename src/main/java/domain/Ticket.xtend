package domain

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.OneToOne
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Entity
@Accessors
@Observable
class Ticket {
	
	@Id
	@GeneratedValue
	Long id

	@OneToOne
	Funcion funcion
	
	@OneToOne
	Proyeccion pelicula // que puede ser pelicula o saga

	def float precio() {
		pelicula.precioBase + funcion.precioSegunDia
	}
	
	override toString(){
		pelicula.toString
	}

}
