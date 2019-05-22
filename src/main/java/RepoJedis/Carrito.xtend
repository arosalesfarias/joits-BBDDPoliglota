package RepoJedis

import redis.clients.jedis.Jedis
import redis.clients.jedis.JedisPool
import redis.clients.jedis.JedisPoolConfig
import redis.clients.jedis.exceptions.JedisConnectionException
import org.uqbar.commons.model.exceptions.UserException
import domain.Usuario
import java.util.List
import domain.Ticket

class Carrito {

	Jedis jedis = new Jedis("localhost")

	static Carrito instance = null

	static def getInstance() {
		if (instance === null) {
			instance = new Carrito
		}
		instance
	}

	def salvarCarrito(Usuario usuario, List<Ticket> carrito) {
		jedis.set(usuario.id.toString, carrito.toString)
	}

	def recuperarCarrito(Usuario usuario) {
		jedis.get(usuario.id.toString)
	}
}
