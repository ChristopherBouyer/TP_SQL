--Affichez les expéditions en transit qui ont été initiées par un entrepôt situé en
--Europe et à destination d un entrepôt situé en Asie.

SELECT *
FROM expeditions ex
JOIN entrepots source ON ex.id_entrepot_source = source.id
JOIN entrepots destination ON ex.id_entrepot_destination = destination.id
WHERE ex.statut = 'En transit'
AND LEFT(source.pays, 1) = 'E'  -- Entrepos en Europe
AND LEFT(destination.pays, 1) = 'A';  -- Entrepos en Asie


--Affichez les entrepôts qui ont envoyé des expéditions à destination d un
--entrepôt situé dans le même pays.

SELECT DISTINCT e.id, e.nom_entrepot, e.adresse, e.ville, e.pays
FROM entrepots e
JOIN expeditions ex ON e.id = ex.id_entrepot_source
JOIN entrepots e_dest ON e_dest.id = ex.id_entrepot_destination
WHERE e.pays = e_dest.pays;


--Affichez les entrepôts qui ont envoyé des expéditions à destination d un
--entrepôt situé dans un pays différent.

SELECT DISTINCT e.id, e.nom_entrepot, e.adresse, e.ville, e.pays
FROM entrepots e
JOIN expeditions ex ON e.id = ex.id_entrepot_source
JOIN entrepots e_dest ON e_dest.id = ex.id_entrepot_destination
WHERE e.pays <> e_dest.pays;


--Affichez les expéditions en transit qui ont été initiées par un entrepôt situé
--dans un pays dont le nom commence par la lettre "F" et qui pèsent plus de 500 kg.

SELECT *
FROM expeditions ex
JOIN entrepots e ON ex.id_entrepot_source = e.id
WHERE ex.statut = 'En transit'
AND e.pays LIKE 'F%'
AND ex.poids > 500;


--Affichez le nombre total d'expéditions pour chaque combinaison de pays
--d'origine et de destination.

SELECT e_source.pays AS pays_origine, e_dest.pays AS pays_destination, COUNT(*) AS nombre_expeditions
FROM expeditions ex
JOIN entrepots e_source ON ex.id_entrepot_source = e_source.id
JOIN entrepots e_dest ON ex.id_entrepot_destination = e_dest.id
GROUP BY e_source.pays, e_dest.pays;


--Affichez les entrepôts qui ont envoyé des expéditions au cours des 30
--derniers jours et dont le poids total des expéditions est supérieur à 1000 kg.

SELECT e.id, e.nom_entrepot, e.adresse, e.ville, e.pays, SUM(ex.poids) AS poids_total_expeditions
FROM entrepots e
JOIN expeditions ex ON e.id = ex.id_entrepot_source
WHERE ex.date_expedition >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY)
GROUP BY e.id
HAVING poids_total_expeditions > 1000;


--Affichez les expéditions qui ont été livrées avec un retard de plus de 2 jours ouvrables.

SELECT *
FROM expeditions ex
WHERE statut = 'Livrée'
AND DATEDIFF(ex.date_livraison, ex.date_expedition) > 2;


--Affichez le nombre total d expéditions pour chaque jour du mois en cours, trié par ordre décroissant.

SELECT DAY(date_expedition) AS jour, COUNT(*) AS nombre_expeditions
FROM expeditions
WHERE MONTH(date_expedition) = MONTH(CURRENT_DATE) AND YEAR(date_expedition) = YEAR(CURRENT_DATE)
GROUP BY DAY(date_expedition)
ORDER BY jour DESC;