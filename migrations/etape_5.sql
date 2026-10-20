CREATE TABLE serveur(
    idServeur serial primary key,
    nomServeur VARCHAR(50),
    prenomServeur VARCHAR(50)
);

CREATE TABLE tables(
    idTable serial primary key,
    tables VARCHAR(50)
);

CREATE TABLE commandeServeurTable(
    idCommandeServeurTable serial primary key,
    idServeur int,
    idTable int,
    idCommandePlat int
);

INSERT INTO serveur(nomServeur,prenomServeur) VALUES ('Njaka','Rakoto');
INSERT INTO serveur(nomServeur,prenomServeur) VALUES ('Lalao','Rasoa');

INSERT INTO tables(tables) VALUES('Table 1'),('Table 2'),('Table 3'),('table 4'),('Table 5'),('Table 6'),('Table 7'),('Table 8');

INSERT INTO commandeServeurTable(idServeur,idCommandePlat,idTable) VALUES (1,1,1),(1,2,2),(2,3,3);