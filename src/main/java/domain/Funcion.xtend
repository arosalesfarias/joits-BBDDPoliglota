package domain

import com.google.gson.annotations.Expose
import exceptions.BusinessException
import java.time.DayOfWeek
import java.time.LocalDateTime
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Entity
import org.mongodb.morphia.annotations.Id
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
@Entity(value="Funcion", noClassnameStored=true)
class Funcion {

	new(LocalDateTime _hora, String _sala) {
		hora = _hora
		sala = _sala
	}

	new() {
	}

	@Id
	Long id

	@Expose
	LocalDateTime hora

	@Expose
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
