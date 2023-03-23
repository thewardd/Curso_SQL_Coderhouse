/*                                   PROYECTO FINAL ~ CURSO SQL ~ LAUTARO LASALA
	
    /*************************************************************************************************************/
	/**********************************  SCRIPT PARA CREACIÓN DE PROCEDIMIENTOS **********************************/	
	/*************************************************************************************************************/
        
    CREATE SCHEMA IF NOT EXISTS Sistema_Gestion_Personal;
	USE Sistema_Gestion_Personal;
    
    -- Stored Procedure 01: Permite indicar a través de un parámetro el campo de ordenamientno de la tabla Eventos y el tipo de gradación a utilizar

	DROP PROCEDURE IF EXISTS SP_Reordenar_Eventos;
	DELIMITER &&
				CREATE PROCEDURE SP_Reordenar_Eventos (IN campo_orden VARCHAR(255), IN tipo_orden VARCHAR(5))
					BEGIN
						SET @objeto = CONCAT('SELECT * FROM eventos ORDER BY',' ',campo_orden,' ',tipo_orden);
						PREPARE s FROM @objeto;
						EXECUTE s;
						DEALLOCATE PREPARE s;
					END			
	&& 
	CALL SP_Reordenar_Eventos('Horas_Extras','asc');


	-- Stored Procedure 02: Inserta registros en la tabla Cargo. El SP permite el ingreso de un nuevo cargo en la empresa, a través
	-- 			   			 de 3 parámetros de ingreso que serán: ID, nombre del cargo y las observaciones del mismo. A su vez, el SP 
	--                       completa de forma automática el campo Fecha_Registro utilizando la función NOW() nativa de SQL. 

	DROP PROCEDURE IF EXISTS SP_Agregar_Cargo;
	DELIMITER &&
				CREATE PROCEDURE SP_Agregar_Cargo (SP_ID_Cargo varchar(10), IN SP_Cargo varchar(40), IN SP_Observaciones varchar(300))
					BEGIN
						INSERT INTO cargo(ID_Cargo, Cargo, Fecha_Registro, Observaciones)
						VALUES (SP_ID_Cargo, SP_Cargo, NOW(), SP_Observaciones);
						SELECT * FROM cargo;
					END
	&& 
	CALL SP_Agregar_Cargo('ID_C_6','Gerenta','Observacion_6');

