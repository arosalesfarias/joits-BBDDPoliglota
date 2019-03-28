package domain

import datos.TestPadre
import org.junit.Test
import repos.RepoUsuarios
import org.junit.Assert

class TestUsuario extends TestPadre {
	def void agregoTodosLosUsuarios() {
		repoUsr.create(dsalamida)
		repoUsr.create(arosales)
	}

	@Test
	def void lezcanoBuscaAmigosYAparecenTodosMenosEl() {
		agregoTodosLosUsuarios()
		Assert.assertEquals(RepoUsuarios.instance.elementos.length - 1,alezcano.buscarPersonas("").length)
	}
	@Test
	def void lezcanoBuscaADiegoPoniendoElUsuario() {
		agregoTodosLosUsuarios()
		Assert.assertEquals(1,alezcano.buscarPersonas("dsalamida").length)
	}
	@Test
	def void lezcanoAgregaUnAmigoYVuelveABuscarPersonas() {
		agregoTodosLosUsuarios()
		alezcano.agregarAmigo(dsalamida)
		Assert.assertEquals(RepoUsuarios.instance.elementos.length - 2,alezcano.buscarPersonas("").length)
	}
}
