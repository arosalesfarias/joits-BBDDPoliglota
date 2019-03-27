package applicationModel

import domain.Usuario
import org.uqbar.commons.model.annotations.Observable
import domain.Proyeccion

@Observable
class GrillaPelicula {
	Proyeccion pelicula
	Usuario usuario

	new(Proyeccion _peli, Usuario _usuario) {
		pelicula = _peli
		usuario = _usuario
	}

	def nombre() {
		pelicula.titulo
	}

	def anioRodaje() {
		pelicula.añoRodaje
	}

	def raiting() {
		pelicula.puntaje
	}

	def genero() {
		pelicula.genero
	}
}
