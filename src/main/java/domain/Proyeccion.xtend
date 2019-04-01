package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.List

@Observable
@Accessors
abstract class Proyeccion extends Entidad {
	String titulo
	int añoRodaje
	float puntaje
	String genero
	List<Funcion> funciones

	new() {
		funciones = newArrayList
	}

	def float precioBase()

	override toString() {
		titulo
	}
}
