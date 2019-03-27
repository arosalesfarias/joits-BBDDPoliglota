package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
public abstract class Proyeccion extends Entidad{
	String titulo
	int añoRodaje
	float puntaje
	
	def float precioBase ()
}