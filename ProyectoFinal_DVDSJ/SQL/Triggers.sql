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


CREATE OR REPLACE FUNCTION modifica_historico()
    RETURNS TRIGGER AS 
    $$
    BEGIN
        INSERT INTO 
            registro_historico (id_item,precio,pinsumos,fecha)
        SELECT id,precio,costo,('now' AT TIME ZONE 'CST')::timestamp::date 
        FROM item AS it
        JOIN (
        SELECT 
            id_item,
            SUM(round((precio / 1000) * cantidad, 2)) AS costo 
        FROM utilizar 
        JOIN ingrediente ON id=utilizar.id_ingrediente 
        GROUP BY id_item
        ) AS cst
        ON it.id=cst.id_item WHERE id = NEW.id GROUP BY id,costo;

        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER al_historico
    AFTER UPDATE
    ON item
    FOR EACH ROW 
    EXECUTE PROCEDURE modifica_historico();
