-- Consulta 1. Chóferes ordenados por número de viajes realizados.
select 	nombre, numlicencia,
		count(idViaje) "Total de viajes"
from personal natural join viaje
group by personal.NumLicencia
order by 2 desc;

-- Consulta 2. Clientes órdenados por total de viajes que han realizado.
select 	nombre, email, 
		count(idViaje) "Total de viajes"
from cliente natural join realizar natural join viaje
group by cliente.email
order by 3 desc;

-- Consulta 3. Vehículos con dos o más infracciones.
select count(idInfraccion), numeconomico
from vehiculo natural join infraccion
group by numeconomico
having count(idinfraccion)>1
order by 1

-- Consulta 4. Número de viajes de clientes que no viven en la CDMX.
SELECT count(idViaje) "Total de Viajes"
from cliente natural join realizar natural join viaje 
where cliente.estado <> 'CDMX';

-- Consulta 5. Monto cumulativo de infracciones a vehículos dados de baja.
select sum(monto)
from vehiculo natural join infraccion
where vehiculo.estado = 'INACTIVO'

-- Consulta 6. Combustible usados en viajes mayores a 20 minutos.
select TipoCombustible, count(idViaje)
from vehiculo natural join viaje
where viaje.tiempo > '00:20'
group by vehiculo.TipoCombustible

-- Consulta 7. Cumulativo de viajes acumulados por alumnos de cada facultad. 
select facultad, count(idViaje) "Viaje por facultad"
from cliente natural join realizar natural join viaje
group by cliente.facultad
order by 2;

-- Consulta 8. Aseguradoras de autos que tienen infracciones.
select aseguradora, count(idInfraccion) "Infracciones"
from infraccion natural join vehiculo
group by aseguradora
order by 2 desc;

-- Consulta 9. Destinos con más viajes en el periodo vacacional de verano en el 2021.
select count(idviaje) Viajes, destino
from viaje natural join destino
where viaje.fecha >= '03-07-2021' and viaje.fecha < '09-08-2021'
group by destino
order by 1 desc


-- Consulta 10. Destinos con menos viajes en el semestre de primavera 2021.
select count(idviaje) viajes, origen
from viaje natural join origen
where viaje.fecha >= '15-02-2021' and viaje.fecha < '12-06-2021'
group by origen
order by 1 asc

-- Consulta 11. Nombre completo y número de licencia de personas que sean chófer y dueño.
select nombre, paterno, materno, numlicencia
from personal
where esDuenio = true and esChofer = true

-- Consulta 12. Número promedio de pasajeros por viaje.
select avg(NumeroP) "Promedio de pasajeros."
from viaje

-- Consulta 13. Tiempo promedio de distancia de viaje.
select avg(distancia::numeric(10,2)) "Promedio de distancia."
from viaje

-- Consulta 14. Municipio o delegación donde viven más estudiantes
select municipio, count(email) "habitantes"
from cliente
group by municipio
order by 2 desc

-- Consulta 15. Distancia del viaje más largo.
select max(distancia::numeric(10,2)) "km viaje más largo"
from viaje
order by 1

-- Consulta 16. Clientes cuyo nombre empiece con C.
select nombre, paterno, materno from cliente
where nombre like 'C%'

-- Consulta 17. Número económico de dueños con vehículos con transmisión automática.
select numeconomico, razonbaja from vehiculo 
where estado = 'INACTIVO'