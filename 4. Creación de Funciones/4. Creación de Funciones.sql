/*                                   PROYECTO FINAL ~ CURSO SQL ~ LAUTARO LASALA
	
    	/*************************************************************************************************************/
	/*************************************  SCRIPT PARA CREACIÓN DE FUNCIONES ************************************/	
	/*************************************************************************************************************/
    
   	CREATE SCHEMA IF NOT EXISTS Sistema_Gestion_Personal;
	USE Sistema_Gestion_Personal;
    
	-- Función 01: Contar cantidad de ausencias en un mes ingresado como parámetro

		DELIMITER && 
			CREATE FUNCTION Ausencias_mes(mes int) RETURNS INT
			DETERMINISTIC
				BEGIN
					DECLARE Resultado INT;
					SET Resultado = 
							(SELECT COUNT(ID_Evento) 
							FROM Eventos
							WHERE MONTH(Fecha_Desde) = mes 
								AND ID_Tipo_Registro = "ID_T_1");
					RETURN Resultado;
				END
		&&

	-- Función 02: Calcular promedio de monto abonado por evento en un mes ingresado como parámetro

		DELIMITER &&
			CREATE FUNCTION promedio_pagos(mes int) RETURNS INT
			DETERMINISTIC
					BEGIN
						DECLARE Resultado INT;
						SET Resultado =
								(SELECT SUM(Monto) 
								FROM Eventos 
								WHERE MONTH(Fecha_Desde) = mes)
								/
								(SELECT COUNT(ID_Evento) 
								FROM Eventos 
								WHERE MONTH(Fecha_Desde) = mes);
						RETURN Resultado;
					END
		&&
    
    
