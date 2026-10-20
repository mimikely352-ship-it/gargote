CREATE DATABASE gargote;

\c gargote;


CREATE TABLE carte(
    idCarte SERIAL PRIMARY KEY,
    nomPlat VARCHAR(100),
    categorie VARCHAR(100),
    prix NUMERIC(10,2)
);

Insert into carte(nomPlat,categorie,prix) values('Romazava','Plat Malagasy',7000);
Insert into carte(nomPlat,categorie,prix) values('Ravitoto sy henakisoa','Plat Malagasy',8000);
Insert into carte(nomPlat,categorie,prix) values('Akoho sy voanio','Plat Malagasy',8500);
Insert into carte(nomPlat,categorie,prix) values('Mi sao','Plat chinois',6000);
Insert into carte(nomPlat,categorie,prix) values('Soupe chinoise','Soupe',5000);
Insert into carte(nomPlat,categorie,prix) values('Mofo gasy (les 4)','Dessert et gouter',1000);
Insert into carte(nomPlat,categorie,prix) values('Ranon''ampango','Boisson',500);


