package applicationModel

import domain.Funcion
import domain.Proyeccion
import domain.Ticket
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import repos.RepoProyecciones
import domain.Usuario
import domain.Saga
import domain.Pelicula

@Accessors
@Observable
class ModeloBusqueda extends BuscaSugiereModel {
	Funcion funcionSeleccionada
	List<Ticket> carrito = new ArrayList<Ticket>
	Ticket entrada
	float precio = 0
	List<Proyeccion> lista
	List<Proyeccion> sugeridos
	Proyeccion entidadSeleccionada

	new(Usuario user) {
		super(user)
		sugeridos = RepoProyecciones.instance.listaSugeridos(3)
	}

	def void setEntidadSeleccionada(Proyeccion proyeccion) {
		if (proyeccion instanceof Pelicula) {
			entidadSeleccionada = RepoProyecciones.instance.searchByIdPelicula(proyeccion.id)
		} else if (proyeccion instanceof Saga) {
			entidadSeleccionada = RepoProyecciones.instance.searchByIdSaga(proyeccion.id)
		}

	}

	override void search() {
		lista = RepoProyecciones.instance.searchByExample(new Saga() => [titulo = valorBusqueda]) // RepoProyecciones.instance.search(valorBusqueda)
	}

	def void clearUsuario() {
		usuario = null
	}

	def clearSeleccionados() {
		clearEntity
		funcionSeleccionada = null
	}

	@Dependencies("carrito")
	def getCantidadTicketsAComprar() {
		carrito.size
	}

	@Dependencies("carrito")
	def getCarritoNoEstaVacio() {
		!carrito.isEmpty
	}

	override agregar() {
		this.crearTicket
		carrito.add(entrada)
		clearSeleccionados()
	}

	def crearTicket() {
		entrada = (new Ticket => [
			funcion = funcionSeleccionada
			pelicula = entidadSeleccionada
		])
	}

	def void setFuncionSeleccionada(Funcion funcion) {
		funcionSeleccionada = funcion
		crearTicket
		precio = valorDeLaEntrada
	}

	@Dependencies("entidadSeleccionada")
	def getHayUnoSeleccionado() {
		entidadSeleccionada !== null
	}

	@Dependencies("funcionSeleccionada")
	def float valorDeLaEntrada() {
		if (funcionSeleccionada === null) {
			0
		} else {
			entrada.precio
		}
	}

	override void clearEntity() {
		entidadSeleccionada = null
	}
}
