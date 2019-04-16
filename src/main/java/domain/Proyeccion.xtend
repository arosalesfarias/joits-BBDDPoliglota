package domain

import java.util.List
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.OneToMany
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

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

	@OneToMany(fetch=FetchType.LAZY)
	List<Funcion> funciones

	new() {
		funciones = newArrayList
	}

	def float precioBase()

	override toString() {
		titulo
	}
}
