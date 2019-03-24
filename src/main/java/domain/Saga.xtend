package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Saga extends Proyeccion {
	int anioRecopilacion
	List<Pelicula> peliculas = new ArrayList<Pelicula>
	int nivelClasico
	
	override precioBase() {
		(peliculas.size * 10) + nivelClasico
	}
	
}