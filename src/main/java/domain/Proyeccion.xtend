package domain

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Embedded
import org.mongodb.morphia.annotations.Entity
import org.uqbar.commons.model.annotations.Observable
import org.mongodb.morphia.annotations.Id
import org.bson.types.ObjectId

@Observable
@Accessors
@Entity(value="Proyecciones", noClassnameStored=true)
abstract class Proyeccion {
	
	@Id ObjectId id

	String titulo

	int añoRodaje

	float puntaje

	String genero
	
	@Embedded
	Set<Funcion> funciones

	new() {
		funciones = newHashSet
	}

	def float precioBase()

	override toString() {
		titulo
	}
}
