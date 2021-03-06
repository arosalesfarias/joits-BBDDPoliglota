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
import reposNeo4j.RepoPeliculas
import RepoManager.RepoManagerUsuario
import RepoManager.RepoManagerProyeccion

@Accessors
@Observable
class ModeloBusqueda extends BuscaSugiereModel {
	Funcion funcionSeleccionada
	List<Ticket> carrito = new ArrayList<Ticket>
	Ticket entrada
	float precio = 0
	List<Proyeccion> lista
	List<Proyeccion> sugeridos = newArrayList
	Proyeccion entidadSeleccionada
	AbstractRepository<Proyeccion> repoProyecciones = ApplicationContext.instance.getSingleton(RepoProyecciones)

	new() {
		super(RepoManagerUsuario.instance.usuarioLogueado)
		inicializarLista
		pelisSugeridas
		carrito = Carrito.instance.recuperarCarrito(RepoManagerUsuario.instance.usuarioLogueado)
	}

	def pelisSugeridas() {
		sugeridos = RepoManagerProyeccion.instance.pelisSugeridas(usuario)
		//(RepoPeliculas.instance.getRecomendados(usuario)).take(5).toList
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
		entrada.usuario = this.usuario
	}

	def void setFuncionSeleccionada(Funcion funcion) {
		funcionSeleccionada = funcion
		crearTicket
		precio = valorDeLaEntrada
	}

	def void setEntidadSeleccionada(Proyeccion proyeccion) {
		entidadSeleccionada = repoProyecciones.searchById(proyeccion)
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
