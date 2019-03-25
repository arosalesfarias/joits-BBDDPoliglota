package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Entidad {
	int Id
	
	def Boolean validateCreate()
}