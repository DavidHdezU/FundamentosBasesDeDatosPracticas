DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;
COMMENT ON SCHEMA public IS 'El esquema que viene por defecto en postgres';

CREATE TABLE cliente(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
	apellidoPaterno VARCHAR(50) NOT NULL CHECK(apellidoPaterno <> ''),
	apellidoMaterno VARCHAR(50) NOT NULL CHECK(apellidoMaterno <> ''),
	numero INT NOT NULL UNIQUE,
	codigoPostal INT NOT NULL CHECK(codigoPostal between 10000 and 99999),
    calle VARCHAR(50) NOT NULL CHECK(calle <> ''), 
	estado VARCHAR(50) NOT NULL CHECK(estado <> ''),
	telefono CHAR(10) NOT NULL CHECK(CHAR_LENGTH(telefono) = 10) UNIQUE,
	PRIMARY KEY(curp)
);
COMMENT ON TABLE cliente IS 'Tabla que contiene la informacion de los clientes';
COMMENT ON COLUMN cliente.curp IS 'La CURP de los clientes';
COMMENT ON COLUMN cliente.nombre IS 'El nombre de los clientes';
COMMENT ON COLUMN cliente.apellidoPaterno IS 'El apellido paterno de los clientes';
COMMENT ON COLUMN cliente.apellidoMaterno IS 'El apellido materno de los clientes';
COMMENT ON COLUMN cliente.numero IS 'El numero identificador que tiene un cliente';
COMMENT ON COLUMN cliente.calle IS 'La calle donde vive el cliente'
COMMENT ON COLUMN cliente.codigoPostal IS 'El codigo postal del cliente'
COMMENT ON COLUMN cliente.estado IS 'El estado donde vive el cliente'
COMMENT ON COLUMN cliente.telefono IS 'El telefono del cliente'


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
COMMENT ON TABLE mascota IS 'Tabla que contiene informacion de las mascotas';
COMMENT ON COLUMN mascota.idMascota IS 'El identificador de la mascota.';
COMMENT ON COLUMN mascota.curp IS 'El CURP del duenio de la mascota';
COMMENT ON COLUMN mascota.nombreDueño IS 'El nombre del duenio de la mascota';
COMMENT ON COLUMN mascota.nombre IS 'El nombre de la mascota';
COMMENT ON COLUMN mascota.edad IS 'La edad de la mascota';
COMMENT ON COLUMN mascota.raza IS 'La raza de la mascota'
COMMENT ON COLUMN mascota.especie IS 'La especie de la mascota'
COMMENT ON COLUMN mascota.peso IS 'El peso de la mascota'


CREATE TABLE consultaEmergencia(
    idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18) UNIQUE,
	sintomas VARCHAR(50) NOT NULL CHECK(sintomas <> ''),
	procedimiento VARCHAR(50) NOT NULL CHECK(procedimiento <> ''),
    PRIMARY KEY(idConsulta)

);
COMMENT ON TABLE consultaEmergencia IS 'Tabla que contiene informacion de las consultas de emergencia';
COMMENT ON COLUMN consultaEmergencia.idConsulta IS 'El identificador de la consulta';
COMMENT ON COLUMN consultaEmergencia.sintomas IS 'Los sintomas que presenta la mascota';
COMMENT ON COLUMN consultaEmergencia.procedimiento IS 'El procedimiento que la mascota necesita';


CREATE TABLE codigo(
    idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18) UNIQUE,
	codigo CHAR(18) NOT NULL CHECK(CHAR_LENGTH(codigo) = 18) UNIQUE,
	constraint codigo_pkey PRIMARY KEY (idConsulta,codigo),
	constraint codigo_fkey FOREIGN KEY (idConsulta) REFERENCES consultaEmergencia(idConsulta)
);
COMMENT ON TABLE codigo IS 'Tabla que contiene informacion de los codigos de emergencia que puede contener una consulta de emergencia';
COMMENT ON COLUMN codigo.idConsulta IS 'El identificador de la consulta';
COMMENT ON COLUMN codigo.codigo IS 'El codigo de la consulta de emergencia';


CREATE TABLE requerirEmergencia(
	idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18),
	idMascota CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idMascota) = 18),
    PRIMARY KEY(idConsulta,idMascota),
	FOREIGN KEY(idConsulta) REFERENCES consultaEmergencia(idConsulta),
	FOREIGN KEY(idMascota) REFERENCES mascota(idMascota)
);
COMMENT ON TABLE requerirEmergencia IS 'Tabla que contiene la informacion necesaria para procesar una consulta de emergencia';
COMMENT ON COLUMN requerirEmergencia.idConsulta IS 'El identificador de la consulta de emergencia';
COMMENT ON COLUMN requerirEmergencia.idMascota IS 'El identificador de la mascota';


CREATE TABLE consultaNormal(
    idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18) UNIQUE,
    motivos VARCHAR(50) NOT NULL CHECK(motivos <> ''),
    proximaRevision DATE,
    estado VARCHAR(20) NOT NULL CHECK(estado <> ''),
    medicamentosRecetados VARCHAR(50) CHECK(motivos <> ''),
    PRIMARY KEY(idConsulta)
);
COMMENT ON TABLE consultaNormal IS 'Tabla que contiene informacion de las consultas normales';
COMMENT ON COLUMN consultaNormal.idConsulta IS 'El identificador de la consulta';
COMMENT ON COLUMN consultaNormal.proximaRevision IS 'La fecha de la proxima revision de la mascota';
COMMENT ON COLUMN consultaNormal.estado IS 'El estado de la mascota';
COMMENT ON COLUMN consultaNormal.medicamentosRecetados IS 'Los medicamentos recetados para la mascota';


CREATE TABLE requerirNormal(
	idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18),
	idMascota CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idMascota) = 18),
    PRIMARY KEY(idConsulta,idMascota),
	FOREIGN KEY(idConsulta) REFERENCES consultaNormal(idConsulta),
	FOREIGN KEY(idMascota) REFERENCES mascota(idMascota)
);
COMMENT ON TABLE requerirNormal IS 'Tabla que contiene la informacion necesaria para procesar una consulta normal';
COMMENT ON COLUMN requerirNormal.idConsulta IS 'El identificador de la consulta';
COMMENT ON COLUMN requerirNormal.idMascota IS 'El identificador de la mascota';


CREATE TABLE recibo(
    idRecibo CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idRecibo) = 18) UNIQUE,
    nombreDueño VARCHAR(50) NOT NULL CHECK(nombreDueño <> ''),
	nombreMascota VARCHAR(50) NOT NULL CHECK(nombreMascota <> ''),
	nombreTrabajador VARCHAR(50) NOT NULL CHECK(nombreTrabajador <> ''),
    PRIMARY KEY(idRecibo)
);
COMMENT ON TABLE recibo IS 'Tabla que contiene la informacion del recibo de una consulta';
COMMENT ON COLUMN recibo.idRecibo IS 'El identificador del recibo';
COMMENT ON COLUMN recibo.nombreDueño IS 'El nombre del duenio de la mascota que tuvo consulta';
COMMENT ON COLUMN recibo.nombreMascota IS 'El nombre de la mascota que tuvo consulta';
COMMENT ON COLUMN recibo.nombreTrabajador IS 'El nombre del trabajador que atendio a la mascota que tuvo consulta';


CREATE TABLE generaReciboNormal(
	idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18),
	idRecibo CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idRecibo) = 18),
    PRIMARY KEY(idConsulta,idRecibo),
	FOREIGN KEY(idConsulta) REFERENCES consultaNormal(idConsulta),
	FOREIGN KEY(idRecibo) REFERENCES recibo(idRecibo)
);
COMMENT ON TABLE generaReciboNormal IS 'Tabla que contiene la informacion necesaria para generar un recibo normal';
COMMENT ON COLUMN generaReciboNormal.idConsulta IS 'El identificador de la consulta';
COMMENT ON COLUMN generaReciboNormal.idRecibo IS 'El identificador del recibo';


CREATE TABLE generaReciboEmergencia(
	idConsulta CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsulta) = 18),
	idRecibo CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idRecibo) = 18),
    PRIMARY KEY(idConsulta,idRecibo),
	FOREIGN KEY(idConsulta) REFERENCES consultaEmergencia(idConsulta),
	FOREIGN KEY(idRecibo) REFERENCES recibo(idRecibo)
);
COMMENT ON TABLE generaReciboEmergencia IS 'Tabla que contiene la informacion necesaria para generar un recibo de una consulta de emergencia';
COMMENT ON COLUMN generaReciboEmergencia.idConsulta IS 'El identificador de la consulta de emergencia';
COMMENT ON COLUMN generaReciboEmergencia.idRecibo IS 'El identificador del recibo de la consulta de emergencia';


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
COMMENT ON TABLE pago IS 'Tabla que contiene la informacin necesaria para procesar el pago de una consulta';
COMMENT ON COLUMN pago.idPago IS 'El identificador del pago de la consulta';
COMMENT ON COLUMN pago.curp IS 'El CURP de del duenio de la mascota que tuvo consulta';
COMMENT ON COLUMN pago.numeroTarjeta IS 'El numero de la tarjeta que pago la consulta';
COMMENT ON COLUMN pago.vencimiento IS 'El vencimiento de la tarjeta que pago la consulta';
COMMENT ON COLUMN pago.titular IS 'El nombre del titular de la tarjeta que pago la consulta';
COMMENT ON COLUMN pago.cvv IS 'El CVV de la tarjeta que pago la consulta';
COMMENT ON COLUMN pago.esTarjerta IS 'Indica si el pago es con tarjeta';
COMMENT ON COLUMN pago.esEfectivo IS 'Indica si el pago es con efectivo';


CREATE TABLE pagar(
	idPago CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idPago) = 18),
	idRecibo CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idRecibo) = 18),
    PRIMARY KEY(idPago,idRecibo),
	FOREIGN KEY(idPago) REFERENCES pago(idPago),
	FOREIGN KEY(idRecibo) REFERENCES recibo(idRecibo)
);
COMMENT ON TABLE pagar IS 'Tabla que contiene la informacion necesaria para procesar un pago y un recibo';
COMMENT ON COLUMN pagar.idPago IS 'El identificador del pago de la consulta';
COMMENT ON COLUMN pagar.idRecibo IS 'El identificador del recibo de la consulta';


CREATE TABLE servicios(
    idRecibo CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idRecibo) = 18) UNIQUE,
	servicios VARCHAR(50) NOT NULL CHECK(servicios <> ''),
	constraint servicios_pkey PRIMARY KEY (idRecibo,servicios),
	constraint servicios_fkey FOREIGN KEY (idRecibo) REFERENCES recibo(idRecibo)
);
COMMENT ON TABLE servicios IS 'Tabla que contiene los servicios que puede contener un recibo';
COMMENT ON COLUMN servicios.idRecibo IS 'El identificador del recibo de la consulta';
COMMENT ON COLUMN servicios.servicios IS 'Los servicios que puede contener un recibo';


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
COMMENT ON TABLE producto IS 'Tabla que contiene la informacion que contiene un producto';
COMMENT ON COLUMN producto.idProducto IS 'El identificador del producto';
COMMENT ON COLUMN producto.nombre IS 'El nombre del producto';
COMMENT ON COLUMN producto.cantidad IS 'La cantidad de productos disponibles';
COMMENT ON COLUMN producto.imagen IS 'La imagen correspondiente al producto';
COMMENT ON COLUMN producto.descripcion IS 'La descripción del producto';
COMMENT ON COLUMN producto.caducidad IS 'La caducidad del producto';
COMMENT ON COLUMN producto.esComida IS 'Indica si el producto es comida';
COMMENT ON COLUMN producto.esMedicamento IS 'Indica si un producto es medicamento';


CREATE TABLE generaReciboProducto(
	idProducto CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idProducto) = 18),
	idRecibo CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idRecibo) = 18),
    PRIMARY KEY(idProducto,idRecibo),
	FOREIGN KEY(idProducto) REFERENCES producto(idProducto),
	FOREIGN KEY(idRecibo) REFERENCES recibo(idRecibo)
);
COMMENT ON TABLE generaReciboProducto IS 'Tabla que contiene la informacion que contiene un producto';
COMMENT ON COLUMN generaReciboProducto.idProducto IS 'El identificador del producto';
COMMENT ON COLUMN generaReciboProducto.idRecibo IS 'El recibo de la compra del producto';


CREATE TABLE estetica(
	nombreEstetica VARCHAR(18) NOT NULL CHECK(nombreEstetica <> '') UNIQUE,
	telefono CHAR(10) NOT NULL CHECK(CHAR_LENGTH(telefono) = 10) UNIQUE,
	codigoPostal INT NOT NULL CHECK(codigoPostal between 10000 and 99999),
    calle VARCHAR(50) NOT NULL CHECK(calle <> ''), 
	estado VARCHAR(50) NOT NULL CHECK(estado <> ''),
	numero INT NOT NULL UNIQUE,
	PRIMARY KEY(nombreEstetica)
);
COMMENT ON TABLE estetica IS 'Almacena la informacion de las Esteticas';
COMMENT ON COLUMN estetica.nombreEstetica IS 'Nombre de la Estetica';
COMMENT ON COLUMN estetica.telefono IS 'El numero telefonico para la Estetica';
COMMENT ON COLUMN estetica.codigoPostal IS 'Codigo Postal de la Estetica';
COMMENT ON COLUMN estetica.calle IS 'La calle donde se encuentra la Estetica';
COMMENT ON COLUMN estetica.estado IS 'El estado donde se ubuca la Estetica';
COMMENT ON COLUMN estetica.numero IS 'Numero de edificio de la Estetica';
COMMENT ON COLUMN estetica.numero IS 'Numero de edificio de la Estetica';


CREATE TABLE consultorio(
	idConsultorio CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idConsultorio) = 18) UNIQUE,
	nombreEstetica VARCHAR(18) NOT NULL CHECK(nombreEstetica <> '') UNIQUE,
	disponible BOOLEAN NOT NULL,
	PRIMARY KEY(idConsultorio),
	FOREIGN KEY(nombreEstetica) REFERENCES estetica(nombreEstetica)
);
COMMENT ON TABLE consultorio IS 'Tabla para guardar los Coonsultorios';
COMMENT ON COLUMN consultorio.idConsultorio IS 'Identificador del Consultorio';
COMMENT ON COLUMN consultorio.nombreEstetica IS 'Identificador de la Estetica a la que pertenece el Consultorio';
COMMENT ON COLUMN consultorio.disponible IS 'Identificador de la Estetica a la que pertenece el Consultorio';


CREATE TABLE horario(
    nombreEstetica VARCHAR(18) NOT NULL CHECK(nombreEstetica <> '') UNIQUE,
	horaEntrada TIME NOT NULL,
	horaSalida TIME NOT NULL,
	constraint horario_pkey PRIMARY KEY (nombreEstetica),
	constraint horario_fkey FOREIGN KEY (nombreEstetica) REFERENCES estetica(nombreEstetica)
);
COMMENT ON TABLE horario IS 'Guarda los horarios de la Estetica';
COMMENT ON COLUMN horario.nombreEstetica IS 'Identificador de la Estetica a la que pertenece el Horario en cuestion';
COMMENT ON COLUMN horario.horaEntrada IS 'Hora de apertura de la Estetica';
COMMENT ON COLUMN horario.horaSalida IS 'Hora de cierre de la Estetica';
COMMENT ON CONSTRAINT horario_pkey IS 'Llave primaria de la tabla horario';
COMMENT ON CONSTRAINT horario_fkey IS 'Llave foranea de la tabla horario';


CREATE TABLE vender(
	nombreEstetica VARCHAR(18) NOT NULL CHECK(nombreEstetica <> ''),
	idProducto CHAR(18) NOT NULL CHECK(CHAR_LENGTH(idProducto) = 18),
    PRIMARY KEY(nombreEstetica,idProducto),
	FOREIGN KEY(nombreEstetica) REFERENCES estetica(nombreEstetica),
	FOREIGN KEY(idProducto) REFERENCES producto(idProducto)
);
COMMENT ON TABLE vender IS 'Tabla que para la relacionn Vender';
COMMENT ON COLUMN vender.nombreEstetica IS 'Identificador de la Estetica que vende';
COMMENT ON COLUMN vender.idProducto IS 'Identificador del Producto que se esta vendiendo';


CREATE TABLE supervisor(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
	apellidoPaterno VARCHAR(50) NOT NULL CHECK(apellidoPaterno <> ''),
	apellidoMaterno VARCHAR(50) NOT NULL CHECK(apellidoMaterno <> ''),
	numero INT NOT NULL UNIQUE,
	codigoPostal INT NOT NULL CHECK(codigoPostal between 10000 and 99999),
    calle VARCHAR(50) NOT NULL CHECK(calle <> ''), 
	estado VARCHAR(50) NOT NULL CHECK(estado <> ''),
	telefono CHAR(10) NOT NULL CHECK(CHAR_LENGTH(telefono) = 10) UNIQUE,
	salario INT NOT NULL,
	rfc CHAR(13) NOT NULL CHECK(CHAR_LENGTH(rfc) = 13) UNIQUE,
	entrada TIME NOT NULL,
	salida TIME NOT NULL,
	PRIMARY KEY(curp)
);
COMMENT ON TABLE supervisor IS 'Tabla que contiene los Supervisores';
COMMENT ON COLUMN supervisor.curp IS 'Identificador del Supervisor';
COMMENT ON COLUMN supervisor.nombre IS 'Nombre del Supervisor';
COMMENT ON COLUMN supervisor.apellidoPaterno IS 'Apellido Paterno del Supervisor';
COMMENT ON COLUMN supervisor.apellidoMaterno IS 'Apellido Materno del Supervisor';
COMMENT ON COLUMN supervisor.estado IS 'Estado donde reside el Supervisor';
COMMENT ON COLUMN supervisor.calle IS 'Calle donde reside el Supervisor';
COMMENT ON COLUMN supervisor.numero IS 'Numero del domicilio del Supervisor';
COMMENT ON COLUMN supervisor.codigoPostal IS 'Codigo postal del Supervisor';
COMMENT ON COLUMN supervisor.telefono IS 'Telefono(s) del Supervisor';
COMMENT ON COLUMN supervisor.salario IS 'Salario del Supervisor';
COMMENT ON COLUMN supervisor.rfc IS 'El RFC del Supervisor';
COMMENT ON COLUMN supervisor.entrada IS 'Hora de entrada del Supervisor';
COMMENT ON COLUMN supervisor.salida IS 'Hora de salida del Supervisor';


CREATE TABLE veterinario(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
	apellidoPaterno VARCHAR(50) NOT NULL CHECK(apellidoPaterno <> ''),
	apellidoMaterno VARCHAR(50) NOT NULL CHECK(apellidoMaterno <> ''),
	numero INT NOT NULL UNIQUE,
	codigoPostal INT NOT NULL CHECK(codigoPostal between 10000 and 99999),
    calle VARCHAR(50) NOT NULL CHECK(calle <> ''), 
	estado VARCHAR(50) NOT NULL CHECK(estado <> ''),
	telefono CHAR(10) NOT NULL CHECK(CHAR_LENGTH(telefono) = 10) UNIQUE,
	salario INT NOT NULL,
	rfc CHAR(13) NOT NULL CHECK(CHAR_LENGTH(rfc) = 13) UNIQUE,
	entrada TIME NOT NULL,
	salida TIME NOT NULL,
	numeroPacientes INT NOT NULL,
	PRIMARY KEY(curp)
);
COMMENT ON TABLE veterinario IS 'Tabla que contiene los Veterinarios';
COMMENT ON COLUMN veterinario.curp IS 'Identificador del Veterinario';
COMMENT ON COLUMN veterinario.nombre IS 'Nombre del Veterinario';
COMMENT ON COLUMN veterinario.apellidoPaterno IS 'Apellido Paterno del Veterinario';
COMMENT ON COLUMN veterinario.apellidoMaterno IS 'Apellido Materno del Veterinario';
COMMENT ON COLUMN veterinario.estado IS 'Estado donde reside el Veterinario';
COMMENT ON COLUMN veterinario.calle IS 'Calle donde reside el Veterinario';
COMMENT ON COLUMN veterinario.numero IS 'Numero del domicilio del Veterinario';
COMMENT ON COLUMN veterinario.codigoPostal IS 'Codigo postal del Veterinario';
COMMENT ON COLUMN veterinario.telefono IS 'Telefono(s) del Veterinario';
COMMENT ON COLUMN veterinario.salario IS 'Salario del Veterinario';
COMMENT ON COLUMN veterinario.rfc IS 'El RFC del Veterinario';
COMMENT ON COLUMN veterinario.entrada IS 'Hora de entrada del Veterinario';
COMMENT ON COLUMN veterinario.salida IS 'Hora de salida del Veterinario';
COMMENT ON COLUMN veterinario.numeroPacientes IS 'El numero de pacientes que el Veterinario esta atendiendo';


CREATE TABLE estilista(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
	apellidoPaterno VARCHAR(50) NOT NULL CHECK(apellidoPaterno <> ''),
	apellidoMaterno VARCHAR(50) NOT NULL CHECK(apellidoMaterno <> ''),
	numero INT NOT NULL UNIQUE,
	codigoPostal INT NOT NULL CHECK(codigoPostal between 10000 and 99999),
    calle VARCHAR(50) NOT NULL CHECK(calle <> ''), 
	estado VARCHAR(50) NOT NULL CHECK(estado <> ''),
	telefono CHAR(10) NOT NULL CHECK(CHAR_LENGTH(telefono) = 10) UNIQUE,
	salario INT NOT NULL,
	certificado VARCHAR(50) NOT NULL CHECK(certificado <> ''),
	PRIMARY KEY(curp)
);
COMMENT ON TABLE estilista IS 'Tabla que contiene los Estilistas';
COMMENT ON COLUMN estilista.curp IS 'Identificador del Estilista';
COMMENT ON COLUMN estilista.nombre IS 'Nombre del Estilista';
COMMENT ON COLUMN estilista.apellidoPaterno IS 'Apellido Paterno del Estilista';
COMMENT ON COLUMN estilista.apellidoMaterno IS 'Apellido Materno del Estilista';
COMMENT ON COLUMN estilista.estado IS 'Estado donde reside el Estilista';
COMMENT ON COLUMN estilista.calle IS 'Calle donde reside el Estilista';
COMMENT ON COLUMN estilista.numero IS 'Numero del domicilio del Estilista';
COMMENT ON COLUMN estilista.codigoPostal IS 'Codigo postal del Estilista';
COMMENT ON COLUMN estilista.telefono IS 'Telefono(s) del Estilista';
COMMENT ON COLUMN estilista.salario IS 'Salario del Estilista';
COMMENT ON COLUMN estilista.certificado IS 'El RFC del Estilista';


CREATE TABLE telefonoSupervisor(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	telefono CHAR(10) NOT NULL CHECK(CHAR_LENGTH(telefono) = 18),
	constraint teleSupervisor_pkey PRIMARY KEY (curp,telefono),
	constraint teleSupervisor_fkey FOREIGN KEY (curp) REFERENCES supervisor(curp)
);
COMMENT ON TABLE telefonoSupervisor IS 'Contiene el numero telefonico de Supervisor';
COMMENT ON COLUMN telefonoSupervisor.curp IS 'Identificador del Supervisor';
COMMENT ON COLUMN telefonoSupervisor.telefono IS 'Numero telefonico del Supervisor';
COMMENT ON CONSTRAINT teleSupervisor_pkey IS 'Llave primaria de la tabla telefonoSupervisor';
COMMENT ON CONSTRAINT teleSupervisor_fkey IS 'Llave primaria de la tabla telefonoSupervisor';


CREATE TABLE telefonoVeterinario(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	telefono CHAR(10) NOT NULL CHECK(CHAR_LENGTH(telefono) = 18),
	constraint teleVeterinario_pkey PRIMARY KEY (curp,telefono),
	constraint teleVeterinario_fkey FOREIGN KEY (curp) REFERENCES veterinario(curp)
);
COMMENT ON TABLE telefonoVeterinario IS 'Contiene el numero telefonico de Veterinario';
COMMENT ON COLUMN telefonoVeterinario.curp IS 'Identificador del Veterinario';
COMMENT ON COLUMN telefonoVeterinario.telefono IS 'Numero telefonico del Veterinario';
COMMENT ON CONSTRAINT teleVeterinario_pkey IS 'Llave primaria de la tabla telefonoVeterinario';
COMMENT ON CONSTRAINT teleVeterinario_fkey IS 'Llave primaria de la tabla telefonoVeterinario';


CREATE TABLE telefonoEstilista(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	telefono CHAR(10) NOT NULL CHECK(CHAR_LENGTH(telefono) = 18),
	constraint teleEstilista_pkey PRIMARY KEY (curp,telefono),
	constraint teleEstilista_fkey FOREIGN KEY (curp) REFERENCES estilista(curp)
);
COMMENT ON TABLE telefonoEstilista IS 'Contiene el numero telefonico de Estilista';
COMMENT ON COLUMN telefonoEstilista.curp IS 'Identificador del Estilista';
COMMENT ON COLUMN telefonoEstilista.telefono IS 'Numero telefonico del Estilista';
COMMENT ON CONSTRAINT teleEstilista_pkey IS 'Llave primaria de la tabla telefonoEstilista';
COMMENT ON CONSTRAINT teleEstilista_fkey IS 'Llave primaria de la tabla telefonoEstilista';


CREATE TABLE supervisorTrabajaEn(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	nombreEstetica VARCHAR(18) NOT NULL CHECK(nombreEstetica <> '') UNIQUE,
    PRIMARY KEY(curp,nombreEstetica),
	FOREIGN KEY(curp) REFERENCES supervisor(curp),
	FOREIGN KEY(nombreEstetica) REFERENCES estetica(nombreEstetica)
);
COMMENT ON TABLE supervisorTrabajaEn IS 'Tabla para relacionar Supervisor con Estetica donde trabaja';
COMMENT ON COLUMN supervisorTrabajaEn.curp IS 'Identificador del Supervisor';
COMMENT ON COLUMN supervisorTrabajaEn.nombreEstetica IS 'Identificador de la Estetica en cuestion';


CREATE TABLE veterinarioTrabajaEn(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	nombreEstetica VARCHAR(18) NOT NULL CHECK(nombreEstetica <> ''),
    PRIMARY KEY(curp,nombreEstetica),
	FOREIGN KEY(curp) REFERENCES veterinario(curp),
	FOREIGN KEY(nombreEstetica) REFERENCES estetica(nombreEstetica)
);
COMMENT ON TABLE veterinarioTrabajaEn IS 'Tabla para relacionar Veterinario con la Estetica donde trabaja';
COMMENT ON COLUMN veterinarioTrabajaEn.curp IS 'Identificador del Veterinario';
COMMENT ON COLUMN veterinarioTrabajaEn.nombreEstetica IS 'Identificador de la Estetica en cuestion';


CREATE TABLE estilistaTrabajaEn(
	curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
	nombreEstetica VARCHAR(18) NOT NULL CHECK(nombreEstetica <> '') UNIQUE,
    PRIMARY KEY(curp,nombreEstetica),
	FOREIGN KEY(curp) REFERENCES estilista(curp),
	FOREIGN KEY(nombreEstetica) REFERENCES estetica(nombreEstetica)
);
COMMENT ON TABLE estilistaTrabajaEn IS 'Tabla para relacionar Estilista con la Estetica donde trabaja';
COMMENT ON COLUMN estilistaTrabajaEn.curp IS 'Identificador del Estilista';
COMMENT ON COLUMN estilistaTrabajaEn.nombreEstetica IS 'Identificador de la Estetica en cuestion';


INSERT INTO cliente VALUES ('12345678901234567A', 'David', 'Hernández', 'Uriostegui', 1, 10000, 'Ignacio Allende', 'Guanajuato', '4731241727'); 
INSERT INTO mascota VALUES ('12345678901234598A', '12345678901234567A', 'David', 'Ron', 13, 'Cocker', 'Perro', 20.5); 


INSERT INTO cliente VALUES ('12345678901234565A', 'David', 'Hernández', 'Escoto', 2 ,10000, 'Ignacio Allende', 'Guanajuato', '4731241728'); 
INSERT INTO mascota VALUES ('12345678901234599A', '12345678901234565A', 'David', 'Ron', 13, 'Cocker', 'Perro', 20.5); 

INSERT INTO estilista VALUES ('12345678901233367A', 'Pedro', 'Paramo', 'Vela', 1, 10000, 'Ignacio Allende', 'Guanajuato', '4731241727', 500, 'NA'); 

INSERT INTO veterinario VALUES ('12345678901233367A', 'Carlos', 'Sanchez', 'Cortez', 1, 40000, 'Ignacio Allende', 'Guanajuato', '4731241727', 1000, '0000123456789', '12:00', '18:00', 2); 

INSERT INTO estetica VALUES ('HAPPY DOGGO', '5520124576', 50000, 'Diaz Ordaz', 'Queretaro', 1);

INSERT INTO veterinarioTrabajaEn VALUES ('12345678901233367A', 'HAPPY DOGGO');

INSERT INTO producto VALUES ('00045678901234565A', 'Bolsas Pedigree', 100, NULL, 'Croquetas para perro', 'En 2 meses después de su compra', TRUE, FALSE);
INSERT INTO vender VALUES ('HAPPY DOGGO', '00045678901234565A');
INSERT INTO consultorio VALUES ('0004567890123456BG', 'HAPPY DOGGO', FALSE);
INSERT INTO horario VALUES ('HAPPY DOGGO', '11:00', '19:00');
select * from horario;

