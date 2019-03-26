package domain

import java.time.LocalDateTime
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Funcion {
	LocalDateTime hora
	String sala

	def boolean esFinDeSemana() { hora.dayOfWeek == 7 }

	def boolean esMiercoles() { hora.dayOfWeek == 3 }

	def float precioSegunDia() {
		if (esFinDeSemana) {
			120
		} else if (esMiercoles) {
			50
		} else
			80
	}

}
