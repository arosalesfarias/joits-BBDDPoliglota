package domain

import exceptions.BusinessException
import javax.persistence.DiscriminatorValue
import javax.persistence.Entity
import org.eclipse.xtend.lib.annotations.Accessors

@Entity
@Accessors
@DiscriminatorValue("1")
class Pelicula extends Proyeccion {

	override precioBase() {
		30
	}

	def validateCreate() {
		if(titulo === null) throw new BusinessException("la pelicula debe tener un titulo")
	}

}
