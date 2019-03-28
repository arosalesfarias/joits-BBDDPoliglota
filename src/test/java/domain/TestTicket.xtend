package domain

import domain.Tiket
import domain.Pelicula
import domain.Saga
import domain.Funcion
import java.time.LocalDateTime
import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestTicket {

	Pelicula volverAlFururo1
	Pelicula volverAlFururo2
	Pelicula volverAlFururo3
	Saga sagaVolverAlFuturo
	Funcion funcionPelicula1
	Funcion funcionPelicula2
	Funcion funcionPelicula3
	Funcion funcionSaga
	Tiket entrada1
	Tiket entrada2
	Tiket entrada3
	Tiket entradaSaga

	@Before
	def void init() {

		volverAlFururo1 = new Pelicula => [
			puntaje = 7
			titulo = "Volver al futuro 1"
			añoRodaje = 1985
			genero = "aventura"
		]

		volverAlFururo2 = new Pelicula => [
			puntaje = 9
			titulo = "Volver al futuro 2"
			añoRodaje = 1987
			genero = "aventura"
		]

		volverAlFururo3 = new Pelicula => [
			puntaje = 10
			titulo = "Volver al futuro 3"
			añoRodaje = 1989
			genero = "aventura"
		]

		sagaVolverAlFuturo = new Saga => [
			puntaje = 10
			añoRodaje = 1990
			nivelClasico = 20
			peliculas.add(volverAlFururo1)
			peliculas.add(volverAlFururo2)
			peliculas.add(volverAlFururo3)
		]

		funcionPelicula1 = new Funcion => [
			hora = LocalDateTime.of(2019, 03, 24, 18, 30)
			sala = "Rivadavia"
		]

		funcionPelicula2 = new Funcion => [
			hora = LocalDateTime.of(2019, 03, 13, 17, 30)
			sala = "Rivadavia"
		]

		funcionPelicula3 = new Funcion => [
			hora = LocalDateTime.of(2019, 03, 25, 18, 30)
			sala = "Rivadavia"
		]

		funcionSaga = new Funcion => [
			hora = LocalDateTime.of(2019, 03, 24, 18, 30)
			sala = "Rivadavia"
		]

		entrada1 = new Tiket => [
			pelicula = volverAlFururo1
			funcion = funcionPelicula1
		]

		entrada2 = new Tiket => [
			pelicula = volverAlFururo2
			funcion = funcionPelicula2
		]

		entrada3 = new Tiket => [
			pelicula = volverAlFururo3
			funcion = funcionPelicula3
		]

		entradaSaga = new Tiket => [
			pelicula = sagaVolverAlFuturo
			funcion = funcionSaga
		]
	}

	@Test
	def void comprobarPrecioFuncion1() {
		Assert.assertEquals(entrada1.precio, (120 + 30), 0.1)
	}

	@Test
	def void comprobarPrecioFuncion2() {
		Assert.assertEquals(entrada2.precio, (50 + 30), 0.1)
	}

	@Test
	def void comprobarPrecioFuncion3() {
		Assert.assertEquals(entrada3.precio, (80 + 30), 0.1)
	}

	@Test
	def void comprobarPrecioFuncionSaga() {
		Assert.assertEquals(entradaSaga.precio, (120 + 30 + 20), 0.1)
	}
}
