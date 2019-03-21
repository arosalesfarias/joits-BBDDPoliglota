package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Saga implements Cartelera {
	int puntaje
	int anioRecopilacion
	List<Pelicula> peliculas = new ArrayList<Pelicula>
	
	override precioBase() {
		peliculas.size * 10
	}
	
}