package RepoJedis

import domain.Ticket
import domain.Usuario
import redis.clients.jedis.Jedis
import com.google.gson.Gson
import com.google.gson.JsonParser
import com.google.gson.JsonObject
import reposMorphia.AbstractRepository
import domain.Proyeccion
import org.uqbar.commons.applicationContext.ApplicationContext
import reposMorphia.RepoProyecciones
import domain.Saga
import com.google.gson.GsonBuilder
import java.time.LocalDateTime
import domain.Funcion
import domain.LocalDateTimeGsonConverter

class Carrito {

	Jedis jedis = new Jedis("localhost")
	Gson gson = new GsonBuilder().registerTypeAdapter(typeof(LocalDateTime), new LocalDateTimeGsonConverter).
		excludeFieldsWithoutExposeAnnotation.create

	AbstractRepository<Proyeccion> repoProyecciones = ApplicationContext.instance.getSingleton(RepoProyecciones)

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
		val proy = repoProyecciones.searchByExample(new Saga() => [
			titulo = campoDeObjeto(jobject, "pelicula", "titulo").asString
		]).head
		// val func = proy.funciones.filter[f|f.idInterno === campoDeObjeto(jobject, "funcion", "idInterno").asInt].head
		val func = gson.fromJson(jobject.get("funcion").asJsonObject, typeof(Funcion))
		return new Ticket(func, proy)
	}

	def campoDeObjeto(JsonObject jobj, String object, String att) {
		return jobj.get(object).asJsonObject.get(att)
	}

	def vaciarCarrito(domain.Usuario usuario) {
		jedis.del(keyCarrito(usuario))
	}

}
