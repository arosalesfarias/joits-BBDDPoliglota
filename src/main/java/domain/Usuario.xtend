package domain

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import exceptions.BusinessException
import java.util.ArrayList

@Observable
@Accessors
class Usuario extends Entidad {
	String nombre
	String apellido
	Integer edad

	Double saldo
	String usuario
	String login

	List<Pelicula> peliculas = new ArrayList<Pelicula>

	override String toString() {
		usuario
	}

	List<Usuario> amigos = newArrayList

	// List<Cartelera> peliculasVistas = newArrayList
	new() {
	}

	def void agregarSaldo(Double cantidad) {
		saldo = saldo + cantidad
	}

	def buscarAmigo(String usuarioAmigo) {
		amigos.filter[it.usuario == usuarioAmigo]
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
}
