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

select CURP, Nombre, A_Paterno, A_Materno,
		count(CURP) "Total de compras"
from cliente natural join ticket
group by cliente.CURP
order by 5 desc
LIMIT 10;