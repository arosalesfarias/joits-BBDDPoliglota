package domain

import java.time.DayOfWeek
import java.time.LocalDateTime
import javax.persistence.Column
import javax.persistence.Entity
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import exceptions.BusinessException

@Entity
@Accessors
@Observable
class Funcion extends Entidad {
//	
//	@Id
//	@GeneratedValue
//	Long id

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
	
	override validateCreate() {
		if (hora === null || sala === null) {
			throw new BusinessException("le falta campo hora o sala")
		}
	}

}
