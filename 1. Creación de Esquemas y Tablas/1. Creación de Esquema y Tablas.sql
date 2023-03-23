/*                                   PROYECTO FINAL ~ CURSO SQL ~ LAUTARO LASALA
  
  	/*************************************************************************************************************/
	/**************************************  SCRIPT PARA CREACIÓN DE TABLAS **************************************/	
	/*************************************************************************************************************/
    
   	CREATE SCHEMA IF NOT EXISTS Sistema_Gestion_Personal;
	USE Sistema_Gestion_Personal;
    
	CREATE TABLE Personal (
							ID_Personal varchar(10) NOT NULL,
							ID_Cargo varchar(10) NOT NULL,
							ID_Formacion varchar(10),
							Fecha_registro datetime, 
							Nombre_1 varchar(30),
							Nombre_2 varchar(30),
							Apellido_1 varchar(30),
							Apellido_2 varchar(30),
							Nombre_Completo varchar(70),
							Foto varchar(500),					-- Imagen
							CV varchar(500),                    -- Documento .pdf
							Edad int,
							Genero varchar(20),  
							DNI varchar(10),
							DNI_Foto varchar(500),				-- Imagen
							Domicilio varchar(50),
							Provincia varchar(30),
							Ciudad varchar(30),
							Nacionalidad varchar(50),
							Fecha_Nacimiento date,
							Sexo varchar(15),
							Celular varchar(20),
							Telefono varchar(20),
							Celular_Emergencia varchar(20),
							Nombre_Contacto_emergencia varchar(30),
							Observaciones varchar(500),
							PRIMARY KEY (ID_Personal),
							FOREIGN KEY(ID_Cargo) REFERENCES Cargo(ID_Cargo),
							FOREIGN KEY(ID_Formacion) REFERENCES Formacion(ID_Formacion)
						);

	CREATE TABLE Cargo (
							ID_Cargo varchar(10) NOT NULL, 
							Cargo varchar(40) NOT NULL,
							Fecha_Registro datetime,
							Observaciones varchar(300),
							PRIMARY KEY (ID_Cargo)
						);

	CREATE TABLE Formacion (
							ID_Formacion varchar(10) NOT NULL,
							Formacion varchar(40),
							Fecha_Registro datetime,
							Observaciones varchar(300),
							PRIMARY KEY (ID_Formacion) 
						);											
	
	CREATE TABLE Reportes (
							ID_Reporte varchar(10),
							ID_Personal varchar(10),
							Fecha_Registro datetime,
							Fecha_Desde_Rep datetime,
							Fecha_Hasta_Rep datetime,
							PRIMARY KEY (ID_Reporte),
							FOREIGN KEY (ID_Personal) REFERENCES Personal(ID_Personal)
						);
                                
	CREATE TABLE Tipos_Registros (
							ID_Tipo_Registro varchar(10),
							Tipo varchar(30),
							Fecha_Registro datetime,
							Descripcion varchar(300),
							PRIMARY KEY (ID_Tipo_Registro)
						);
											
	CREATE TABLE Eventos (
							ID_Evento varchar(10),
							ID_Personal varchar(10),
							Fecha_Registro datetime,
							ID_Tipo_Registro varchar(10),
							Fecha_Desde datetime,
							Fecha_Hasta datetime,
							Descripcion varchar(300),
							Detalle_1 varchar(300),
							Detalle_2 varchar(300),
							Documento_Adjunto varchar(500),
							Horas_Extras int,
							Minutos_extras int,
							Dias_Vacaciones int,
							Monto float(10,2),
							PRIMARY KEY (ID_Evento),
							FOREIGN KEY (ID_Personal) REFERENCES Personal(ID_Personal),
							FOREIGN KEY (ID_Tipo_Registro) REFERENCES Tipos_Registros(ID_Tipo_Registro)
						);	
