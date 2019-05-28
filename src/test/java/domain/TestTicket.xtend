package domain

import domain.Pelicula
import domain.Saga
import domain.Funcion
import java.time.LocalDateTime
import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestTicket {

	Pelicula volverAlFuturo1
	Pelicula volverAlFuturo2
	Pelicula volverAlFuturo3
	Saga sagaVolverAlFuturo
	Funcion funcionDomingo
	Funcion funcionMiercoles
	Funcion funcionLunes
	Funcion funcionSagaDomingo
	Ticket entradaDomingo
	Ticket entradaMiercoles
	Ticket entradaLunes
	Ticket entradaSagaDomingo

	@Before
	def void init() {

		volverAlFuturo1 = new Pelicula => [
			puntaje = 7
			titulo = "Volver al futuro 1"
			añoRodaje = 1985
			genero = "aventura"
		]

		volverAlFuturo2 = new Pelicula => [
			puntaje = 9
			titulo = "Volver al futuro 2"
			añoRodaje = 1987
			genero = "aventura"
		]

		volverAlFuturo3 = new Pelicula => [
			puntaje = 10
			titulo = "Volver al futuro 3"
			añoRodaje = 1989
			genero = "aventura"
		]

		sagaVolverAlFuturo = new Saga => [
			puntaje = 10
			añoRodaje = 1990
			nivelClasico = 20
			peliculas.add(volverAlFuturo1)
			peliculas.add(volverAlFuturo2)
			peliculas.add(volverAlFuturo3)
		]

		funcionDomingo = new Funcion(LocalDateTime.of(2019, 03, 24, 18, 30), "Rivadavia")

		funcionMiercoles = new Funcion(LocalDateTime.of(2019, 03, 13, 17, 30), "Rivadavia")

		funcionLunes = new Funcion(LocalDateTime.of(2019, 03, 25, 18, 30), "Rivadavia")

		funcionSagaDomingo = new Funcion(LocalDateTime.of(2019, 03, 24, 18, 30), "Rivadavia")

		entradaDomingo = new Ticket(funcionDomingo, volverAlFuturo1)

		entradaMiercoles = new Ticket(funcionMiercoles, volverAlFuturo2)

		entradaLunes = new Ticket(funcionLunes, volverAlFuturo3)

		entradaSagaDomingo = new Ticket(funcionSagaDomingo, sagaVolverAlFuturo)
	}

	@Test
	def void comprueboQueElPrecioDeUnPelicula() {
		Assert.assertEquals(volverAlFuturo1.precioBase, 30, 0.1)
	}

	@Test
	def void comprueboQueElPrecioDeUnaSagaCon3PeliculasYNivelDeClasico20() {
		Assert.assertEquals(sagaVolverAlFuturo.precioBase, 3 * 10 + 20, 0.1)
	}

	@Test
	def void comprueboQueLaFuncionEnFinDeSemanaSale120() {
		Assert.assertEquals(funcionDomingo.precioSegunDia, 120, 0.1)
	}

	@Test
	def void comprueboQueLaFuncionEnMiercolesSale50() {
		Assert.assertEquals(funcionMiercoles.precioSegunDia, 50, 0.1)
	}

	@Test
	def void comprueboQueLaFuncionEnLunesSale80() {
		Assert.assertEquals(funcionLunes.precioSegunDia, 80, 0.1)
	}

	@Test
	def void comprueboQueElPrecioDeUnaFuncion() {
		Assert.assertEquals(volverAlFuturo1.precioBase, 30, 0.1)
	}

	@Test
	def void comprueboQueElPrecioDeUnTicketParaElDomingo() {
		Assert.assertEquals(entradaDomingo.precio, (120 + 30), 0.1)
	}

	@Test
	def void comprueboQueElPrecioDeUnTicketParaElMiercoles() {
		Assert.assertEquals(entradaMiercoles.precio, (50 + 30), 0.1)
	}

	@Test
	def void comprueboQueElPrecioDeUnTicketParaElLunes() {
		Assert.assertEquals(entradaLunes.precio, (80 + 30), 0.1)
	}

	@Test
	def void comprueboQueElPrecioDeUnTicketParaElDomingoDeUnaSaga() {
		Assert.assertEquals(entradaSagaDomingo.precio, (120 + 30 + 20), 0.1)
	}
}
