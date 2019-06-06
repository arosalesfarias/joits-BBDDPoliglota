package application

import domain.Funcion
import domain.Pelicula
import domain.Proyeccion
import domain.Saga
import domain.Ticket
import domain.Usuario
import java.time.LocalDateTime
import org.uqbar.arena.bootstrap.Bootstrap
import org.uqbar.commons.applicationContext.ApplicationContext
import reposHibernate.RepoUsuarios
import reposMorphia.AbstractRepository
import reposMorphia.RepoProyecciones
import reposNeo4j.AbstractRepoNeo4J
import reposNeo4j.RepoPeliculas

class JoitsBootstrap implements Bootstrap {

	AbstractRepository<Proyeccion> repoProyecciones = ApplicationContext.instance.getSingleton(typeof(RepoProyecciones))

	AbstractRepoNeo4J<Proyeccion> repoPelis = RepoPeliculas.instance

//	AbstractRepository<Funcion> repoFunciones = ApplicationContext.instance.getSingleton(typeof(RepoFunciones))
	override run() {

		// Funciones (27)
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

		/*newArrayList(funcionBatmanFinde, funcionSupermanFinde, funcionSagaFinde, funcionVolver1Finde,
		 * 	funcionVolver2Finde, funcionVolver3Finde, funcionAvengers1Finde, funcionAvengers2Finde,
		 * 	funcionAvengers3Finde, funcionBatmanLunes, funcionSupermanLunes, funcionSagaLunes, funcionVolver1Lunes,
		 * 	funcionVolver2Lunes, funcionVolver3Lunes, funcionAvengers1Lunes, funcionAvengers2Lunes,
		 * 	funcionAvengers3Lunes, funcionBatmanMiercoles, funcionSupermanMiercoles, funcionSagaMiercoles,
		 * 	funcionVolver1Miercoles, funcionVolver2Miercoles, funcionVolver3Miercoles, funcionAvengers1Miercoles,
		 * 	funcionAvengers2Miercoles, funcionAvengers3Miercoles).forEach [
		 * 	repoFunciones.createIfNotExists(it)
		 ]*/
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

		val entradaAlberto2 = new Ticket(funcionVolver1Finde, volverAlFuturo1)

		val entradaAriel1 = new Ticket(funcionSupermanFinde, superman)

		val entradaAriel2 = new Ticket(funcionAvengers2Miercoles, avengers2)

		val entradaDiego1 = new Ticket(funcionSagaFinde, volverAlFuturo)

		val entradaDiego2 = new Ticket(funcionVolver1Miercoles, volverAlFuturo1)

		val entradaChinwenwencha1 = new Ticket(funcionVolver2Miercoles, volverAlFuturo1)

		val entradaChinwenwencha2 = new Ticket(funcionSagaLunes, volverAlFuturo)

		val entradaMacri1 = new Ticket(funcionAvengers3Miercoles, avengers3)

		val entradaMacri2 = new Ticket(funcionBatmanMiercoles, batman)

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
		// agrego las entradas a los usuarios
		alezcano.tickets.addAll(entradaAlberto1, entradaAlberto2)
		arosales.tickets.addAll(entradaAriel1, entradaAriel2)
		dsalamida.tickets.addAll(entradaDiego1, entradaDiego2)
		elgato.tickets.addAll(entradaMacri1, entradaMacri2)
		chinwenwencha.tickets.addAll(entradaChinwenwencha1, entradaChinwenwencha2)

		// Creo las pelis y sagas
		newArrayList(batman, superman, avengers1, avengers2, avengers3, volverAlFuturo1, volverAlFuturo2,
			volverAlFuturo3, volverAlFuturo).forEach[repoProyecciones.createIfNotExists(it)]

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

		// Update con entradas y amigos
		crearUsuarios(alezcano)
		crearUsuarios(dsalamida)
		crearUsuarios(arosales)
		crearUsuarios(elgato)
		crearUsuarios(chinwenwencha)

		// esto para neo4j
		newArrayList(batman, superman, avengers1, avengers2, avengers3, volverAlFuturo1, volverAlFuturo2,
			volverAlFuturo3, volverAlFuturo).forEach[repoPelis.crear(it)]
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

	override isPending() {
		true
	}
}
