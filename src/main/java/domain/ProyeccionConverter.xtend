package domain

import javax.persistence.AttributeConverter
import reposMorphia.AbstractRepository
import org.uqbar.commons.applicationContext.ApplicationContext
import reposMorphia.RepoProyecciones

class ProyeccionConverter implements AttributeConverter<Proyeccion, String> {
	AbstractRepository<Proyeccion> repoProyecciones = ApplicationContext.instance.getSingleton(RepoProyecciones)

	override convertToDatabaseColumn(Proyeccion attribute) {
		if(!attribute.titulo.nullOrEmpty) return attribute.titulo
	}

	override convertToEntityAttribute(String dbData) {
		return repoProyecciones.searchByExample(new Saga() => [titulo = dbData]).head
	}

}
