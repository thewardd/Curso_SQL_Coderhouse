/*                                   PROYECTO FINAL ~ CURSO SQL ~ LAUTARO LASALA
	
    	/*************************************************************************************************************/
	/*************************************  SCRIPT PARA CREACIÓN DE TRIGGERS *************************************/	
	/*************************************************************************************************************/
        
    	CREATE SCHEMA IF NOT EXISTS Sistema_Gestion_Personal;
	USE Sistema_Gestion_Personal;
    
    
	# Explicación Trigger 01: Tabla de auditoría que permite guardar mediante un Trigger un registro de movimiento de la tabla Eventos 
	--                         según el personal involucrado en el evento

		-- Tabla 01: 
				CREATE TABLE Auditoria_Eventos (ID_Evento VARCHAR(10), ID_Personal VARCHAR(10), Fecha_Registro datetime);
				DROP TABLE Auditoria_Eventos;

		-- Trigger 01:
				CREATE TRIGGER TRG_Auditoria_Eventos
					AFTER INSERT ON Eventos
					FOR EACH ROW 
					INSERT INTO Auditoria_Eventos (ID_Evento, ID_Personal, Fecha_Registro) 
						VALUES (NEW.ID_Evento, NEW.ID_Personal, NOW());

				DROP TRIGGER TRG_Auditoria_Eventos;

		-- Testeo Trigger 01: Se realizó una carga manual de un registro y luego se observó la tabla de auditoría correspondiente

				INSERT INTO Eventos(ID_Evento, ID_Personal, Fecha_Registro, ID_Tipo_Registro, Fecha_Desde, Fecha_Hasta, Descripcion, 
											Detalle_1, Detalle_2, Documento_Adjunto, Horas_Extras, Minutos_extras, Dias_Vacaciones,  Monto) 
					VALUES ('ID_E_27','ID_P_10',NOW(),'ID_T_8','2022-02-27 00:00:00','2022-02-28 00:00:00','Descripcion_7','Detalle_1_7',
							'Detalle_2_8','url_7',3,7,11,9280);

				SELECT * FROM Eventos;
				SELECT * FROM Auditoria_Eventos;
	  
	  
	# Explicación Trigger 02: Tabla de auditoría que permite guardar mediante un Trigger un registro de los eventos que implicaron un
	--                          egreso de dinero. Este permitiría ofrecer al sector de finanzas información pertinente a sus procesos.
			
		-- Tabla 02: 
				CREATE TABLE Auditoria_Finanzas (ID_Evento VARCHAR(10), ID_Personal VARCHAR(10), Fecha_Registro datetime, ID_Tipo_Registro VARCHAR(10), Monto FLOAT(10));
				DROP TABLE Auditoria_Finanzas;
		-- Trigger 02:
				DROP TRIGGER IF EXISTS TRG_Auditoria_Finanzas;
				DELIMITER &&
						CREATE TRIGGER TRG_Auditoria_Finanzas 
						BEFORE INSERT ON Eventos
						FOR EACH ROW
						BEGIN
							IF NEW.Monto != '' THEN 
									BEGIN
										INSERT INTO Auditoria_Finanzas (ID_Evento, ID_Personal, Fecha_Registro, ID_Tipo_Registro, Monto) 
										VALUES (NEW.ID_Evento, NEW.ID_Personal, NOW(), NEW.ID_Tipo_Registro, NEW.Monto);

									END; 
							END IF;
						END
				&&


		-- Testeo Trigger 02: Se realizó una carga manual de un registro y luego se observó la tabla de auditoría correspondiente

				INSERT INTO Eventos(ID_Evento, ID_Personal, Fecha_Registro, ID_Tipo_Registro, Fecha_Desde, Fecha_Hasta, Descripcion, 
												Detalle_1, Detalle_2, Documento_Adjunto, Horas_Extras, Minutos_extras, Dias_Vacaciones,  Monto) 
						VALUES ('ID_E_41','ID_P_10',NOW(),'ID_T_8','2022-02-27 00:00:00','2022-02-28 00:00:00','Descripcion_7','Detalle_1_7',
								'Detalle_2_8','url_7',3,7,11,5000);

		-- Testeo Trigger 02: Se realizó una carga manual de un registro cuyo valor en Monto es 0 y luego se observó la tabla de 
		-- 						auditoría correspondiente. Constatando el correcto funcionamiento del condicional aplicado en el Trigger

				INSERT INTO Eventos(ID_Evento, ID_Personal, Fecha_Registro, ID_Tipo_Registro, Fecha_Desde, Fecha_Hasta, Descripcion, 
												Detalle_1, Detalle_2, Documento_Adjunto, Horas_Extras, Minutos_extras, Dias_Vacaciones,  Monto) 
						VALUES ('ID_E_42','ID_P_10',NOW(),'ID_T_8','2022-02-27 00:00:00','2022-02-28 00:00:00','Descripcion_7','Detalle_1_7',
								'Detalle_2_8','url_7',3,7,11,0);

				SELECT * FROM Eventos ORDER BY Fecha_Registro DESC;
				SELECT * FROM Auditoria_Finanzas;
  
