package RepoJedis

import domain.Ticket
import domain.Usuario
import redis.clients.jedis.Jedis
import com.fasterxml.jackson.databind.ObjectMapper

class Carrito {

	Jedis jedis = new Jedis("localhost")

	static Carrito instance = null

	static def getInstance() {
		if (instance === null) {
			instance = new Carrito
		}
		instance
	}

	def salvarCarrito(Usuario user, Ticket ticket) {
		val ObjectMapper mapper = new ObjectMapper
		jedis.sadd("user:" + user.id.toString, mapper.writeValueAsString(ticket))
		println(mapper.writeValueAsString(ticket))
//		val tkt = jedis.smembers("user:"+user.id.toString).head
//		val ticketmapeado = mapper.readValue(tkt,typeof(Ticket))
//		println(ticketmapeado)
	}

	def recuperarCarrito(Usuario usuario) {
		jedis.get("user:" + usuario.id.toString)
	}
}
