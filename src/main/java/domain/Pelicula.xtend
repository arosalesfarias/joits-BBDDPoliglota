package domain

import exceptions.BusinessException
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Entity
import org.neo4j.ogm.annotation.NodeEntity

@Accessors
@NodeEntity(label="Proyeccion")
@Entity(value="Proyecciones")
class Pelicula extends Proyeccion {

	override precioBase() {
		30
	}

	def validateCreate() {
		if(titulo === null) throw new BusinessException("la pelicula debe tener un titulo")
	}

}
