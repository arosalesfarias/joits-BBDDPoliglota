package RepoJedis

import domain.Ticket
import domain.Usuario
import redis.clients.jedis.Jedis
import com.fasterxml.jackson.databind.ObjectMapper
import com.google.gson.Gson
import com.google.gson.JsonParser
import com.google.gson.JsonElement
import com.google.gson.JsonObject

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
		val Gson gson = new Gson()
//		val JsonParser parser = new JsonParser()
//		val JsonElement jelem = parser.parse(gson.toJson(ticket))
//		val JsonObject jobject = jelem.asJsonObject
//		println(gson.toJson(ticket))
//		println(jobject.get("funcion").asJsonObject.get("idInterno"))
//		println(jobject.get("pelicula").asJsonObject.get("titulo"))	
		jedis.sadd("user:" + user.id.toString, gson.toJson(ticket))
//		println(mapper.writeValueAsString(ticket))
//		val tkt = jedis.smembers("user:"+user.id.toString).head
//		val ticketmapeado = mapper.readValue(tkt,typeof(Ticket))
//		println(ticketmapeado)
	}

	def recuperarCarrito(Usuario usuario) {
		jedis.smembers("user:" + usuario.id.toString).forEach[json| recuperarTicket(json)]
	}
	
	def recuperarTicket(String json) {
		val JsonParser parser = new JsonParser()
		val JsonElement jelem = parser.parse(json)
		val JsonObject jobject = jelem.asJsonObject
		return println(jobject.get("funcion").asJsonObject.get("idInterno").toString + jobject.get("pelicula").asJsonObject.get("titulo"))
	}
	
}
