CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `joyts`.`peliculasmasvendidas` AS
    SELECT 
        `joyts`.`proyeccion`.`titulo` AS `titulo`
    FROM
        (`joyts`.`proyeccion`
        JOIN (`joyts`.`usuario_ticket`
        JOIN `joyts`.`ticket` ON ((`joyts`.`usuario_ticket`.`tickets_id` = `joyts`.`ticket`.`id`))) ON ((`joyts`.`proyeccion`.`id` = `joyts`.`ticket`.`pelicula_id`)))
    GROUP BY `joyts`.`proyeccion`.`id`
    HAVING (COUNT(`joyts`.`proyeccion`.`titulo`) > 3)