/*
 * Author: Diego Padilla
 * Version: 22.5.9
 */

CREATE OR REPLACE FUNCTION default_data()
    RETURNS TRIGGER AS 
    $$
    BEGIN
        IF (TG_OP = 'INSERT') THEN 
            INSERT INTO 
                cliente(CURP, Nombre, A_Paterno, A_Materno,
                        Calle, Numero, Estado, C_Postal, Telefono, 
                        Email, A_Domicilio, Puntos_Taquero_Corazon)
            VALUES 
                (NEW.RFC, NEW.Nombre, 'Ricos', 'Tacos', NEW.Calle,
                NEW.Numero, NEW.Estado, NEW.C_Postal, NEW.Telefono,
                NEW.Email, FALSE, 0);

        ELSIF (TG_OP = 'UPDATE') THEN 
            -- Eliminar cliente default anterior
            DELETE FROM cliente AS clnt WHERE clnt.CURP = OLD.RFC;
            -- Crear un cliente default nuevo
            INSERT INTO 
                cliente(CURP, Nombre, A_Paterno, A_Materno,
                        Calle, Numero, Estado, C_Postal, Telefono, 
                        Email, A_Domicilio, Puntos_Taquero_Corazon)
            VALUES 
                (NEW.RFC, NEW.Nombre, 'Ricos', 'Tacos', NEW.Calle,
                NEW.Numero, NEW.Estado, NEW.C_Postal, NEW.Telefono,
                NEW.Email, FALSE, 0);
        END IF;
        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER usuario_default
    AFTER INSERT OR UPDATE 
    ON taqueria
    FOR EACH ROW
    EXECUTE PROCEDURE default_data();