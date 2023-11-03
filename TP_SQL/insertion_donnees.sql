--Ajoutez 5 entrepôts dans différentes villes et pays.

INSERT INTO entrepots (nom_entrepot, adresse, ville, pays) VALUES
    ('Entrepôt Lyon', '2 Avenue Berthelot', 'Lyon', 'France'),
    ('Entrepôt Paris', '4 Rue Depardieu', 'Paris', 'France'),
    ('Entrepôt Lille', '16 Avenue de la Colombe', 'Lille', 'France'),
    ('Entrepôt Bordeaux', '23 Rue de la Marche', 'Bordeaux', 'France'),
    ('Entrepôt Limoges', '6 Rue Montauciel', 'Limoges', 'France');



--Ajoutez 10 expéditions de différents poids, en provenance de différents
--entrepôts et à destination de différents entrepôts. Assurez-vous que certaines
--expéditions ont été livrées et d autres sont en transit.
--NB : Insérer autant de données que nécessaire pour créer des scénarios permettant
--l application des requêtes ci-dessous.

INSERT INTO expeditions (date_expedition, id_entrepot_source, id_entrepot_destination, poids, statut) 
VALUES ('2023-10-28', 1, 2, 150, 'Livrée'),
    ('2023-09-25', 2, 3, 200, 'Livrée'),
    ('2023-09-02', 3, 4, 100, 'En transit'),
    ('2023-08-31', 4, 5, 250, 'En transit'),
    ('2023-08-12', 5, 1, 180, 'Livrée'),
    ('2023-07-21', 1, 3, 120, 'Livrée'),
    ('2023-06-29', 2, 4, 300, 'En transit'),
    ('2023-06-17', 3, 5, 220, 'Livrée'),
    ('2023-06-09', 4, 1, 170, 'En transit'),
    ('2023-05-21', 5, 2, 130, 'Livrée');
