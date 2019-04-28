package domain

import exceptions.BusinessException
import java.util.ArrayList
import java.util.List
import javax.persistence.Column
import javax.persistence.DiscriminatorValue
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.OneToMany
import org.eclipse.xtend.lib.annotations.Accessors

@Entity
@Accessors
@DiscriminatorValue("2")
class Saga extends Proyeccion {

	@OneToMany(fetch=FetchType.LAZY)
	List<Pelicula> peliculas = new ArrayList<Pelicula>

	@Column(length=50)
	float nivelClasico

	override precioBase() {
		(peliculas.size * 10) + nivelClasico
	}

	def validateCreate() {
		if(nivelClasico == 0) throw new BusinessException("la saga no tiene nivel de Clasico")
	}

}
