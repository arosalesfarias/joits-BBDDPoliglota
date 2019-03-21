package repos

//import ar.edu.eventos.exceptions.Validar
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.Entity

@Accessors
@TransactionalAndObservable
abstract class RepoGenerico<T extends Entity> {
	
	List<T> elementos = newArrayList()
	
	int proximoId = 0

	abstract def List<T> search(String value)

	abstract def void actualizarDatos(T t, T t2)

	def void update(T objectViejo,T objectNuevo) {
		objectNuevo.validateCreate
		this.actualizarDatos(objectViejo, objectNuevo)
	}

	def void create(T object) {
		object.validateCreate
		elementos.add(object)
		proximoId++
		object.setId(proximoId)
	}

	def void delete(T object) {
		elementos.remove(object)
	}

	def T searchById(int id) {
		elementos.findFirst[elem|elem.id == id]
	}

	def boolean existeElid(T object) {
		elementos.exists[elemento|elemento.id == object.id]
	}
}

