CREATE TABLE menu(
    idMenu SERIAL PRIMARY KEY,
    libelle VARCHAR(100),
    prix int
);

CREATE TABLE platMenu(
    idPlatMenu SERIAL PRIMARY KEY,
    idmenu int,
    idCarte int,
    quantite int
);

INSERT INTO menu(libelle,prix) values('Menu Romazava',8000);

insert into platMenu(idMenu,idCarte,quantite) values(1,1,1),
(1,7,1),(1,6,4);