DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

CREATE TABLE cliente(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
	apellidoPaterno VARCHAR(50) NOT NULL CHECK(apellidoPaterno <> ''),
	apellidoMaterno VARCHAR(50) NOT NULL CHECK(apellidoMaterno <> ''),
	codigoPostal INT NOT NULL CHECK(codigoPostal between 10000 and 99999),
    calle VARCHAR(50) NOT NULL CHECK(calle <> ''), 
	estado VARCHAR(50) NOT NULL CHECK(estado <> ''),
	telefono CHAR(10) NOT NULL CHECK(CHAR_LENGTH(telefono) = 10) UNIQUE,
	PRIMARY KEY(curp)
);

CREATE TABLE mascota(
	idMascota CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idMascota) = 18) UNIQUE,
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
    nombreDueño VARCHAR(50) NOT NULL CHECK(nombreDueño <> ''),
	nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
    edad INT NOT NULL,
	raza VARCHAR(50) NOT NULL CHECK(raza <> ''),
	especie VARCHAR(50) NOT NULL CHECK(especie <> ''),
    peso REAL NOT NULL,
	PRIMARY KEY(idMascota),
	FOREIGN KEY (curp) REFERENCES cliente(curp)
);

CREATE TABLE consultaEmergencia(
    idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18) UNIQUE,
	sintomas VARCHAR(50) NOT NULL CHECK(sintomas <> ''),
	procedimiento VARCHAR(50) NOT NULL CHECK(procedimiento <> ''),
    PRIMARY KEY(idConsulta)

);

CREATE TABLE codigo(
    idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18) UNIQUE,
	codigo CHAR(18) NOT NULL CHECK(CHAR_LENGTH(codigo) = 18) UNIQUE,
	constraint codigo_pkey PRIMARY KEY (idConsulta,codigo),
	constraint codigo_fkey FOREIGN KEY (idConsulta) REFERENCES consultaEmergencia(idConsulta)
);

CREATE TABLE requerirEmergencia(
	idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18),
	idMascota CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idMascota) = 18),
    PRIMARY KEY(idConsulta,idMascota),
	FOREIGN KEY(idConsulta) REFERENCES consultaEmergencia(idConsulta),
	FOREIGN KEY(idMascota) REFERENCES mascota(idMascota)
);

CREATE TABLE consultaNormal(
    idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18) UNIQUE,
    motivos VARCHAR(50) NOT NULL CHECK(motivos <> ''),
    proximaRevision DATE,
    estado VARCHAR(20) NOT NULL CHECK(estado <> ''),
    medicamentosRecetados VARCHAR(50) CHECK(motivos <> ''),
    PRIMARY KEY(idConsulta)
);

CREATE TABLE requerirNormal(
	idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18),
	idMascota CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idMascota) = 18),
    PRIMARY KEY(idConsulta,idMascota),
	FOREIGN KEY(idConsulta) REFERENCES consultaNormal(idConsulta),
	FOREIGN KEY(idMascota) REFERENCES mascota(idMascota)
);


CREATE TABLE recibo(
    idRecibo CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idRecibo) = 18) UNIQUE,
    nombreDueño VARCHAR(50) NOT NULL CHECK(nombreDueño <> ''),
	nombreMascota VARCHAR(50) NOT NULL CHECK(nombreMascota <> ''),
	nombreTrabajador VARCHAR(50) NOT NULL CHECK(nombreTrabajador <> ''),
    PRIMARY KEY(idRecibo)
);

CREATE TABLE generaReciboNormal(
	idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18),
	idRecibo CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idRecibo) = 18),
    PRIMARY KEY(idConsulta,idRecibo),
	FOREIGN KEY(idConsulta) REFERENCES consultaNormal(idConsulta),
	FOREIGN KEY(idRecibo) REFERENCES recibo(idRecibo)
);

CREATE TABLE generaReciboEmergencia(
	idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18),
	idRecibo CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idRecibo) = 18),
    PRIMARY KEY(idConsulta,idRecibo),
	FOREIGN KEY(idConsulta) REFERENCES consultaEmergencia(idConsulta),
	FOREIGN KEY(idRecibo) REFERENCES recibo(idRecibo)
);

CREATE TABLE pago(
    idPago CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idPago) = 18) UNIQUE,
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
    numeroTarjeta CHAR(16) CHECK(CHAR_LENGTH(numeroTarjeta) = 16),
	vencimiento DATE NOT NULL,
	titular VARCHAR(50) NOT NULL CHECK(titular <> ''),
	cvv CHAR(3) NOT NULL CHECK(CHAR_LENGTH(cvv) = 3),
	esTarjerta BOOLEAN NOT NULL,
	esEfectivo BOOLEAN NOT NULL,
    PRIMARY KEY(idPago),
	FOREIGN KEY(curp) REFERENCES cliente(curp)
);


CREATE TABLE pagar(
	idPago CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idPago) = 18),
	idRecibo CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idRecibo) = 18),
    PRIMARY KEY(idPago,idRecibo),
	FOREIGN KEY(idPago) REFERENCES pago(idPago),
	FOREIGN KEY(idRecibo) REFERENCES recibo(idRecibo)
);

CREATE TABLE servicios(
    idRecibo CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idRecibo) = 18) UNIQUE,
	servicios VARCHAR(50) NOT NULL CHECK(servicios <> ''),
	constraint servicios_pkey PRIMARY KEY (idRecibo,servicios),
	constraint servicios_fkey FOREIGN KEY (idRecibo) REFERENCES recibo(idRecibo)
);

CREATE TABLE producto(
	idProducto CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idProducto) = 18) UNIQUE,
	nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
	cantidad INT NOT NULL,
	imagen bytea,
	descripcion VARCHAR(50) NOT NULL CHECK(descripcion <> ''),
	caducidad VARCHAR(50) NOT NULL CHECK(caducidad <> ''), -- Lo usaremos como VARCHAR para decir por ejemplo 'Caduca en 2 años y 6 meses',
	esComida BOOLEAN NOT NULL,
	esMedicamento BOOLEAN NOT NULL,
	PRIMARY KEY(idProducto)
);




INSERT INTO cliente VALUES ('12345678901234567A', 'David', 'Hernández', 'Uriostegui', 10000, 'Ignacio Allende', 'Guanajuato', '4731241727'); 
INSERT INTO mascota VALUES ('12345678901234598A', '12345678901234567A', 'David', 'Ron', 13, 'Cocker', 'Perro', 20.5); 


INSERT INTO cliente VALUES ('12345678901234565A', 'David', 'Hernández', 'Escoto', 10000, 'Ignacio Allende', 'Guanajuato', '4731241728'); 
INSERT INTO mascota VALUES ('12345678901234599A', '12345678901234565A', 'David', 'Ron', 13, 'Cocker', 'Perro', 20.5); 
select * from mascota;






