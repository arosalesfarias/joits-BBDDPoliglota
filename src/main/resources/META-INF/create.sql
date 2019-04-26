--1
DELIMITER //
CREATE PROCEDURE joyts.salasDeAccionFinal(in sala int)
begin select titulo,añoRodaje,puntaje from joyts.funcion f
inner join joyts.proyeccion_funcion pf on pf.funciones_id = f.id
inner join (select id,titulo,añoRodaje,genero,puntaje 
from joyts.Pelicula 
	union
    all select id,titulo,añoRodaje,genero,puntaje 
            from joyts.Saga) proy on proy.id = pf.proyeccion_id
where f.id = sala and proy.genero = "Accion";
END//
DELIMITER ;
--2
create table if not exists joyts.pelicula_historico(
proyeccion_id bigint(20),
fecha_modificacion datetime,
titulo_anterior varchar(50),
titulo_nuevo varchar(50),
primary key(proyeccion_id,fecha_modificacion),
foreign key fk_proy(proyeccion_id)
references joyts.pelicula(id)
);

delimiter |
CREATE TRIGGER historico_peliculas BEFORE UPDATE ON joyts.pelicula
  FOR EACH ROW 
  BEGIN
  declare anterior varchar(50);
  select titulo from joyts.pelicula where id = new.id into anterior;
    INSERT INTO joyts.pelicula_historico SET proyeccion_id = NEW.id, fecha_modificacion = now(), titulo_anterior = anterior, titulo_nuevo = new.titulo;
  END;
  |
delimiter ;
--4
ALTER TABLE joyts.usuario ALTER saldo SET DEFAULT 0;