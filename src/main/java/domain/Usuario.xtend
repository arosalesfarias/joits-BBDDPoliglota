package domain

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import exceptions.BusinessException
import java.util.ArrayList
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import repos.RepoUsuarios

@TransactionalAndObservable
@Accessors
class Usuario extends Entidad {
	String nombre
	String apellido
	Integer edad

	Double saldo
	Double cantidad
	String usuario
	String login

	List<Proyeccion> peliculas = new ArrayList<Proyeccion>

	override String toString() {
		usuario
	}

	List<Usuario> amigos = newArrayList

	def void agregarAmigo(Usuario amigo) {
		amigos.add(amigo)
	}

	def void agregarSaldo() {
		saldo = saldo + cantidad
		cantidad = 0.0
	}

	def buscarAmigo(String usuarioAmigo) {
		amigos.filter[it.usuario == usuarioAmigo]
	}

	def buscarPersonas(String buscar) {
		RepoUsuarios.instance.buscarPersonas(this,buscar)
	}

	override validateCreate() {
		if (!this.tengoUsuario || !this.tengoLogin) {
			throw new BusinessException("no tiene usuario y/o login")
		}
	}

	def Boolean tengoUsuario() {
		!usuario.isNullOrEmpty
	}

	def Boolean tengoLogin() {
		!login.isNullOrEmpty
	}

	def buscar(String pelicula) {
		peliculas
	}

	def void comprarPelicula(List<Proyeccion> peliculas) {
		peliculas.addAll(peliculas)
	}
}
