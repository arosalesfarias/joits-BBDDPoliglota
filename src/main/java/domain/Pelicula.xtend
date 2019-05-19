package domain

import exceptions.BusinessException
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Entity

@Accessors
class Pelicula extends Proyeccion {

	override precioBase() {
		30
	}

	def validateCreate() {
		if(titulo === null) throw new BusinessException("la pelicula debe tener un titulo")
	}

}
