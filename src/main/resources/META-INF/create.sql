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
--4
ALTER TABLE joyts.usuario ALTER saldo SET DEFAULT 0;