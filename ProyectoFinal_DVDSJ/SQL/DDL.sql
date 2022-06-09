DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;


CREATE TABLE taqueria (
    id INT NOT NULL UNIQUE,
    RFC VARCHAR(13) NOT NULL CHECK(RFC ~* '^[a-z0-9]+$') UNIQUE,
    nombre   VARCHAR(100) NOT NULL CHECK(nombre <> ''),
    calle    VARCHAR(50)  NOT NULL,
    numero   VARCHAR(10)  NOT NULL,
    estado   VARCHAR(50)  NOT NULL CHECK(estado ~* '^[a-z]+$'),
    cpostal  VARCHAR(5)   NOT NULL CHECK(cpostal ~* '^[0-9]+$' AND  CHAR_LENGTH(cpostal) = 5),
    telefono VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(telefono) = 10) UNIQUE,
    email    VARCHAR(320) NOT NULL UNIQUE,
    
    PRIMARY KEY(id)
);


CREATE TABLE parrillero (
    RFC VARCHAR(13) NOT NULL CHECK(RFC ~* '^[a-z0-9]+$') UNIQUE,
    idTaqueria INT  NOT NULL,
    -- Nombre completo
    nombre   VARCHAR(50) NOT NULL CHECK(nombre <> '' AND nombre ~* '^[a-z]+$'),
    APaterno VARCHAR(50) NOT NULL CHECK(APaterno <> '' AND APaterno ~* '^[a-z]+$'),
    AMaterno VARCHAR(50) NOT NULL CHECK(AMaterno <> '' AND AMaterno ~* '^[a-z]+$'),
    -- Direccion
    calle   VARCHAR(50) NOT NULL,
    numero  VARCHAR(10) NOT NULL,
    estado  VARCHAR(50) NOT NULL CHECK(estado ~* '^[a-z]+$'),
    cpostal VARCHAR(5)  NOT NULL CHECK(cpostal ~* '^[0-9]+$' AND  CHAR_LENGTH(cpostal) = 5),

    edad INT NOT NULL CHECK(edad >= 18),
    NSS        VARCHAR(11)  NOT NULL CHECK(NSS ~* '^[a-z0-9]+$' AND CHAR_LENGTH(NSS) = 11) UNIQUE,
    antiguedad DATE NOT NULL,
    telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(telefono) = 10) UNIQUE,
    email      VARCHAR(320) NOT NULL UNIQUE,

    PRIMARY KEY(RFC),
    FOREING KEY(idTaqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE NO ACTION
);


CREATE TABLE taquero (
    RFC VARCHAR(13) NOT NULL CHECK(RFC ~* '^[a-z0-9]+$') UNIQUE,
    idTaqueria INT  NOT NULL,
    -- Nombre completo
    nombre   VARCHAR(50) NOT NULL CHECK(nombre <> '' AND nombre ~* '^[a-z]+$'),
    APaterno VARCHAR(50) NOT NULL CHECK(APaterno <> '' AND APaterno ~* '^[a-z]+$'),
    AMaterno VARCHAR(50) NOT NULL CHECK(AMaterno <> '' AND AMaterno ~* '^[a-z]+$'),
    -- Direccion
    calle   VARCHAR(50) NOT NULL,
    numero  VARCHAR(10) NOT NULL,
    estado  VARCHAR(50) NOT NULL CHECK(estado ~* '^[a-z]+$'),
    cpostal VARCHAR(5)  NOT NULL CHECK(cpostal ~* '^[0-9]+$' AND  CHAR_LENGTH(cpostal) = 5),

    edad INT NOT NULL CHECK(edad >= 18),
    NSS        VARCHAR(11)  NOT NULL CHECK(NSS ~* '^[a-z0-9]+$' AND CHAR_LENGTH(NSS) = 11) UNIQUE,
    antiguedad DATE NOT NULL,
    telefono   VARCHAR(10)  NOT NULL CHECK(CHAR_LENGTH(telefono) = 10) UNIQUE,
    email      VARCHAR(320) NOT NULL UNIQUE,

    PRIMARY KEY(RFC),
    FOREING KEY(idTaqueria) REFERENCES taqueria(id) ON UPDATE CASCADE ON DELETE NO ACTION
);

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
