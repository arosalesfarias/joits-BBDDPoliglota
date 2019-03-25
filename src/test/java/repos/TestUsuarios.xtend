package repos

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import domain.Usuario
import org.junit.After
import exceptions.BusinessException

class TestUsuarios {
	RepoUsuarios repo = RepoUsuarios.instance
	Usuario alezcano
	Usuario dsalamida
	Usuario arosales

	@Before
	def void init() {
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
		repo.create(alezcano)
	}

	@After
	def void finish() {
		repo.elementos.clear
		repo.proximoId = 0
	}

	@Test
	def void arrancoConUnUsuarioEnRepo() {
		Assert.assertEquals(repo.elementos.length, 1)
	}

	@Test
	def void agregoUnUsuarioAlRepoYTieneId2() {
		repo.create(dsalamida)
		Assert.assertEquals(dsalamida.id, 2)
	}

	@Test
	def void agregoUnUsuarioAlRepoYTieneId3() {
		repo.create(dsalamida)
		repo.create(arosales)
		Assert.assertEquals(arosales.id, 3)
	}

	@Test
	def void agregoUsuarioYElRepoTiene2Elementos() {
		repo.create(dsalamida)
		Assert.assertEquals(repo.elementos.length, 2)
	}

	@Test(expected=typeof(BusinessException))
	def void agregoUnUsuarioNoValidoParaElRepo() {
		var nulo = new Usuario() => [
			nombre = "Nulo"
			apellido = "Null"
			edad = 8
			saldo = 12.0
			usuario = ""
			login = "3333"
		]
		repo.create(nulo)
	}

	@Test
	def void eliminoUnicoUsuarioDelRepoPeroNoReiniciaContador() {
		repo.delete(alezcano)
		Assert.assertEquals(repo.elementos.length, 0)
		Assert.assertFalse(repo.proximoId == 0)
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
		repo.update(alezcano, alezcano2)
		Assert.assertEquals(repo.searchById(1).nombre, "Alberto Reload")
	}

	@Test
	def void noExisteIdEnRepoParaUnUsuarioQueNoFueAgregado() {
		Assert.assertFalse(repo.existeId(dsalamida))
	}

	@Test
	def void buscoPorIdUnUsuario() {
		Assert.assertTrue(repo.searchById(1) === alezcano)
	}

}
