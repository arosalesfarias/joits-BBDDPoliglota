package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Proyeccion {
	
	float puntaje
	
	def int precioBase ()
}