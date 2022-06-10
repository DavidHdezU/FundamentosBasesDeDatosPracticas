-- vim:fileencoding=utf-8:foldmethod=marker
/*
 * Author: Diego Padilla
 * Version: 22.5.9
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
    Estado   VARCHAR(50)  NOT NULL CHECK(Estado ~* '^[a-z]+$'),
    C_Postal VARCHAR(5)   NOT NULL CHECK(C_Postal ~* '^[0-9]+$' AND  CHAR_LENGTH(C_Postal) = 5),
    -- Contacto
    Telefono VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email    VARCHAR(320) NOT NULL UNIQUE,
    
    PRIMARY KEY(id)
);


-- Empleados    -- {{{
CREATE TABLE parrillero (
    RFC VARCHAR(13) NOT NULL CHECK(RFC ~* '^[a-z0-9]+$') UNIQUE,
    id_Taqueria INT NOT NULL,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre <> '' AND Nombre ~* '^[a-z]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado ~* '^[a-z]+$'),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$' AND  CHAR_LENGTH(C_Postal) = 5),

    Edad INT NOT NULL CHECK(edad >= 18),
    NSS        VARCHAR(11)  NOT NULL CHECK(NSS ~* '^[a-z0-9]+$' AND CHAR_LENGTH(NSS) = 11) UNIQUE,
    Antiguedad DATE NOT NULL CHECK(Antiguedad <= NOW()),
    -- Contacto
    Telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email      VARCHAR(320) NOT NULL UNIQUE,

    PRIMARY KEY (RFC),
    FOREIGN KEY (id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE taquero (
    RFC VARCHAR(13) NOT NULL CHECK(RFC ~* '^[a-z0-9]+$') UNIQUE,
    id_Taqueria INT NOT NULL,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre <> '' AND Nombre ~* '^[a-z]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado ~* '^[a-z]+$'),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$' AND  CHAR_LENGTH(C_Postal) = 5),

    Edad INT NOT NULL CHECK(edad >= 18),
    NSS        VARCHAR(11)  NOT NULL CHECK(NSS ~* '^[a-z0-9]+$' AND CHAR_LENGTH(NSS) = 11) UNIQUE,
    Antiguedad DATE NOT NULL CHECK(Antiguedad <= NOW()),
    -- Contacto
    Telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email      VARCHAR(320) NOT NULL UNIQUE,

    PRIMARY KEY(RFC),
    FOREIGN KEY(id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE mesero (
    RFC VARCHAR(13) NOT NULL CHECK(RFC ~* '^[a-z0-9]+$') UNIQUE,
    id_Taqueria INT NOT NULL,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre <> '' AND Nombre ~* '^[a-z]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado ~* '^[a-z]+$'),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$' AND  CHAR_LENGTH(C_Postal) = 5),

    Edad INT NOT NULL CHECK(edad >= 18),
    NSS        VARCHAR(11)  NOT NULL CHECK(NSS ~* '^[a-z0-9]+$' AND CHAR_LENGTH(NSS) = 11) UNIQUE,
    Antiguedad DATE NOT NULL CHECK(Antiguedad <= NOW()),
    -- Contacto
    Telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email      VARCHAR(320) NOT NULL UNIQUE,

    PRIMARY KEY(RFC),
    FOREIGN KEY(id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE cajero (
    RFC VARCHAR(13) NOT NULL CHECK(RFC ~* '^[a-z0-9]+$') UNIQUE,
    id_Taqueria INT NOT NULL,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre <> '' AND Nombre ~* '^[a-z]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado ~* '^[a-z]+$'),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$' AND  CHAR_LENGTH(C_Postal) = 5),

    Edad INT NOT NULL CHECK(edad >= 18),
    NSS        VARCHAR(11)  NOT NULL CHECK(NSS ~* '^[a-z0-9]+$' AND CHAR_LENGTH(NSS) = 11) UNIQUE,
    Antiguedad DATE NOT NULL CHECK(Antiguedad <= NOW()),
    -- Contacto
    Telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email      VARCHAR(320) NOT NULL UNIQUE,

    PRIMARY KEY(RFC),
    FOREIGN KEY(id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE tortillero (
    RFC VARCHAR(13) NOT NULL CHECK(RFC ~* '^[a-z0-9]+$') UNIQUE,
    id_Taqueria INT NOT NULL,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre <> '' AND Nombre ~* '^[a-z]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado ~* '^[a-z]+$'),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$' AND  CHAR_LENGTH(C_Postal) = 5),

    Edad INT NOT NULL CHECK(edad >= 18),
    NSS        VARCHAR(11)  NOT NULL CHECK(NSS ~* '^[a-z0-9]+$' AND CHAR_LENGTH(NSS) = 11) UNIQUE,
    Antiguedad DATE NOT NULL CHECK(Antiguedad <= NOW()),
    -- Contacto
    Telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email      VARCHAR(320) NOT NULL UNIQUE,

    PRIMARY KEY(RFC),
    FOREIGN KEY(id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE repartidor (
    RFC VARCHAR(13) NOT NULL CHECK(RFC ~* '^[a-z0-9]+$') UNIQUE,
    id_Taqueria INT NOT NULL,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre <> '' AND Nombre ~* '^[a-z]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado ~* '^[a-z]+$'),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$' AND  CHAR_LENGTH(C_Postal) = 5),

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

    PRIMARY KEY(RFC),
    FOREIGN KEY(id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE CASCADE
);
-- }}}


CREATE TABLE cliente (
    CURP VARCHAR(18) NOT NULL CHECK(CURP ~* '^[a-z0-9]+$') UNIQUE,
    id_Taqueria INT NOT NULL,
    -- Nombre completo
    Nombre    VARCHAR(50) NOT NULL CHECK(Nombre <> '' AND Nombre ~* '^[a-z\s]+$'),
    A_Paterno VARCHAR(50) NOT NULL CHECK(A_Paterno <> '' AND A_Paterno ~* '^[a-z\s]+$'),
    A_Materno VARCHAR(50) NOT NULL CHECK(A_Materno <> '' AND A_Materno ~* '^[a-z\s]+$'),
    -- Direccion
    Calle    VARCHAR(50) NOT NULL,
    Numero   VARCHAR(10) NOT NULL,
    Estado   VARCHAR(50) NOT NULL CHECK(Estado ~* '^[a-z]+$'),
    C_Postal VARCHAR(5)  NOT NULL CHECK(C_Postal ~* '^[0-9]+$' AND  CHAR_LENGTH(C_Postal) = 5),
    -- Contacto
    Telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(Telefono) = 10) UNIQUE,
    Email      VARCHAR(320) NOT NULL UNIQUE,

    A_Domicilio BOOLEAN NOT NULL,
    Puntos_Taquero_Corazon DECIMAL NOT NULL CHECK(Puntos_Taquero_Corazon >= 0),

    PRIMARY KEY(CURP),
    FOREIGN KEY(id_Taqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE NO ACTION
);


CREATE TABLE ticket (
    id VARCHAR(4) NOT NULL CHECK(id ~* '^[a-z0-9]+$' AND CHAR_LENGTH(id) = 4) UNIQUE,
    id_Cliente VARCHAR(18) NOT NULL,
    Fecha DATE NOT NULL CHECK(Fecha <= NOW()),
    RFC_Mesero VARCHAR(13) NOT NULL CHECK(RFC_Mesero ~* '^[a-z0-9]+$'), -- TODO: Asegurar integridad referencial con los RFC de mesero
    -- Metodo de pago
    Es_Efectivo BOOLEAN NOT NULL,
    Es_Tarjeta  BOOLEAN NOT NULL,
    Es_Puntos   BOOLEAN NOT NULL,
    -- Monto
    Total DECIMAL NOT NULL CHECK(Total >= 0),

    PRIMARY KEY(id),
    FOREIGN KEY(id_Cliente) REFERENCES cliente(CURP) ON UPDATE CASCADE ON DELETE NO ACTION
);


-- Menu     -- {{{
CREATE TABLE categoria (
    id INT NOT NULL UNIQUE,
    Nombre VARCHAR(50) CHECK(Nombre <> ''),

    PRIMARY KEY(id)
);


CREATE TABLE item (
    id INT NOT NULL UNIQUE,
    id_Categoria   INT  NOT NULL,
    Nombre VARCHAR(50)  NOT NULL CHECK(Nombre <> ''),
    Descripcion TEXT    NOT NULL,
    Precio      DECIMAL NOT NULL CHECK(Precio >= 0),

    PRIMARY KEY(id),
    FOREIGN KEY(id_Categoria) REFERENCES categoria(id) ON UPDATE CASCADE ON DELETE CASCADE
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

    PRIMARY KEY(id),
    FOREIGN KEY(id_Categoria) REFERENCES categoria(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE ingrediente (
    id INT NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL CHECK(Nombre <> ''),
    Tipo   VARCHAR(50) NOT NULL CHECK(Nombre <> ''),
    Precio DECIMAL NOT NULL CHECK(Precio >= 0),

    PRIMARY KEY(id)
);


CREATE TABLE utilizar (
    id_Item INT NOT NULL,
    id_Ingrediente INT NOT NULL,
    
    Cantidad INT NOT NULL CHECK(Cantidad >= 0),

    PRIMARY KEY(id_Item, id_Ingrediente),
    FOREIGN KEY(id_Item) REFERENCES item(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(id_Ingrediente) REFERENCES ingrediente(id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE utilizar_en_salsa (
    id_Salsa INT NOT NULL,
    id_Ingrediente INT NOT NULL,
    
    Cantidad INT NOT NULL CHECK(Cantidad >= 0),

    PRIMARY KEY(id_Salsa, id_Ingrediente),
    FOREIGN KEY(id_Salsa) REFERENCES salsa(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(id_Ingrediente) REFERENCES ingrediente(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- }}}

----------- Comments -----------

-- Comentarios de Taqueria      -- {{{
COMMENT ON TABLE taqueria IS 'Almacena la informacion de todas las taquerias';
-- }}}

-- Comentarios de Parrillero    -- {{{ 
COMMENT ON TABLE parrillero IS 'Almacena la informacion de todos los empleados parrilleros';
-- }}}

-- Comentarios de Taquero      -- {{{ 
COMMENT ON TABLE taquero IS 'Almacena la informacion de todos los empleados taqueros';
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