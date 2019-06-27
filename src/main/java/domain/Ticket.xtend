package domain

import com.google.gson.annotations.Expose
import exceptions.BusinessException
import javax.persistence.Convert
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.Transient
import org.eclipse.xtend.lib.annotations.Accessors
import org.neo4j.ogm.annotation.EndNode
import org.neo4j.ogm.annotation.RelationshipEntity
import org.neo4j.ogm.annotation.StartNode
import org.neo4j.ogm.annotation.GeneratedValue
import org.uqbar.commons.model.annotations.Observable

@Entity
@Accessors
@Observable
@RelationshipEntity(type="COMPRO")
class Ticket {

	new(Funcion _funcion, Proyeccion _peli) {
		funcion = _funcion
		pelicula = _peli
	}

	new() {
	}

	@Id
	@org.neo4j.ogm.annotation.Id
	@GeneratedValue // esto es de neo4J
	Long id

	@Transient
	@StartNode
	Usuario usuario

	@Transient
	@Expose
	@org.neo4j.ogm.annotation.Transient
	Funcion funcion

	@Expose
	@Convert(converter=ProyeccionConverter)
	@EndNode
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
