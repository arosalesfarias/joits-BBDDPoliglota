use joyts;

alter table usuario 
change column saldo saldo float not null ;

/*
INSERT INTO usuario (id, apellido, cantidad, edad, login, nombre, usuario, saldo)
VALUES ('7', 'Mora', '0', '34', '12345', 'Vicente', null, 'vincent'); 
descomentar para probar  que funciona */