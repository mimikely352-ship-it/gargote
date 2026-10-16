Etape 1: affichage les plats du plus cher au moins cher.
SELECT * FROM carte order by prix DESC;

Piege: 
- Pour le prix j'ai choisi le type NUMERIC(10,2)
- L'identifiant que j'ai choisi c'est "idCarte"