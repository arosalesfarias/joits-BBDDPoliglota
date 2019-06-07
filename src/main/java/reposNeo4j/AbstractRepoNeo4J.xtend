package reposNeo4j

import org.eclipse.xtend.lib.annotations.Accessors
import org.neo4j.ogm.config.Configuration
import org.neo4j.ogm.session.SessionFactory

@Accessors
abstract class AbstractRepoNeo4J<T> {

	static Configuration configuration = new Configuration.Builder()
	.uri("bolt://localhost")
	.credentials("neo4j","root")
	.build()

	public static SessionFactory sessionFactory = new SessionFactory(configuration, "domain")

	protected def getSession() {
		sessionFactory.openSession
	}

	def crear(T t) {
		session.save(t)
	}
}
