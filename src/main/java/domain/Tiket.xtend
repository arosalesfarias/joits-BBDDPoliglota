package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Tiket {
	
	Funcion funcion
	Proyeccion pelicula  // que puede ser pelicula o saga
	
	def float precio () {
		pelicula.precioBase + funcion.precioSegunDia
	}
	
	
}