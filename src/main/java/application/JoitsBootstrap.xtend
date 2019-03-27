package application

import org.uqbar.arena.bootstrap.Bootstrap
import domain.Usuario
import repos.RepoUsuarios
import domain.Pelicula
import domain.Saga
import repos.RepoProyecciones

class JoitsBootstrap implements Bootstrap {
	override run() {
		val RepoUsuarios repoUsr = RepoUsuarios.instance
		var alezcano = new Usuario() => [
			nombre = "Alberto"
			apellido = "Lezcano"
			edad = 26
			saldo = 1000.0
			usuario = "alezcano"
			login = "1234"
		]
		var dsalamida = new Usuario() => [
			nombre = "Diego"
			apellido = "Salamida"
			edad = 32
			saldo = 2500.0
			usuario = "dsalamida"
			login = "dsalamida"
		]
		var arosales = new Usuario() => [
			nombre = "Ariel"
			apellido = "Rosales"
			edad = 8
			saldo = 12.0
			usuario = "arosales"
			login = "3333"
		]
		repoUsr.create(alezcano)
		println("usuario alezcano creado")
		repoUsr.create(dsalamida)
		println("usuario dsalamida creado")
		repoUsr.create(arosales)
		println("usuario arosales creado")
		// Pelis y Sagas
		val RepoProyecciones repoProy = RepoProyecciones.instance
		val batman = new Pelicula() => [
			titulo = "Batman asciende"
			añoRodaje = 2010
			puntaje = 5
			genero = "Accion"
		]
		val volverAlFuturo1 = new Pelicula() => [
			titulo = "Volver al futuro"
			añoRodaje = 1989
			puntaje = 4
			genero = "Aventura"
		]
		val volverAlFuturo2 = new Pelicula() => [
			titulo = "Volver al futuro 2"
			añoRodaje = 1991
			puntaje = 5
			genero = "Aventura"
		]
		val volverAlFuturo3 = new Pelicula() => [
			titulo = "Volver al futuro 3"
			añoRodaje = 1992
			puntaje = 4
			genero = "Aventura"
		]
		val volverAlFuturo = new Saga() => [
			titulo = "Saga Volver al futuro"
			añoRodaje = 1989
			puntaje = 4
			nivelClasico = 50
			peliculas.addAll(volverAlFuturo1, volverAlFuturo2, volverAlFuturo3)
		]
		repoProy.create(batman)
		println("pelicula batman creado")
		repoProy.create(volverAlFuturo1)
		println("pelicula volver al futuro creada")
		repoProy.create(volverAlFuturo2)
		println("pelicula volver al futuro 2 creada")
		repoProy.create(volverAlFuturo3)
		println("pelicula volver al futuro 3 creada")
		repoProy.create(volverAlFuturo)
		println("saga volver al futuro creada")
	}

	override isPending() {
		true
	}
}
