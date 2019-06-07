package domain

import exceptions.BusinessException
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.Transient
import com.google.gson.annotations.Expose
import javax.persistence.Convert
import org.neo4j.ogm.annotation.RelationshipEntity
import org.neo4j.ogm.annotation.Relationship

@Entity
@RelationshipEntity(type="Tiene")
@Accessors
@Observable
class Ticket {

	new(Funcion _funcion, Proyeccion _peli) {
		funcion = _funcion
		pelicula = _peli
	}

	new() {
	}

	@Id
	@GeneratedValue
	Long id

	@org.neo4j.ogm.annotation.Id 
	@org.neo4j.ogm.annotation.GeneratedValue Long ide

	@Transient
	@Expose
	@org.neo4j.ogm.annotation.Transient
	Funcion funcion

	@Expose
	@Convert(converter=ProyeccionConverter)
//	@Relationship(type= "Pertenece", direction = "INCOMING")
	Proyeccion pelicula // que puede ser pelicula o saga

	def float precio() {
		pelicula.precioBase + funcion.precioSegunDia
	}

	override toString() {
		pelicula.titulo
	}

	def validateCreate() {
		if (funcion === null || pelicula === null) {
			throw new BusinessException("le falta campo pelicula o funcion")
		}
	}

}
