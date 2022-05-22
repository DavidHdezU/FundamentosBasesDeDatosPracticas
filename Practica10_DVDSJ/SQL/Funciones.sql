/*
 * Author: Diego Padilla
 * Version: 22.5.22
 */

-- Una funcion que reciba la CURP y nos regrese la edad del cliente.
CREATE OR REPLACE FUNCTION getEdadCliente(curp TEXT)
	RETURNS TEXT AS $edad$
	DECLARE
		edad TEXT;
		years   integer := to_number(substring(curp from 5 for 2), '99');
		months  integer := to_number(substring(curp from 7 for 2), '99');
		days    integer := to_number(substring(curp from 9 for 2), '99');
	BEGIN
		-- Manejar los 'errores' de curp al poblar la bd con datos aleatorios
		IF months > 12 OR months <= 0 THEN 
			months := 12;
		END IF;

		IF years > 21 THEN 
			years := years + 1900;
		ELSE
			years := years + 2000;
		END IF;

		IF days > 28 AND months = 2 THEN
			days := 28;
		ELSIF days > 30 THEN
			days := 30;
		ELSE 
			days := 15;
		END IF;

		edad := concat(years::TEXT, '-', months::TEXT, '-', days::TEXT);
		edad := date_part('years', age(NOW(), to_timestamp(edad, 'YYYY-MM-DD') ))::TEXT;

		RETURN edad;
	END;
$edad$ LANGUAGE plpgsql;


-- Una funcion que reciba idEstetica y regrese las ganancias de esa estetica.
CREATE OR REPLACE FUNCTION gananciasEstetica(idEstetica TEXT)
	RETURNS TABLE (nombre VARCHAR, ganancias NUMERIC) AS $$
	BEGIN
		RETURN QUERY 
			SELECT 
				nombreestetica, sum(monto) AS total 
			FROM 
				(SELECT * FROM recibo WHERE nombreestetica = idEstetica) AS ganancias
			GROUP BY 
				nombreestetica;

	END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION gananciasEsteticaNeta(idEstetica TEXT)
	RETURNS TABLE (nombre VARCHAR, pagos bigint, ingresostotales NUMERIC, ganancias NUMERIC) AS $$
	BEGIN 
		-- Obtener el total de los salarios de veterinario a pagar
		CREATE TEMP TABLE IF NOT EXISTS t1 AS
		SELECT 
			data.nombreestetica, 
			sum(data.vsalario) AS vtotal 
		FROM (
			SELECT 
				vett.nombreestetica, 
				vet.salario AS vsalario
			FROM 
				veterinariotrabajaen AS vett 
			INNER JOIN 
				veterinario AS vet ON vett.curp = vet.curp
			) AS data 
			GROUP BY 
				nombreestetica 
			ORDER BY nombreestetica ASC; -- vtotal


		-- Obtener el total de los salarios de estilistas a pagar
		CREATE TEMP TABLE IF NOT EXISTS t2 AS
		SELECT 
			data.nombreestetica, 
			sum(data.esalario) AS etotal 
		FROM (
			SELECT 
				estt.nombreestetica, 
				est.salario AS esalario
			FROM 
				estilistatrabajaen AS estt 
			INNER JOIN 
				estilista AS est ON estt.curp = est.curp
			) AS data 
			GROUP BY 
				nombreestetica 
			ORDER BY nombreestetica ASC;

		-- Como solo hay un supervisor por estetica, entonces no hace falta obtener un total de estos salarios.
		-- En su lugar unimos directo con las tablas t1 y t2
		CREATE TEMP TABLE IF NOT EXISTS t3 AS
		SELECT 
				vets.nombreestetica, 
				vets.vtotal AS vsalario, 
				ests.etotal AS esalario,
				sups.supsalario AS ssalario

			FROM 
				t1 AS vets 
				JOIN t2 AS ests ON ests.nombreestetica = vets.nombreestetica
				JOIN --supervisortrabajaen 
				(
					SELECT 
						supt.nombreestetica,
						sup.salario AS supsalario
					FROM 
						supervisortrabajaen AS supt 
						JOIN supervisor AS sup ON supt.curp = sup.curp
				) 
					AS sups ON sups.nombreestetica = vets.nombreestetica;

		-- Obtenemos el total de los salarios a pagar(pagoSalarios) y unimos con una tabla 
		-- proveniente de recibo que contenga los ingresos totales de la estetica.
		-- Finalmente restamos los ingresos menos el pagoSalarios para obtener el balance (ganancia neta)
		RETURN QUERY
		SELECT 
			estetica, 
			pagoSalarios, 
			ingresos, 
			COALESCE(ingresos,0) - 
			COALESCE(pagoSalarios) AS ganancianeta
		FROM 
		(SELECT 
			estetica,
			pagoSalarios,
			ingresos
		FROM
		(
			SELECT
				cuentas.nombreestetica AS estetica,
				COALESCE(cuentas.vsalario, 0) +
				COALESCE(cuentas.esalario, 0) +
				COALESCE(cuentas.ssalario, 0) AS pagoSalarios
			FROM 
				t3 AS cuentas
		) AS pagos
		JOIN 
		(
			SELECT
				nombreestetica,
				SUM(monto) AS ingresos
			FROM 
			(
				SELECT * FROM recibo
			) AS total 
			GROUP BY 
				nombreestetica
		) AS income ON income.nombreestetica = estetica) AS balance
		WHERE 
			estetica = idEstetica;



		DROP TABLE t1,t2,t3;

	END;
$$ LANGUAGE plpgsql;


-- Funcion getEdadCliente comentarios
COMMENT ON FUNCTION getEdadCliente IS 'Obten la edad de un Cliente a partir de su CURP';


-- Funcion gananciasEstetica comentarios
COMMENT ON FUNCTION gananciasEstetica IS 'Obten los ingresos totales de una Estetica por su nombre (idEstetica)';


-- Funcion gananciasEsteticaNeta comentarios
COMMENT ON FUNCTION gananciasEsteticaNeta IS 'Obten la ganancia neta de una Estetica por su nombre (idEstetica)';
