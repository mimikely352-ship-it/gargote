CREATE TABLE ingredient (
    idIngredient SERIAL PRIMARY KEY,
    nomIngredient VARCHAR(50) NOT NULL,
    stock INT NOT NULL, 
    unite VARCHAR(20) NOT NULL 
);

CREATE TABLE compositionPlat (
    idCompositionPlat SERIAL PRIMARY KEY,
    idPlatCarte INT ,
    idIngredient INT,
    quantite INT NOT NULL
);

INSERT INTO ingredient (nomIngredient, stock, unite) VALUES
('riz', 5000, 'g'),
('viande de zebu', 3000, 'g'),
('bredes mafana', 2000, 'g'),
('ravitoto', 4000, 'g'),
('viande de porc', 3500, 'g');

-- Composition des plats (ex: le plat 1 utilise du riz, de la viande de zébu, etc.)
INSERT INTO compositionPlat (idPlatCarte, idIngredient, quantite) VALUES
(1, 1, 250), -- Plat 1 : 250g de riz
(1, 2, 150), -- Plat 1 : 150g de viande de zébu
(1, 3, 100), -- Plat 1 : 100g de brèdes mafana
(2, 4, 250), -- Plat 2 : 250g de ravitoto
(2, 5, 200); -- Plat 2 : 200g de viande de porc