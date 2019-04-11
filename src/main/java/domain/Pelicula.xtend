package domain

import exceptions.BusinessException
import javax.persistence.Entity
import org.eclipse.xtend.lib.annotations.Accessors

@Entity
@Accessors
class Pelicula extends Proyeccion {

	override precioBase() {
		30
	}

	override validateCreate() {
		if(titulo === null) throw new BusinessException("la pelicula debe tener un titulo")
	}

}
