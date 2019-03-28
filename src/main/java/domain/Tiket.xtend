package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Tiket {
	
	Funcion funcion
	Proyeccion pelicula  // que puede ser pelicula o saga
	
	def float precio () {
		pelicula.precioBase + funcion.precioSegunDia
	}
	
	
}