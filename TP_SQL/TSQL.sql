--Créez une vue qui affiche les informations suivantes pour chaque entrepôt :
--nom de l entrepôt, adresse complète, nombre d expéditions envoyées au
--cours des 30 derniers jours.

CREATE VIEW Vue_InfoEntrepots AS
SELECT e.id AS id_entrepot, e.nom_entrepot, CONCAT(e.adresse, ', ', e.ville, ', ', e.pays) AS adresse_complete, COUNT(ex.id) AS nombre_expeditions_envoyees
FROM entrepots e
LEFT JOIN expeditions ex ON e.id = ex.id_entrepot_source
WHERE ex.date_expedition >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY)
GROUP BY e.id, e.nom_entrepot, adresse_complete;


--Créez une procédure stockée qui prend en entrée l ID d un entrepôt et
--renvoie le nombre total d expéditions envoyées par cet entrepôt au cours du
--dernier mois.

DELIMITER $$
CREATE PROCEDURE NombreExpeditionsParEntrepot(IN entrepot_id INT)
BEGIN
    SELECT COUNT(*) AS nombre_expeditions
    FROM expeditions
    WHERE id_entrepot_source = entrepot_id
    AND date_expedition >= DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH);
END $$
DELIMITER ;


--Créez une fonction qui prend en entrée une date et renvoie le nombre total d'expéditions livrées ce jour-là.
