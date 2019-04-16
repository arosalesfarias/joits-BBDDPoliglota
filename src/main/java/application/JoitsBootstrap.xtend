package application

import domain.Usuario
import org.uqbar.arena.bootstrap.Bootstrap
import repos.RepoUsuarios

class JoitsBootstrap implements Bootstrap {
	override run() {
		// val RepoUsuarios repoUsuarios = RepoUsuarios.instance
		var alezcano = new Usuario() => [
			nombre = "Alberto"
			apellido = "Lezcano"
			edad = 26
			saldo = 1000
			usuario = "alezcano"
			login = "1234"
		]

		this.crearUsuarios(alezcano)

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
//		// amigos
//		alezcano.amigos.addAll(dsalamida, arosales)
//		dsalamida.amigos.addAll(alezcano, arosales)
//		arosales.amigos.addAll(alezcano, dsalamida)
//		// Update con amigos
//		crearUsuarios(alezcano)
//		crearUsuarios(dsalamida)
//		crearUsuarios(arosales)
	// amigos
//		alezcano.amigos.addAll(dsalamida, arosales)
//		dsalamida.amigos.addAll(alezcano, arosales)
//		arosales.amigos.addAll(alezcano, dsalamida)
//		// RepoUsuarios
//		repoUsr.create(alezcano)
//		println("usuario alezcano creado")
//		repoUsr.create(dsalamida)
//		println("usuario dsalamida creado")
//		repoUsr.create(arosales)
//		println("usuario arosales creado")
//		repoUsr.create(chinwenwencha)
//		println("usuario chinwenwencha creado")
//		repoUsr.create(elgato)
//		println("usuario elgato creado")
//		// Funciones
//		val funcionMiercoles = new Funcion() => [
//			hora = LocalDateTime.of(2019, 03, 06, 13, 30)
//			sala = "2"
//		]
//		val funcionFinde = new Funcion() => [
//			hora = LocalDateTime.of(2019, 03, 03, 13, 30)
//			sala = "12"
//		]
//		val funcionLunes = new Funcion() => [
//			hora = LocalDateTime.of(2019, 03, 04, 13, 30)
//			sala = "6"
//		]
//		// Pelis y Sagas
//		val RepoProyecciones repoProy = RepoProyecciones.instance
//		val batman = new Pelicula() => [
//			titulo = "Batman asciende"
//			añoRodaje = 2010
//			puntaje = 5
//			genero = "Accion"
//			funciones.addAll(funcionMiercoles, funcionFinde, funcionLunes)
//		]
//		val superman = new Pelicula() => [
//			titulo = "Superman"
//			añoRodaje = 2012
//			puntaje = 3
//			genero = "Accion"
//			funciones.add(funcionMiercoles)
//		]
//		val avengers1 = new Pelicula() => [
//			titulo = "Avengers"
//			añoRodaje = 2010
//			puntaje = 5
//			genero = "Accion"
//			funciones.addAll(funcionFinde, funcionLunes)
//		]
//		val avengers2 = new Pelicula() => [
//			titulo = "Avengers 2"
//			añoRodaje = 2012
//			puntaje = 4
//			genero = "Accion"
//			funciones.addAll(funcionMiercoles, funcionLunes)
//		]
//		val avengers3 = new Pelicula() => [
//			titulo = "Avengers 3"
//			añoRodaje = 2014
//			puntaje = 5
//			genero = "Accion"
//			funciones.addAll(funcionMiercoles, funcionFinde)
//		]
//		val volverAlFuturo1 = new Pelicula() => [
//			titulo = "Volver al futuro"
//			añoRodaje = 1989
//			puntaje = 4
//			genero = "Aventura"
//			funciones.add(funcionLunes)
//		]
//		val volverAlFuturo2 = new Pelicula() => [
//			titulo = "Volver al futuro 2"
//			añoRodaje = 1991
//			puntaje = 5
//			genero = "Aventura"
//			funciones.add(funcionFinde)
//		]
//		val volverAlFuturo3 = new Pelicula() => [
//			titulo = "Volver al futuro 3"
//			añoRodaje = 1992
//			puntaje = 4
//			genero = "Aventura"
//			funciones.addAll(funcionMiercoles, funcionLunes, funcionFinde)
//		]
//		val volverAlFuturo = new Saga() => [
//			titulo = "Saga Volver al futuro"
//			añoRodaje = 1989
//			puntaje = 4
//			nivelClasico = 50
//			peliculas.addAll(volverAlFuturo1, volverAlFuturo2, volverAlFuturo3)
//			funciones.addAll(funcionMiercoles, funcionLunes)
//		]
//
//		println("funcion miercoles agregado a Avengers 1")
//		// pelis vistas
//		arosales.tickets.add(new Ticket() => [pelicula = batman])
//		arosales.tickets.add(new Ticket() => [pelicula = volverAlFuturo])
//		repoProy.create(batman)
//		println("pelicula batman creado")
//		repoProy.create(volverAlFuturo1)
//		println("pelicula volver al futuro creada")
//		repoProy.create(volverAlFuturo2)
//		println("pelicula volver al futuro 2 creada")
//		repoProy.create(volverAlFuturo3)
//		println("pelicula volver al futuro 3 creada")
//		repoProy.create(volverAlFuturo)
//		println("saga volver al futuro creada")
//		repoProy.create(superman)
//		println("pelicula superman creado")
//		repoProy.create(avengers1)
//		println("pelicula Avengers creada")
//		repoProy.create(avengers2)
//		println("pelicula Avengers 2 creada")
//		repoProy.create(avengers3)
//		println("pelicula Avengers 3 creada")
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
