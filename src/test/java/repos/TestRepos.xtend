package repos

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import domain.Usuario
import org.junit.After
import exceptions.BusinessException
import repos.RepoUsuarios
import repos.RepoProyecciones
import domain.Pelicula
import domain.Saga

class TestRepos {
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

	@Before
	def void init() {
		usuarios()
		pelis()
	}

	@After
	def void finish() {
		repoUsr.limpiar
		repoProy.limpiar
	}

	@Test
	def void arrancoConUnUsuarioEnrepoUsr() {
		Assert.assertEquals(repoUsr.elementos.length, 1)
	}

	@Test
	def void agregoUnUsuarioAlrepoUsrYTieneId2() {
		repoUsr.create(dsalamida)
		Assert.assertEquals(dsalamida.id, 2)
	}

	@Test
	def void agregoUnUsuarioAlrepoUsrYTieneId3() {
		repoUsr.create(dsalamida)
		repoUsr.create(arosales)
		Assert.assertEquals(arosales.id, 3)
	}

	@Test
	def void agregoUsuarioYElrepoUsrTiene2Elementos() {
		repoUsr.create(dsalamida)
		Assert.assertEquals(repoUsr.elementos.length, 2)
	}

	@Test(expected=typeof(BusinessException))
	def void agregoUnUsuarioNoValidoParaElrepoUsr() {
		var nulo = new Usuario() => [
			nombre = "Nulo"
			apellido = "Null"
			edad = 8
			saldo = 12.0
			usuario = ""
			login = "3333"
		]
		repoUsr.create(nulo)
	}

	@Test
	def void eliminoUnicoUsuarioDelrepoUsrPeroNoReiniciaContador() {
		repoUsr.delete(alezcano)
		Assert.assertEquals(repoUsr.elementos.length, 0)
		Assert.assertFalse(repoUsr.proximoId == 0)
	}

	@Test
	def void actualizoNombreDeUsuario() {
		var alezcano2 = new Usuario() => [
			nombre = "Alberto Reload"
			apellido = "Lezcano"
			edad = 26
			saldo = 1000.0
			usuario = "alezcano"
			login = "1234"
		]
		repoUsr.update(alezcano, alezcano2)
		Assert.assertEquals(repoUsr.searchById(1).nombre, "Alberto Reload")
	}

	@Test
	def void noExisteIdEnrepoUsrParaUnUsuarioQueNoFueAgregado() {
		Assert.assertFalse(repoUsr.existeId(dsalamida))
	}

	@Test
	def void buscoPorIdUnUsuario() {
		Assert.assertTrue(repoUsr.searchById(1) === alezcano)
	}

	@Test
	def void buscoVolverYMeAparece3PeliculasY1Saga() {
		Assert.assertEquals(3 + 1, repoProy.search("Volver").length)
	}

	@Test
	def void buscoBatYMeAparece1LaPeliculaBatman() {
		Assert.assertEquals(1, repoProy.search("Bat").length)
	}

	@Test
	def void buscoSagaMeApareceLaUnica() {
		Assert.assertEquals(1, repoProy.search("Saga").length)
	}

	@Test
	def void noAgregoValorABuscarMeDebenAparecerTodos() {
		Assert.assertEquals(repoProy.elementos.length, repoProy.search("").length)
	}

	def usuarios() {
		alezcano = new Usuario() => [
			nombre = "Alberto"
			apellido = "Lezcano"
			edad = 26
			saldo = 1000.0
			usuario = "alezcano"
			login = "1234"
		]
		dsalamida = new Usuario() => [
			nombre = "Diego"
			apellido = "Salamida"
			edad = 32
			saldo = 2500.0
			usuario = "dsalamida"
			login = "dsalamida"
		]
		arosales = new Usuario() => [
			nombre = "Ariel"
			apellido = "Rosales"
			edad = 8
			saldo = 12.0
			usuario = "arosales"
			login = "3333"
		]
		repoUsr.create(alezcano)
	}

	def pelis() {
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
		repoProy.create(batman)
		repoProy.create(volverAlFuturo1)
		repoProy.create(volverAlFuturo2)
		repoProy.create(volverAlFuturo3)
		repoProy.create(volverAlFuturo)
	}

}
