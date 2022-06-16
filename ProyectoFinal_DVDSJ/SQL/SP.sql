/*
 * Author: Diego Padilla
 * Version: 22.6.15
 */

-- -- SP para manejar los INSERT de un nuevo platillo, pide la "receta" e inserta en las tablas correspondientes
CREATE OR REPLACE PROCEDURE nuevo_item (
    id_platillo     INT,
    Categoria       INT,
    Nombre_Platillo TEXT,
    Descripcion_P   TEXT,
    Precio_Platillo DECIMAL,
    id_de_ingredientes_y_cantidad INTEGER[][]
)
AS $$
    DECLARE
    elem INTEGER[];
BEGIN
    -- Insert en Item
    INSERT INTO 
        item (id, id_Categoria, Nombre, Descripcion, Precio)
    VALUES
        (id_platillo, Categoria, Nombre_Platillo, Descripcion_P, Precio_Platillo);
    -- Insert en Utilizar
    FOREACH elem SLICE 1 IN ARRAY id_de_ingredientes_y_cantidad
    LOOP 
        INSERT INTO utilizar(id_item,id_ingrediente,cantidad) VALUES (id_platillo, elem[1], elem[2]);
    END LOOP;
    -- Insert en Registro Historico
    INSERT INTO registro_historico (id_item,precio,pinsumos,fecha)
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
        ON it.id=cst.id_item WHERE id = id_platillo GROUP BY id,costo;

END;
$$ LANGUAGE plpgsql;


-- SP para manejar los DELETE de items
CREATE OR REPLACE PROCEDURE item_delete (idItem INT)
AS $$
BEGIN
    -- Borra de la relacion Utilizar
    DELETE FROM utilizar AS util WHERE util.id_item = idItem;
    -- Borra de Item
    DELETE FROM item AS it WHERE it.id = idItem;
END;
$$ LANGUAGE plpgsql;


-- Comments --
-- SP nuevo_item
COMMENT ON PROCEDURE nuevo_item IS 'Inserta un nuevo platillo, pide la receta [[id ingred, cantidad]] e inserta en las tablas correspondientes'

-- SP item_delete
COMMENT ON PROCEDURE item_delete IS 'Elimina un item junto con sus referencias'