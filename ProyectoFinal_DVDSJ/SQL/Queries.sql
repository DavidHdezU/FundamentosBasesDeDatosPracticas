-- OBTENER LOS 15 CLIENTES MÁS FRECUENTES
SELECT CURP, Nombre, A_Paterno, count(CURP) "Total de compras", SUM(Total) "Gastos totales"
FROM cliente
INNER JOIN ticket ON cliente.CURP=ticket.id_Cliente
GROUP BY cliente.CURP
ORDER BY 4 desc
LIMIT 15;


-- INGRESOS TOTALES DE LAS TAQUERIAS
SELECT id_Taqueria, SUM(Total) "Ingresos" FROM ticket
GROUP BY id_Taqueria
ORDER BY 1;


-- EMPLEADOS QUE CUMPLEN CON EL PROGRAMA DE ANTIGUEDAD
SELECT CURP, id_Taqueria, Nombre, A_Paterno, Antiguedad FROM taquero
WHERE DATE_PART('year', AGE(NOW(), antiguedad)) >= 2
UNION
SELECT CURP, id_Taqueria, Nombre, A_Paterno, Antiguedad FROM parrillero
WHERE DATE_PART('year', AGE(NOW(), antiguedad)) >= 2
UNION
SELECT CURP, id_Taqueria, Nombre, A_Paterno, Antiguedad FROM mesero
WHERE DATE_PART('year', AGE(NOW(), antiguedad)) >= 2
UNION
SELECT CURP, id_Taqueria, Nombre, A_Paterno, Antiguedad FROM cajero
WHERE DATE_PART('year', AGE(NOW(), antiguedad)) >= 2
UNION
SELECT CURP, id_Taqueria, Nombre, A_Paterno, Antiguedad FROM tortillero
WHERE DATE_PART('year', AGE(NOW(), antiguedad)) >= 2
UNION
SELECT CURP, id_Taqueria, Nombre, A_Paterno, Antiguedad FROM repartidor
GROUP BY CURP
HAVING DATE_PART('year', AGE(NOW(), antiguedad)) >= 2;


-- NUMERO DE CLIENTES ATENDIDOS POR SUCURSAL
SELECT id_taqueria, COUNT(id_taqueria) "Clientes atendidos totales" FROM ticket
GROUP BY id_taqueria
ORDER BY 2 DESC;


-- 20 MESEROS CON MÁS CLIENTES ATENDIDOS
SELECT RFC, Nombre, A_Paterno, A_Materno, Telefono, Email, COUNT(RFC_mesero) "Clientes atendidos" 
FROM mesero INNER JOIN ticket ON mesero.RFC = ticket.RFC_mesero
GROUP BY RFC, Nombre, A_Paterno, A_Materno, Telefono, Email
ORDER BY 7 DESC
LIMIT 20;


-- LAS 10 TAQUERIAS QUE HAN TENIDO QUE ABASTECERSE MÁS EN EL ULTIMO MES (BETWEEN 2022-05-14 2022-06-14)
SELECT id_taqueria, SUM(PrecioCompra) "Gastos totales en abastencimiento"
FROM abastecer INNER JOIN compra ON compra.id = abastecer.id_Compra
GROUP BY id_taqueria
ORDER BY 2 DESC
LIMIT 10;


-- VER QUE TAQUERIAS VENDEN MÁS POR PUNTOS
SELECT id_taqueria, COUNT(id_taqueria) "Pagos con Puntos Taquero Corazon"
FROM ticket
GROUP BY id_taqueria, Es_Puntos
HAVING Es_Puntos = true
ORDER BY 2 DESC;


-- INGREDIENTES DE SALSAS CON MAXIMO PICOR
SELECT                                    
   id_salsa, 
   sls.nombre,
   array_to_string(array_agg(array[ing.nombre]), ', ') AS ingredientes
FROM 
   utilizar_en_salsa AS us 
JOIN 
   ingrediente AS ing
   ON us.id_ingrediente = ing.id 
JOIN 
   salsa AS sls 
   ON us.id_salsa = sls.id
WHERE 
   sls.picor='Extremo'
GROUP BY 
   us.id_salsa, sls.nombre 
ORDER BY 
   us.id_salsa ASC;
   

-- INGRESOS DE CADA TAQUERIA EN EL ULTIMO MES
SELECT id_taqueria, Nombre, SUM(Total) "Ingresos en el último mes"
FROM (
	SELECT 
		id_taqueria, Nombre , Total
	FROM
		ticket INNER JOIN taqueria ON ticket.id_taqueria = taqueria.id
	GROUP BY id_taqueria, Nombre, Fecha, Total
	HAVING
		Fecha >= '2022-05-15' AND Fecha <= '2022-06-15'
)  AS tk
GROUP BY
	id_taqueria, Nombre
ORDER BY 3 DESC;


-- PLATILLOS DE CARNITAS VENDIDOS EN TODAS LAS SUCURSALES
SELECT 
   id,nombre,pv.piezas_vendidas,precio 
FROM 
   item 
JOIN 
   (SELECT id_item,SUM(cantidad) AS piezas_vendidas 
   FROM vender GROUP BY id_item ORDER BY id_item ASC) AS pv 
ON 
   id=pv.id_item 
GROUP BY 
   item.id,pv.piezas_vendidas 
HAVING 
   nombre LIKE '%carnitas%' 
ORDER BY item.id ASC;


-- CERVEZA MODELO VENDIDA POR TAQUERIA EN EL ULTIMO MES
SELECT 
    id_taqueria, id_item, SUM(cantidad) AS cerveza_vendida
FROM (
    SELECT 
        id_taqueria,id_item,cantidad 
    FROM 
        ticket 
    JOIN 
        (SELECT * FROM vender WHERE id_item=111) AS ventas 
    ON 
        id=ventas.id_ticket
    GROUP BY 
        id_taqueria,id_item,fecha,cantidad
    HAVING 
        fecha >= ('now'::timestamp - '1 month'::interval)
) AS foo 
GROUP BY 
    id_taqueria, id_item
ORDER BY 
    id_taqueria ASC;


-- TACOS AL PASTOR VENDIDOS LOS DIAS LUNES DE ESTE ÚLTIMO MES POR SUCURSAL
SELECT id_taqueria, nombre, SUM(cantidad) "Tacos al pastor vendidos los lunes del último mes" 
FROM 
	(SELECT id_taqueria,id_item, id_ticket, cantidad
	 FROM
	 vender JOIN ticket ON vender.id_ticket = ticket.id
	 GROUP BY id_taqueria,id_item,id_ticket,Fecha
	 -- VEMOS QUE ESTÉ EN EL RANGO DE ESTE ÚLTIMO MES, QUE SEA LUNES Y QUE EL ID_ITEM = 2, YA QUE COMO LO DEFINIMOS ESTE ID ES EL CORRESPONDIENTE A UN TACO AL PASTOR
	 HAVING Fecha >= '2022-05-15' AND Fecha <= '2022-06-15' AND EXTRACT(dow from Fecha) = 1 AND id_item = 2
	 
	) as tv
INNER JOIN 
	taqueria
ON
	tv.id_taqueria = taqueria.id
	
GROUP BY id_taqueria, nombre
ORDER BY 2 DESC;


-- LOS TRES TACOS MAS VENDIDOS
SELECT 
   id,nombre,pv.piezas_vendidas 
FROM 
   item 
JOIN (
   SELECT 
      id_item,SUM(cantidad) AS piezas_vendidas 
   FROM 
      vender 
   GROUP BY id_item
) AS pv 
ON 
   id=pv.id_item 
GROUP BY 
   item.id,pv.piezas_vendidas 
HAVING 
   nombre LIKE '%Taco%' 
ORDER BY pv.piezas_vendidas DESC LIMIT 3;


-- TOP 10 PRODUCTOS MÁS VENDIDOS EN LO QUE VA DEL AÑO
SELECT id_item, nombre, SUM(cantidad) "Cantidad de piezas vendidas en el transcurso de año"
FROM 
	(SELECT id_item, cantidad
	 FROM
	 vender JOIN ticket ON vender.id_ticket = ticket.id
	 GROUP BY id_item, cantidad,Fecha
	 -- VEMOS QUE ESTÉ EN EL RANGO DE ESTE ÚLTIMO MES, QUE SEA LUNES Y QUE EL ID_ITEM = 2, YA QUE COMO LO DEFINIMOS ESTE ID ES EL CORRESPONDIENTE A UN TACO AL PASTOR
	 HAVING Fecha >= '2022-01-01' AND Fecha <= NOW()
	) as tv
JOIN
	item
ON
	tv.id_item = item.id
GROUP BY id_item, nombre
ORDER BY 3 DESC
LIMIT 10;


-- TACOS MAS VENDIDOS EN CIERTA SUCURSAL
SELECT 
   id_taqueria,nombre,SUM(cantidad) AS total
FROM 
   ticket
JOIN 
   (SELECT id_ticket,id_item,nombre,cantidad FROM vender JOIN item as it ON id_item=it.id GROUP BY id_ticket,id_item,nombre HAVING nombre LIKE '%Taco%'
   ORDER BY cantidad DESC) 
AS foo
ON ticket.id = foo.id_ticket
WHERE id_taqueria=1
GROUP BY id_taqueria,nombre
ORDER BY total DESC;


-- TACOS MAS VENDIDOS POR SUCURSAL  
SELECT 
   id_taqueria,nombre,SUM(cantidad) AS total
FROM 
   ticket
JOIN 
   (SELECT id_ticket,id_item,nombre,cantidad FROM vender JOIN item as it ON id_item=it.id GROUP BY id_ticket,id_item,nombre HAVING nombre LIKE '%Taco%'
   ORDER BY cantidad DESC)          
AS foo
ON ticket.id = foo.id_ticket
GROUP BY id_taqueria,nombre
ORDER BY id_taqueria ASC,total DESC;
