package domain

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.Inheritance
import javax.persistence.InheritanceType
import org.eclipse.xtend.lib.annotations.Accessors

@Entity
@Accessors
@Inheritance(strategy=InheritanceType.TABLE_PER_CLASS)
abstract class Entidad {

	@Id
	@GeneratedValue
	Long id

	def Boolean validateCreate()
}
