package domain

import exceptions.BusinessException
import java.time.DayOfWeek
import java.time.LocalDateTime
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Entity
import org.uqbar.commons.model.annotations.Observable

@Entity // decidir si esta va en una coleccion nueva o dejarlo asi xq esta embebido
@Accessors
@Observable
class Funcion {

	@Id Object id

	LocalDateTime hora

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
