CREATE DATABASE  IF NOT EXISTS `sistema_gestion_personal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistema_gestion_personal`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_gestion_personal
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditoria_eventos`
--

DROP TABLE IF EXISTS `auditoria_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_eventos` (
  `ID_Evento` varchar(10) DEFAULT NULL,
  `ID_Personal` varchar(10) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_eventos`
--

LOCK TABLES `auditoria_eventos` WRITE;
/*!40000 ALTER TABLE `auditoria_eventos` DISABLE KEYS */;
INSERT INTO `auditoria_eventos` VALUES ('ID_E_27','ID_P_10','2023-02-07 23:09:18'),('ID_E_41','ID_P_10','2023-02-07 23:09:46'),('ID_E_42','ID_P_10','2023-02-07 23:09:49');
/*!40000 ALTER TABLE `auditoria_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_finanzas`
--

DROP TABLE IF EXISTS `auditoria_finanzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_finanzas` (
  `ID_Evento` varchar(10) DEFAULT NULL,
  `ID_Personal` varchar(10) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL,
  `ID_Tipo_Registro` varchar(10) DEFAULT NULL,
  `Monto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_finanzas`
--

LOCK TABLES `auditoria_finanzas` WRITE;
/*!40000 ALTER TABLE `auditoria_finanzas` DISABLE KEYS */;
INSERT INTO `auditoria_finanzas` VALUES ('ID_E_41','ID_P_10','2023-02-07 23:09:46','ID_T_8',5000);
/*!40000 ALTER TABLE `auditoria_finanzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ausencias`
--

DROP TABLE IF EXISTS `ausencias`;
/*!50001 DROP VIEW IF EXISTS `ausencias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ausencias` AS SELECT 
 1 AS `Nombre_1`,
 1 AS `Apellido_1`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `ID_Cargo` varchar(10) NOT NULL,
  `Cargo` varchar(40) NOT NULL,
  `Fecha_Registro` datetime DEFAULT NULL,
  `Observaciones` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID_Cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES ('ID_C_1','Tecnico en esterilizacion','2020-12-15 00:00:00','Observacion_1'),('ID_C_2','Administrativo','2020-12-15 00:00:00','Observacion_2'),('ID_C_3','Transportista','2020-12-15 00:00:00','Observacion_3'),('ID_C_4','Limpieza','2020-12-15 00:00:00','Observacion_4'),('ID_C_5','Contador','2020-12-15 00:00:00','Observacion_5'),('ID_C_6','Gerenta','2023-02-07 23:09:05','Observacion_6');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `ID_Evento` varchar(10) NOT NULL,
  `ID_Personal` varchar(10) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL,
  `ID_Tipo_Registro` varchar(10) DEFAULT NULL,
  `Fecha_Desde` datetime DEFAULT NULL,
  `Fecha_Hasta` datetime DEFAULT NULL,
  `Descripcion` varchar(300) DEFAULT NULL,
  `Detalle_1` varchar(300) DEFAULT NULL,
  `Detalle_2` varchar(300) DEFAULT NULL,
  `Documento_Adjunto` varchar(500) DEFAULT NULL,
  `Horas_Extras` int DEFAULT NULL,
  `Minutos_extras` int DEFAULT NULL,
  `Dias_Vacaciones` int DEFAULT NULL,
  `Monto` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID_Evento`),
  KEY `ID_Personal` (`ID_Personal`),
  KEY `ID_Tipo_Registro` (`ID_Tipo_Registro`),
  CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`ID_Personal`) REFERENCES `personal` (`ID_Personal`),
  CONSTRAINT `eventos_ibfk_2` FOREIGN KEY (`ID_Tipo_Registro`) REFERENCES `tipos_registros` (`ID_Tipo_Registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES ('ID_E_1','ID_P_10','2022-07-18 00:00:00','ID_T_5','2021-11-18 00:00:00','2021-11-19 00:00:00','Descripcion_1','Detalle_1_1','Detalle_2_2','url_1',2,49,5,2697.00),('ID_E_11','ID_P_7','2021-10-03 00:00:00','ID_T_1','2022-05-01 00:00:00','2022-05-02 00:00:00','Descripcion_11','Detalle_1_11','Detalle_2_12','url_11',4,31,13,4451.00),('ID_E_13','ID_P_7','2021-07-27 00:00:00','ID_T_5','2021-07-28 00:00:00','2021-07-29 00:00:00','Descripcion_13','Detalle_1_13','Detalle_2_14','url_13',1,37,7,14664.00),('ID_E_15','ID_P_4','2022-11-28 00:00:00','ID_T_4','2021-08-03 00:00:00','2021-08-04 00:00:00','Descripcion_15','Detalle_1_15','Detalle_2_16','url_15',4,17,5,4205.00),('ID_E_17','ID_P_7','2021-02-16 00:00:00','ID_T_2','2021-10-05 00:00:00','2021-10-06 00:00:00','Descripcion_17','Detalle_1_17','Detalle_2_18','url_17',4,60,6,1320.00),('ID_E_19','ID_P_7','2021-03-18 00:00:00','ID_T_4','2021-11-13 00:00:00','2021-11-14 00:00:00','Descripcion_19','Detalle_1_19','Detalle_2_20','url_19',4,38,6,1524.00),('ID_E_2','ID_P_7','2021-05-29 00:00:00','ID_T_3','2022-11-07 00:00:00','2022-11-08 00:00:00','Descripcion_2','Detalle_1_2','Detalle_2_3','url_2',3,14,13,13054.00),('ID_E_21','ID_P_3','2022-09-24 00:00:00','ID_T_8','2022-05-05 00:00:00','2022-05-06 00:00:00','Descripcion_21','Detalle_1_21','Detalle_2_22','url_21',3,16,5,7940.00),('ID_E_24','ID_P_9','2021-06-04 00:00:00','ID_T_6','2022-02-21 00:00:00','2022-02-22 00:00:00','Descripcion_24','Detalle_1_24','Detalle_2_25','url_24',1,25,12,5383.00),('ID_E_27','ID_P_10','2023-02-07 23:09:18','ID_T_8','2022-02-27 00:00:00','2022-02-28 00:00:00','Descripcion_7','Detalle_1_7','Detalle_2_8','url_7',3,7,11,9280.00),('ID_E_3','ID_P_9','2022-02-08 00:00:00','ID_T_2','2022-03-17 00:00:00','2022-03-18 00:00:00','Descripcion_3','Detalle_1_3','Detalle_2_4','url_3',3,0,10,7983.00),('ID_E_41','ID_P_10','2023-02-07 23:09:46','ID_T_8','2022-02-27 00:00:00','2022-02-28 00:00:00','Descripcion_7','Detalle_1_7','Detalle_2_8','url_7',3,7,11,5000.00),('ID_E_42','ID_P_10','2023-02-07 23:09:49','ID_T_8','2022-02-27 00:00:00','2022-02-28 00:00:00','Descripcion_7','Detalle_1_7','Detalle_2_8','url_7',3,7,11,0.00),('ID_E_5','ID_P_9','2022-06-13 00:00:00','ID_T_2','2022-10-17 00:00:00','2022-10-18 00:00:00','Descripcion_5','Detalle_1_5','Detalle_2_6','url_5',3,33,8,5021.00),('ID_E_6','ID_P_4','2021-05-02 00:00:00','ID_T_9','2021-08-31 00:00:00','2021-09-01 00:00:00','Descripcion_6','Detalle_1_6','Detalle_2_7','url_6',3,12,7,6461.00),('ID_E_8','ID_P_2','2022-07-15 00:00:00','ID_T_7','2021-03-27 00:00:00','2021-03-28 00:00:00','Descripcion_8','Detalle_1_8','Detalle_2_9','url_8',4,34,9,13778.00),('ID_E_9','ID_P_10','2021-01-29 00:00:00','ID_T_5','2021-08-20 00:00:00','2021-08-21 00:00:00','Descripcion_9','Detalle_1_9','Detalle_2_10','url_9',4,8,8,14343.00);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_Auditoria_Finanzas` BEFORE INSERT ON `eventos` FOR EACH ROW BEGIN
								IF NEW.Monto != '' THEN 
															BEGIN
																INSERT INTO Auditoria_Finanzas (ID_Evento, ID_Personal, Fecha_Registro, ID_Tipo_Registro, Monto) 
																VALUES (NEW.ID_Evento, NEW.ID_Personal, NOW(), NEW.ID_Tipo_Registro, NEW.Monto);
		
															END; 
								END IF;
							END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_Auditoria_Eventos` AFTER INSERT ON `eventos` FOR EACH ROW INSERT INTO Auditoria_Eventos (ID_Evento, ID_Personal, Fecha_Registro) 
							VALUES (NEW.ID_Evento, NEW.ID_Personal, NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `formacion`
--

DROP TABLE IF EXISTS `formacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formacion` (
  `ID_Formacion` varchar(10) NOT NULL,
  `Formacion` varchar(40) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL,
  `Observaciones` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID_Formacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formacion`
--

LOCK TABLES `formacion` WRITE;
/*!40000 ALTER TABLE `formacion` DISABLE KEYS */;
INSERT INTO `formacion` VALUES ('ID_F_1','Tecnitactura en esterilizacion','2020-11-05 00:00:00','Observacion_1'),('ID_F_4','Secundario completo','2020-11-05 00:00:00','Observacion_4'),('ID_F_5','Secundario incompleto','2020-11-05 00:00:00','Observacion_5');
/*!40000 ALTER TABLE `formacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `llamadas_atencion`
--

DROP TABLE IF EXISTS `llamadas_atencion`;
/*!50001 DROP VIEW IF EXISTS `llamadas_atencion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `llamadas_atencion` AS SELECT 
 1 AS `Llamadas de atención realizadas este mes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `ID_Personal` varchar(10) NOT NULL,
  `ID_Cargo` varchar(10) NOT NULL,
  `ID_Formacion` varchar(10) DEFAULT NULL,
  `Fecha_registro` datetime DEFAULT NULL,
  `Nombre_1` varchar(30) DEFAULT NULL,
  `Nombre_2` varchar(30) DEFAULT NULL,
  `Apellido_1` varchar(30) DEFAULT NULL,
  `Apellido_2` varchar(30) DEFAULT NULL,
  `Nombre_Completo` varchar(70) DEFAULT NULL,
  `Foto` varchar(500) DEFAULT NULL,
  `CV` varchar(500) DEFAULT NULL,
  `Edad` int DEFAULT NULL,
  `Genero` varchar(20) DEFAULT NULL,
  `DNI` varchar(10) DEFAULT NULL,
  `DNI_Foto` varchar(500) DEFAULT NULL,
  `Domicilio` varchar(50) DEFAULT NULL,
  `Provincia` varchar(30) DEFAULT NULL,
  `Ciudad` varchar(30) DEFAULT NULL,
  `Nacionalidad` varchar(50) DEFAULT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Sexo` varchar(15) DEFAULT NULL,
  `Celular` varchar(20) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Celular_Emergencia` varchar(20) DEFAULT NULL,
  `Nombre_Contacto_emergencia` varchar(30) DEFAULT NULL,
  `Observaciones` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID_Personal`),
  KEY `ID_Cargo` (`ID_Cargo`),
  KEY `ID_Formacion` (`ID_Formacion`),
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`ID_Cargo`) REFERENCES `cargo` (`ID_Cargo`),
  CONSTRAINT `personal_ibfk_2` FOREIGN KEY (`ID_Formacion`) REFERENCES `formacion` (`ID_Formacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES ('ID_P_1','ID_C_4','ID_F_5','2022-10-25 00:00:00','Nombre_1_1','Nombre_2_1','Apellido_1_1','Apellido_2_1','Nombre_completo_1','url_1','url_1',41,'Genero_1','26549138','url_1','domicilio_1','provincia_1','ciudad_1','nacionalidad_1','1981-12-15','sexo_1','0113205221','4438474','0113482212','Nombre_Emerg_1','Observacion_1'),('ID_P_10','ID_C_4','ID_F_1','2022-11-05 00:00:00','Nombre_1_10','Nombre_2_10','Apellido_1_10','Apellido_2_10','Nombre_completo_10','url_10','url_10',30,'Genero_1','30704712','url_10','domicilio_10','provincia_10','ciudad_10','nacionalidad_10','1992-12-12','sexo_1','0116688724','4439589','0117384851','Nombre_Emerg_10','Observacion_10'),('ID_P_2','ID_C_2','ID_F_1','2022-10-05 00:00:00','Nombre_1_2','Nombre_2_2','Apellido_1_2','Apellido_2_2','Nombre_completo_2','url_2','url_2',61,'Genero_2','34310517','url_2','domicilio_2','provincia_2','ciudad_2','nacionalidad_2','1961-12-20','sexo_2','0116583636','4431341','0111333040','Nombre_Emerg_2','Observacion_2'),('ID_P_3','ID_C_4','ID_F_4','2022-10-29 00:00:00','Nombre_1_3','Nombre_2_3','Apellido_1_3','Apellido_2_3','Nombre_completo_3','url_3','url_3',37,'Genero_1','22227609','url_3','domicilio_3','provincia_3','ciudad_3','nacionalidad_3','1985-12-14','sexo_1','0115337580','4439603','0119658760','Nombre_Emerg_3','Observacion_3'),('ID_P_4','ID_C_4','ID_F_5','2022-11-14 00:00:00','Nombre_1_4','Nombre_2_4','Apellido_1_4','Apellido_2_4','Nombre_completo_4','url_4','url_4',21,'Genero_1','27441156','url_4','domicilio_4','provincia_4','ciudad_4','nacionalidad_4','2001-12-10','sexo_1','0114064482','4435349','0111857069','Nombre_Emerg_4','Observacion_4'),('ID_P_7','ID_C_2','ID_F_4','2022-10-29 00:00:00','Nombre_1_7','Nombre_2_7','Apellido_1_7','Apellido_2_7','Nombre_completo_7','url_7','url_7',37,'Genero_1','27252194','url_7','domicilio_7','provincia_7','ciudad_7','nacionalidad_7','1985-12-14','sexo_1','0114467736','4434451','0112671278','Nombre_Emerg_7','Observacion_7'),('ID_P_8','ID_C_2','ID_F_1','2022-10-28 00:00:00','Nombre_1_8','Nombre_2_8','Apellido_1_8','Apellido_2_8','Nombre_completo_8','url_8','url_8',38,'Genero_2','29945850','url_8','domicilio_8','provincia_8','ciudad_8','nacionalidad_8','1984-12-14','sexo_2','0114914203','4436269','0117368462','Nombre_Emerg_8','Observacion_8'),('ID_P_9','ID_C_1','ID_F_1','2022-10-26 00:00:00','Nombre_1_9','Nombre_2_9','Apellido_1_9','Apellido_2_9','Nombre_completo_9','url_9','url_9',40,'Genero_1','21762558','url_9','domicilio_9','provincia_9','ciudad_9','nacionalidad_9','1982-12-15','sexo_1','0113000849','4431784','0118977018','Nombre_Emerg_9','Observacion_9');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `personal_edad`
--

DROP TABLE IF EXISTS `personal_edad`;
/*!50001 DROP VIEW IF EXISTS `personal_edad`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `personal_edad` AS SELECT 
 1 AS `Personal cuya edad es mayor a 30 años`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `personal_incorporacion`
--

DROP TABLE IF EXISTS `personal_incorporacion`;
/*!50001 DROP VIEW IF EXISTS `personal_incorporacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `personal_incorporacion` AS SELECT 
 1 AS `ID_Personal`,
 1 AS `Fecha_registro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `personal_organigrama`
--

DROP TABLE IF EXISTS `personal_organigrama`;
/*!50001 DROP VIEW IF EXISTS `personal_organigrama`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `personal_organigrama` AS SELECT 
 1 AS `ID_Personal`,
 1 AS `ID_Cargo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `ID_Reporte` varchar(10) NOT NULL,
  `ID_Personal` varchar(10) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL,
  `Fecha_Desde_Rep` datetime DEFAULT NULL,
  `Fecha_Hasta_Rep` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Reporte`),
  KEY `ID_Personal` (`ID_Personal`),
  CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`ID_Personal`) REFERENCES `personal` (`ID_Personal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
INSERT INTO `reportes` VALUES ('ID_R_1','ID_P_3','2022-08-01 00:00:00','2022-10-04 00:00:00','2022-10-05 00:00:00'),('ID_R_12','ID_P_4','2021-06-15 00:00:00','2021-01-19 00:00:00','2021-01-21 00:00:00'),('ID_R_13','ID_P_1','2022-11-10 00:00:00','2021-11-19 00:00:00','2021-11-20 00:00:00'),('ID_R_14','ID_P_1','2022-02-12 00:00:00','2021-01-09 00:00:00','2021-01-11 00:00:00'),('ID_R_15','ID_P_10','2021-04-12 00:00:00','2021-06-24 00:00:00','2021-06-25 00:00:00'),('ID_R_2','ID_P_9','2022-04-10 00:00:00','2021-07-19 00:00:00','2021-07-21 00:00:00'),('ID_R_3','ID_P_4','2022-11-16 00:00:00','2021-10-09 00:00:00','2021-10-11 00:00:00'),('ID_R_5','ID_P_8','2022-01-03 00:00:00','2022-10-16 00:00:00','2022-10-18 00:00:00'),('ID_R_7','ID_P_4','2021-02-21 00:00:00','2021-08-16 00:00:00','2021-08-18 00:00:00');
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_registros`
--

DROP TABLE IF EXISTS `tipos_registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_registros` (
  `ID_Tipo_Registro` varchar(10) NOT NULL,
  `Tipo` varchar(30) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT NULL,
  `Descripcion` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`ID_Tipo_Registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_registros`
--

LOCK TABLES `tipos_registros` WRITE;
/*!40000 ALTER TABLE `tipos_registros` DISABLE KEYS */;
INSERT INTO `tipos_registros` VALUES ('ID_T_1','Ausencia','2020-11-05 00:00:00','Descripcion_1'),('ID_T_2','Llamada de atencion','2020-11-05 00:00:00','Descripcion_2'),('ID_T_3','Guardia','2020-11-05 00:00:00','Descripcion_3'),('ID_T_4','Vacaciones','2020-11-05 00:00:00','Descripcion_4'),('ID_T_5','Nota','2020-11-05 00:00:00','Descripcion_5'),('ID_T_6','Horas Extras','2020-11-05 00:00:00','Descripcion_6'),('ID_T_7','Cambio de turno','2020-11-05 00:00:00','Descripcion_7'),('ID_T_8','Bono por productividad','2020-11-05 00:00:00','Descripcion_8'),('ID_T_9','Dia libre','2020-11-05 00:00:00','Descripcion_9');
/*!40000 ALTER TABLE `tipos_registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sistema_gestion_personal'
--
/*!50003 DROP FUNCTION IF EXISTS `Ausencias_mes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Ausencias_mes`(mes int) RETURNS int
    DETERMINISTIC
BEGIN
							DECLARE Resultado INT;
							SET Resultado = 
											(SELECT COUNT(ID_Evento) 
											FROM Eventos
											WHERE MONTH(Fecha_Desde) = mes 
												AND ID_Tipo_Registro = "ID_T_1");
							RETURN Resultado;
					END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `promedio_pagos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `promedio_pagos`(mes int) RETURNS int
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
						END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Agregar_Cargo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Agregar_Cargo`(SP_ID_Cargo varchar(10), IN SP_Cargo varchar(40), IN SP_Observaciones varchar(300))
BEGIN
						INSERT INTO cargo(ID_Cargo, Cargo, Fecha_Registro, Observaciones)
						VALUES (SP_ID_Cargo, SP_Cargo, NOW(), SP_Observaciones);
						SELECT * FROM cargo;
					END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Reordenar_Eventos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Reordenar_Eventos`(IN campo_orden VARCHAR(255), IN tipo_orden VARCHAR(5))
BEGIN
						SET @objeto = CONCAT('SELECT * FROM eventos ORDER BY',' ',campo_orden,' ',tipo_orden);
						PREPARE s FROM @objeto;
						EXECUTE s;
						DEALLOCATE PREPARE s;
					END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ausencias`
--

/*!50001 DROP VIEW IF EXISTS `ausencias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ausencias` AS select `personal`.`Nombre_1` AS `Nombre_1`,`personal`.`Apellido_1` AS `Apellido_1` from (`personal` join `eventos` on((`personal`.`ID_Personal` = `eventos`.`ID_Personal`))) where ((month(`eventos`.`Fecha_Desde`) = month(now())) and (year(`eventos`.`Fecha_Desde`) = year(now())) and (`eventos`.`ID_Tipo_Registro` = 'ID_T_1')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `llamadas_atencion`
--

/*!50001 DROP VIEW IF EXISTS `llamadas_atencion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `llamadas_atencion` AS select count(`eventos`.`ID_Evento`) AS `Llamadas de atención realizadas este mes` from `eventos` where ((month(`eventos`.`Fecha_Desde`) = month(now())) and (year(`eventos`.`Fecha_Desde`) = year(now())) and (`eventos`.`ID_Tipo_Registro` = 'ID_T_3')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `personal_edad`
--

/*!50001 DROP VIEW IF EXISTS `personal_edad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `personal_edad` AS select `personal`.`ID_Personal` AS `Personal cuya edad es mayor a 30 años` from `personal` where ((to_days(curdate()) - to_days(`personal`.`Fecha_Nacimiento`)) > (30 * 365)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `personal_incorporacion`
--

/*!50001 DROP VIEW IF EXISTS `personal_incorporacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `personal_incorporacion` AS select `personal`.`ID_Personal` AS `ID_Personal`,`personal`.`Fecha_registro` AS `Fecha_registro` from `personal` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `personal_organigrama`
--

/*!50001 DROP VIEW IF EXISTS `personal_organigrama`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `personal_organigrama` AS select `personal`.`ID_Personal` AS `ID_Personal`,`personal`.`ID_Cargo` AS `ID_Cargo` from `personal` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-07 23:17:15
