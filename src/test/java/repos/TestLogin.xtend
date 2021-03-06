package repos

import applicationModel.Login
import domain.Usuario
import org.junit.After
import org.junit.Before
import reposHibernate.RepoUsuarios

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

//	@Test(expected=typeof(UserException))
//	def void ingresoUnUsuarioIncorrectoEnLogin() {
//
//	}
//
//	@Test(expected=typeof(UserException))
//	def void ingresoUnPasswordIncorrectoEnLogin() {
//
//	}
//
//	@Test
//	def void logueoExitosoMeDevuelveUsuario() {
//
//	}
}
