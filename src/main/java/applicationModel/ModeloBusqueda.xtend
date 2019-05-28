package applicationModel

import RepoJedis.Carrito
import domain.Funcion
import domain.Proyeccion
import domain.Saga
import domain.Ticket
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import reposHibernate.RepoUsuarios
import reposMorphia.AbstractRepository
import reposMorphia.RepoProyecciones

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
	AbstractRepository<Proyeccion> repoProyecciones = ApplicationContext.instance.getSingleton(RepoProyecciones)

	new() {
		super(RepoUsuarios.instance.usuarioLogueado)
		inicializarLista
		sugeridos = lista.take(3).toList
		Carrito.instance.recuperarCarrito(RepoUsuarios.instance.usuarioLogueado)
	}

	def inicializarLista() {
		lista = repoProyecciones.searchByExample(new Saga() => [titulo = valorBusqueda])
	}

	override void search() {
		this.clearSeleccionados
		inicializarLista
	}

	def void clearUsuario() {
		usuario = null
	}

	def clearSeleccionados() {
		funcionSeleccionada = null
		clearEntity
		
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
		Carrito.instance.salvarCarrito(usuario, entrada)
		clearSeleccionados()
	}

	def crearTicket() {
		entrada = new Ticket(funcionSeleccionada, entidadSeleccionada)
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
