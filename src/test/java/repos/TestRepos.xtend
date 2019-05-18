package repos

import org.junit.Test
import org.junit.Assert
import domain.Usuario
import exceptions.BusinessException
import datos.TestPadre
import domain.Pelicula

class TestRepos extends TestPadre {

	@Test
	def void arrancoConUnUsuarioEnrepoUsr() {
		Assert.assertEquals(repoUsr.searchByString(new Usuario => [id = 99L], "").length, 2)
	}

	@Test
	def void creoUnUsuarioAlrepoUsrYTieneId2() {
		Assert.assertEquals(repoUsr.devolverUsuario(dsalamida).id, 2)
	}

//	@Test
//	def void agregoUsuarioYElrepoUsrTiene2Elementos() {
//		repoUsr.create(dsalamida)
//		Assert.assertEquals(repoUsr.elementos.length, 2)
//	}
//
//	@Test(expected=typeof(BusinessException))
//	def void agregoUnUsuarioNoValidoParaElrepoUsr() {
//		var nulo = new Usuario() => [
//			nombre = "Nulo"
//			apellido = "Null"
//			edad = 8
//			saldo = 12
//			usuario = ""
//			login = "3333"
//		]
//		repoUsr.create(nulo)
//	}
//
//	@Test
//	def void eliminoUnicoUsuarioDelrepoUsrPeroNoReiniciaContador() {
//		repoUsr.delete(alezcano)
//		Assert.assertEquals(repoUsr.elementos.length, 0)
//		Assert.assertFalse(repoUsr.proximoId == 0)
//	}
//	@Test
//	def void actualizoNombreDeUsuario() {
//		val listaUsuarios = repoUsr.searchByString(new Usuario=>[id = 99L],"Alberto")
//		println(listaUsuarios)
//		val usuarioBD = listaUsuarios.head
//		print(usuarioBD)
//		usuarioBD.nombre= "ablerto reload"
//		repoUsr.update(usuarioBD)
//		Assert.assertEquals(repoUsr.searchById(1).nombre, "ablerto reload")
//	}
//
//	@Test
//	def void noExisteIdEnrepoUsrParaUnUsuarioQueNoFueAgregado() {
//		Assert.assertFalse(repoUsr.existeId(dsalamida))
//	}
//
	@Test
	def void buscoPorExampleUsuario() {
		val texto = repoUsr.searchByExample(alezcano).head.usuario
		Assert.assertTrue(texto.equals("alezcano"))
	}

//	@Test
//	def void buscoVolverYMeAparece3PeliculasY1Saga() {
//		Assert.assertEquals(3 + 1, repoProy.searchByExample(new Pelicula =>[titulo = "Volver"]).length)
//	}
//
//	@Test
//	def void buscoBatYMeAparece1LaPeliculaBatman() {
//		Assert.assertEquals(1, repoProy.searchByExample(new Pelicula =>[titulo = "bat"]).length)
//	}
//
//	@Test
//	def void buscoSagaMeApareceLaUnica() {
//		Assert.assertEquals(1, repoProy.searchByExample(new Pelicula =>[titulo = "Saga"]).length)
//	}
//
//	@Test
//	def void noAgregoValorABuscarMeDebenAparecerTodos() {
//		Assert.assertEquals(5, repoProy.searchByExample(new Pelicula =>[titulo = ""]).length)
//	}
}
