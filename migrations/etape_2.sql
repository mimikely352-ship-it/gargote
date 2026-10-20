CREATE TABLE categorie(
    idCategorie SERIAL PRIMARY KEY,
    categorie VARCHAR(100)
);

INSERT INTO categorie (categorie) VALUES
('plat malagasy'),
('plat chinois'),
('soupe'),
('dessert et goûter'),
('boisson');

ALTER TABLE carte ADD COLUMN idCategorie INT;

UPDATE carte SET idCategorie = 1 WHERE nomPlat IN ('Romazava', 'Ravitoto sy henakisoa', 'Akoho sy voanio');
UPDATE carte SET idCategorie = 2 WHERE nomPlat = 'Mi sao';
UPDATE carte SET idCategorie = 3 WHERE nomPlat = 'Soupe chinoise';
UPDATE carte SET idCategorie = 4 WHERE nomPlat = 'Mofo gasy (les 4)';
UPDATE carte SET idCategorie = 5 WHERE nomPlat = 'Ranon''ampango';

ALTER TABLE carte ALTER COLUMN idCategorie SET NOT NULL;

ALTER TABLE carte DROP COLUMN categorie;