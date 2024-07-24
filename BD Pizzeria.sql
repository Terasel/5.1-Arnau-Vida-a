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