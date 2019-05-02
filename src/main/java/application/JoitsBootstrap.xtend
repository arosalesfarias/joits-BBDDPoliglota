package application

import domain.Funcion
import domain.Pelicula
import domain.Proyeccion
import domain.Saga
import domain.Ticket
import domain.Usuario
import java.time.LocalDateTime
import org.uqbar.arena.bootstrap.Bootstrap
import repos.RepoFunciones
import repos.RepoProyecciones
import repos.RepoUsuarios
import repos.RepoTickets

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
		arosales.amigos.addAll(alezcano)

		// Funciones
		val funcionBatmanFinde = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 03, 13, 30)
			sala = "5"
		]

		val funcionSupermanFinde = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 03, 13, 30)
			sala = "8"
		]

		val funcionSagaFinde = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 03, 13, 30)
			sala = "2"
		]

		val funcionVolver1Finde = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 03, 13, 30)
			sala = "1"
		]

		val funcionVolver2Finde = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 03, 13, 30)
			sala = "9"
		]
		val funcionVolver3Finde = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 03, 13, 30)
			sala = "7"
		]

		val funcionAvengers1Finde = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 03, 13, 30)
			sala = "11"
		]

		val funcionAvengers2Finde = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 03, 13, 30)
			sala = "14"
		]

		val funcionAvengers3Finde = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 03, 13, 30)
			sala = "18"
		]

		val funcionBatmanLunes = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
			sala = "8"
		]

		val funcionSupermanLunes = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
			sala = "5"
		]

		val funcionSagaLunes = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
			sala = "10"
		]

		val funcionVolver1Lunes = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
			sala = "4"
		]

		val funcionVolver2Lunes = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
			sala = "2"
		]
		val funcionVolver3Lunes = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
			sala = "7"
		]

		val funcionAvengers1Lunes = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
			sala = "12"
		]

		val funcionAvengers2Lunes = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
			sala = "15"
		]

		val funcionAvengers3Lunes = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
			sala = "1"
		]

		val funcionBatmanMiercoles = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 06, 13, 30)
			sala = "1"
		]

		val funcionSupermanMiercoles = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 06, 13, 30)
			sala = "7"
		]

		val funcionSagaMiercoles = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 06, 13, 30)
			sala = "4"
		]

		val funcionVolver1Miercoles = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 06, 13, 30)
			sala = "10"
		]

		val funcionVolver2Miercoles = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 06, 13, 30)
			sala = "8"
		]
		val funcionVolver3Miercoles = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 06, 13, 30)
			sala = "2"
		]

		val funcionAvengers1Miercoles = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 06, 13, 30)
			sala = "6"
		]

		val funcionAvengers2Miercoles = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 06, 13, 30)
			sala = "17"
		]

		val funcionAvengers3Miercoles = new Funcion() => [
			hora = LocalDateTime.of(2019, 03, 06, 13, 30)
			sala = "12"
		]

		// Creo las funciones
		crearFunciones(funcionBatmanFinde)
		crearFunciones(funcionSagaFinde)
		crearFunciones(funcionSupermanFinde)
		crearFunciones(funcionVolver1Finde)
		crearFunciones(funcionVolver2Finde)
		crearFunciones(funcionVolver3Finde)
		crearFunciones(funcionAvengers1Finde)
		crearFunciones(funcionAvengers2Finde)
		crearFunciones(funcionAvengers3Finde)
		crearFunciones(funcionBatmanLunes)
		crearFunciones(funcionSagaLunes)
		crearFunciones(funcionSupermanLunes)
		crearFunciones(funcionVolver1Lunes)
		crearFunciones(funcionVolver2Lunes)
		crearFunciones(funcionVolver3Lunes)
		crearFunciones(funcionAvengers1Lunes)
		crearFunciones(funcionAvengers2Lunes)
		crearFunciones(funcionAvengers3Lunes)
		crearFunciones(funcionBatmanMiercoles)
		crearFunciones(funcionSagaMiercoles)
		crearFunciones(funcionSupermanMiercoles)
		crearFunciones(funcionVolver1Miercoles)
		crearFunciones(funcionVolver2Miercoles)
		crearFunciones(funcionVolver3Miercoles)
		crearFunciones(funcionAvengers1Miercoles)
		crearFunciones(funcionAvengers2Miercoles)
		crearFunciones(funcionAvengers3Miercoles)

		// Pelis y Sagas
		val batman = new Pelicula() => [
			titulo = "Batman asciende"
			añoRodaje = 2010
			puntaje = 5
			genero = "Accion"
			funciones.addAll(funcionBatmanFinde, funcionBatmanLunes, funcionBatmanMiercoles)
		]
		val superman = new Pelicula() => [
			titulo = "Superman"
			añoRodaje = 2012
			puntaje = 3
			genero = "Accion"
			funciones.addAll(funcionSupermanFinde, funcionSupermanLunes, funcionSupermanMiercoles)
		]

		val avengers1 = new Pelicula() => [
			titulo = "Avengers"
			añoRodaje = 2010
			puntaje = 5
			genero = "Accion"
			funciones.addAll(funcionAvengers1Finde, funcionAvengers1Lunes, funcionAvengers1Miercoles)
		]
		val avengers2 = new Pelicula() => [
			titulo = "Avengers 2"
			añoRodaje = 2012
			puntaje = 4
			genero = "Accion"
			funciones.addAll(funcionAvengers2Finde, funcionAvengers2Lunes, funcionAvengers2Miercoles)
		]
		val avengers3 = new Pelicula() => [
			titulo = "Avengers 3"
			añoRodaje = 2014
			puntaje = 5
			genero = "Accion"
			funciones.addAll(funcionAvengers3Finde, funcionAvengers3Lunes, funcionAvengers3Miercoles)
		]
		val volverAlFuturo1 = new Pelicula() => [
			titulo = "Volver al futuro"
			añoRodaje = 1989
			puntaje = 4
			genero = "Aventura"
			funciones.addAll(funcionVolver1Finde, funcionVolver1Lunes, funcionVolver1Miercoles)
		]
		val volverAlFuturo2 = new Pelicula() => [
			titulo = "Volver al futuro 2"
			añoRodaje = 1991
			puntaje = 5
			genero = "Aventura"
			funciones.addAll(funcionVolver2Finde, funcionVolver2Lunes, funcionVolver2Miercoles)
		]
		val volverAlFuturo3 = new Pelicula() => [
			titulo = "Volver al futuro 3"
			añoRodaje = 1992
			puntaje = 4
			genero = "Aventura"
			funciones.addAll(funcionVolver3Finde, funcionVolver3Lunes, funcionVolver3Miercoles)
		]
		val volverAlFuturo = new Saga() => [
			titulo = "Saga Volver al futuro"
			añoRodaje = 1989
			puntaje = 4
			nivelClasico = 50
			peliculas.addAll(volverAlFuturo1, volverAlFuturo2, volverAlFuturo3)
			funciones.addAll(funcionSagaFinde, funcionSagaLunes, funcionSagaMiercoles)
		]

		// Creo las pelis y sagas
		newArrayList(batman, superman, avengers1, avengers2, avengers3, volverAlFuturo1, volverAlFuturo2,
			volverAlFuturo3, volverAlFuturo).forEach[proy|this.crearProyeccion(proy)]

		// creo los Tickets
		val entradaAlberto1 = new Ticket => [
			funcion = funcionVolver1Lunes
			pelicula = volverAlFuturo1
		]

		val entradaAlberto2 = new Ticket => [
			funcion = funcionVolver1Finde
			pelicula = volverAlFuturo1
		]

		val entradaAriel1 = new Ticket => [
			funcion = funcionSupermanFinde
			pelicula = superman
		]

		val entradaAriel2 = new Ticket => [
			funcion = funcionAvengers2Miercoles
			pelicula = avengers2
		]

		val entradaDiego1 = new Ticket => [
			funcion = funcionSagaFinde
			pelicula = volverAlFuturo
		]

		val entradaDiego2 = new Ticket => [
			funcion = funcionVolver1Miercoles
			pelicula = volverAlFuturo1
		]

		val entradaChinwenwencha1 = new Ticket => [
			funcion = funcionVolver2Miercoles
			pelicula = volverAlFuturo1
		]

		val entradaChinwenwencha2 = new Ticket => [
			funcion = funcionSagaLunes
			pelicula = volverAlFuturo
		]

		val entradaMacri1 = new Ticket => [
			funcion = funcionAvengers3Miercoles
			pelicula = avengers3
		]

		val entradaMacri2 = new Ticket => [
			funcion = funcionBatmanMiercoles
			pelicula = batman
		]

		// crear Tickerts
		crearTickets(entradaAlberto1)
		crearTickets(entradaAlberto2)
		crearTickets(entradaAriel1)
		crearTickets(entradaAriel2)
		crearTickets(entradaDiego1)
		crearTickets(entradaDiego2)
		crearTickets(entradaChinwenwencha1)
		crearTickets(entradaChinwenwencha2)
		crearTickets(entradaMacri1)
		crearTickets(entradaMacri2)

		// agrego las entradas a los usuarios
		alezcano.tickets.addAll(entradaAlberto1, entradaAlberto2)
		arosales.tickets.addAll(entradaAriel1, entradaAriel2)
		dsalamida.tickets.addAll(entradaDiego1, entradaDiego2)
		elgato.tickets.addAll(entradaMacri1, entradaMacri2)
		chinwenwencha.tickets.addAll(entradaChinwenwencha1, entradaChinwenwencha2)

		// Update con entradas y amigos
		crearUsuarios(alezcano)
		crearUsuarios(dsalamida)
		crearUsuarios(arosales)
		crearUsuarios(elgato)
		crearUsuarios(chinwenwencha)
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

	def void crearTickets(Ticket ticket) {
		val repoTickets = RepoTickets.instance
		val listaTikets = repoTickets.searchByExample(ticket)
		if (listaTikets.isEmpty) {
			repoTickets.create(ticket)
			println("Ticket creado")
		} else {
			val ticketBD = listaTikets.head
			ticket.id = ticketBD.id
			repoTickets.update(ticket)
		}
	}

	override isPending() {
		true
	}
}
