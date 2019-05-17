package domain

import java.util.Set
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors
import org.mongodb.morphia.annotations.Embedded
import org.mongodb.morphia.annotations.Entity
import org.uqbar.commons.model.annotations.Observable

@Entity(value="Proyeccion")
@Observable
@Accessors
abstract class Proyeccion {

	@Id Object id

	String titulo

	int añoRodaje

	float puntaje

	String genero

	@Embedded
	Set<Funcion> funciones

	new() {
		funciones = newHashSet
	}

	def float precioBase()

	override toString() {
		titulo
	}
}
