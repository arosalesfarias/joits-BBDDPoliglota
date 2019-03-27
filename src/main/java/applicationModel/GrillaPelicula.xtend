package applicationModel

import domain.Pelicula
import domain.Usuario
import org.uqbar.commons.model.annotations.Observable

@Observable
class GrillaPelicula {
	Pelicula pelicula
	Usuario usuario

	new(Pelicula _peli, Usuario _usuario) {
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
