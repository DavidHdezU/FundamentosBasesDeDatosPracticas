/*
 * Author: Diego Padilla
 * Version: 22.5.23
 */

-- Funcion para invertir los apellidos
CREATE OR REPLACE FUNCTION swap()
	RETURNS TRIGGER AS $$ 
	DECLARE 
		dummy TEXT := NEW.apellidoPaterno;
	BEGIN
		NEW.apellidoPaterno := NEW.apellidoMaterno;
		NEW.apellidoMaterno := dummy;

		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;


-- Un trigger que se encargue de invertir el apellido paterno con el apellido materno de los supervisores.
CREATE OR REPLACE TRIGGER inviertir
	BEFORE INSERT OR UPDATE 
	ON supervisor 
	FOR EACH ROW
	EXECUTE PROCEDURE swap();



-- Funcion para detener cambios en Mascota
CREATE OR REPLACE FUNCTION stopChanges()
	RETURNS TRIGGER AS $$
	BEGIN
		IF (TG_OP = 'UPDATE') THEN
			RAISE EXCEPTION 'No puedes modificar la tabla Mascota';
		ELSIF (TG_OP = 'DELETE') THEN 
			RAISE EXCEPTION 'No puedes modificar la tabla Mascota';
		END IF;
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;

-- Un trigger que se encargue de evitar que se pueda modificar y borrar de la tabla mascota.
CREATE OR REPLACE TRIGGER sinModificaciones
	BEFORE UPDATE OR DELETE
	ON mascota 
	FOR EACH ROW 
	EXECUTE PROCEDURE stopChanges();
