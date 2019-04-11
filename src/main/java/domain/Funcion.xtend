package domain

import java.time.LocalDateTime
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.time.DayOfWeek
import javax.persistence.Entity
import javax.persistence.Column

@Entity
@Accessors
@Observable
class Funcion {

	@Column
	LocalDateTime hora

	@Column(length=10)
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

}
