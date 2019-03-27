package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import exceptions.BusinessException

@Accessors
class Saga extends Proyeccion {
	List<Pelicula> peliculas = new ArrayList<Pelicula>
	float nivelClasico

	override precioBase() {
		(peliculas.size * 10) + nivelClasico
	}

	override validateCreate() {
		if(nivelClasico == 0) throw new BusinessException("la saga no tiene nivel de Clasico")
	}

}
