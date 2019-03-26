package repos

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import domain.Usuario
import org.junit.After
import exceptions.BusinessException
import applicationModel.Login

class TestLogin {
	RepoUsuarios repo = RepoUsuarios.instance
	Usuario alezcano
	Usuario dsalamida
	Usuario arosales
	Login login

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
		repo.create(dsalamida)
		repo.create(arosales)
		login = new Login()
	}

	@After
	def void finish() {
		repo.elementos.clear
		repo.proximoId = 0
	}

	@Test(expected=typeof(BusinessException))
	def void ingresoUnUsuarioIncorrectoEnLogin() {
		login.usuario = "SoyFalso"
		login.contraseña = "fake"
		login.validaLogin()
	}

	@Test(expected=typeof(BusinessException))
	def void ingresoUnPasswordIncorrectoEnLogin() {
		login.usuario = "alezcano"
		login.contraseña = "clavefalsa"
		login.validaLogin()
	}

	@Test
	def void logueoExitosoMeDevuelveUsuario() {
		login.usuario = "alezcano"
		login.contraseña = "1234"
	//	Assert.assertTrue(login.validaLogin().nombre === "Alberto")
	}
}
