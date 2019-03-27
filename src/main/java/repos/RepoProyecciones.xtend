package repos

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Proyeccion

@Accessors
class RepoProyecciones extends RepoGenerico<Proyeccion> {

	static RepoProyecciones repoProyecciones

	def static RepoProyecciones getInstance() {
		if (repoProyecciones === null) {
			repoProyecciones = new RepoProyecciones
		}
		repoProyecciones
	}

	private new() {
	}

	override List<Proyeccion> search(String buscar) {
		elementos.filter[proyeccion|this.match(buscar, proyeccion.titulo)].toList
	}

	override actualizarDatos(Proyeccion viejo, Proyeccion nuevo) {
		viejo => [
			viejo.titulo = nuevo.titulo
			viejo.añoRodaje = nuevo.añoRodaje
		]
	}
}
