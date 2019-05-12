package domain

import java.util.Set
import javax.persistence.Column
import javax.persistence.DiscriminatorColumn
import javax.persistence.DiscriminatorType
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Inheritance
import javax.persistence.InheritanceType
import javax.persistence.OneToMany
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.CascadeType

@Entity
@Observable
@Accessors
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="tipoProyeccion", discriminatorType=DiscriminatorType.INTEGER)
abstract class Proyeccion {

	@Id
	@GeneratedValue
	Long id

	@Column(length=50)
	String titulo

	@Column
	int añoRodaje

	@Column
	float puntaje

	@Column(length=50)
	String genero

	@OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	Set<Funcion> funciones

	new() {
		funciones = newHashSet
	}

	def float precioBase()

	override toString() {
		titulo
	}
}
