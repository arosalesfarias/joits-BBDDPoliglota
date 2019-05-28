package domain

import exceptions.BusinessException
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.Transient
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import javax.persistence.Column
import javax.persistence.Converter

@Entity
@Accessors
@Observable
@JsonIgnoreProperties(value=#["changeSupport"])
class Ticket {

	new(Funcion _funcion, Proyeccion _peli) {
		funcion = _funcion
		pelicula = _peli
		nombrePeli = pelicula.titulo
	}

	new() {
	}

	@Id
	@GeneratedValue
	Long id

	@Transient
	Funcion funcion

	// @Converter(converter=PeliculaConverter implements AtributeConverter<¨Pelicula,String>)
	@Transient
	Proyeccion pelicula // que puede ser pelicula o saga
	@Column
	String nombrePeli

	def float precio() {
		pelicula.precioBase + funcion.precioSegunDia
	}

	override toString() {
		nombrePeli
	}

	def validateCreate() {
		if (funcion === null || pelicula === null) {
			throw new BusinessException("le falta campo pelicula o funcion")
		}
	}

	override equals(Object obj) {
		try {
			val other = obj as Ticket
			id == other?.id
		} catch (ClassCastException e) {
			return false
		}
	}

	override hashCode() {
		if(id !== null) id.hashCode else super.hashCode
	}

}
