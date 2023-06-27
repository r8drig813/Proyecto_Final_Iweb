-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.28

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

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

--
-- Table structure for table `comprausuario`
--

DROP TABLE IF EXISTS `comprausuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprausuario` (
  `idCompra` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idJuego` int NOT NULL,
  `cantidad` int NOT NULL,
  `fechaCompra` date NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `idAdminAsignado` int DEFAULT NULL,
  `precioCompra` varchar(45) DEFAULT NULL,
  `idEstados` int NOT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `raiting` int DEFAULT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `fk_Compra_Usuario1_idx` (`idUsuario`),
  KEY `fk_Compra_Juego1_idx` (`idJuego`),
  KEY `fk_Compra_Usuario2_idx` (`idAdminAsignado`),
  KEY `fk_comprausuario_estados1_idx` (`idEstados`),
  CONSTRAINT `fk_Compra_Juego1` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idJuego`),
  CONSTRAINT `fk_Compra_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `cuenta` (`idCuenta`),
  CONSTRAINT `fk_Compra_Usuario2` FOREIGN KEY (`idAdminAsignado`) REFERENCES `cuenta` (`idCuenta`),
  CONSTRAINT `fk_comprausuario_estados1` FOREIGN KEY (`idEstados`) REFERENCES `estados` (`idestados`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprausuario`
--

LOCK TABLES `comprausuario` WRITE;
/*!40000 ALTER TABLE `comprausuario` DISABLE KEYS */;
INSERT INTO `comprausuario` VALUES (1,114,127,1,'2023-06-10','Av. Arequipa 789',10,'50',6,NULL,NULL),(2,114,128,1,'2023-06-14','Av. Arequipa 789',10,'200',7,NULL,NULL),(3,120,130,2,'2023-06-25','Av. Lima 1918',10,'100',6,NULL,NULL),(4,121,129,3,'2023-06-05','Av. Ferrocarril 1010',10,'12',6,NULL,NULL),(11,114,148,1,'2023-06-26','Av. Arequipa 789',10,'1.0',1,NULL,NULL);
/*!40000 ALTER TABLE `comprausuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `idCuenta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `nickname` varchar(45) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `fotoNombre` varchar(100) DEFAULT NULL,
  `fotoExt` varchar(45) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `desabilitado` tinyint NOT NULL,
  `idRol` int NOT NULL,
  `passwordHashed` varchar(255) NOT NULL,
  `passwordText` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCuenta`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`),
  UNIQUE KEY `correo_UNIQUE` (`correo`),
  KEY `fk_Cuentas_Roles_idx` (`idRol`),
  CONSTRAINT `fk_Cuentas_Roles` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES (1,'Dylan','Bustamante','tecreo','Chosica','dyla@hotmail.com',NULL,NULL,'soy una persona xd',0,1,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(2,'Joeyn','Doead','johndoead','Calle Los Pinos 33333','jondoead@gmail.com',NULL,NULL,'Tengo miedo de web1',0,1,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(10,'Robert','Brown','robertbrown','Avenida Los Laureles 321','robertbrown@gmail.com',NULL,NULL,'todos quieren ser admins',0,2,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(11,'Emilie','Davd','emiliedavd','Calle Maple 654','emiliedavd@gmail.com',NULL,NULL,'soy admin',0,2,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(12,'Roro','Roro','Chino','Av. China','roro@gmail.com',NULL,NULL,'soy chino koreano de japon',0,2,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(112,'Juan','Pérez','juanperez','Av. Javier Prado 123','juanperez@gmail.com',NULL,NULL,'Soy un amante de la música',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(113,'María','González','mariagonz','Jr. Huallaga 456','mariagonz@gmail.com',NULL,NULL,'Me encanta viajar',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(114,'Carlos','López','carlosl','Av. Arequipa 789','carloslopez@gmail.com',NULL,NULL,'Amante de los deportes',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(115,'Laura','Rodríguez','larodri','Av. Larco 321','larodriguez@gmail.com',NULL,NULL,'Apasionada por la lectura',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(116,'Diego','Hernández','diegoh','Jr. Iquitos 654','diegohernandez@gmail.com',NULL,NULL,'Fanático de la tecnología',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(117,'Ana','Martínez','anamart','Chiclayo','anamartinez@gmail.com',NULL,NULL,'Adoro la cocina',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(118,'Pedro','García','pedrog','Piura','pedrogarcia@gmail.com',NULL,NULL,'Me encanta el cine',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(119,'Luisa','Sánchez','luisas','Huaraz','luisasanchez@gmail.com',NULL,NULL,'Amante de los animales',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(120,'Miguel','Torres','miguelt','Tacna','migueltorres@gmail.com',NULL,NULL,'Apasionado por la fotografía',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(121,'Sofía','Luna','sofial','Ayacucho','sofialuna@gmail.com',NULL,NULL,'Me gusta la pintura',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(122,'Alejandro','Rojas','alejandror','Pucallpa','alejandrorojas@gmail.com',NULL,NULL,'Adicto a los videojuegos',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(123,'Valentina','Cordova','valentinac','Ica','valentinacordova@gmail.com',NULL,NULL,'Me gusta la jardinería',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(124,'Javier','Vargas','javierv','Huancayo','javiervargas@gmail.com',NULL,NULL,'Fanático del fútbol',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(125,'Paula','Ortega','paulao','Chimbote','paulaortega@gmail.com',NULL,NULL,'Amante de la moda',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(126,'Andrés','Guerrero','andresg','Tarapoto','andresguerrero@gmail.com',NULL,NULL,'Apasionado por la historia',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(127,'Fernanda','Díaz','fernandad','Trujillo','fernandadiaz@gmail.com',NULL,NULL,'Me gusta el yoga',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(128,'Gabriel','Vargas','gabrielv','Lima','gabrielvargas@gmail.com',NULL,NULL,'Adicto a las series',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(129,'John','Doe','johndoe','Calle Los Pinos 123','johndoe@gmail.com',NULL,NULL,'Tengo miedo del entregable',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(130,'Jane','Smith','janesmith','Avenida Los Robles 456','janesmith@gmail.com',NULL,NULL,'Iweb izipizi',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(131,'Alice','Johnson','alicejohnson','Calle Las Flores 789','alicejohnson@gmail.com',NULL,NULL,'No tengo dinero',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(132,'Emily','Davis','emilydavis','Calle Maple 654','emilydavis@gmail.com',NULL,NULL,'Soy un niño',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(133,'Sophia','Wilson','sophiawilson','Calle Cedar 147','sophiawilson@gmail.com',NULL,NULL,'Amo jugar videojuegos',0,2,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(134,'Laura','González','lauragonzalez','Calle Secundaria 456','lauragonzalez@gmail.com',NULL,NULL,'Usuario activo',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(135,'Carlos','Torres','carlostorres','Avenida Norte 789','carlostorres@gmail.com',NULL,NULL,'Usuario activo',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(136,'Ana','Ramírez','anaramirez','Calle Principal 789','anaramirez@gmail.com',NULL,NULL,'Usuario activo',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(137,'Luis','Hernández','luishernandez','Avenida Central 123','luishernandez@gmail.com',NULL,NULL,'Usuario activo',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(138,'Elena','Castro','elenacastro','Calle Secundaria 789','elenacastro@gmail.com',NULL,NULL,'Usuario activo',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(139,'Mario','López','mariolopez','Avenida Norte 456','mariolopez@gmail.com',NULL,NULL,'Usuario activo',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(140,'Sofía','Gómez','sofiagomez','Calle Principal 456','sofiagomez@gmail.com',NULL,NULL,'Usuario activo',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(141,'Andrés','Martínez','andresmartinez','Avenida Central 789','andresmartinez@gmail.com',NULL,NULL,'Usuario activo',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(142,'Carolina','Silva','carolinasilva','Calle Secundaria 123','carolinasilva@gmail.com',NULL,NULL,'Usuario activo',0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL),(159,'Rodrigo','Tinoco ','Koreano','Av. Peru','a20190159@pucp.edu.pe',NULL,NULL,NULL,0,3,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',NULL);
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `idestados` int NOT NULL,
  `nombreEstados` varchar(45) NOT NULL,
  PRIMARY KEY (`idestados`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'pendiente'),(2,'aceptado'),(3,'no aceptado'),(4,'rechazado'),(5,'retirado'),(6,'Pendiente'),(7,'Entregado'),(8,'Eliminado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juego`
--

DROP TABLE IF EXISTS `juego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juego` (
  `idJuego` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `descuento` decimal(4,2) DEFAULT NULL,
  `fotoNombre` varchar(100) NOT NULL,
  `extensionFoto` varchar(45) DEFAULT NULL,
  `existente` tinyint DEFAULT NULL,
  `habilitado` tinyint DEFAULT NULL,
  `consola` varchar(45) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `stock` int NOT NULL,
  `idAdmin` int DEFAULT NULL,
  PRIMARY KEY (`idJuego`),
  KEY `fk_Juegos_Cuentas1_idx` (`idJuego`),
  KEY `idAdmin` (`idAdmin`),
  CONSTRAINT `juego_ibfk_1` FOREIGN KEY (`idAdmin`) REFERENCES `cuenta` (`idCuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juego`
--

LOCK TABLES `juego` WRITE;
/*!40000 ALTER TABLE `juego` DISABLE KEYS */;
INSERT INTO `juego` VALUES (121,'Valorant 1','Juego de disparos casi tan bueno como CSGO',100.00,0.00,'img/juegos/1valorant.png',NULL,1,1,'PC','Acción',2,10),(122,'dota2','juegazo',60.00,0.00,'img/juegos/2dota2.jpg',NULL,1,1,'PlayStation 4','Acción',50,11),(123,'Toontown','juego de farmeo',70.00,0.00,'img/juegos/3toon.jpg',NULL,1,1,'PlayStation 5','Sandbox',100,12),(124,'Call of Duty','shooter',150.00,0.00,'img/juegos/4callDuty.jpg',NULL,1,1,'PlayStation 4','Acción',5,10),(125,'Beyond two souls ','Beyond: Two Souls es un videojuego de drama interactivo, desarrollado por Quantic Dream y distribuido por Sony',120.00,4.00,'img/juegos/5beyond.jpg',NULL,1,1,'PlayStation 5','Mundo abierto',100,11),(126,'The Legend of Zelda: Breath of the Wild','Videojuego de aventuras',180.00,10.00,'img/juegos/6zelda.jpg',NULL,1,1,'PlayStation 4','Terror',50,12),(127,'Minecraft','Juego de construcción y aventura',50.00,2.00,'img/juegos/7mine.jpg',NULL,1,1,'Nintendo Switch','Mundo abierto',200,10),(128,'Grand Theft Auto V','Videojuego de acción y mundo abierto',200.00,25.00,'img/juegos/8gta5.jpg',NULL,1,1,'PlayStation 4','Acción',20,11),(129,'FIFA 22','Videojuego de fútbol',60.00,0.00,'img/juegos/9fifa.jpeg',NULL,1,1,'Nintendo Switch','Estrategia',30,12),(130,'Assassins Creed Valhalla','Videojuego de acción y aventura',140.00,15.00,'img/juegos/10assa.jpg',NULL,1,1,'PlayStation 5','Terror',15,10),(131,'Animal Crossing: New Horizons','Videojuego de simulación de vida',60.00,0.00,'img/juegos/11animal.jpg',NULL,1,1,'Nintendo Switch','Mundo abierto',10,11),(132,'Super Mario Odyssey','Videojuego de plataformas',50.00,24.00,'img/juegos/12mario.jpg',NULL,1,1,'PlayStation 5','Acción',50,12),(133,'The Witcher 3: Wild Hunt','Videojuego de rol y acción',40.00,10.00,'img/juegos/13witcher.jpg',NULL,1,1,'PC','Terror',25,NULL),(134,'Fortnite','Videojuego de Battle Royale',100.00,0.00,'img/juegos/14fortnite.jpg',NULL,1,1,'PlayStation 4','Shooter',100,NULL),(135,'Red Dead Redemption 2','Videojuego de acción y mundo abierto',60.00,0.00,'img/juegos/15reddead.jpg',NULL,1,1,'PC','battle royal',40,NULL),(136,'Pokemon','Videojuego de Pokemon',60.00,0.00,'img/juegos/16pokemon.png',NULL,1,1,'PlayStation 4','Estrategia',1,NULL),(137,'The Last of Us Part II','Videojuego de acción y aventura',70.00,0.00,'img/juegos/17lastofus.jpg',NULL,1,1,'PlayStation 5','Acción',20,NULL),(138,'Overwatch','Videojuego de disparos en equipo',40.00,0.00,'img/juegos/18over.jpg',NULL,1,1,'PC','battle royal',50,NULL),(139,'Resident Evil Village','Videojuego de terror y supervivencia',50.00,0.00,'img/juegos/19resident.jpg',NULL,1,1,'PlayStation 4','battle royal',15,NULL),(140,'Splatoon 2','Videojuego de disparos y acción',40.00,0.00,'img/juegos/20spla.jpg',NULL,1,1,'PlayStation 5','Estrategia',40,NULL),(141,'Final Fantasy VII Remake','Videojuego de rol y aventuras',60.00,0.00,'img/juegos/21final.jpg',NULL,1,1,'PlayStation 4','Acción',25,NULL),(142,'Rommel','El juego favorito de ella',12.00,NULL,'img/juegos/juegoNuevo.png',NULL,NULL,NULL,'PlayStation 5','Aventura',12,NULL),(144,'Rommel','El juego favorito de ella',12.00,NULL,'img/juegos/juegoNuevo.png',NULL,NULL,NULL,'PlayStation 5','Aventura',1,NULL),(145,'Rommel','El juego favorito de ella',50.00,NULL,'img/juegos/juegoNuevo',NULL,NULL,NULL,'Nintendo Switch','Aventura',1,NULL),(146,'Planta vs Zombie','FUegi',14.00,0.00,'img/juegos/juegoNuevo',NULL,1,0,'PC','Terror',100,NULL),(147,'Mineli','El juego favorito de él.',30.00,0.00,'img/juegos/juegoNuevo.png',NULL,1,0,'PC','Aventura',5,NULL),(148,'Dylan','El juego favorito de ella... XDD Pero no por mucho time',1.00,0.00,'img/juegos/juegoNuevo.png',NULL,1,1,'PlayStation 5','Acción',1,NULL),(149,'New Game','Nuevo juego',20.00,0.00,'img/juegos/juegoNuevo.png',NULL,1,1,'PlayStation 5','Terror',2,NULL),(150,'Juan Pablo','El juego favorito de ella',1.00,0.00,'img/juegos/juegoNuevo.png',NULL,1,1,'PlayStation 5','Terror',1,NULL),(151,'gato','wert',12.00,0.00,'# bit errados.pdf',NULL,0,0,'PC','Acción',1,NULL);
/*!40000 ALTER TABLE `juego` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'manager'),(2,'administrador'),(3,'usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventausuario`
--

DROP TABLE IF EXISTS `ventausuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventausuario` (
  `idVenta` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idJuego` int NOT NULL,
  `precioVenta` decimal(10,0) NOT NULL,
  `mensajeAdmin` varchar(255) DEFAULT NULL,
  `idAdmin` int DEFAULT NULL,
  `idEstados` int NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `fk_Venta_Usuario1_idx` (`idUsuario`),
  KEY `fk_Venta_Juego1_idx` (`idJuego`),
  KEY `fk_Venta_Usuario2_idx` (`idAdmin`),
  KEY `fk_ventausuario_estados1_idx` (`idEstados`),
  CONSTRAINT `fk_Venta_Juego1` FOREIGN KEY (`idJuego`) REFERENCES `juego` (`idJuego`),
  CONSTRAINT `fk_Venta_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `cuenta` (`idCuenta`),
  CONSTRAINT `fk_Venta_Usuario2` FOREIGN KEY (`idAdmin`) REFERENCES `cuenta` (`idCuenta`),
  CONSTRAINT `fk_ventausuario_estados1` FOREIGN KEY (`idEstados`) REFERENCES `estados` (`idestados`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventausuario`
--

LOCK TABLES `ventausuario` WRITE;
/*!40000 ALTER TABLE `ventausuario` DISABLE KEYS */;
INSERT INTO `ventausuario` VALUES (11,112,121,50,' ',10,1),(12,113,122,60,'',10,2),(13,113,123,80,'Rebaje el precio a: 60',11,3),(14,113,124,1000,'El juego lo esta vendiendo demasiado caro',10,4),(15,113,125,96,'',11,1),(16,113,126,162,'',11,2),(17,114,127,60,'Rebaje el precio: 49',11,3),(18,114,128,150,'No se encuentra en optimas condiciones',11,4),(19,114,129,60,'',10,1),(20,114,130,119,'',10,2),(42,114,151,12,NULL,NULL,1);
/*!40000 ALTER TABLE `ventausuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-26  1:42:53
