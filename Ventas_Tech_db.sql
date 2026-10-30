CREATE DATABASE Ventas_Tech_DB;

USE Ventas_Tech_DB;

-- DROP --
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;


-- CREATE TABLA VENTAS --
CREATE TABLE Ventas (
ID_Venta INT IDENTITY(1,1) PRIMARY KEY,
ID_Cliente INT NOT NULL,
ID_Producto INT NOT NULL,
Cantidad INT NOT NULL,
Precio_Unitario DECIMAL(10,2) NOT NULL,
Fecha_Venta DATE NOT NULL
);

-- CREATE TABLA PRODUCTOS --
CREATE TABLE Productos (
ID_Producto INT IDENTITY(1,1) PRIMARY KEY,
Nombre_Producto VARCHAR(100) NOT NULL,
ID_Categoria INT NOT NULL,
Precio DECIMAL(10,2) NOT NULL,
Stock INT DEFAULT 0,
Activo BIT DEFAULT 1,

CONSTRAINT FK_Ventas_Productos FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);

-- CREATE TABLA CATEGORIAS --
CREATE TABLE Categorias (
ID_Categoria INT IDENTITY(1,1) PRIMARY KEY,
Nombre_Categoria VARCHAR(50) NOT NULL,
Descripcion VARCHAR(200),

CONSTRAINT FK_Producto_Categorias FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria)
);

-- CREATE TABLA CLIENTES --
CREATE TABLE Clientes (
ID_Cliente INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE,
Ciudad VARCHAR(50),
Fecha_Registro DATE NOT NULL,

CONSTRAINT FK_Ventas_Clientes FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
);

SELECT * FROM Ventas

-- INSERT CATEGORIAS --
SET IDENTITY_INSERT Categorias ON;

INSERT INTO Categorias(id_categoria,nombre_categoria,descripcion)
VALUES
(1,'Computación', 'Laptops, PCs y monitores'),
(2,'Accesorios', 'Periféricos y complementos'),
(3,'Audio', 'Auriculares y parlantes'),
(4,'Almacenamiento','Discos y memorias');

SET IDENTITY_INSERT Categorias OFF;


-- INSERT CLIENTES --
SET IDENTITY_INSERT Clientes ON;

INSERT INTO Clientes (id_cliente,nombre,email,ciudad,fecha_registro)
VALUES
(1,'María López','maria@mail.com','Buenos Aires','2024-01-05'),
(2,'Carlos Ruiz','carlos@mail.com','Córdoba','2024-01-10'),
(3,'Ana Gómez','ana@mail.com','Rosario','2024-02-01'),
(4,'Pedro Sanz','pedro@mail.com','Mendoza','2024-02-15'),
(5,'Laura Torres','laura@mail.com','Tucumán','2024-03-01');

SET IDENTITY_INSERT Clientes OFF;

-- INSERT PRODUCTOS --
SET IDENTITY_INSERT Productos ON;

INSERT INTO Productos (id_producto,nombre_producto,id_categoria,precio,stock,activo)
VALUES
(1,'Laptop Pro 15',1,1200.00,15,1),
(2,'Mouse Inalámbrico',2,28.00,80,1),
(3,'Monitor 4K 27',1,450.00,12,1),
(4,'Auriculares BT Pro',3,120.00,35,1),
(5,'SSD Externo 1TB',4,130.00,18,1),
(6,'Teclado Mecánico',2,95.00,40,1);

SET IDENTITY_INSERT Productos OFF;

-- INSERT VENTAS --
SET IDENTITY_INSERT Ventas ON;

INSERT INTO Ventas (id_venta,id_cliente,id_producto,cantidad,precio_unitario,fecha_venta)
VALUES
(1,1,1,2,1200.00,'2024-03-05'),
(2,2,2,5,28.00,'2024-03-06'),
(3,3,3,1,450.00,'2024-03-07'),
(4,1,4,2,120.00,'2024-03-08'),
(5,4,5,3,130.00,'2024-03-10'),
(6,2,6,4,95.00,'2024-03-11'),
(7,5,1,1,1200.00,'2024-03-12'),
(8,3,2,8,28.00,'2024-03-13'),
(9,4,4,1,120.00,'2024-03-14'),
(10,5,3,2,450.00,'2024-03-15');

SET IDENTITY_INSERT Ventas OFF;

-- VALIDACIÓN --
SELECT * FROM Categorias
SELECT * FROM Clientes
SELECT * FROM Productos
SELECT * FROM Ventas
