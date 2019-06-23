package builderRepositorio

interface RepoGenerico<T> {

	def createIfNotExists(T t) {}

	def update(T t) {}

	def delete(T t) {}
}
