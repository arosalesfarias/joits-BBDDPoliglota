package domain

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Usuario {
	String nombre
	String apellido
	Integer edad
	
	Double saldo
	String usuario
	String login
	
	
	List<Usuario> amigos = newArrayList
	//List<Cartelera> peliculasVistas = newArrayList
	
	new() {}
	
	def void agregarSaldo(Double cantidad){
		saldo = saldo + cantidad
	}
	
	def buscarAmigo(String usuarioAmigo ) {
		amigos.filter[it.usuario == usuarioAmigo]
	}
}