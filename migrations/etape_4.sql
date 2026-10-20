CREATE TABLE client(
    idClient SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);

CREATE TABLE commandeClient(
    idcommandeClient SERIAL PRIMARY KEY,
    idCommande INT,
    idClient INT
);


INSERT INTO commandeClient (idCommande, idClient) VALUES
(1, 1), -- La commande 1 est passée par Rabe
(3, 2); -- La commande 3 est passée par Rakoto