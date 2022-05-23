/*
 * Author: Diego Padilla
 * Version: 22.5.22
 */

CREATE OR REPLACE PROCEDURE veterinarioInsert(idCurp TEXT , name TEXT, lastnameFathers TEXT, lastnameMothers TEXT, 
	no TEXT, zipCode TEXT, streetName TEXT, state TEXT, phoneNumber TEXT, 
	salary integer, rfcseq TEXT, shiftBegins TIME, shiftEnds TIME, patientNumber integer)
	AS $$
	DECLARE
		fullname TEXT := CONCAT(name, lastnameFathers, lastnameMothers);
	BEGIN 
		IF LENGTH(idCurp) <> 18 THEN 
			RAISE EXCEPTION 'CURP no valido: % ', idCurp USING HINT = 'Longitud diferente de 18. Abortando ...';

		ELSIF fullname ~* '^[a-z]+$' IS NOT TRUE -- '^[a-z\s]+$' empty spaces
					OR name = '' 
					OR lastnameFathers = ''
					OR lastnameMothers = ''
		THEN 
			RAISE EXCEPTION 'Nombre no valido: % ', fullname USING HINT = 'Contiene numeros o caracteres especiales. Abortando ...';

		ELSIF no ~ '^[0-9]+$' IS NOT TRUE THEN
			RAISE EXCEPTION 'Numero no valido: % ', no USING HINT = 'Contiene letras o caracteres especiales. Abortando ...';

		ELSIF zipCode ~ '^[0-9]+$' IS NOT TRUE OR LENGTH(zipCode) <> 5 THEN 
			RAISE EXCEPTION 'Codigo Postal no valido: % ', zipCode USING HINT = 'No contiene unicamente numeros o longitud diferente de 5. Abortando ...';

		ELSIF streetName = '' OR state = '' THEN 
			RAISE EXCEPTION 'Direccion no valida: %', CONCAT(streetName, ' ', state) USING HINT = 'Llena los campos. Abortando ...';

		ELSIF phoneNumber ~ '^[0-9]+$' IS NOT TRUE OR LENGTH(phoneNumber) <> 10 THEN 
			RAISE EXCEPTION 'Numero de telefono no valido: %', phoneNumber USING HINT = 'No contiene unicamnte numeros o longitud diferente de 10. Abortando ...';

		ELSIF salary < 0 THEN 
			RAISE EXCEPTION 'Salario no valido: %', salary USING HINT = 'Salario negativo. Abortando ...';

		ELSIF LENGTH(rfcseq) <> 13 THEN 
			RAISE EXCEPTION 'RFC no valido: %', rfcseq USING HINT = 'Longitud diferente de 13. Abortando ...';

		ELSIF patientNumber < 0 THEN 
			RAISE EXCEPTION 'Numero de pacientes no valido: %', salary USING HINT = 'Numeros negativos. Abortando ...';

		END IF;

		INSERT INTO 
			veterinario(curp,nombre,apellidoPaterno,apellidoMaterno,numero,codigoPostal,calle,estado,telefono,salario,rfc,entrada,salida,numeropacientes) 
		VALUES 
			(idCurp, name, lastnameFathers, lastnameMothers, no, zipCode, streetName, state, phoneNumber, salary, rfcseq, shiftBegins, shiftEnds, patientNumber);


	
	END;
$$ LANGUAGE plpgsql;
