package RepoJedis

import domain.Ticket
import domain.Usuario
import redis.clients.jedis.Jedis
import com.google.gson.Gson
import com.google.gson.JsonParser
import com.google.gson.JsonObject
import domain.Saga
import com.google.gson.GsonBuilder
import java.time.LocalDateTime
import domain.Funcion
import domain.LocalDateTimeGsonConverter
import domain.Pelicula

class Carrito {

	Jedis jedis = new Jedis("localhost")
	Gson gson = new GsonBuilder().registerTypeAdapter(typeof(LocalDateTime), new LocalDateTimeGsonConverter).
		excludeFieldsWithoutExposeAnnotation.create

	static Carrito instance = null

	static def getInstance() {
		if (instance === null) {
			instance = new Carrito
		}
		instance
	}

	def salvarCarrito(Usuario user, Ticket ticket) {
		jedis.sadd(keyCarrito(user), ticketAJson(ticket))
	}

	def eliminarDeCarrito(Usuario user, Ticket ticket) {
		jedis.srem(keyCarrito(user), ticketAJson(ticket))
	}

	def keyCarrito(Usuario user) {
		"user:" + user.id.toString
	}

	def ticketAJson(Ticket ticket) {
		gson.toJson(ticket)
	}

	def recuperarCarrito(Usuario usuario) {
		return jedis.smembers(keyCarrito(usuario)).map[json|recuperarTicket(json)].toList
	}

	def recuperarTicket(String json) {
		val JsonParser parser = new JsonParser()
		val JsonObject jobject = parser.parse(json).asJsonObject
		val proy = proyeccionExacta(jobject)
		val func = gson.fromJson(jobject.get("funcion").asJsonObject, typeof(Funcion))
		return new Ticket(func, proy)
	}

	def proyeccionExacta(JsonObject jobject) {
		if (jobject.get("pelicula").asJsonObject.has("peliculas")) {
			return gson.fromJson(jobject.get("pelicula").asJsonObject, typeof(Saga))
		} else {
			return gson.fromJson(jobject.get("pelicula").asJsonObject, typeof(Pelicula))
		}
	}

	def vaciarCarrito(domain.Usuario usuario) {
		jedis.del(keyCarrito(usuario))
	}

}
