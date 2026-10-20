CREATE TABLE modeDePayement(
    idModeDePayement serial primary key,
    modeDePayement VARCHAR(50)
);

CREATE TABLE payement(
    idPayement SERIAL primary key,
    idCommande int,
    idModeDePayement int,
    montant int,
    reference VARCHAR(100)
);

INSERT INTO modeDePayement (modeDePayement) VALUES
('Espèces'),
('MVola'),
('Orange Money'),
('Airtel Money');

insert into payement(idCommande,idPayement,montant,reference) VALUES(1, 1, 10000, NULL),
(1, 2, 5000, 'MVOLA123456'),(2, 3, 6000, 'OM987654');