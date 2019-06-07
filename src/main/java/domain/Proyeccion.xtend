package domain

import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Embedded
import org.mongodb.morphia.annotations.Entity
import org.uqbar.commons.model.annotations.Observable
import com.google.gson.annotations.Expose
import org.neo4j.ogm.annotation.NodeEntity
import org.neo4j.ogm.annotation.GeneratedValue
//import org.neo4j.ogm.annotation.Id
import org.bson.types.ObjectId
import org.neo4j.ogm.annotation.Property
import org.mongodb.morphia.annotations.Id
import org.neo4j.ogm.annotation.Transient

//import org.mongodb.morphia.annotations.Id

@Observable
@Accessors
@NodeEntity
@Entity(value="Proyecciones", noClassnameStored=true)
abstract class Proyeccion {

	
	@Id ObjectId id
	@org.neo4j.ogm.annotation.Id @GeneratedValue Long ide

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
