package RepoJedis

import domain.Ticket
import domain.Usuario
import redis.clients.jedis.Jedis

class Carrito {

	Jedis jedis = new Jedis("localhost")

	static Carrito instance = null

	static def getInstance() {
		if (instance === null) {
			instance = new Carrito
		}
		instance
	}

	def salvarCarrito(Ticket ticket) {
		jedis.lpush(ticket.id.toString, ticket.funcion.id.toString)
		jedis.lpush(ticket.id.toString, ticket.pelicula.id.toString)
	}

	def recuperarCarrito(Usuario usuario) {
		jedis.get(usuario.id.toString)
	}
}
