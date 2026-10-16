CREATE TABLE commande(
    idCommande SERIAL PRIMARY KEY,
    dates DATE
);

CREATE TABLE commandePlat(
    idCommandePlat SERIAL PRIMARY KEY,
    idCommande INT,
    idPlatCarte INT,
    quantite INT
);