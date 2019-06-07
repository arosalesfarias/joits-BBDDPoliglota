package domain

import com.google.gson.annotations.Expose
import exceptions.BusinessException
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Embedded
import org.mongodb.morphia.annotations.Entity
import org.neo4j.ogm.annotation.NodeEntity
import org.neo4j.ogm.annotation.Relationship

@Accessors
@NodeEntity(label="Proyeccion")
@Entity(value="Proyecciones")
class Saga extends Proyeccion {

	@Embedded
	@Expose
	@Relationship(type = "Contiene"/*, direction = "INCOMING*/)
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
