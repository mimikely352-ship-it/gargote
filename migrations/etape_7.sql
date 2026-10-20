CREATE TABLE augmentation(
    idAugmentation SERIAL primary key,
    idCarte int,
    dates DATE,
    nouveauPrix int
);

INSERT INTO augmentation(idCarte,dates,nouveauPrix) values(1,'2026-10-15',7500);