-- Desarrollo Grupal 4 Claudio Campos --
-- Crear una base de datos
CREATE DATABASE grupal_4;
USE grupal_4;
-- Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.
CREATE USER 'usuario_4'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON grupal_4 TO 'usuario_4'@'localhost';
FLUSH PRIVILEGES;

-- Crear dos tablas.
-- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).
CREATE TABLE usuarios (
usuario_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(100),
apellido VARCHAR(100),
contraseña VARCHAR(100),
zona_horaria VARCHAR(100),
genero VARCHAR(255),
telefono INT);

--  La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)).
CREATE TABLE ingresos (
  id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  fecha_hora_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Modifique el UTC por defecto.Desde UTC-3 a UTC-2.
ALTER TABLE usuarios MODIFY zona_horaria VARCHAR(250) DEFAULT 'UTC 2';

-- Creación de registros.
-- Para cada tabla crea 8 registros.
INSERT INTO usuarios (usuario_id, nombre, apellido, contraseña, zona_horaria, genero, telefono) VALUES
(001, 'Armando', 'Luna', 'arm232', 'UTC-3', 'masculino', 988888876),
(002, 'Amanda', 'Espinoza', 'rosasa232', 'UTC-3', 'femenino', 988998845),
(003, 'Jose', 'Sanhueza', 'pepillo33223', 'UTC-3', 'masculino', 922221132),
(004, 'Guido', 'Quiroz', 'gui234234', 'UTC-3', 'masculino', 955664434),
(005, 'Celedonio', 'Aldunate', 'Cele3234234', 'UTC-3', 'masculino', 988765432),
(006, 'Ireneo', 'Lincovilo', 'ireneus32312', 'UTC-3', 'masculino', 955654343),
(007, 'Guillermo', 'Soliz', 'guillee3232', 'UTC-3', 'masculino', 999000076),
(008, 'Macarena', 'Macaya', 'macaya12345', 'UTC-3', 'femenino', 967675456);
select * from usuarios;
INSERT INTO Ingresos ( id_usuario) VALUES
  (1), 
  (2), 
  (3),
  (4), 
  (5), 
  (6), 
  (7), 
  (8);
  select * from Ingresos;

 -- Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono, correo electronico).
CREATE TABLE Contactos (
  id_contacto INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  teléfono VARCHAR(20) NOT NULL,
  correo_electronico VARCHAR(50)
  );
 
-- Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.
ALTER TABLE Usuarios
MODIFY telefono VARCHAR(20) NOT NULL;
ALTER TABLE Contactos
ADD CONSTRAINT key_telefono
FOREIGN KEY (teléfono) REFERENCES Usuarios(telefono);


