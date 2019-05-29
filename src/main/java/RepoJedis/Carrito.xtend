package RepoJedis

import domain.Ticket
import domain.Usuario
import redis.clients.jedis.Jedis
import com.google.gson.Gson
import com.google.gson.JsonParser
import com.google.gson.JsonElement
import com.google.gson.JsonObject
import reposMorphia.AbstractRepository
import domain.Proyeccion
import org.uqbar.commons.applicationContext.ApplicationContext
import reposMorphia.RepoProyecciones
import domain.Saga
import com.google.gson.GsonBuilder

class Carrito {

	Jedis jedis = new Jedis("localhost")

	AbstractRepository<Proyeccion> repoProyecciones = ApplicationContext.instance.getSingleton(RepoProyecciones)

	static Carrito instance = null

	static def getInstance() {
		if (instance === null) {
			instance = new Carrito
		}
		instance
	}

	def salvarCarrito(Usuario user, Ticket ticket) {
		val Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation.create
		jedis.sadd("user:" + user.id.toString, gson.toJson(ticket))
	}

	def eliminarDeCarrito(Usuario user, Ticket ticket) {
		val Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation.create
		println(gson.toJson(ticket))
		jedis.srem("user:" + user.id.toString, gson.toJson(ticket))
	}

	def recuperarCarrito(Usuario usuario) {
		return jedis.smembers("user:" + usuario.id.toString).map[json|recuperarTicket(json)].toList
	}

	def recuperarTicket(String json) {
		val JsonParser parser = new JsonParser()
		val JsonElement jelem = parser.parse(json)
		val JsonObject jobject = jelem.asJsonObject
		val proy = repoProyecciones.searchByExample(new Saga() => [
			titulo = jobject.get("pelicula").asJsonObject.get("titulo").asString
		]).head
		val func = proy.funciones.filter[f|f.idInterno === jobject.get("funcion").asJsonObject.get("idInterno").asInt].
			head
		return new Ticket(func, proy)
	}

	def vaciarCarrito(domain.Usuario usuario) {
		jedis.del("user:" + usuario.id.toString)
	}

}
