DROP DATABASE IF EXISTS `coruscant_pizza`;
CREATE DATABASE `coruscant_pizza`; 
USE `coruscant_pizza`;

CREATE TABLE `clients` (
`id_client` int(11) NOT NULL AUTO_INCREMENT,
`nom` varchar(50) NOT NULL,
`cognoms` varchar(50) NOT NULL,
`adreça` varchar(50) NOT NULL,
`codi_postal` int(5) NOT NULL,
`localitat` varchar(50) NOT NULL,
`provincia` varchar(50) NOT NULL,
`telefon` varchar(20) NOT NULL,
PRIMARY KEY (`id_client`)
);
INSERT INTO `clients` VALUES (1,'Luke','Skywalker Amidala','Smugglers Row, 13',17835,'Mos Eisley','Tatooine','93 543 74 90');
INSERT INTO `clients` VALUES (2,'Leia','Organa Amidala','Palace Plaza, 1',13665,'Organa City','Alderaan','93 993 20 19');
INSERT INTO `clients` VALUES (3,'Han','Organa Solo','Plasteel Street, 20, Floor 7, Door 4',16485,'Coronet City','Corellia','93 063 11 59');
INSERT INTO `clients` VALUES (4,'Obi','Wan Kenobi','Krayt Dragon Avenue, 4',17535,'Dune Sea','Tatooine','93 544 22 31');
INSERT INTO `clients` VALUES (5,'Darth','Vader Sith','Imperial Square, 2, Floor 1, Door 1',10125,'Coruscant City','Coruscant','93 105 64 88');

CREATE TABLE `categories` (
`id_categoria` int(11) NOT NULL AUTO_INCREMENT,
`nom` varchar(50) NOT NULL,
PRIMARY KEY (`id_categoria`)
);
INSERT INTO `categories` VALUES (1,'Margherita');
INSERT INTO `categories` VALUES (2,'Prosciutto');
INSERT INTO `categories` VALUES (3,'4 Formaggi');
INSERT INTO `categories` VALUES (4,'Diavola');
INSERT INTO `categories` VALUES (5,'Di Mare');
INSERT INTO `categories` VALUES (6,'Al Pesto');
INSERT INTO `categories` VALUES (7,'Regina');

CREATE TABLE `botigues` (
`id_botiga` int(11) NOT NULL AUTO_INCREMENT,
`adreça` varchar(50) NOT NULL,
`codi_postal` int(5) NOT NULL,
`localitat` varchar(50) NOT NULL,
`provincia` varchar(50) NOT NULL,
PRIMARY KEY (`id_botiga`)
);
INSERT INTO `botigues` VALUES (1,'Weequay Boulevard, 25',17825,'Mos Espa','Tatooine');
INSERT INTO `botigues` VALUES (2,'Alde Memorial Street, 30',136655,'Organa City','Alderaan');
INSERT INTO `botigues` VALUES (3,'CDC Plaza, 7',16485,'Coronet City','Corellia');
INSERT INTO `botigues` VALUES (4,'Senate Square, 14',10125,'Coruscant City','Coruscant');

CREATE TABLE `empleats` (
`id_empleat` int(11) NOT NULL AUTO_INCREMENT,
`id_botiga` int(11) NOT NULL,
`nom` varchar(50) NOT NULL,
`cognoms` varchar(50) NOT NULL,
`NIF` varchar(9) NOT NULL,
`telefon` varchar(20) NOT NULL,
`funcio` varchar(20) NOT NULL,
PRIMARY KEY (`id_empleat`),
CONSTRAINT `fk_empleats_botigues` FOREIGN KEY (`id_botiga`) REFERENCES `botigues` (`id_botiga`) ON UPDATE CASCADE
);
INSERT INTO `empleats` VALUES (1,1,'Ran','Cyone Pellian','65784612Q','93 756 83 43','cuiner');
INSERT INTO `empleats` VALUES (2,1,'Anami','Brene Rastee','73501648H','93 645 87 11','repartidor');
INSERT INTO `empleats` VALUES (3,2,'Kai','Isme Tuab','97636529I','93 753 43 90','cuiner');
INSERT INTO `empleats` VALUES (4,2,'Safis','Orm Tarlaio','87629530P','93 847 12 85','repartidor');
INSERT INTO `empleats` VALUES (5,3,'Fela','Stazi Trehug','84729783F','93 997 12 65','cuiner');
INSERT INTO `empleats` VALUES (6,3,'Taga','Nokko Dulla','75639815V','93 857 92 54','repartidor');
INSERT INTO `empleats` VALUES (7,4,'Momoz','Adobb Habat','84682619E','93 746 16 64','cuiner');
INSERT INTO `empleats` VALUES (8,4,'Merai','Arik Mona','84736717X','93 847 83 00','repartidor');

CREATE TABLE `productes` (
`id_producte` int(11) NOT NULL AUTO_INCREMENT,
`descripcio` varchar(50) NOT NULL,
`imatge` varchar(1024) NOT NULL,
`preu_euros` decimal(5,2) NOT NULL,
PRIMARY KEY (`id_producte`)
);
INSERT INTO `productes` VALUES (1,'Pizzes','./img/img_pizza.jpeg',10.50);
INSERT INTO `productes` VALUES (2,'Hamburgueses','./img/img_hamburger.jpeg',8.00);
INSERT INTO `productes` VALUES (3,'Begudes','./img/img_pizza.jpeg',3.00);

CREATE TABLE `comandes` (
`id_comanda` int(11) NOT NULL AUTO_INCREMENT,
`id_client` int(11) NOT NULL,
`tipus_entrega` varchar(50) NOT NULL,
`id_botiga` int(11) NOT NULL,
`id_repartidor` int(11),
`id_pizzes` int(11) NOT NULL,
`quantitat_pizzes_total` int(5) NOT NULL,
`id_pizzes_1` int(11) NOT NULL,
`quantitat_pizzes_1` int(5) DEFAULT '0',
`id_pizzes_2` int(11) NOT NULL,
`quantitat_pizzes_2` int(5) DEFAULT '0',
`id_pizzes_3` int(11) NOT NULL,
`quantitat_pizzes_3` int(5) DEFAULT '0',
`id_pizzes_4` int(11) NOT NULL,
`quantitat_pizzes_4` int(5) DEFAULT '0',
`id_pizzes_5` int(11) NOT NULL,
`quantitat_pizzes_5` int(5) DEFAULT '0',
`id_pizzes_6` int(11) NOT NULL,
`quantitat_pizzes_6` int(5) DEFAULT '0',
`id_pizzes_7` int(11) NOT NULL,
`quantitat_pizzes_7` int(5) DEFAULT '0',
`id_hamburgueses` int(11) NOT NULL,
`quantitat_hamburgueses` int(5) NOT NULL,
`id_begudes` int(11) NOT NULL,
`quantitat_begudes` int(5) NOT NULL,
`preu_total` decimal(8,2) NOT NULL,
`data_comanda` datetime NOT NULL,
`data_entrega` datetime,
PRIMARY KEY (`id_comanda`),
CONSTRAINT `fk_comandes_clients` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON UPDATE CASCADE,
CONSTRAINT `fk_comandes_botigues` FOREIGN KEY (`id_botiga`) REFERENCES `botigues` (`id_botiga`) ON UPDATE CASCADE,
CONSTRAINT `fk_comandes_empleats` FOREIGN KEY (`id_repartidor`) REFERENCES `empleats` (`id_empleat`) ON UPDATE CASCADE,
CONSTRAINT `fk_comandes_productes_1` FOREIGN KEY (`id_pizzes`) REFERENCES `productes` (`id_producte`) ON UPDATE CASCADE,
CONSTRAINT `fk_comandes_productes_2` FOREIGN KEY (`id_hamburgueses`) REFERENCES `productes` (`id_producte`) ON UPDATE CASCADE,
CONSTRAINT `fk_comandes_productes_3` FOREIGN KEY (`id_begudes`) REFERENCES `productes` (`id_producte`) ON UPDATE CASCADE,
CONSTRAINT `fk_comandes_categories_1` FOREIGN KEY (`id_pizzes_1`) REFERENCES `categories` (`id_categoria`) ON UPDATE CASCADE,
CONSTRAINT `fk_comandes_categories_2` FOREIGN KEY (`id_pizzes_2`) REFERENCES `categories` (`id_categoria`) ON UPDATE CASCADE,
CONSTRAINT `fk_comandes_categories_3` FOREIGN KEY (`id_pizzes_3`) REFERENCES `categories` (`id_categoria`) ON UPDATE CASCADE,
CONSTRAINT `fk_comandes_categories_4` FOREIGN KEY (`id_pizzes_4`) REFERENCES `categories` (`id_categoria`) ON UPDATE CASCADE,
CONSTRAINT `fk_comandes_categories_5` FOREIGN KEY (`id_pizzes_5`) REFERENCES `categories` (`id_categoria`) ON UPDATE CASCADE,
CONSTRAINT `fk_comandes_categories_6` FOREIGN KEY (`id_pizzes_6`) REFERENCES `categories` (`id_categoria`) ON UPDATE CASCADE,
CONSTRAINT `fk_comandes_categories_7` FOREIGN KEY (`id_pizzes_7`) REFERENCES `categories` (`id_categoria`) ON UPDATE CASCADE
);
INSERT INTO `comandes` VALUES (1,1,'A domicili',1,2,1,2,1,0,2,0,3,1,4,1,5,0,6,0,7,0,2,1,3,2,35.00,'2024-02-11 13:11:55','2024-02-11 13:29:23');
INSERT INTO `comandes` VALUES (2,4,'A domicili',1,2,1,1,1,1,2,0,3,0,4,0,5,0,6,0,7,0,2,1,3,1,21.50,'2024-05-03 20:34:12','2024-05-03 20:59:55');
INSERT INTO `comandes` VALUES (3,2,'A domicili',2,4,1,4,1,0,2,1,3,0,4,0,5,1,6,1,7,1,2,5,3,8,106.00,'2024-01-27 17:04:54','2024-01-27 17:25:02');
INSERT INTO `comandes` VALUES (4,3,'A domicili',3,6,1,2,1,0,2,0,3,0,4,2,5,0,6,0,7,0,2,2,3,4,49.00,'2024-03-15 12:49:44','2024-03-15 13:03:25');
INSERT INTO `comandes` VALUES (5,5,'A domicili',4,8,1,1,1,0,2,0,3,0,4,0,5,0,6,0,7,1,2,1,3,1,21.50,'2024-05-04 09:02:11','2024-05-04 09:18:38');
INSERT INTO `comandes` VALUES (6,1,'A domicili',1,2,1,1,1,0,2,1,3,0,4,0,5,0,6,0,7,0,2,1,3,2,24.50,'2024-04-24 21:04:12','2024-04-24 21:21:21');
INSERT INTO `comandes` VALUES (7,4,'A domicili',1,2,1,1,1,0,2,0,3,0,4,0,5,0,6,1,7,0,2,1,3,1,21.50,'2024-06-20 12:40:35','2024-06-20 12:56:30');
INSERT INTO `comandes` VALUES (8,2,'A domicili',2,4,1,7,1,2,2,0,3,1,4,0,5,1,6,0,7,3,2,10,3,24,225.50,'2024-03-23 14:12:09','2024-03-23 14:28:37');
INSERT INTO `comandes` VALUES (9,3,'A domicili',3,6,1,2,1,0,2,0,3,0,4,1,5,1,6,0,7,0,2,3,3,5,60.00,'2024-04-19 13:18:45','2024-04-19 13:31:45');
INSERT INTO `comandes` VALUES (10,5,'A domicili',4,8,1,1,1,0,2,0,3,0,4,1,5,0,6,0,7,0,2,1,3,2,24.50,'2024-06-21 20:44:13','2024-06-21 21:01:29');
INSERT INTO `comandes` VALUES (11,1,'En botiga',1,NULL,1,1,1,0,2,0,3,1,4,0,5,0,6,0,7,0,2,1,3,1,21.50,'2024-07-14 16:40:32',NULL);
INSERT INTO `comandes` VALUES (12,4,'En botiga',1,NULL,1,1,1,0,2,0,3,0,4,0,5,0,6,1,7,0,2,0,3,1,13.50,'2024-06-23 09:33:54',NULL);
INSERT INTO `comandes` VALUES (13,2,'En botiga',2,NULL,1,5,1,0,2,0,3,0,4,3,5,0,6,1,7,1,2,5,3,6,110.50,'2024-05-02 19:55:04',NULL);
INSERT INTO `comandes` VALUES (14,3,'En botiga',3,NULL,1,2,1,0,2,1,3,0,4,0,5,0,6,0,7,1,2,2,3,2,43.00,'2024-07-10 21:53:05',NULL);
INSERT INTO `comandes` VALUES (15,5,'En botiga',4,NULL,1,1,1,1,2,1,3,0,4,0,5,0,6,0,7,0,2,1,3,1,21.50,'2024-06-24 18:04:09',NULL);
