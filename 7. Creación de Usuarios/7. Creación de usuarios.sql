/*                                   PROYECTO FINAL ~ CURSO SQL ~ LAUTARO LASALA
	
    	/*************************************************************************************************************/
	/*************************************  SCRIPT PARA CREACIÓN DE USUARIOS *************************************/	
	/*************************************************************************************************************/
    
	-- La creación de usuarios se realiza para una utilización de tipo local del sistema de gestion de personal

	    	USE mysql;
		SHOW tables;
		SELECT * FROM user;

	-- Usuario 01: Sector_RRHH (Permisos de Lectura, Inserción y Modificación de datos.(No puede eliminar registros))

		CREATE USER 'sector_rrhh'@'localhost' IDENTIFIED BY 'password'; 
		DROP USER 'sector_rrhh'@'localhost'; 
		SHOW GRANTS FOR 'sector_rrhh'@'localhost';

		GRANT SELECT, INSERT, UPDATE ON sistema_gestion_personal.* TO 'sector_rrhh'@'localhost';
		REVOKE SELECT ON sistema_gestion_personal.* FROM 'sector_rrhh'@'localhost';




	-- Usuario 02: Sector_Finanzas (Permisos de sólo lectura sobre la tabla Eventos (No puede eliminar registros))

		CREATE USER 'sector_finanzas'@'localhost' IDENTIFIED BY 'password'; 
		DROP USER 'sector_finanzas'@'localhost'; 
		SHOW GRANTS FOR 'sector_finanzas'@'localhost';

		GRANT SELECT, SELECT ON sistema_gestion_personal.eventos TO 'sector_finanzas'@'localhost';
		REVOKE SELECT ON sistema_gestion_personal.eventos FROM 'sector_finanzas'@'localhost';

    
