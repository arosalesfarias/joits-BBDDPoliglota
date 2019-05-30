package domain

import exceptions.BusinessException
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Entity
import org.mongodb.morphia.annotations.Embedded
import com.google.gson.annotations.Expose

@Accessors
@Entity(value="Proyecciones")
class Saga extends Proyeccion {

	@Embedded
	@Expose
	List<Pelicula> peliculas = new ArrayList<Pelicula>

	@Expose
	float nivelClasico

	override precioBase() {
		(peliculas.size * 10) + nivelClasico
	}

	def validateCreate() {
		if(nivelClasico == 0) throw new BusinessException("la saga no tiene nivel de Clasico")
	}

}
