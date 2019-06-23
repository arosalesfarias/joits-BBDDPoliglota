package reposNeo4j

import org.eclipse.xtend.lib.annotations.Accessors
import org.neo4j.ogm.config.Configuration
import org.neo4j.ogm.session.SessionFactory
import builderRepositorio.RepoGenerico

@Accessors
abstract class AbstractRepoNeo4J<T> implements RepoGenerico<T> {

	public static int BUSQUEDA_ELEMENTO = 0
	public static int BUSQUEDA_ELEMENTO_RELACIONES = 1

	static Configuration configuration = new Configuration.Builder().uri("bolt://localhost").credentials("neo4j",
		"root").build()

	public static SessionFactory sessionFactory = new SessionFactory(configuration, "domain")

	protected def getSession() {
		sessionFactory.openSession
	}

	abstract def Class<T> getEntityType()

	abstract def T getById(T t)

	override createIfNotExists(T t) {
		session.save(t, BUSQUEDA_ELEMENTO_RELACIONES)
		return t
	}

	override delete(T t) {
		session.delete(t)
		return t
	}

	override update(T t) {
		this.createIfNotExists(t)
	}
}
