package domain

import exceptions.BusinessException
import java.util.HashSet
import java.util.Set
import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.ManyToMany
import javax.persistence.OneToMany
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.neo4j.ogm.annotation.NodeEntity
import org.neo4j.ogm.annotation.Property
import org.neo4j.ogm.annotation.Relationship
import org.neo4j.ogm.annotation.Transient

@Entity
@NodeEntity
@TransactionalAndObservable
@Accessors
class Usuario {

	@Id
	@GeneratedValue
	Long id

	@org.neo4j.ogm.annotation.Id 
	@org.neo4j.ogm.annotation.GeneratedValue Long ide

	@Column(length=50)
	@Property
	String nombre

	@Column(length=50)
	String apellido

	@Column
	Integer edad

	@Column
	float saldo

	@Column(length=25)
	@Property
	String usuario

	@Column(length=25)
	String login

	@ManyToMany(fetch=FetchType.LAZY)
	@Relationship(type = "EsAmigoDe")
	Set<Usuario> amigos = newHashSet

	@OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	//@Relationship(type="Tiene", direction = "INCOMING")
	@Transient
	Set<Ticket> tickets = new HashSet<Ticket>

	override String toString() {
		usuario
	}

	def void agregarAmigo(Usuario amigo) {
		amigos.add(amigo)
	}

	def buscarAmigo(String usuarioAmigo) {
		amigos.filter[it.usuario == usuarioAmigo]
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

}
