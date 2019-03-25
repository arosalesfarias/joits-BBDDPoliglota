package application

import org.uqbar.arena.bootstrap.Bootstrap
import domain.Usuario
import repos.RepoUsuarios

class JoitsBootstrap implements Bootstrap{
	override run() {
		val RepoUsuarios repo = RepoUsuarios.instance
		var alezcano = new Usuario() => [
			nombre = "Alberto"
			apellido = "Lezcano"
			edad = 26
			saldo = 1000.0
			usuario = "alezcano"
			login = "1234"
		]
		var dsalamida = new Usuario() => [
			nombre = "Diego"
			apellido = "Salamida"
			edad = 32
			saldo = 2500.0
			usuario = "dsalamida"
			login = "dsalamida"
		]
		var arosales = new Usuario() => [
			nombre = "Ariel"
			apellido = "Rosales"
			edad = 8
			saldo = 12.0
			usuario = "arosales"
			login = "3333"
		]
		repo.create(alezcano)
		println("usuario alezcano creado")
		repo.create(dsalamida)
		println("usuario dsalamida creado")
		repo.create(arosales)
		println("usuario arosales creado")
	}

	override isPending() {
		true
	}
}