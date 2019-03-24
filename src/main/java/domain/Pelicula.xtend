package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pelicula extends Proyeccion {
	String titulo
	int anioRodaje
	String genero
	
	override precioBase() {
		30
	}
	
}