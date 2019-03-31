package datos

import repos.RepoUsuarios
import domain.Usuario
import repos.RepoProyecciones
import domain.Pelicula
import domain.Saga
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Before
import org.junit.After

@Accessors
class TestPadre {
	RepoUsuarios repoUsr = RepoUsuarios.instance
	Usuario alezcano
	Usuario dsalamida
	Usuario arosales

	RepoProyecciones repoProy = RepoProyecciones.instance
	Pelicula batman
	Pelicula volverAlFuturo1
	Pelicula volverAlFuturo2
	Pelicula volverAlFuturo3
	Saga volverAlFuturo

	new() {
		inicioVariables()
	}

	@Before
	def void init() {
		inicioRepoUsuarios()
		inicioRepoProyecciones()
	}

	@After
	def void finish() {
		repoUsr.limpiar
		repoProy.limpiar
	}

	def inicioVariables() {
		// Usuarios
		alezcano = new Usuario() => [
			nombre = "Alberto"
			apellido = "Lezcano"
			edad = 26
			saldo = 1000
			usuario = "alezcano"
			login = "1234"
		]
		dsalamida = new Usuario() => [
			nombre = "Diego"
			apellido = "Salamida"
			edad = 32
			saldo = 2500
			usuario = "dsalamida"
			login = "dsalamida"
		]
		arosales = new Usuario() => [
			nombre = "Ariel"
			apellido = "Rosales"
			edad = 8
			saldo = 12
			usuario = "arosales"
			login = "3333"
		]
		// Pelis y sagas
		batman = new Pelicula() => [
			titulo = "Batman asciende"
			añoRodaje = 2010
			puntaje = 5
			genero = "Accion"
		]
		volverAlFuturo1 = new Pelicula() => [
			titulo = "Volver al futuro"
			añoRodaje = 1989
			puntaje = 4
			genero = "Aventura"
		]
		volverAlFuturo2 = new Pelicula() => [
			titulo = "Volver al futuro 2"
			añoRodaje = 1991
			puntaje = 5
			genero = "Aventura"
		]
		volverAlFuturo3 = new Pelicula() => [
			titulo = "Volver al futuro 3"
			añoRodaje = 1992
			puntaje = 4
			genero = "Aventura"
		]
		volverAlFuturo = new Saga() => [
			titulo = "Saga Volver al futuro"
			añoRodaje = 1989
			puntaje = 4
			nivelClasico = 50
			peliculas.addAll(volverAlFuturo1, volverAlFuturo2, volverAlFuturo3)
		]
	}

	def inicioRepoUsuarios() {
		repoUsr.create(alezcano)
	}

	def inicioRepoProyecciones() {
		repoProy.create(batman)
		repoProy.create(volverAlFuturo1)
		repoProy.create(volverAlFuturo2)
		repoProy.create(volverAlFuturo3)
		repoProy.create(volverAlFuturo)
	}
}
