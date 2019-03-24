package domain

import java.util.Map
import java.time.DayOfWeek
import java.util.HashMap
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Tiket {
	
	Funcion funcion
	Proyeccion pelicula  // que puede ser pelicula o saga
	Map <DayOfWeek, Integer> precios = new HashMap <DayOfWeek, Integer>
	
	new () {
		precios.put(DayOfWeek.MONDAY, 80)
		precios.put(DayOfWeek.TUESDAY, 80)
		precios.put(DayOfWeek.WEDNESDAY, 50)
		precios.put(DayOfWeek.THURSDAY, 80)
		precios.put(DayOfWeek.FRIDAY, 80)
		precios.put(DayOfWeek.SATURDAY, 80)
		precios.put(DayOfWeek.SUNDAY, 120)
	}
	
	
	def int precioDiaDeLaSemana () {
		precios.get(funcion.dia)
	}

	def int precio () {
		pelicula.precioBase + precioDiaDeLaSemana
	}
	
	
}