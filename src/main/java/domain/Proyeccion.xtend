package domain

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Embedded
import org.mongodb.morphia.annotations.Entity
import org.uqbar.commons.model.annotations.Observable
import com.google.gson.annotations.Expose
import org.neo4j.ogm.annotation.NodeEntity
import org.bson.types.ObjectId
import org.neo4j.ogm.annotation.Property
import org.mongodb.morphia.annotations.Id
import org.neo4j.ogm.annotation.Transient

@Observable
@Accessors
@NodeEntity(label="Proyeccion")
@Entity(value="Proyecciones", noClassnameStored=true)
abstract class Proyeccion {

	@org.neo4j.ogm.annotation.Id
	@org.neo4j.ogm.annotation.GeneratedValue
	Long clave

	@Id ObjectId id

	@Expose
	@Property
	String titulo

	int añoRodaje

	float puntaje

	String genero

	@Embedded
	@Transient
	Set<Funcion> funciones

	new() {
		funciones = newHashSet
	}

	def float precioBase()

	override toString() {
		titulo
	}
}
