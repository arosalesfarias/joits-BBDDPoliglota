package repos

import org.junit.Test
import org.junit.Assert
import domain.Usuario
import exceptions.BusinessException
import datos.TestPadre

class TestRepos extends TestPadre {

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

}
