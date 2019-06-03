Para levantar los procesos config y shard con replicaset
Aclaracion use Windosw 10 Home 64 bits
Utilize cmd (simbolo del sistema) de windows, ya que con powershell y gitbash tuve problemas

1 - Crear estas carpetas:

C:\Users\alber\data\mongodb\sharding\shard1
C:\Users\alber\data\mongodb\sharding\repl1
C:\Users\alber\data\mongodb\sharding\shard2
C:\Users\alber\data\mongodb\sharding\repl2
C:\Users\alber\data\mongodb\sharding\shard3
C:\Users\alber\data\mongodb\sharding\repl3
C:\Users\alber\data\mongodb\sharding\cfg1
C:\Users\alber\data\mongodb\sharding\cfg2

2 - levantar config
mongod --replSet rsConf --configsvr --port 26050 --logpath C:\Users\alber\data\mongodb\sharding\log.cfg1 --logappend --dbpath C:\Users\alber\data\mongodb\sharding\cfg1

mongod --replSet rsConf --configsvr --port 26051 --logpath C:\Users\alber\data\mongodb\sharding\log.cfg2 --logappend --dbpath C:\Users\alber\data\mongodb\sharding\cfg2



3 - levantar los shard + replicaset
mongod --shardsvr --replSet shard1 --dbpath C:\Users\alber\data\mongodb\sharding\shard1 --logpath C:\Users\alber\data\mongodb\sharding\log.shard1 --port 27000 --logappend --smallfiles --oplogSize 50

mongod --shardsvr --replSet shard1 --dbpath C:\Users\alber\data\mongodb\sharding\repl1 --logpath C:\Users\alber\data\mongodb\sharding\log.repl1 --port 27001 --logappend --smallfiles --oplogSize 50

mongod --shardsvr --replSet shard2 --dbpath C:\Users\alber\data\mongodb\sharding\shard2 --logpath C:\Users\alber\data\mongodb\sharding\log.shard2 --port 27100 --logappend --smallfiles --oplogSize 50

mongod --shardsvr --replSet shard2 --dbpath C:\Users\alber\data\mongodb\sharding\repl2 --logpath C:\Users\alber\data\mongodb\sharding\log.repl2 --port 27101 --logappend --smallfiles --oplogSize 50

3 - levantar servicio de ruteo ( Ejecutar cmd como administrador para acceder al puerto )

mongo --port 26050

*Ahora configuraremos el servicio de routing (ejecutar una linea a la vez)

cfg={_id:"rsConf",members:[{_id:0 ,host: "127.0.0.1:26050"}, {_id: 1, host: "127.0.0.1:26051" }]}
rs.initiate(cfg)
exit

4 - Configurar sharding

mongo --port 27000
cfg={_id:"shard1", members:[{_id:0 ,host: "127.0.0.1:27000"}, {_id:1 ,host: "127.0.0.1:27001" }]}
rs.initiate(cfg)
exit


mongo --port 27100
cfg={_id:"shard2", members:[{_id:0 ,host: "127.0.0.1:27100"}, {_id:1 ,host: "127.0.0.1:27101" }]}
rs.initiate(cfg)
rs.status()
exit

5 - Iniciar sharding ( levantar servicio de ruteo )
mongos --configdb rsConf/127.0.0.1:26050,127.0.0.1:26051 --logappend --logpath C:\Users\alber\data\mongodb\shardlog --port 28001 --bind_ip 127.0.0.1

6 - Conectandonos al routing
mongo --port 28001

Dentro del shell del router, le definiremos los dos shards:
sh.addShard("shard1/127.0.0.1:27000")
sh.addShard("shard2/127.0.0.1:27100")

Inicializar datos desde el eclipse para que cargue los datos ( acordarse de cambiar el puerto del repo en eclipse( AbstractRepository ) al puerto de ruteo; puerto 28001)
Luego:

Usar la base
use Joyts

Realizar una consulta
db.Proyecciones.count()

7 - Abrimos 2 terminles como administador, conectándonos a cada uno de los shard 1 o 2 primarios:
mongo --port 27000 ( shard1 )
mongo --port 27100 ( shard2 )

Usar la base
use Joyts

Realizar una consulta
db.Proyecciones.count() ; realizar esto en cada uno de los shard para probar que funcionan

8 - Definiendo la shard key -> hashed
Usar la base
use Joyts

-- creamos el índice de facturas por hash del número, lo que asegurará buena dispersión
db.Proyecciones.ensureIndex({"titulo": "hashed"})

-- habilitamos el sharding para la database finanzas
sh.enableSharding("Joyts")

-- definimos la clave por el índice que anteriormente generamos ( titulo )
sh.shardCollection("Joyts.Proyecciones", {"titulo": "hashed" }, false)

-- vemos los chunks que se generaron
use config
db.chunks.find({}, {min:1,max:1,shard:1,_id:0,ns:1}).pretty()


9 - Nos conectamos a cada shard y realizamos las consultas de pueba
mongo --port 27000 ( shard1 )
mongo --port 27100 ( shard2 )

Consultas de prueba:
db.Proyecciones.count()
db.Proyecciones.find({"titulo": "Avengers" }).limit(2).pretty()
db.Proyecciones.find({"titulo": "Volver al futuro" }).limit(2).pretty()
db.Proyecciones.find({"titulo": "Batman asciende" }).limit(2).pretty(); en cada uno de los shard para realizar las pruebas# tp-2019-tp-joits-grupo-06
