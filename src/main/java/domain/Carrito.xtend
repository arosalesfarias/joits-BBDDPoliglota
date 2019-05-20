package domain

import redis.clients.jedis.Jedis
import redis.clients.jedis.JedisPool
import redis.clients.jedis.JedisPoolConfig
import redis.clients.jedis.exceptions.JedisConnectionException
import org.uqbar.commons.model.exceptions.UserException

class Carrito {
	var JedisPool jedisPool
	static Carrito instance = null

	private new() {
		jedisPool = new JedisPool(new JedisPoolConfig, "localhost")
	}

	static def getInstance() {
		if (instance === null) {
			instance = new Carrito
		}
		instance
	}

	private def applyOnJedis((Jedis)=>String aBlock) {
		var Jedis jedis
		try {
			jedis = jedisPool.resource
			val value = aBlock.apply(jedis)
			if (value === null) {
				throw new UserException("No hay datos de la pelicula")
			}
			val returnValue = value
			jedis.close()
			returnValue
		} catch (JedisConnectionException e) {
			throw new UserException("Error de conexión a Redis")
		} finally {
			if (jedis !== null)
				jedis.close()
		}
	}

	private def traerValor(String key) {
		return [Jedis jedis|jedis.get(key)]
	}
}
