/*                                   PROYECTO FINAL ~ CURSO SQL ~ LAUTARO LASALA
	
    /*************************************************************************************************************/
	/**************************************  SCRIPT PARA CREACIÓN DE VISTAS **************************************/	
	/*************************************************************************************************************/
    
    CREATE SCHEMA IF NOT EXISTS Sistema_Gestion_Personal;
	USE Sistema_Gestion_Personal;
    
    
	-- Vista 01: Personal y Posición en la empresa
		CREATE OR REPLACE VIEW Personal_Organigrama AS (SELECT ID_Personal, ID_Cargo FROM Personal);
		SELECT * FROM Personal_Organigrama;

	-- Vista 02: Personal y Fecha de incorporación 
		CREATE OR REPLACE VIEW Personal_Incorporacion AS (SELECT ID_Personal, Fecha_registro FROM Personal);
		SELECT * FROM Personal_Incorporacion;
											
	-- Vista 03: Empleados/as cuya edad es mayor a 30 años
		CREATE OR REPLACE VIEW Personal_Edad AS (
							SELECT ID_Personal AS 'Personal cuya edad es mayor a 30 años'
							FROM Personal
							WHERE DATEDIFF(CURDATE(),fecha_nacimiento) > 30*365
							);
		SELECT * FROM Personal_Edad;

-- Vista 04: Cantidad de llamadas de atención en el presente mes
		CREATE OR REPLACE VIEW Llamadas_atencion AS (
								SELECT 
										COUNT(ID_EVENTO) as 'Llamadas de atención realizadas este mes'
								FROM Eventos
								WHERE 
									MONTH(Fecha_Desde) = MONTH(NOW()) 
										AND YEAR(Fecha_Desde) = YEAR(NOW()) AND ID_TIPO_REGISTRO = 'ID_T_3'
							);
		SELECT * FROM Llamadas_atencion;
        
        
	-- Vista 05: Nombre y Apellido de los empleados que hayan tenido alguna ausencia en el presente mes
		CREATE OR REPLACE VIEW Ausencias AS (
							SELECT Nombre_1, Apellido_1
							FROM Personal
							INNER JOIN Eventos ON Personal.ID_Personal = Eventos.ID_Personal
							WHERE 
								MONTH(Fecha_Desde) = MONTH(NOW()) AND YEAR(Fecha_Desde) = YEAR(NOW()) 
									AND Eventos.ID_Tipo_Registro = 'ID_T_1'	
						);
		SELECT  * FROM Ausencias;
