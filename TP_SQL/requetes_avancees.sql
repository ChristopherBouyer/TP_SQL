--Affichez les entrepôts qui ont envoyé au moins une expédition en transit.

SELECT DISTINCT e.id, e.nom_entrepot, e.adresse, e.ville, e.pays
FROM entrepots e
JOIN expeditions ex ON e.id = ex.id_entrepot_source
WHERE ex.statut = 'En transit';


--Affichez les entrepôts qui ont reçu au moins une expédition en transit.

SELECT DISTINCT e.id, e.nom_entrepot, e.adresse, e.ville, e.pays
FROM entrepots e
JOIN expeditions ex ON e.id = ex.id_entrepot_destination
WHERE ex.statut = 'En transit';


--Affichez les expéditions qui ont un poids supérieur à 100 kg et qui sont en
transit.

SELECT * 
FROM expeditions
WHERE poids > 100 AND statut = 'En transit';


--Affichez le nombre d expéditions envoyées par chaque entrepôt.

SELECT e.id, e.nom_entrepot, COUNT(ex.id) AS nombre_expeditions_envoyees
FROM entrepots e
LEFT JOIN expeditions ex ON e.id = ex.id_entrepot_source
GROUP BY e.id, e.nom_entrepot;


--Affichez le nombre total d expéditions en transit.

SELECT COUNT(*)
FROM expeditions
WHERE statut = 'En transit';


--Affichez le nombre total d expéditions livrées.

SELECT COUNT(*)
FROM expeditions
WHERE statut = 'Livrée';


--Affichez le nombre total d expéditions pour chaque mois de l année en cours.

SELECT YEAR(date_expedition) AS annee, MONTH(date_expedition) AS mois, COUNT(*) AS nombre_expeditions
FROM expeditions
WHERE YEAR(date_expedition) = YEAR(CURRENT_DATE)
GROUP BY YEAR(date_expedition), MONTH(date_expedition)
ORDER BY annee, mois;


--Affichez les entrepôts qui ont envoyé des expéditions au cours des 30
derniers jours.

SELECT DISTINCT e.id, e.nom_entrepot, e.adresse, e.ville, e.pays
FROM entrepots e
JOIN expeditions ex ON e.id = ex.id_entrepot_source
WHERE ex.date_expedition >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY);


--Affichez les entrepôts qui ont reçu des expéditions au cours des 30 derniers
jours.

SELECT DISTINCT e.id, e.nom_entrepot, e.adresse, e.ville, e.pays
FROM entrepots e
JOIN expeditions ex ON e.id = ex.id_entrepot_destination
WHERE ex.date_expedition >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY);


--Affichez les expéditions qui ont été livrées dans un délai de moins de 5 jours
ouvrables.

SELECT *
FROM expeditions ex
WHERE statut = 'Livrée'
AND DATEDIFF(ex.date_expedition, ex.date_livraison) < 5;