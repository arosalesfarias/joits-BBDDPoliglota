package exceptions

class BusinessException extends Exception {
	
	new(String msg) {
		super("Error de negocio: "+msg)
	}
	
}