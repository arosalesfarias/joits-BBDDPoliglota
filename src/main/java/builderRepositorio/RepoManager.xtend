package builderRepositorio

import domain.Proyeccion
import domain.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoManager {

	List<RepoGenerico<Proyeccion>> repositoriosPeliculas = new ArrayList

	List<RepoGenerico<Usuario>> repositoriosUsuarios = new ArrayList

	def void persistirUsuario(Usuario usuario) {
		repositoriosUsuarios.forEach[repo|repo.createIfNotExists(usuario)]
	}

	def void persistirProyeccion(Proyeccion proyeccion) {
		repositoriosPeliculas.forEach[repo|repo.createIfNotExists(proyeccion)]
	}

	def void actualizarUsuario(Usuario usuario) {
		repositoriosUsuarios.forEach[repo|repo.update(usuario)]
	}

}
