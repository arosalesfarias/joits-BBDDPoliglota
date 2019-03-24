package domain

import java.time.DayOfWeek
import java.time.LocalDateTime
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Funcion {
	LocalDateTime hora
	DayOfWeek dia
	String sala
}