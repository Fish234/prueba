CREATE DATABASE prueba;

CREATE TABLE cliente(
	id SERIAL,
	rut VARCHAR,
	nombre VARCHAR,
	direccion VARCHAR,
	PRIMARY KEY(id)
);

CREATE TABLE categoria(
	id SERIAL,
	nombre_categoria VARCHAR,
	descripcion VARCHAR,
	PRIMARY KEY(id)
);

CREATE TABLE factura(
	id SERIAL,
	fecha DATE,
	cliente_id INT, 
	valor_total FLOAT,
	PRIMARY KEY(id),
	FOREIGN KEY(cliente_id) REFERENCES cliente(id)
);

CREATE TABLE producto(
	id SERIAL,
	nombre_producto VARCHAR,
	descripcion VARCHAR,
	valor_unitario FLOAT,
	categoria_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY(categoria_id) REFERENCES categoria(id)
);

CREATE TABLE factura_producto(
	producto_id INT,
	factura_id INT,
	cantidad INT,
	FOREIGN KEY(producto_id) REFERENCES producto(id),
	FOREIGN KEY(factura_id) REFERENCES factura(id)
);


---------------------------------------

INSERT INTO cliente(rut, nombre, direccion)
VALUES ('14169975-k', 'Lucia', 'playa ancha calle 14 casa 222');

INSERT INTO cliente(rut, nombre, direccion)
VALUES ('20661995-3', 'Claude', 'casurias calle 3 casa 1242');

INSERT INTO cliente(rut, nombre, direccion)
VALUES ('22409642-9', 'Valentin', 'maralegre calle 8 casa 013');

INSERT INTO cliente(rut, nombre, direccion)
VALUES ('19191397-3', 'Lawrence', 'dirigente calle 5 casa 785');

INSERT INTO cliente(rut, nombre, direccion)
VALUES ('18227284-1', 'Cordelia', 'israel calle 2 casa 108');


INSERT INTO producto(nombre_producto, descripcion, valor_unitario, categoria_id)
VALUES ('Arena', 'Crea el habitad perfecto para tu mascota!', '5.000', '1');

INSERT INTO producto(nombre_producto, descripcion, valor_unitario, categoria_id)
VALUES ('Piedras', 'Decora y darme espacios de sombra a tus peces', '8.000', '1');

INSERT INTO producto(nombre_producto, descripcion, valor_unitario, categoria_id)
VALUES ('Rueda Hamster', 'No tengas un hamster gordito!', '3.000', '2');

INSERT INTO producto(nombre_producto, descripcion, valor_unitario, categoria_id)
VALUES ('Cueva', 'Los lugares oscuros y calentitos, le encantaran!', '7.000', '2');

INSERT INTO producto(nombre_producto, descripcion, valor_unitario, categoria_id)
VALUES ('Casa Hamster', 'Tiene todo lo que necesita un hamster!', '4.000', '2');

INSERT INTO producto(nombre_producto, descripcion, valor_unitario, categoria_id)
VALUES ('Lampara de calor', 'Esencial para reptiles', '2.000', '3');

INSERT INTO producto(nombre_producto, descripcion, valor_unitario, categoria_id)
VALUES ('Algas', 'Decora tu pecera!', '9.000', '1');

INSERT INTO producto(nombre_producto, descripcion, valor_unitario, categoria_id)
VALUES ('Luz led', 'Ilumina tu pecera!', '10.000', '1');

INSERT INTO producto(nombre_producto, descripcion, valor_unitario, categoria_id)
VALUES ('Termometro', '¿Sabes cual es la temperatura más adecuada para tus peces?', '13.000', '1');


INSERT INTO categoria(nombre_categoria, descripcion)
VALUES ('animales acuaticos', 'Aquí podrás encontrar todo lo que necesitas para su habitad acuatico');

INSERT INTO categoria(nombre_categoria, descripcion)
VALUES ('roedores', 'Aquí podrás encontrar todo lo que necesitas para tu roedor');

INSERT INTO categoria(nombre_categoria, descripcion)
VALUES ('reptiles', 'Aquí podrás encontrar todo lo que necesitas para tu reptil');


INSERT INTO factura(fecha, cliente_id, valor_total)
VALUES('15/06/2010', '1', '10.000');

INSERT INTO factura(fecha, cliente_id, valor_total)
VALUES('15/12/2000', '1', '24.000');

INSERT INTO factura(fecha, cliente_id, valor_total)
VALUES('20/03/1890', '2', '9.000');

INSERT INTO factura(fecha, cliente_id, valor_total)
VALUES('09/12/2004', '2', '14.000');

INSERT INTO factura(fecha, cliente_id, valor_total)
VALUES('04/10/1900', '2', '12.000');

INSERT INTO factura(fecha, cliente_id, valor_total)
VALUES('30/07/1976', '3', '20.000');

INSERT INTO factura(fecha, cliente_id, valor_total)
VALUES('08/02/2019', '4', '10.000');

INSERT INTO factura(fecha, cliente_id, valor_total)
VALUES('07/03/2016', '4', '27.000');

INSERT INTO factura(fecha, cliente_id, valor_total)
VALUES('27/07/2020', '4', '40.000');

INSERT INTO factura(fecha, cliente_id, valor_total)
VALUES('15/10/2003', '4', '13.000');


INSERT INTO factura_producto(producto_id, factura_id, cantidad)
VALUES('1', '1', '2');

INSERT INTO factura_producto(producto_id, factura_id, cantidad)
VALUES('2', '2', '3');

INSERT INTO factura_producto(producto_id, factura_id, cantidad)
VALUES('3', '3', '3');

INSERT INTO factura_producto(producto_id, factura_id, cantidad)
VALUES('4', '3', '2');

INSERT INTO factura_producto(producto_id, factura_id, cantidad)
VALUES('5', '5', '3');

INSERT INTO factura_producto(producto_id, factura_id, cantidad)
VALUES('6', '6', '1');

INSERT INTO factura_producto(producto_id, factura_id, cantidad)
VALUES('1', '7', '2');

INSERT INTO factura_producto(producto_id, factura_id, cantidad)
VALUES('7', '8', '3');

INSERT INTO factura_producto(producto_id, factura_id, cantidad)
VALUES('8', '9', '4');

INSERT INTO factura_producto(producto_id, factura_id, cantidad)
VALUES('9', '10', '1');

------------------------------

---¿Que cliente realizo la compra más cara?---

SELECT cliente_id FROM factura WHERE valor_total > 35.000;

---¿Que cliente pago sobre 100 de monto?---
--En este caso le puse 10.000 por que no tengo 100 por así decirlo, entonces no lo pesca"

SELECT cliente_id FROM factura WHERE valor_total > 10.000;

---¿Cuantos clientes han comprado el producto 6?---

SELECT COUNT(cliente.id) FROM cliente INNER JOIN factura ON cliente.id = factura.cliente_id INNER JOIN factura_producto ON factura.id = factura_producto.factura_id WHERE factura_producto.producto_id = 6;