--CREATE DATABASE prueba;
--\c prueba;

-- CREANDO TABLAS SIN DEPENDENCIAS FORANEAS
CREATE TABLE clientes(id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL, rut VARCHAR(9) NOT NULL, direccion VARCHAR(200) NOT NULL);
CREATE TABLE categorias(id SERIAL PRIMARY KEY, nombre_categoria VARCHAR(100) NOT NULL, descripcion_categoria VARCHAR(200) NOT NULL);

-- INSERCIONES EN TABLA CLIENTES
INSERT INTO clientes(nombre, rut, direccion) 
VALUES('Jose', '204542348', 'direccion de Jose 2854, Santiago'), 
('Pedro', '248356421', 'direccion de Pedro 6412, Providencia'), 
('Andres', '173456920', 'direccion de Andres 4501, Maipu'), 
('Alejandra', '152356470', 'direccion de Alejandra 3456, Recoleta'), 
('Maria', '213246748', 'direccion de Maria 1204, Pudahuel');

-- INSERCIONES EN TABLA CATEGORIAS
INSERT INTO categorias(nombre_categoria, descripcion_categoria) 
VALUES('Instrumentos de percusion', 'Sonido se origina al ser golpeado o agitado.'), 
('Instrumentos de Cuerda', 'Producen sonidos por medio de vibraciones de una o mas cuerdas.'), 
('Instrumentos de Viento', 'Producen sonido por la vibracion de la masa de aire en su interior.');

-- CREANDO TABLA PRODUCTOS CON DEPENDENCIAS FORANEAS
CREATE TABLE productos(id SERIAL PRIMARY KEY, nombre_producto VARCHAR(100) NOT NULL, precio_unitario INTEGER NOT NULL, descripcion_producto VARCHAR(200) NOT NULL, categoria_id SERIAL);
ALTER TABLE productos ADD CONSTRAINT categoria_fk FOREIGN KEY (categoria_id) REFERENCES categorias(id);

-- INSERCIONES EN TABLA PRODUCTOS
INSERT INTO productos(nombre_producto, precio_unitario, descripcion_producto, categoria_id) 
VALUES('Shell pack Tama', 350, '18 pzs, color Metal Classic', 1), 
('Caja Tama Starclassic', 150, 'Maple, MRS 1455 - RWO', 1), 
('Shell Pack Tama 5 pzs', 80, 'LMP52RTLS S.L.P STUDIO MAPLE', 1), 
('Ibanez GRX20EXB', 95, 'Color Black Knight', 2), 
('LTD M1001', 90, 'Color see thru black', 2), 
('Nativa THIN BODY', 30, 'Cuesdas de nilon', 2), 
('Saxo Alto Baldassare', 65, 'Color dorado', 3), 
('Clarinete Baldassare', 45, 'Afinacion Bd', 3);

-- CREANDO TABLA FACTURAS CON DEPENDENCIAS FORANEAS
CREATE TABLE facturas(id SERIAL PRIMARY KEY, numero VARCHAR(10) NOT NULL, fecha DATE NOT NULL, subtotal INTEGER NOT NULL, total INTEGER NOT NULL, cliente_id SERIAL);
ALTER TABLE facturas ADD CONSTRAINT cliente_fk FOREIGN KEY (cliente_id) REFERENCES clientes(id);

-- INSERCIONES EN TABLA FACTURAS
INSERT INTO facturas(numero, fecha, subtotal, total, cliente_id) 
VALUES(393, '2019-11-08', 445, 530, 1), 
(404, '2019-11-11', 265, 315, 1), 
(415, '2019-11-12', 215, 256, 2), 
(420, '2019-11-13', 545, 649, 2), 
(437, '2019-11-14', 470, 559, 2), 
(448, '2019-11-15', 65, 77, 3),
(459, '2019-11-16', 135, 161, 4), 
(460, '2019-11-17', 320, 381, 4),
(471, '2019-11-18', 205, 244, 4),
(480, '2019-11-19', 65, 77, 4);

-- CREANDO TABLA COMPRAS CON DEPENDENCIAS FORANEAS
CREATE TABLE compras(id SERIAL PRIMARY KEY, cantidad INTEGER NOT NULL, producto_id SERIAL, factura_id SERIAL);
ALTER TABLE compras ADD CONSTRAINT factura_fk FOREIGN KEY (factura_id) REFERENCES facturas(id);
ALTER TABLE compras ADD CONSTRAINT producto_fk FOREIGN KEY (producto_id) REFERENCES productos(id);

-- INSERCIONES EN TABLA COMPRAS
INSERT INTO compras(cantidad, producto_id, factura_id) 
VALUES(1, 1, 1), 
(1, 4, 1), 
(1, 5, 2), 
(1, 4, 2), 
(1, 3, 2), 
(1, 2, 3),
(1, 7, 3), 
(1, 1, 4),
(1, 2, 4),
(1, 8, 4),
(1, 5, 5),
(1, 6, 5),
(1, 1, 5),
(1, 7, 6),
(1, 8, 7),
(1, 5, 7),
(1, 3, 8),
(1, 5, 8),
(1, 2, 8),
(1, 6, 9),
(1, 3, 9),
(1, 4, 9),
(1, 7, 10);

-- FIN