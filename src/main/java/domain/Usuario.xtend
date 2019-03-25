package domain

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Usuario extends Entidad {
	String nombre
	String apellido
	Integer edad

	Double saldo
	String usuario
	String login

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
		this.tengoUsuario && this.tengoLogin
	}

	def Boolean tengoUsuario() {
		!usuario.isNullOrEmpty
	}

	def Boolean tengoLogin() {
		!login.isNullOrEmpty
	}
}
