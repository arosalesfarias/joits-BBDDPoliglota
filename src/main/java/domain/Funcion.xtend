package domain

import exceptions.BusinessException
import java.time.DayOfWeek
import java.time.LocalDateTime
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Entity
import org.uqbar.commons.model.annotations.Observable
import org.bson.types.ObjectId
import org.mongodb.morphia.annotations.Id
import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonIgnoreProperties

@Accessors
@Observable
@Entity(value="Funcion", noClassnameStored=true)
@JsonIgnoreProperties(value=#["changeSupport"])
class Funcion {

	new(LocalDateTime _hora, String _sala) {
		hora = _hora
		sala = _sala
	}

	new() {
	}

	@Id ObjectId id

	@JsonIgnore LocalDateTime hora

	String sala

	def boolean esFinDeSemana() { hora.dayOfWeek == DayOfWeek.SUNDAY || hora.dayOfWeek == DayOfWeek.SATURDAY }

	def boolean esMiercoles() { hora.dayOfWeek == DayOfWeek.WEDNESDAY }

	def float precioSegunDia() {
		if (esFinDeSemana) {
			120
		} else if (esMiercoles) {
			50
		} else
			80
	}

	def validateCreate() {
		if (hora === null || sala === null) {
			throw new BusinessException("le falta campo hora o sala")
		}
	}

}
