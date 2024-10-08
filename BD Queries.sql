-- Òptica
USE `cul_d_ampolla`;
SELECT * FROM `ulleres` WHERE id_client = 5;
SELECT * FROM `ulleres` WHERE venedor = 'Elrond Halfelven' AND data_venda BETWEEN '2023-04-01 00:00:00' AND '2024-04-01 00:00:00';
SELECT DISTINCT p.nom AS 'Proveïdors' FROM `proveidors` p JOIN `marques` m ON p.id_proveidor = m.id_proveidor JOIN `ulleres` u ON m.id_marca = u.id_marca WHERE u.id_ulleres IS NOT NULL;
-- Pizzeria
USE `coruscant_pizza`;
SELECT SUM(c.quantitat_begudes) AS 'Quantitat Begudes venudes a Mos Espa' FROM `comandes` c JOIN `botigues` b ON c.id_botiga = b.id_botiga WHERE b.localitat = 'Mos Espa';
SELECT COUNT(c.id_comanda) AS 'Quantitat de comandes efectuades per Anami Brene Rastee' FROM `comandes` c JOIN `empleats` e ON c.id_repartidor = e.id_empleat WHERE e.nom = "Anami";