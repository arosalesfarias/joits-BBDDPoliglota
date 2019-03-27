package domain

import org.eclipse.xtend.lib.annotations.Accessors
import exceptions.BusinessException

@Accessors
class Pelicula extends Proyeccion {
	String genero

	override precioBase() {
		30
	}

	override validateCreate() {
		if(titulo === null) throw new BusinessException("la pelicula debe tener un titulo")
	}

}
