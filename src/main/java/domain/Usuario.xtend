package domain

import exceptions.BusinessException
import java.util.ArrayList
import java.util.List
import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.ManyToMany
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import repos.RepoUsuarios

@Entity
@TransactionalAndObservable
@Accessors
class Usuario {

	@Id
	@GeneratedValue
	Long id

	@Column(length=50)
	String nombre

	@Column(length=50)
	String apellido

	@Column
	Integer edad

	@Column
	float saldo

	@Column(length=25)
	String usuario

	@Column(length=25)
	String login

	@ManyToMany(fetch=FetchType.EAGER)
	List<Usuario> amigos = newArrayList()

	@ManyToMany(fetch=FetchType.EAGER, cascade=CascadeType.PERSIST)
	List<Ticket> tickets = new ArrayList<Ticket>

	float cantidad

	override String toString() {
		usuario
	}

	def void agregarAmigo(Usuario amigo) {
		amigos.add(amigo)
	}

	def void agregarSaldo() {
		saldo = saldo + cantidad
		cantidad = 0
	}

	def buscarAmigo(String usuarioAmigo) {
		amigos.filter[it.usuario == usuarioAmigo]
	}

	def buscarPersonas(String buscar) {
		RepoUsuarios.instance.buscarPersonas(this, buscar)
	}

	def validateCreate() {
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

	def void comprarTicket(Ticket ticket) {
		pagarTicket(ticket)
		tickets.add(ticket)
	}

	def void pagarTicket(Ticket ticket) {
		if(ticket.precio > saldo) throw new BusinessException("el usuario no tiene saldo suficiente")
		saldo = saldo - ticket.precio
	}

	def update() {
		RepoUsuarios.instance.update(this)
	}

}
