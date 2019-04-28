package application

import domain.Funcion
import domain.Pelicula
import domain.Proyeccion
import domain.Saga
import domain.Usuario
import java.time.LocalDateTime
import org.uqbar.arena.bootstrap.Bootstrap
import repos.RepoProyecciones
import repos.RepoUsuarios
import repos.RepoFunciones

class JoitsBootstrap implements Bootstrap {
	override run() {
		var alezcano = new Usuario() => [
			nombre = "Alberto"
			apellido = "Lezcano"
			edad = 26
			saldo = 1000
			usuario = "alezcano"
			login = "1234"
		]

		var dsalamida = new Usuario() => [
			nombre = "Diego"
			apellido = "Salamida"
			edad = 32
			saldo = 2500
			usuario = "dsalamida"
			login = "dsalamida"
		]
		var arosales = new Usuario() => [
			nombre = "Ariel"
			apellido = "Rosales"
			edad = 8
			saldo = 12
			usuario = "arosales"
			login = "3333"
		]
		var chinwenwencha = new Usuario() => [
			nombre = "El"
			apellido = "Chinwenwencha"
			edad = 26
			saldo = 5
			usuario = "chinwenwencha"
			login = "1234"
		]
		var elgato = new Usuario() => [
			nombre = "Mauiricio"
			apellido = "Macri"
			edad = 50
			saldo = 999999999
			usuario = "elgato"
			login = "1234"
		]
		// RepoUsuarios
		crearUsuarios(alezcano)
		crearUsuarios(dsalamida)
		crearUsuarios(arosales)
		crearUsuarios(chinwenwencha)
		crearUsuarios(elgato)
		// amigos
		alezcano.amigos.addAll(dsalamida, arosales)
		dsalamida.amigos.addAll(alezcano, arosales)
		arosales.amigos.addAll()
		// Update con amigos
		crearUsuarios(alezcano)
		crearUsuarios(dsalamida)
		crearUsuarios(arosales)

		// Funciones
		val funcionBatman = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 03, 13, 30)
			sala = "5"
		]

		val funcionSuperman = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
			sala = "8"
		]

		val funcionSaga = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 06, 13, 30)
			sala = "2"
		]

		val funcionVolver1 = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 03, 13, 30)
			sala = "1"
		]

		val funcionVolver2 = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
			sala = "9"
		]
		val funcionVolver3 = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 06, 13, 30)
			sala = "7"
		]

		val funcionAvengers1 = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 06, 13, 30)
			sala = "11"
		]

		val funcionAvengers2 = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
			sala = "14"
		]

		val funcionAvengers3 = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
			sala = "18"
		]

		// Creo las funciones
		crearFunciones(funcionBatman)
		crearFunciones(funcionSaga)
		crearFunciones(funcionSuperman)
		crearFunciones(funcionVolver1)
		crearFunciones(funcionVolver2)
		crearFunciones(funcionVolver3)
		crearFunciones(funcionAvengers1)
		crearFunciones(funcionAvengers2)
		crearFunciones(funcionAvengers3)

		// Pelis y Sagas
		val batman = new Pelicula() => [
			titulo = "Batman asciende"
			añoRodaje = 2010
			puntaje = 5
			genero = "Accion"
			funciones.addAll(funcionBatman)
		]
		val superman = new Pelicula() => [
			titulo = "Superman"
			añoRodaje = 2012
			puntaje = 3
			genero = "Accion"
			funciones.add(funcionSuperman)
		]

		val avengers1 = new Pelicula() => [
			titulo = "Avengers"
			añoRodaje = 2010
			puntaje = 5
			genero = "Accion"
			funciones.addAll(funcionAvengers1)
		]
		val avengers2 = new Pelicula() => [
			titulo = "Avengers 2"
			añoRodaje = 2012
			puntaje = 4
			genero = "Accion"
			funciones.addAll(funcionAvengers2)
		]
		val avengers3 = new Pelicula() => [
			titulo = "Avengers 3"
			añoRodaje = 2014
			puntaje = 5
			genero = "Accion"
			funciones.addAll(funcionAvengers3)
		]
		val volverAlFuturo1 = new Pelicula() => [
			titulo = "Volver al futuro"
			añoRodaje = 1989
			puntaje = 4
			genero = "Aventura"
			funciones.add(funcionVolver1)
		]
		val volverAlFuturo2 = new Pelicula() => [
			titulo = "Volver al futuro 2"
			añoRodaje = 1991
			puntaje = 5
			genero = "Aventura"
			funciones.add(funcionVolver2)
		]
		val volverAlFuturo3 = new Pelicula() => [
			titulo = "Volver al futuro 3"
			añoRodaje = 1992
			puntaje = 4
			genero = "Aventura"
			funciones.addAll(funcionVolver3)
		]
		val volverAlFuturo = new Saga() => [
			titulo = "Saga Volver al futuro"
			añoRodaje = 1989
			puntaje = 4
			nivelClasico = 50
			peliculas.addAll(volverAlFuturo1, volverAlFuturo2, volverAlFuturo3)
			funciones.addAll(funcionSaga)
		]

		// Creo las pelis y sagas
		newArrayList(batman, superman, avengers1, avengers2, avengers3, volverAlFuturo1, volverAlFuturo2,
			volverAlFuturo3, volverAlFuturo).forEach[proy|this.crearProyeccion(proy)]

	}

	def crearProyeccion(Proyeccion proy) {
		val repoProy = RepoProyecciones.instance
		val listaProy = repoProy.searchByExample(proy)
		if (listaProy.isEmpty) {
			repoProy.create(proy)
			println("Proyeccion " + proy.titulo + " creada")
		} else {
			val proyBD = listaProy.head
			proy.id = proyBD.id
			repoProy.update(proy)
		}
	}

	def void crearUsuarios(Usuario usuario) {
		val repoUsuarios = RepoUsuarios.instance
		val listaUsuarios = repoUsuarios.searchByExample(usuario)
		if (listaUsuarios.isEmpty) {
			repoUsuarios.create(usuario)
			println("Usuario " + usuario.usuario + " creado")
		} else {
			val usuarioBD = listaUsuarios.head
			usuario.id = usuarioBD.id
			repoUsuarios.update(usuario)
		}
	}

	def void crearFunciones(Funcion funcion) {
		val repoFunciones = RepoFunciones.instance
		val listaFunciones = repoFunciones.searchByExample(funcion)
		if (listaFunciones.isEmpty) {
			repoFunciones.create(funcion)
			println("Funcion creada")
		} else {
			val funcionBD = listaFunciones.head
			funcion.id = funcionBD.id
			repoFunciones.update(funcion)
		}
	}

	override isPending() {
		true
	}
}
