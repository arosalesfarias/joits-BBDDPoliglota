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

@Accessors
@Observable
class ModeloBusqueda extends BuscaSugiereModel<Proyeccion> {
	Funcion funcionSeleccionada
	List<Ticket> carrito = new ArrayList<Ticket>
	Ticket entrada
	float precio = 0
	
	new(Usuario user){
		super(user)
		sugeridos = RepoProyecciones.instance.elementos
	}

	override void search() {
		lista = RepoProyecciones.instance.search(valorBusqueda)	
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

	def pelisSugeridas() {
		RepoProyecciones.instance.peliculasSugeridas
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

	@Dependencies("funcionSeleccionada")
	def float valorDeLaEntrada() {
		if (funcionSeleccionada === null) {
			0
		} else {
			entrada.precio
		}
	}
}
