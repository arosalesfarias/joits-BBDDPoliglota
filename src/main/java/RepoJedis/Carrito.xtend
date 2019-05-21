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

//	var JedisPool jedisPool
	static Carrito instance = null

//
//	private new() {
//		jedisPool = new JedisPool(new JedisPoolConfig, "localhost")
//	}
//
	static def getInstance() {
		if (instance === null) {
			instance = new Carrito
		}
		instance
	}

	def salvarCarrito(Usuario usuario, List<Ticket> carrito) {
		jedis.set(usuario.usuario, carrito.toString)
	}

	def recuperarCarrito(Usuario usuario) {
		jedis.get(usuario.usuario)
	}

//	private def applyOnJedis((Jedis)=>String aBlock) {
//		var Jedis jedis
//		try {
//			jedis = jedisPool.resource
//			val value = aBlock.apply(jedis)
//			if (value === null) {
//				throw new UserException("No hay datos de la pelicula")
//			}
//			val returnValue = value
//			jedis.close()
//			returnValue
//		} catch (JedisConnectionException e) {
//			throw new UserException("Error de conexión a Redis")
//		} finally {
//			if (jedis !== null)
//				jedis.close()
//		}
//	}
//
//	private def traerValor(String key) {
//		return [Jedis jedis|jedis.get(key)]
//	}
}
