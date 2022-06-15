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
    id_Registro INT NOT NULL UNIQUE,
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
COMMENT ON TABLE taqueria          IS 'Almacena la informacion de todas las taquerias';
COMMENT ON COLUMN taqueria.id       IS 'El id de la taqueria';
COMMENT ON COLUMN taqueria.rfc      IS 'El RFC de la taqueria';
COMMENT ON COLUMN taqueria.nombre   IS 'Nombre de la taqueria';
COMMENT ON COLUMN taqueria.calle    IS 'Calle donde se encuentra la taqueria';
COMMENT ON COLUMN taqueria.numero   IS 'Numero (direccion) de la taqueria';
COMMENT ON COLUMN taqueria.estado   IS 'Estado donde se ubica la taqueria';
COMMENT ON COLUMN taqueria.c_postal IS 'Codigo Postal de la taqueria';
COMMENT ON COLUMN taqueria.telefono IS 'Numero telefonico de la taqueria';
-- }}}

-- Comentarios de Parrillero    -- {{{ 
COMMENT ON TABLE parrillero      IS 'Almacena la informacion de todos los empleados parrilleros';
COMMENT ON COLUMN parrillero.curp IS 'El CURP del parrillero';
COMMENT ON COLUMN parrillero.rfc  IS 'El RFC del parrillero';
COMMENT ON COLUMN parrillero.id_taqueria IS 'ID de la taqueria donde trabaja el parrillero';
COMMENT ON COLUMN parrillero.nombre      IS 'Nombre del parrillero';
COMMENT ON COLUMN parrillero.a_paterno   IS 'Apellido paterno del parrillero';
COMMENT ON COLUMN parrillero.a_materno   IS 'Apellido materno del parrillero';
COMMENT ON COLUMN parrillero.calle       IS 'Calle donde vive el parrillero';
COMMENT ON COLUMN parrillero.numero      IS 'Numero (direccion) donde vive el parrillero';
COMMENT ON COLUMN parrillero.estado      IS 'Estado de donde es originario el parrillero';
COMMENT ON COLUMN parrillero.c_postal    IS 'Codigo postal de donde vive el parrillero';
COMMENT ON COLUMN parrillero.edad        IS 'Edad del parrillero';
COMMENT ON COLUMN parrillero.nss         IS 'Numero de Seguridad Social del parrillero';
COMMENT ON COLUMN parrillero.antiguedad  IS 'Fecha de conratacion del parrillero';
COMMENT ON COLUMN parrillero.telefono    IS 'Numero telefonico del parrillero';
COMMENT ON COLUMN parrillero.email       IS 'Email del parrillero';
-- }}}

-- Comentarios de Taquero      -- {{{ 
COMMENT ON TABLE taquero      IS 'Almacena la informacion de todos los empleados taqueros';
COMMENT ON COLUMN taquero.curp IS 'El CURP del taquero';
COMMENT ON COLUMN taquero.rfc  IS 'El RFC del taquero';
COMMENT ON COLUMN taquero.id_taqueria IS 'ID de la taqueria donde trabaja el taquero';
COMMENT ON COLUMN taquero.nombre      IS 'Nombre del taquero';
COMMENT ON COLUMN taquero.a_paterno   IS 'Apellido paterno del taquero';
COMMENT ON COLUMN taquero.a_materno   IS 'Apellido materno del taquero';
COMMENT ON COLUMN taquero.calle       IS 'Calle donde vive el taquero';
COMMENT ON COLUMN taquero.numero      IS 'Numero (direccion) donde vive el taquero';
COMMENT ON COLUMN taquero.estado      IS 'Estado de donde es originario el taquero';
COMMENT ON COLUMN taquero.c_postal    IS 'Codigo postal de donde vive el taquero';
COMMENT ON COLUMN taquero.edad        IS 'Edad del taquero';
COMMENT ON COLUMN taquero.nss         IS 'Numero de Seguridad Social del taquero';
COMMENT ON COLUMN taquero.antiguedad  IS 'Fecha de conratacion del taquero';
COMMENT ON COLUMN taquero.telefono    IS 'Numero telefonico del taquero';
COMMENT ON COLUMN taquero.email       IS 'Email del taquero';
-- }}}

-- Comentarios de Mesero      -- {{{ 
COMMENT ON TABLE mesero IS 'Almacena la informacion de todos los empleados meseros';
-- }}}

-- Comentarios de Cajero      -- {{{ 
COMMENT ON TABLE cajero IS 'Almacena la informacion de todos los empleados cajeros';
-- }}}

-- Comentarios de Tortillero  -- {{{ 
COMMENT ON TABLE tortillero IS 'Almacena la informacion de todos los empleados tortilleros';
-- }}}

-- Comentarios de Repartidor  -- {{{ 
COMMENT ON TABLE repartidor IS 'Almacena la informacion de todos los empleados repartidores';
-- }}}

-- Comentarios de Cliente     -- {{{ 
COMMENT ON TABLE cliente IS 'Almacena la informacion de todos los clientes';
-- }}}

-- Comentarios de Ticket      -- {{{ 
COMMENT ON TABLE ticket IS 'Almacena la informacion de todos los tickets de consumo';
-- }}}

-- Comentarios de Categoria   -- {{{ 
COMMENT ON TABLE categoria IS 'Almacena la informacion de las categorias del menu del restaurante';
-- }}}

-- Comentarios de Item        -- {{{ 
COMMENT ON TABLE item IS 'Almacena la informacion de todos los items del menu';
-- }}}

-- Comentarios de Salsa       -- {{{ 
COMMENT ON TABLE salsa IS 'Almacena la informacion de las salsas';
-- }}}

-- Comentarios de Ingrediente -- {{{ 
COMMENT ON TABLE ingrediente IS 'Almacena la informacion relevante de los ingredientes para cada plato';
-- }}}

-- Comentarios de OrganizarMenu -- {{{ 
COMMENT ON TABLE organizar_menu IS 'Almacena la informacion relevante de como está organizado el menu';
-- }}}

-- Comentarios de RegistroHistorico -- {{{ 
COMMENT ON TABLE registro_historico IS 'Almacena la informacion relevante del registro historico de un item';
-- }}}

-- Comentarios de Compra -- {{{ 
COMMENT ON TABLE compra IS 'Almacena la informacion relevante de la información de una Compra';
-- }}}

-- Comentarios de Proveedor -- {{{ 
COMMENT ON TABLE proveedor IS 'Almacena la informacion relevante de la información de un proveedor';
-- }}}

-- Comentarios de TelefonoProveedor -- {{{ 
COMMENT ON TABLE telefono_proveedor IS 'Almacena la informacion relevante del telefono de un proveedor';
-- }}}

-- Comentarios de EmailProveedor -- {{{ 
COMMENT ON TABLE email_proveedor IS 'Almacena la informacion relevante del email de un proveedor';
-- }}}

-- Comentarios de Abastecer -- {{{ 
COMMENT ON TABLE abastecer IS 'Almacena la informacion sobre la relación abastecer';
-- }}}

-- Comentarios de Inventario -- {{{ 
COMMENT ON TABLE inventario IS 'Almacena la informacion sobre el inventario';
-- }}}

-- Comentarios de Vender     -- {{{ 
COMMENT ON TABLE vender IS 'Contiene los datos que relacionan ticket y item';
-- }}}