package application

import domain.Funcion
import domain.Pelicula
import domain.Saga
import domain.Ticket
import domain.Usuario
import java.time.LocalDateTime
import org.uqbar.arena.bootstrap.Bootstrap
import RepoManager.RepoManagerProyeccion
import RepoManager.RepoManagerUsuario

class JoitsBootstrap implements Bootstrap {

	override run() {

		// Creo usuarios
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
			saldo = 50
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

		// Creo a las funciones (27)
		val funcionBatmanFinde = new Funcion(LocalDateTime.of(2019, 03, 03, 13, 30), "5")
		val funcionSupermanFinde = new Funcion(LocalDateTime.of(2019, 03, 03, 13, 30), "8")
		val funcionSagaFinde = new Funcion(LocalDateTime.of(2019, 03, 03, 13, 30), "2")
		val funcionVolver1Finde = new Funcion(LocalDateTime.of(2019, 03, 03, 13, 30), "1")
		val funcionVolver2Finde = new Funcion(LocalDateTime.of(2019, 03, 03, 13, 30), "9")
		val funcionVolver3Finde = new Funcion(LocalDateTime.of(2019, 03, 03, 13, 30), "7")
		val funcionAvengers1Finde = new Funcion(LocalDateTime.of(2019, 03, 03, 13, 30), "11")
		val funcionAvengers2Finde = new Funcion(LocalDateTime.of(2019, 03, 03, 13, 30), "14")
		val funcionAvengers3Finde = new Funcion(LocalDateTime.of(2019, 03, 03, 13, 30), "18")
		val funcionBatmanLunes = new Funcion(LocalDateTime.of(2019, 03, 04, 13, 30), "8")
		val funcionSupermanLunes = new Funcion(LocalDateTime.of(2019, 03, 04, 13, 30), "5")
		val funcionSagaLunes = new Funcion(LocalDateTime.of(2019, 03, 04, 13, 30), "10")
		val funcionVolver1Lunes = new Funcion(LocalDateTime.of(2019, 03, 04, 13, 30), "4")
		val funcionVolver2Lunes = new Funcion(LocalDateTime.of(2019, 03, 04, 13, 30), "2")
		val funcionVolver3Lunes = new Funcion(LocalDateTime.of(2019, 03, 04, 13, 30), "7")
		val funcionAvengers1Lunes = new Funcion(LocalDateTime.of(2019, 03, 04, 13, 30), "12")
		val funcionAvengers2Lunes = new Funcion(LocalDateTime.of(2019, 03, 04, 13, 30), "15")
		val funcionAvengers3Lunes = new Funcion(LocalDateTime.of(2019, 03, 04, 13, 30), "1")
		val funcionBatmanMiercoles = new Funcion(LocalDateTime.of(2019, 03, 06, 13, 30), "1")
		val funcionSupermanMiercoles = new Funcion(LocalDateTime.of(2019, 03, 06, 13, 30), "7")
		val funcionSagaMiercoles = new Funcion(LocalDateTime.of(2019, 03, 06, 13, 30), "4")
		val funcionVolver1Miercoles = new Funcion(LocalDateTime.of(2019, 03, 06, 13, 30), "10")
		val funcionVolver2Miercoles = new Funcion(LocalDateTime.of(2019, 03, 06, 13, 30), "8")
		val funcionVolver3Miercoles = new Funcion(LocalDateTime.of(2019, 03, 06, 13, 30), "2")
		val funcionAvengers1Miercoles = new Funcion(LocalDateTime.of(2019, 03, 06, 13, 30), "6")
		val funcionAvengers2Miercoles = new Funcion(LocalDateTime.of(2019, 03, 06, 13, 30), "17")
		val funcionAvengers3Miercoles = new Funcion(LocalDateTime.of(2019, 03, 06, 13, 30), "12")

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

		// creo los Tickets
		val entradaAlberto1 = new Ticket(funcionVolver1Lunes, volverAlFuturo1)
		entradaAlberto1.usuario = alezcano

		val entradaAlberto2 = new Ticket(funcionVolver1Finde, volverAlFuturo1)
		entradaAlberto2.usuario = alezcano

		val entradaAriel1 = new Ticket(funcionSupermanFinde, superman)
		entradaAriel1.usuario = arosales

		val entradaAriel2 = new Ticket(funcionAvengers2Miercoles, avengers2)
		entradaAriel2.usuario = arosales

		val entradaDiego1 = new Ticket(funcionSagaFinde, volverAlFuturo)
		entradaDiego1.usuario = dsalamida

		val entradaDiego2 = new Ticket(funcionVolver1Miercoles, volverAlFuturo1)
		entradaDiego2.usuario = dsalamida

		val entradaChinwenwencha1 = new Ticket(funcionVolver2Miercoles, volverAlFuturo1)
		entradaChinwenwencha1.usuario = chinwenwencha

		val entradaChinwenwencha2 = new Ticket(funcionSagaLunes, volverAlFuturo)
		entradaChinwenwencha2.usuario = chinwenwencha

		val entradaMacri1 = new Ticket(funcionAvengers3Miercoles, avengers3)
		entradaMacri1.usuario = elgato

		val entradaMacri2 = new Ticket(funcionBatmanMiercoles, batman)
		entradaMacri2.usuario = elgato

		// Creo lista de pelis y sagas
		val listaPelis = #[batman, superman, avengers1, avengers2, avengers3, volverAlFuturo1, volverAlFuturo2,
			volverAlFuturo3, volverAlFuturo]

		// Creo lista de usuarios
		val listaUsuarios = #[alezcano, dsalamida, arosales, elgato, chinwenwencha]

		// persisto usuarios
		listaUsuarios.forEach[u|RepoManagerUsuario.instance.persistirUsuario(u)]

		// persisto peliculas
		listaPelis.forEach[p|RepoManagerProyeccion.instance.persistirProyeccion(p)]

		// agrego las entradas a los usuarios
		alezcano.tickets.addAll(entradaAlberto1, entradaAlberto2)
		arosales.tickets.addAll(entradaAriel1, entradaAriel2)
		dsalamida.tickets.addAll(entradaDiego1, entradaDiego2)
		elgato.tickets.addAll(entradaMacri1, entradaMacri2)
		chinwenwencha.tickets.addAll(entradaChinwenwencha1, entradaChinwenwencha2)

		// amigos
		alezcano.amigos.addAll(dsalamida, arosales)
		dsalamida.amigos.addAll(alezcano, arosales, elgato)
		arosales.amigos.addAll(alezcano)

		// actualizo usuarios en grafo
		listaUsuarios.forEach[u|RepoManagerUsuario.instance.actualizarUsuario(u)]

	}

	override isPending() {
		true
	}
}
