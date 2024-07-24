DROP DATABASE IF EXISTS `cul_d_ampolla`;
CREATE DATABASE `cul_d_ampolla`; 
USE `cul_d_ampolla`;

CREATE TABLE `clients` (
`id_client` int(11) NOT NULL AUTO_INCREMENT,
`nom` varchar(50) NOT NULL,
`carrer` varchar(50) NOT NULL,
`numero` tinyint(4) NOT NULL,
`pis` tinyint(4) NOT NULL,
`porta` tinyint(4) NOT NULL,
`ciutat` varchar(50) NOT NULL,
`codi_postal` int(5) NOT NULL,
`pais` varchar(50) NOT NULL,
`telèfon` varchar(20) NOT NULL,
`correu_electronic` varchar(50) NOT NULL,
`recomanat_per` int(11),
PRIMARY KEY (`id_client`)
);
INSERT INTO `clients` VALUES (1,'Frodo Baggins','Bag Row',10,0,1,'Hobbiton',01230,'The Shire','+64 635 777 910','jahofarejo@gmail.com',NULL);
INSERT INTO `clients` VALUES (2,'Sam Gamgee','Bag Row',8,0,1,'Hobbiton',01230,'The Shire','+64 635 814 722','potatoes@gmail.com',1);
INSERT INTO `clients` VALUES (3,'Meriadoc Brandybuck','Brandy Hall Street',1,3,7,'Buckland',02260,'The Shire','+64 634 033 405','longbottomleaf@gmail.com',1);
INSERT INTO `clients` VALUES (4,'Peregrin Took','Great Smials Street',1,1,5,'Tuckborough',05290,'The Shire','+64 634 887 129','secondbreakfast@gmail.com',1);
INSERT INTO `clients` VALUES (5,'Gandalf Maiar','Pelóri Street',53,0,1,'Valmar',91219,'Valinor','+11 732 756 920','foolofatook@gmail.com',1);
INSERT INTO `clients` VALUES (6,'Aragorn Dúnedain','The Last Homely House Avenue',1,0,4,'Rivendell',15397,'Arnor','+55 937 544 123','thebeaconsarelit@gmail.com',5);
INSERT INTO `clients` VALUES (7,'Boromir Steward','Citadel Plaza',3,2,2,'Minas Tirith',77430,'Gondor','+34 833 028 955','onedoesnotsimply@gmail.com',NULL);
INSERT INTO `clients` VALUES (8,'Legolas Greenleaf','Noldorin Avenue',4,0,16,'Felegoth',44801,'Mirkwood','+27 540 014 875','hobbitstoisengard@gmail.com',5);
INSERT INTO `clients` VALUES (9,'Gimli Glóinsson','Stoneworkers Square',54,3,7,'Erebor',35758,'Rhovanion','+34 558 628 080','tossme@gmail.com',NULL);

CREATE TABLE `proveidors` (
`id_proveidor` int(11) NOT NULL AUTO_INCREMENT,
`nom` varchar(50) NOT NULL,
`carrer` varchar(50) NOT NULL,
`numero` tinyint(4) NOT NULL,
`pis` tinyint(4) NOT NULL,
`porta` tinyint(4) NOT NULL,
`ciutat` varchar(50) NOT NULL,
`codi_postal` int(5) NOT NULL,
`pais` varchar(50) NOT NULL,
`telèfon` varchar(20) NOT NULL,
`fax` varchar(50) NOT NULL,
`NIF` varchar(9) NOT NULL,
PRIMARY KEY (`id_proveidor`)
);
INSERT INTO `proveidors` VALUES (1,'Shire Glasscraft','Flourdumpling Avenue',19,0,1,'Michel Delving',05410,'The Shire','+64 639 622 085','(123)-456-7890','Y8539002T');
INSERT INTO `proveidors` VALUES (2,'Arnor Crafters','Boar Fountain Square',4,1,2,'Bree',16387,'Arnor','+55 949 341 506','(559)-136-0582','Y2617432M');
INSERT INTO `proveidors` VALUES (3,'Undying Vision','Cuivienen Street',104,2,3,'Valmar',91219,'Valinor','+11 732 555 782','(001)-322-6573','Y8532844G');
INSERT INTO `proveidors` VALUES (4,'Numenorian Artisanship','Swan Knights Street',86,0,1,'Dol Amroth',16387,'Gondor','+34 835 594 100','(433)-073-5476','Y2617432M');

CREATE TABLE `marques` (
`id_marca` int(11) NOT NULL AUTO_INCREMENT,
`nom` varchar(50) NOT NULL,
`id_proveidor` int(11) NOT NULL,
PRIMARY KEY (`id_marca`),
CONSTRAINT `fk_marques_proveidors` FOREIGN KEY (`id_proveidor`) REFERENCES `proveidors` (`id_proveidor`) ON UPDATE CASCADE
);
INSERT INTO `marques` VALUES (1,'Took Trailblazers',1);
INSERT INTO `marques` VALUES (2,'Visions of Annúminas',2);
INSERT INTO `marques` VALUES (3,'AmanGlass',3);
INSERT INTO `marques` VALUES (4,'Pride of Anduin',4);
INSERT INTO `marques` VALUES (5,'Dol Guldurians',4);
INSERT INTO `marques` VALUES (6,'Zirakzigilers',2);

CREATE TABLE `ulleres` (
`id_ulleres` int(11) NOT NULL AUTO_INCREMENT,
`id_marca` int(11) NOT NULL,
`id_client` int(11) NOT NULL,
`graduacio_vidre_dret` decimal(5,3) NOT NULL,
`graduacio_vidre_esq` decimal(5,3) NOT NULL,
`muntura` varchar(50) NOT NULL,
`color_muntura` varchar(50) NOT NULL,
`color_vidre_dret` varchar(50) NOT NULL,
`color_vidre_esq` varchar(50) NOT NULL,
`preu_euros` decimal(5,3) NOT NULL,
`venedor` varchar(50) NOT NULL,
`data_venda` datetime NOT NULL,
PRIMARY KEY (`id_ulleres`),
CONSTRAINT `fk_ulleres_marques` FOREIGN KEY (`id_marca`) REFERENCES `marques` (`id_marca`) ON UPDATE CASCADE,
CONSTRAINT `fk_ulleres_clients` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`) ON UPDATE CASCADE
);
INSERT INTO `ulleres` VALUES (1,2,1,2.5,2.0,'flotant','verd_fosc','incolor','incolor',40.50,'Elrond Halfelven','2023-04-16 10:50:32');
INSERT INTO `ulleres` VALUES (2,1,2,0.5,0.75,'pasta','marro_clar','incolor','incolor',35.00,'Elrond Halfelven','2023-04-17 09:11:30');
INSERT INTO `ulleres` VALUES (3,3,3,4.0,4.0,'metal·lica','vermell_clar','incolor','incolor',50.00,'Elladan Halfelven','2023-11-9 19:22:53');
INSERT INTO `ulleres` VALUES (4,4,4,3.25,3.75,'flotant','plata','negre','negre',55.00,'Arwen Halfelven','2024-05-02 12:33:22');
INSERT INTO `ulleres` VALUES (5,5,5,1.0,1.25,'pasta','gris','incolor','incolor',37.50,'Elrond Halfelven','2024-01-07 13:31:01');
INSERT INTO `ulleres` VALUES (6,6,6,2.5,2.5,'flotant','blau_mari','incolor','incolor',41.00,'Arwen Halfelven','2023-03-17 20:28:15');
INSERT INTO `ulleres` VALUES (7,3,7,3.75,3.5,'metal·lica','blanc','negre','negre',65.00,'Elladan Halfelven','2024-07-19 11:55:33');
INSERT INTO `ulleres` VALUES (8,4,8,0.5,0.5,'pasta','verd_clar','incolor','incolor',34.50,'Elladan Halfelven','2024-02-27 09:01:45');
INSERT INTO `ulleres` VALUES (9,6,9,3.0,2.5,'metal·lica','gris','incolor','incolor',52.50,'Arwen Halfelven','2023-12-17 12:28:08');
INSERT INTO `ulleres` VALUES (10,3,5,1.0,1.25,'pasta','blanc','incolor','incolor',37.50,'Elrond Halfelven','2024-04-17 17:06:55');