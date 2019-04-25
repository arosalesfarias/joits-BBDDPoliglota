package domain

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.ManyToMany
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.Set

@Entity
@Observable
@Accessors
abstract class Proyeccion extends Entidad {

	@Column(length=50)
	String titulo

	@Column
	int añoRodaje

	@Column
	float puntaje

	@Column(length=50)
	String genero

	@ManyToMany(fetch=FetchType.LAZY)
	Set<Funcion> funciones

	new() {
		funciones = newHashSet
	}

	def float precioBase()

	override toString() {
		titulo
	}
}
