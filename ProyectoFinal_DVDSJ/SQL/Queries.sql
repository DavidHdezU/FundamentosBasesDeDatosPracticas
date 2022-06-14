/*
 * Ideas

    - Consultar que items son los que aparecen más 

    - Ver que clientes son los más frecuentes mediante los tickets

    - Ver cuantos empleados cumplen con el programa de pagos

    - Ver cuantos empleados también son clientes

    - Ver que que proveedores son lo más frecuentes

    - Ver que ingredientes se usan en salsas con un nivel de picos 'n'

    - Cumulativo de ingresos acumulados por taqueria

    - Ver que meseros han sido los que han atendido más clientes

    - Ver el acumulativo total de los pagos hecho en tarjeta

    - Ver que item se vendió más en cierto día

    - Ver que item se vendió más en una taqueria en un cierto periodo de tiempo

    - Items con un avg(precio) > 'n' sobre el registro historico


    - Ver cuantos tacos al pastor se venden y el ingreso generado los lunes en cada taqueria en un mes

    - Ver que taco es el más vendido en las taquerias

    - Ver que ingredientes se usan en la salsa con el maximo picor


 * 
 */



-- OBTENCIÓN DE LOS 15 CLIENTES MÁS FRECUENTES
SELECT CURP, Nombre, A_Paterno, count(CURP) "Total de compras", SUM(Total) "Gastos totales"
FROM cliente
INNER JOIN ticket ON cliente.CURP=ticket.id_Cliente
group by cliente.CURP
order by 4 desc
LIMIT 15;

-- INGRESOS TOTALES DE LAS CON INGRESOS MAYORES O IGUALES A 1000
SELECT id_Taqueria, SUM(Total) "Ingresos" FROM ticket left join cliente ON ticket.id_Cliente = cliente.CURP
GROUP BY id_Taqueria
HAVING SUM(Total) >= 1000
ORDER BY 2 desc;

-- EMPLEADOS QUE CUMPLEN CON EL PROGRAMA DE ANTIGUEDAD
SELECT CURP, id_Taqueria, Nombre, A_Paterno, Antiguedad FROM taquero
UNION ALL
SELECT CURP, id_Taqueria, Nombre, A_Paterno, Antiguedad FROM parrillero
UNION ALL
SELECT CURP, id_Taqueria, Nombre, A_Paterno, Antiguedad FROM mesero
UNION ALL
SELECT CURP, id_Taqueria, Nombre, A_Paterno, Antiguedad FROM cajero
UNION ALL
SELECT CURP, id_Taqueria, Nombre, A_Paterno, Antiguedad FROM tortillero
UNION ALL
SELECT CURP, id_Taqueria, Nombre, A_Paterno, Antiguedad FROM repartidor
GROUP BY CURP
HAVING Antiguedad < NOW() - interval '2' year;



