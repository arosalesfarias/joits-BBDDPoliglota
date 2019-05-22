package RepoJedis

import domain.Funcion
import domain.Proyeccion
import domain.Ticket

class Transformer {

	def String convertirFuncionAString(Funcion funcion) {
		funcion.id.toString + funcion.hora.toString + funcion.sala
	}

	def String convertirProyeccionAString(Proyeccion proyeccion) {
		proyeccion.id.toString + proyeccion.titulo + proyeccion.añoRodaje.toString + proyeccion.puntaje.toString +
			proyeccion.genero + proyeccion.funciones.map[f|convertirFuncionAString(f)]
	}

	def String convertirDeTicketAString(Ticket ticket) {
		convertirFuncionAString(ticket.funcion) + convertirProyeccionAString(ticket.pelicula)
	}
}
