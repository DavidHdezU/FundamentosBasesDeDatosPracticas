-- vim:fileencoding=utf-8:foldmethod=marker
/*
 * Author: Diego Padilla
 * Version: 22.5.13
 */
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;


CREATE TABLE taqueria (
    id INT NOT NULL UNIQUE,
    RFC VARCHAR(13) NOT NULL CHECK(RFC ~* '^[a-z0-9]+$') UNIQUE,
    Nombre   VARCHAR(100) NOT NULL CHECK(Nombre <> ''),
    -- Direccion
    Calle    VARCHAR(50)  NOT NULL,
    Numero   VARCHAR(10)  NOT NULL,
    Estado   VARCHAR(50)  NOT NULL CHECK(Estado   <> ''),
    C_Postal VARCHAR(5)   NOT NULL CHECK(C_Postal ~* '^[0-9]+$'   AND CHAR_LENGTH(C_Postal) = 5),
    -- Contacto
    Telefono VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email    VARCHAR(320) NOT NULL UNIQUE,
    
    PRIMARY KEY (id)
);


-- Empleados    -- {{{
CREATE TABLE parrillero (
    CURP VARCHAR(18) NOT NULL CHECK(CURP ~* '^[a-z0-9]+$') UNIQUE,
    RFC  VARCHAR(13) NOT NULL CHECK(RFC  ~* '^[a-z0-9]+$') UNIQUE,
    id_Taqueria  INT NOT NULL,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre    <> '' AND Nombre    ~* '^[a-z\s]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z\s]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z\s]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado   <> ''),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$'   AND  CHAR_LENGTH(C_Postal) = 5),

    Edad INT NOT NULL CHECK(edad >= 18),
    NSS        VARCHAR(11)  NOT NULL CHECK(NSS ~* '^[a-z0-9]+$' AND CHAR_LENGTH(NSS) = 11) UNIQUE,
    Antiguedad DATE NOT NULL CHECK(Antiguedad <= NOW()),
    -- Contacto
    Telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email      VARCHAR(320) NOT NULL UNIQUE,

    PRIMARY KEY (CURP),
    FOREIGN KEY (id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE taquero (
    CURP VARCHAR(18) NOT NULL CHECK(CURP ~* '^[a-z0-9]+$') UNIQUE,
    RFC  VARCHAR(13) NOT NULL CHECK(RFC  ~* '^[a-z0-9]+$') UNIQUE,
    id_Taqueria  INT NOT NULL,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre    <> '' AND Nombre    ~* '^[a-z\s]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z\s]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z\s]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado   <> ''),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$'   AND  CHAR_LENGTH(C_Postal) = 5),

    Edad INT NOT NULL CHECK(edad >= 18),
    NSS        VARCHAR(11)  NOT NULL CHECK(NSS ~* '^[a-z0-9]+$' AND CHAR_LENGTH(NSS) = 11) UNIQUE,
    Antiguedad DATE NOT NULL CHECK(Antiguedad <= NOW()),
    -- Contacto
    Telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email      VARCHAR(320) NOT NULL UNIQUE,

    PRIMARY KEY (CURP),
    FOREIGN KEY (id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE mesero (
    CURP VARCHAR(18) NOT NULL CHECK(CURP ~* '^[a-z0-9]+$') UNIQUE,
    RFC  VARCHAR(13) NOT NULL CHECK(RFC  ~* '^[a-z0-9]+$') UNIQUE,
    id_Taqueria  INT NOT NULL,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre    <> '' AND Nombre    ~* '^[a-z\s]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z\s]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z\s]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado   <> ''),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$'   AND  CHAR_LENGTH(C_Postal) = 5),

    Edad INT NOT NULL CHECK(edad >= 18),
    NSS        VARCHAR(11)  NOT NULL CHECK(NSS ~* '^[a-z0-9]+$' AND CHAR_LENGTH(NSS) = 11) UNIQUE,
    Antiguedad DATE NOT NULL CHECK(Antiguedad <= NOW()),
    -- Contacto
    Telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email      VARCHAR(320) NOT NULL UNIQUE,

    PRIMARY KEY (CURP),
    FOREIGN KEY (id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE cajero (
    CURP VARCHAR(18) NOT NULL CHECK(CURP ~* '^[a-z0-9]+$') UNIQUE,
    RFC  VARCHAR(13) NOT NULL CHECK(RFC  ~* '^[a-z0-9]+$') UNIQUE,
    id_Taqueria  INT NOT NULL,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre    <> '' AND Nombre    ~* '^[a-z\s]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z\s]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z\s]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado   <> ''),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$'   AND  CHAR_LENGTH(C_Postal) = 5),

    Edad INT NOT NULL CHECK(edad >= 18),
    NSS        VARCHAR(11)  NOT NULL CHECK(NSS ~* '^[a-z0-9]+$' AND CHAR_LENGTH(NSS) = 11) UNIQUE,
    Antiguedad DATE NOT NULL CHECK(Antiguedad <= NOW()),
    -- Contacto
    Telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email      VARCHAR(320) NOT NULL UNIQUE,

    PRIMARY KEY (CURP),
    FOREIGN KEY (id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE tortillero (
    CURP VARCHAR(18) NOT NULL CHECK(CURP ~* '^[a-z0-9]+$') UNIQUE,
    RFC  VARCHAR(13) NOT NULL CHECK(RFC  ~* '^[a-z0-9]+$') UNIQUE,
    id_Taqueria  INT NOT NULL,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre    <> '' AND Nombre    ~* '^[a-z\s]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z\s]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z\s]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado   <> ''),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$'   AND  CHAR_LENGTH(C_Postal) = 5),

    Edad INT NOT NULL CHECK(edad >= 18),
    NSS        VARCHAR(11)  NOT NULL CHECK(NSS ~* '^[a-z0-9]+$' AND CHAR_LENGTH(NSS) = 11) UNIQUE,
    Antiguedad DATE NOT NULL CHECK(Antiguedad <= NOW()),
    -- Contacto
    Telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email      VARCHAR(320) NOT NULL UNIQUE,

    PRIMARY KEY (CURP),
    FOREIGN KEY (id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE repartidor (
    CURP VARCHAR(18) NOT NULL CHECK(CURP ~* '^[a-z0-9]+$') UNIQUE,
    RFC  VARCHAR(13) NOT NULL CHECK(RFC  ~* '^[a-z0-9]+$') UNIQUE,
    id_Taqueria  INT NOT NULL,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre    <> '' AND Nombre    ~* '^[a-z\s]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z\s]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z\s]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado   <> ''),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$'   AND  CHAR_LENGTH(C_Postal) = 5),

    Edad INT NOT NULL CHECK(edad >= 18),
    NSS        VARCHAR(11)  NOT NULL CHECK(NSS ~* '^[a-z0-9]+$' AND CHAR_LENGTH(NSS) = 11) UNIQUE,
    Antiguedad DATE NOT NULL CHECK(Antiguedad <= NOW()),
    -- Contacto
    Telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email      VARCHAR(320) NOT NULL UNIQUE,

    -- Transporte
    tieneTransportePropio BOOLEAN NOT NULL, 
    marca  VARCHAR(50),
    modelo VARCHAR(50),
    tipo   VARCHAR(50),

    PRIMARY KEY (CURP),
    FOREIGN KEY (id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE
);
-- }}}


CREATE TABLE cliente (
    CURP VARCHAR(18) NOT NULL CHECK(CURP ~* '^[a-z0-9]+$') UNIQUE,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre    <> '' AND Nombre    ~* '^[a-z\s]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z\s]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z\s]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado   <> ''),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$'   AND  CHAR_LENGTH(C_Postal) = 5),
    -- Contacto
    Telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email      VARCHAR(320) NOT NULL UNIQUE,

    A_Domicilio BOOLEAN NOT NULL,
    Puntos_Taquero_Corazon DECIMAL NOT NULL CHECK(Puntos_Taquero_Corazon >= 0),

    PRIMARY KEY (CURP)
);


CREATE TABLE ticket (
    id VARCHAR(8) NOT NULL CHECK(id ~* '^[a-z0-9]+$' AND CHAR_LENGTH(id) = 8) UNIQUE,
    id_Cliente VARCHAR(18) NOT NULL,
    id_Taqueria INT NOT NULL,
    Fecha DATE NOT NULL CHECK(Fecha <= NOW()),
    RFC_Mesero VARCHAR(13) NOT NULL CHECK(RFC_Mesero ~* '^[a-z0-9]+$'), -- TODO: Asegurar integridad referencial con los RFC de mesero
    -- Metodo de pago
    Es_Efectivo BOOLEAN NOT NULL,
    Es_Tarjeta  BOOLEAN NOT NULL,
    Es_Puntos   BOOLEAN NOT NULL,
    -- Monto
    Total DECIMAL NOT NULL CHECK(Total >= 0),

    PRIMARY KEY (id),
    FOREIGN KEY (id_Cliente) REFERENCES cliente(CURP) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE NO ACTION
);


-- Menu     -- {{{
CREATE TABLE categoria (
    id INT NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL CHECK(Nombre <> '') UNIQUE,

    PRIMARY KEY(id)
);

CREATE TABLE organizar_menu (
    id_Taqueria  INT NOT NULL,
    id_Categoria INT NOT NULL,

    PRIMARY KEY (id_Taqueria, id_Categoria),
    FOREIGN KEY (id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_Categoria) REFERENCES categoria(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE item (
    id INT NOT NULL UNIQUE,
    id_Categoria   INT  NOT NULL,
    Nombre VARCHAR(50)  NOT NULL CHECK(Nombre <> ''),
    Descripcion TEXT    NOT NULL,
    Precio      DECIMAL NOT NULL CHECK(Precio >= 0),

    PRIMARY KEY (id),
    FOREIGN KEY (id_Categoria) REFERENCES categoria(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE salsa (
    id INT NOT NULL UNIQUE,
    id_Categoria   INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL CHECK(Nombre <> ''),
    Picor  VARCHAR(50) NOT NULL CHECK(Picor <> ''),
    Recomendacion TEXT NOT NULL CHECK(Recomendacion <> ''),
    -- Precios
    Precio250  DECIMAL NOT NULL CHECK(Precio250 >= 0),
    Precio500  DECIMAL NOT NULL CHECK(Precio500 >= 0),
    Precio1000 DECIMAL NOT NULL CHECK(Precio1000 >= 0),

    PRIMARY KEY (id),
    FOREIGN KEY (id_Categoria) REFERENCES categoria(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE ingrediente (
    id INT NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL CHECK(Nombre <> ''),
    Tipo   VARCHAR(50) NOT NULL CHECK(Nombre <> ''),
    Precio DECIMAL     NOT NULL CHECK(Precio >= 0),

    PRIMARY KEY (id)
);

CREATE TABLE utilizar (
    id_Item        INT NOT NULL,
    id_Ingrediente INT NOT NULL,
    Cantidad       INT NOT NULL CHECK(Cantidad >= 0),

    PRIMARY KEY (id_Item, id_Ingrediente),
    FOREIGN KEY (id_Item) REFERENCES item(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_Ingrediente) REFERENCES ingrediente(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE utilizar_en_salsa (
    id_Salsa       INT NOT NULL,
    id_Ingrediente INT NOT NULL,
    Cantidad       INT NOT NULL CHECK(Cantidad >= 0),

    PRIMARY KEY (id_Salsa, id_Ingrediente),
    FOREIGN KEY (id_Salsa) REFERENCES salsa(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_Ingrediente) REFERENCES ingrediente(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE registro_historico (
    id_Registro SERIAL PRIMARY KEY,
    id_Item     INT NOT NULL,

    Precio   DECIMAL NOT NULL CHECK(Precio >= 0),
    Pinsumos DECIMAL NOT NULL CHECK(Pinsumos >= 0),
    Fecha    DATE    NOT NULL CHECK(Fecha <= NOW()),
    
    PRIMARY KEY (id_Registro),
    FOREIGN KEY (id_Item) REFERENCES item(id) ON UPDATE CASCADE ON DELETE CASCADE
);
-- }}}


-- Proveedor    -- {{{
CREATE TABLE proveedor (
    RFC    VARCHAR(13) NOT NULL CHECK(RFC ~* '^[a-z0-9]+$') UNIQUE,
    Nombre VARCHAR(50) NOT NULL CHECK(Nombre <> '' AND Nombre ~* '^[a-z]+$'),
    Servicio TEXT      NOT NULL,

    PRIMARY KEY (RFC)
);

CREATE TABLE compra (
    id INT NOT NULL UNIQUE,
    RFC_proveedor VARCHAR(13) NOT NULL CHECK(RFC_proveedor  ~* '^[a-z0-9]+$'),
    Marca VARCHAR(50) CHECK(Marca <> ''),
    Tipo  VARCHAR(50) CHECK(Tipo <> ''),
    FechaCompra     DATE NOT NULL CHECK(FechaCompra <= NOW()),
    FechaCaducidad  DATE NOT NULL CHECK(FechaCaducidad <= NOW()),
    CantidadComprada INT NOT NULL CHECK(CantidadComprada >= 0),
    PrecioCompra DECIMAL NOT NULL CHECK(PrecioCompra >= 0),

    PRIMARY KEY (id),
    FOREIGN KEY (RFC_proveedor) REFERENCES proveedor(RFC) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE telefono_proveedor(
    RFC_proveedor VARCHAR(13) NOT NULL CHECK(RFC_proveedor ~* '^[a-z0-9]+$') UNIQUE,
    Telefono      VARCHAR(10) NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,  

    PRIMARY KEY(RFC_proveedor, Telefono),
    FOREIGN KEY(RFC_proveedor) REFERENCES proveedor(RFC) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE email_proveedor(
    RFC_proveedor VARCHAR(13)  NOT NULL CHECK(RFC_proveedor ~* '^[a-z0-9]+$') UNIQUE,
    Email         VARCHAR(320) NOT NULL UNIQUE,
    
    PRIMARY KEY (RFC_proveedor, Email),
    FOREIGN KEY (RFC_proveedor) REFERENCES proveedor(RFC) ON UPDATE CASCADE ON DELETE CASCADE
);
 -- }}}


-- Inventario   -- {{{ 
CREATE TABLE abastecer (
    id_Taqueria INT NOT NULL,
    id_Compra   INT NOT NULL UNIQUE,

    PRIMARY KEY (id_Taqueria, id_Compra),
    FOREIGN KEY (id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_Compra) REFERENCES compra(id) ON UPDATE CASCADE ON DELETE CASCADE

);

CREATE TABLE inventario (
    id INT NOT NULL UNIQUE,
    id_Taqueria INT NOT NULL,

    Tipo VARCHAR(50) CHECK(Tipo <> ''),
    FechaCaducidad   DATE,
    CantidadRestante INT NOT NULL CHECK(CantidadRestante >= 0),

    PRIMARY KEY (id),
    FOREIGN KEY (id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE
);
-- }}}


-- Ventas   -- {{{
CREATE TABLE vender (
    id_Item   INT        NOT NULL,
    id_Ticket VARCHAR(8) NOT NULL CHECK(id_Ticket ~* '^[a-z0-9]+$' AND CHAR_LENGTH(id_Ticket) = 8),

    Cantidad   INT NOT NULL,
    
    PRIMARY KEY (id_Item, id_Ticket),
    FOREIGN KEY (id_Item)   REFERENCES item(id)   ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (id_Ticket) REFERENCES ticket(id) ON UPDATE CASCADE ON DELETE CASCADE
);
-- }}}


----------- Comments -----------

-- Comentarios de Taqueria      -- {{{
COMMENT ON TABLE taqueria           IS 'Almacena la informacion de todas las taquerias';
COMMENT ON COLUMN taqueria.id       IS 'El id de la taqueria';
COMMENT ON COLUMN taqueria.RFC      IS 'El RFC de la taqueria';
COMMENT ON COLUMN taqueria.Nombre   IS 'Nombre de la taqueria';
COMMENT ON COLUMN taqueria.Calle    IS 'Calle donde se encuentra la taqueria';
COMMENT ON COLUMN taqueria.Numero   IS 'Numero (direccion) de la taqueria';
COMMENT ON COLUMN taqueria.Estado   IS 'Estado donde se ubica la taqueria';
COMMENT ON COLUMN taqueria.C_Postal IS 'Codigo Postal de la taqueria';
COMMENT ON COLUMN taqueria.Telefono IS 'Numero telefonico de la taqueria';
COMMENT ON COLUMN taqueria.Email    IS 'Email de la taquería'
-- }}}

-- Comentarios de Parrillero    -- {{{ 
COMMENT ON TABLE parrillero              IS 'Almacena la informacion de todos los empleados parrilleros';
COMMENT ON COLUMN parrillero.CURP        IS 'El CURP del parrillero';
COMMENT ON COLUMN parrillero.RFC         IS 'El RFC del parrillero';
COMMENT ON COLUMN parrillero.id_Taqueria IS 'ID de la taqueria donde trabaja el parrillero';
COMMENT ON COLUMN parrillero.Nombre      IS 'Nombre del parrillero';
COMMENT ON COLUMN parrillero.A_Paterno   IS 'Apellido paterno del parrillero';
COMMENT ON COLUMN parrillero.A_Materno   IS 'Apellido materno del parrillero';
COMMENT ON COLUMN parrillero.Calle       IS 'Calle donde vive el parrillero';
COMMENT ON COLUMN parrillero.Numero      IS 'Numero (direccion) donde vive el parrillero';
COMMENT ON COLUMN parrillero.Estado      IS 'Estado de donde es originario el parrillero';
COMMENT ON COLUMN parrillero.C_Postal    IS 'Codigo postal de donde vive el parrillero';
COMMENT ON COLUMN parrillero.Edad        IS 'Edad del parrillero';
COMMENT ON COLUMN parrillero.NSS         IS 'Numero de Seguridad Social del parrillero';
COMMENT ON COLUMN parrillero.Antiguedad  IS 'Fecha de conratacion del parrillero';
COMMENT ON COLUMN parrillero.Telefono    IS 'Numero telefonico del parrillero';
COMMENT ON COLUMN parrillero.Email       IS 'Email del parrillero';
-- }}}

-- Comentarios de Taquero      -- {{{ 
COMMENT ON TABLE taquero      IS 'Almacena la informacion de todos los empleados taqueros';
COMMENT ON COLUMN taquero.CURP IS 'El CURP del taquero';
COMMENT ON COLUMN taquero.RFC  IS 'El RFC del taquero';
COMMENT ON COLUMN taquero.id_Taqueria IS 'ID de la taqueria donde trabaja el taquero';
COMMENT ON COLUMN taquero.Nombre      IS 'Nombre del taquero';
COMMENT ON COLUMN taquero.A_Paterno   IS 'Apellido paterno del taquero';
COMMENT ON COLUMN taquero.A_Materno   IS 'Apellido materno del taquero';
COMMENT ON COLUMN taquero.Calle       IS 'Calle donde vive el taquero';
COMMENT ON COLUMN taquero.Numero      IS 'Numero (direccion) donde vive el taquero';
COMMENT ON COLUMN taquero.Estado      IS 'Estado de donde es originario el taquero';
COMMENT ON COLUMN taquero.C_Postal    IS 'Codigo postal de donde vive el taquero';
COMMENT ON COLUMN taquero.Edad        IS 'Edad del taquero';
COMMENT ON COLUMN taquero.NSS         IS 'Numero de Seguridad Social del taquero';
COMMENT ON COLUMN taquero.Antiguedad  IS 'Fecha de conratacion del taquero';
COMMENT ON COLUMN taquero.Telefono    IS 'Numero telefonico del taquero';
COMMENT ON COLUMN taquero.Email       IS 'Email del taquero';
-- }}}

-- Comentarios de Mesero      -- {{{ 
COMMENT ON TABLE mesero IS 'Almacena la informacion de todos los empleados meseros';
COMMENT ON COLUMN mesero.CURP IS 'El CURP del mesero';
COMMENT ON COLUMN mesero.RFC  IS 'El RFC del mesero';
COMMENT ON COLUMN mesero.id_Taqueria IS 'ID de la taqueria donde trabaja el mesero';
COMMENT ON COLUMN mesero.Nombre      IS 'Nombre del mesero';
COMMENT ON COLUMN mesero.A_Paterno   IS 'Apellido paterno del mesero';
COMMENT ON COLUMN mesero.A_Materno   IS 'Apellido materno del mesero';
COMMENT ON COLUMN mesero.Calle       IS 'Calle donde vive el mesero';
COMMENT ON COLUMN mesero.Numero      IS 'Numero (direccion) donde vive el mesero';
COMMENT ON COLUMN mesero.Estado      IS 'Estado de donde es originario el mesero';
COMMENT ON COLUMN mesero.C_Postal    IS 'Codigo postal de donde vive el mesero';
COMMENT ON COLUMN mesero.Edad        IS 'Edad del mesero';
COMMENT ON COLUMN mesero.NSS         IS 'Numero de Seguridad Social del mesero';
COMMENT ON COLUMN mesero.Antiguedad  IS 'Fecha de conratacion del mesero';
COMMENT ON COLUMN mesero.Telefono    IS 'Numero telefonico del mesero';
COMMENT ON COLUMN mesero.Email       IS 'Email del mesero';
-- }}}

-- Comentarios de Cajero      -- {{{ 
COMMENT ON TABLE cajero IS 'Almacena la informacion de todos los empleados cajeros';
COMMENT ON COLUMN cajero.CURP IS 'El CURP del cajero';
COMMENT ON COLUMN cajero.RFC  IS 'El RFC del cajero';
COMMENT ON COLUMN cajero.id_Taqueria IS 'ID de la taqueria donde trabaja el cajero';
COMMENT ON COLUMN cajero.Nombre      IS 'Nombre del cajero';
COMMENT ON COLUMN cajero.A_Paterno   IS 'Apellido paterno del cajero';
COMMENT ON COLUMN cajero.A_Materno   IS 'Apellido materno del cajero';
COMMENT ON COLUMN cajero.Calle       IS 'Calle donde vive el cajero';
COMMENT ON COLUMN cajero.Numero      IS 'Numero (direccion) donde vive el cajero';
COMMENT ON COLUMN cajero.Estado      IS 'Estado de donde es originario el cajero';
COMMENT ON COLUMN cajero.C_Postal    IS 'Codigo postal de donde vive el cajero';
COMMENT ON COLUMN cajero.Edad        IS 'Edad del cajero';
COMMENT ON COLUMN cajero.NSS         IS 'Numero de Seguridad Social del cajero';
COMMENT ON COLUMN cajero.Antiguedad  IS 'Fecha de conratacion del cajero';
COMMENT ON COLUMN cajero.Telefono    IS 'Numero telefonico del cajero';
COMMENT ON COLUMN cajero.Email       IS 'Email del cajero';
-- }}}

-- Comentarios de Tortillero  -- {{{ 
COMMENT ON TABLE tortillero IS 'Almacena la informacion de todos los empleados tortilleros';
COMMENT ON COLUMN tortillero.CURP IS 'El CURP del tortillero';
COMMENT ON COLUMN tortillero.RFC  IS 'El RFC del tortillero';
COMMENT ON COLUMN tortillero.id_Taqueria IS 'ID de la taqueria donde trabaja el tortillero';
COMMENT ON COLUMN tortillero.Nombre      IS 'Nombre del tortillero';
COMMENT ON COLUMN tortillero.A_Paterno   IS 'Apellido paterno del tortillero';
COMMENT ON COLUMN tortillero.A_Materno   IS 'Apellido materno del tortillero';
COMMENT ON COLUMN tortillero.Calle       IS 'Calle donde vive el tortillero';
COMMENT ON COLUMN tortillero.Numero      IS 'Numero (direccion) donde vive el tortillero';
COMMENT ON COLUMN tortillero.Estado      IS 'Estado de donde es originario el tortillero';
COMMENT ON COLUMN tortillero.C_Postal    IS 'Codigo postal de donde vive el tortillero';
COMMENT ON COLUMN tortillero.Edad        IS 'Edad del tortillero';
COMMENT ON COLUMN tortillero.NSS         IS 'Numero de Seguridad Social del tortillero';
COMMENT ON COLUMN tortillero.Antiguedad  IS 'Fecha de conratacion del tortillero';
COMMENT ON COLUMN tortillero.Telefono    IS 'Numero telefonico del tortillero';
COMMENT ON COLUMN tortillero.Email       IS 'Email del tortillero';
-- }}}

-- Comentarios de Repartidor  -- {{{ 
COMMENT ON TABLE repartidor IS 'Almacena la informacion de todos los empleados repartidores';
COMMENT ON COLUMN repartidor.CURP IS 'El CURP del repartidor';
COMMENT ON COLUMN repartidor.RFC  IS 'El RFC del repartidor';
COMMENT ON COLUMN repartidor.id_Taqueria IS 'ID de la taqueria donde trabaja el repartidor';
COMMENT ON COLUMN repartidor.Nombre      IS 'Nombre del repartidor';
COMMENT ON COLUMN repartidor.A_Paterno   IS 'Apellido paterno del repartidor';
COMMENT ON COLUMN repartidor.A_Materno   IS 'Apellido materno del repartidor';
COMMENT ON COLUMN repartidor.Calle       IS 'Calle donde vive el repartidor';
COMMENT ON COLUMN repartidor.Numero      IS 'Numero (direccion) donde vive el repartidor';
COMMENT ON COLUMN repartidor.Estado      IS 'Estado de donde es originario el repartidor';
COMMENT ON COLUMN repartidor.C_Postal    IS 'Codigo postal de donde vive el repartidor';
COMMENT ON COLUMN repartidor.Edad        IS 'Edad del repartidor';
COMMENT ON COLUMN repartidor.NSS         IS 'Numero de Seguridad Social del repartidor';
COMMENT ON COLUMN repartidor.Antiguedad  IS 'Fecha de conratacion del repartidor';
COMMENT ON COLUMN repartidor.Telefono    IS 'Numero telefonico del repartidor';
COMMENT ON COLUMN repartidor.Email       IS 'Email del repartidor';
COMMENT ON COLUMN repartidor.tieneTransportePropio IS 'Booleano que pregunta si el repartidor tiene vehículo personal';
COMMENT ON COLUMN repartidor.marca       IS 'Marca del transporte del repartidor';
COMMENT ON COLUMN repartidor.modelo      IS 'Modelo del transporte del repartidor';
COMMENT ON COLUMN repartidor.tipo        IS 'Tipo de transporte del repartidor; Bicleta ó motocileta';
-- }}}

-- Comentarios de Cliente     -- {{{ 
COMMENT ON TABLE cliente IS 'Almacena la informacion de todos los clientes';
COMMENT ON COLUMN cliente.CURP IS 'El CURP del cliente';
COMMENT ON COLUMN cliente.Nombre      IS 'Nombre del cliente';
COMMENT ON COLUMN cliente.A_Paterno   IS 'Apellido paterno del cliente';
COMMENT ON COLUMN cliente.A_Materno   IS 'Apellido materno del cliente';
COMMENT ON COLUMN cliente.Calle       IS 'Calle donde vive el cliente';
COMMENT ON COLUMN cliente.Numero      IS 'Numero (direccion) donde vive el cliente';
COMMENT ON COLUMN cliente.Estado      IS 'Estado de donde es originario el cliente';
COMMENT ON COLUMN cliente.C_Postal    IS 'Codigo postal de donde vive el cliente';
COMMENT ON COLUMN cliente.Telefono    IS 'Numero telefonico del cliente';
COMMENT ON COLUMN cliente.Email       IS 'Email del cliente';
COMMENT ON COLUMN cliente.A_Domicilio IS 'Booleano que verifica si la compra del cliente es a domicilio';
COMMENT ON COLUMN cliente.Puntos_Taquero_Corazon IS 'Número de puntos que tiene el cliente en la Taquería';

-- }}}

-- Comentarios de Ticket      -- {{{ 
COMMENT ON TABLE ticket IS 'Almacena la informacion de todos los tickets de consumo';
COMMENT ON COLUMN ticket.id          IS 'ID del ticket de la compra';
COMMENT ON COLUMN ticket.id_Cliente  IS 'ID del cliente que realizó la compra';
COMMENT ON COLUMN ticket.Fecha       IS 'Fecha de la compra';
COMMENT ON COLUMN ticket.RFC_Mesero  IS 'RFC del mesero que tomó la orden de los clientes';
COMMENT ON COLUMN ticket.Es_Efectivo IS 'Indica si el pago del ticket fue realizado con efectivo';
COMMENT ON COLUMN ticket.Es_Tarjeta  IS 'Indica si el pago del ticket fue realizado con tarjeta';
COMMENT ON COLUMN ticket.Es_Puntos   IS 'Indica si el pago del ticket fue realizado con puntos de cliente';
COMMENT ON COLUMN ticket.Total       IS 'Total de precio a pagar';
-- }}}

-- Comentarios de Categoria   -- {{{ 
COMMENT ON TABLE categoria IS 'Almacena la informacion de las categorias del menu del restaurante';
COMMENT ON COLUMN categoria.id     IS 'Id de la categoría';
COMMENT ON COLUMN categoria.Nombre IS 'Nombre de la categoría en el menú';
-- }}}

-- Comentarios de OrganizarMenu -- {{{ 
COMMENT ON TABLE organizar_menu IS 'Almacena la informacion relevante de como está organizado el menu';
COMMENT ON COLUMN organizar_menu.id_Taqueria  IS 'ID de la taquería de la cual se organizará el menú';
COMMENT ON COLUMN organizar_menu.id_Categoria IS 'ID de la categoría organizada';
-- }}}

-- Comentarios de Item        -- {{{ 
COMMENT ON TABLE item IS 'Almacena la informacion de todos los items del menu';
COMMENT ON COLUMN item.id  IS 'ID del item';
COMMENT ON COLUMN item.id_Categoria IS 'ID de la categoría en la que se encuentra el item';
COMMENT ON COLUMN item.Nombre       IS 'Nombre del item en el menu';
COMMENT ON COLUMN item.Descripcion  IS 'Decripción del item en el menú';
COMMENT ON COLUMN item.Precio       IS 'Precio del item';
-- }}}

-- Comentarios de Salsa       -- {{{ 
COMMENT ON TABLE salsa IS 'Almacena la informacion de las salsas';
COMMENT ON COLUMN salsa.id             IS 'ID de la salsa';
COMMENT ON COLUMN salsa.id_Categoria   IS 'ID de la categoría en la que se encuentra la salsa';
COMMENT ON COLUMN salsa.Nombre         IS 'Nombre de la salsa';
COMMENT ON COLUMN salsa.Recomendacion  IS 'Recomendación para acompañar la salsa';
COMMENT ON COLUMN salsa.Picor          IS 'Nivel de picor de la salsa';
COMMENT ON COLUMN salsa.Precio250      IS 'Precio si se sirven menos de 250 ml de salsa';
COMMENT ON COLUMN salsa.Precio500      IS 'Precio si se sirven menos de 500 ml de salsa';
COMMENT ON COLUMN salsa.Precio1000     IS 'Precio si se sirven menos de 1L de salsa';
-- }}}

-- Comentarios de Ingrediente -- {{{ 
COMMENT ON TABLE ingrediente IS 'Almacena la informacion relevante de los ingredientes para cada plato';
COMMENT ON COLUMN ingrediente.id      IS 'ID del ingrediente';
COMMENT ON COLUMN ingrediente.Nombre  IS 'Nombre del item en el menu';
COMMENT ON COLUMN ingrediente.Tipo    IS 'Tipo de ingrediente';
COMMENT ON COLUMN ingrediente.Precio  IS 'Precio del ingrediente';
-- }}}

-- Comentarios de Utilizar -- {{{ 
COMMENT ON TABLE utilizar IS 'Utiliza una cantidad específica de ingrediente en un item';
COMMENT ON COLUMN utilizar.id_Item     IS 'ID del item donde se utilizará el ingrediente';
COMMENT ON COLUMN utilizar.id_Ingrediente  IS 'ID del ingrediente';
COMMENT ON COLUMN utilizar.Cantidad    IS 'Cantidad usada';
-- }}}

-- Comentarios de utilizarEnSalsa -- {{{ 
COMMENT ON TABLE utilizarEnSalsa IS 'Utiliza una cantidad específica de ingrediente en un item';
COMMENT ON COLUMN utilizarEnSalsa.id_Salsa    IS 'ID la salsa a preparar';
COMMENT ON COLUMN utilizarEnSalsa.id_Ingrediente  IS 'ID del ingrediente';
COMMENT ON COLUMN utilizarEnSalsa.Cantidad    IS 'Cantidad usada';
-- }}}

-- Comentarios de RegistroHistorico -- {{{ 
COMMENT ON TABLE registro_historico IS 'Almacena la informacion relevante del registro historico de un item';
COMMENT ON COLUMN registro_historico.id_Registro IS 'ID único del registro';
COMMENT ON COLUMN registro_historico.id_Item     IS 'ID del item al cuál pertenece el registro';
COMMENT ON COLUMN registro_historico.Precio      IS 'Precio del item en la fecha de registro';
COMMENT ON COLUMN registro_historico.Pinsumos    IS 'Precio de los insumos para elaborar el item';
COMMENT ON COLUMN registro_historico.Fecha       IS 'Fecha en la que se realizó el registro';
-- }}}

-- Comentarios de Proveedor -- {{{ 
COMMENT ON TABLE proveedor IS 'Almacena la informacion relevante de la información de un proveedor';
COMMENT ON COLUMN proveedor.RFC      IS 'RFC del proveedor';
COMMENT ON COLUMN proveedor.Nombre   IS 'Nombre del provedor';
COMMENT ON COLUMN proveedor.Servicio IS 'Descripción del servicio que efectuó el proveedor';
-- }}}

-- Comentarios de Compra -- {{{ 
COMMENT ON TABLE compra IS 'Almacena la informacion relevante de la información de una Compra';
COMMENT ON COLUMN compra.id               IS 'ID de la compra';
COMMENT ON COLUMN compra.RFC_proveedor    IS 'RFC del proveedor que realizó la compra';
COMMENT ON COLUMN compra.Marca            IS 'Marca de los productos comprados';
COMMENT ON COLUMN compra.Tipo             IS 'Tipo de los items comprados';
COMMENT ON COLUMN compra.FechaCompra      IS 'Fecha en que se realizó la compra';
COMMENT ON COLUMN compra.FechaCaducidad   IS 'Fecha de caducidad de los productos comprados';
COMMENT ON COLUMN compra.CantidadComprada IS 'Cantidad de producto comprado';
COMMENT ON COLUMN compra.PrecioCompra     IS 'Precio que se pagó por la compra';
-- }}}


-- Comentarios de TelefonoProveedor -- {{{ 
COMMENT ON TABLE telefono_proveedor                IS 'Almacena la informacion relevante del telefono de un proveedor';
COMMENT ON COLUMN telefono_proveedor.RFC_proveedor IS 'RFC del proveedor';
COMMENT ON COLUMN telefono_proveedor.Telefono      IS 'Teléfono del proveedor';
-- }}}

-- Comentarios de EmailProveedor -- {{{ 
COMMENT ON TABLE email_proveedor                IS 'Almacena la informacion relevante del email de un proveedor';
COMMENT ON COLUMN email_proveedor.RFC_proveedor IS 'RFC del proveedor';
COMMENT ON COLUMN email_proveedor.Email         IS 'Teléfono del proveedor';
-- }}}

-- Comentarios de Abastecer -- {{{ 
COMMENT ON TABLE abastecer              IS 'Almacena la informacion sobre la relación abastecer';
COMMENT ON COLUMN abastecer.id_Taqueria IS 'ID de la taquería a abastecer';
COMMENT ON COLUMN abastecer.id_Compra   IS 'ID de la compra de abastecimiento';
-- }}}

-- Comentarios de Inventario -- {{{ 
COMMENT ON TABLE inventario                   IS 'Almacena la informacion sobre el inventario';
COMMENT ON COLUMN inventario.id               IS 'ID del inventario de las taquerías';
COMMENT ON COLUMN inventario.id_Taqueria      IS 'ID de la taquería cuyo inventario es este';
COMMENT ON COLUMN inventario.Tipo             IS 'Tipo de producto en el inventario';
COMMENT ON COLUMN inventario.FechaCaducidad   IS 'Fecha de caducidad del producto en el inventario';
COMMENT ON COLUMN inventario.CantidadRestante IS 'Cantidad restante de productos en el inventario';
-- }}}

-- Comentarios de Vender     -- {{{ 
COMMENT ON TABLE vender            IS 'Contiene los datos que relacionan ticket y item';
COMMENT ON COLUMN vender.id_Item   IS 'ID del item que se vendió';
COMMENT ON COLUMN vender.id_Ticket IS 'ID del ticket de la compra';
COMMENT ON COLUMN vender.Cantidad  IS 'Cantidad de item vendido';
-- }}}