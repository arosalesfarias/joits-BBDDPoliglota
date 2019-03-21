package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pelicula implements Cartelera {
	String titulo
	int anioRodaje
	float puntaje
	String genero
	
	override precioBase() {
		30
	}
	
}