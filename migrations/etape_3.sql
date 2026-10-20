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

INSERT INTO commande(dates) VALUES('2026-10-15');
INSERT INTO commande(dates) VALUES('2026-02-25');


insert into commandePlat(idCommande,idPlatCarte,quantite) VALUES(1,1,2),(1,2,1),(2,3,1);
