package datos

import domain.Pelicula
import domain.Proyeccion
import domain.Saga
import domain.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.junit.Before
import reposHibernate.RepoUsuarios

@Accessors
class TestPadre {
	RepoUsuarios repoUsr = RepoUsuarios.instance
	Usuario alezcano
	Usuario dsalamida
	Usuario arosales

	// RepoProyecciones repoProy = RepoProyecciones.instance
	Pelicula batman
	Pelicula volverAlFuturo1
	Pelicula volverAlFuturo2
	Pelicula volverAlFuturo3
	Saga volverAlFuturo

	new() {
		inicioVariables
	}

	@Before
	def void init() {
		inicioRepoUsuarios
		inicioRepoProyecciones
	}

//
//	@After
//	def void finish() {
//		repoUsr.limpiar
//		repoProy.limpiar
//	}
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
		crearUsuarios(alezcano)
		crearUsuarios(dsalamida)
	}

	def inicioRepoProyecciones() {
		crearProyeccion(batman)
		crearProyeccion(volverAlFuturo1)
		crearProyeccion(volverAlFuturo2)
		crearProyeccion(volverAlFuturo3)
		crearProyeccion(volverAlFuturo)
	}

	def void crearUsuarios(Usuario usuario) {
		val listaUsuarios = repoUsr.searchByExample(usuario)
		if (listaUsuarios.isEmpty) {
			repoUsr.create(usuario)
			println("Usuario " + usuario.usuario + " creado")
		} else {
			val usuarioBD = listaUsuarios.head
			usuario.id = usuarioBD.id
			repoUsr.update(usuario)
		}
	}

	def crearProyeccion(Proyeccion proy) {
		/*val repoProy = RepoProyecciones.instance
		 * val listaProy = repoProy.searchByExample(proy)
		 * if (listaProy.isEmpty) {
		 * 	repoProy.create(proy)
		 * 	println("Proyeccion " + proy.titulo + " creada")
		 * } else {
		 * 	val proyBD = listaProy.head
		 * 	proy.id = proyBD.id
		 * 	repoProy.update(proy)
		 }*/
	}
}
