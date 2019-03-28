package domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
abstract class Proyeccion extends Entidad {
	String titulo
	int añoRodaje
	float puntaje
	String genero

	def float precioBase()
	
	override toString(){
		titulo
	}
}
