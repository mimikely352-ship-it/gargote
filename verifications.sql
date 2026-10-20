Etape 1: Affichage les plats du plus cher au moins cher.
SELECT * FROM carte order by prix DESC;

Piege: 
- Pour le prix j'ai choisi le type NUMERIC(10,2)
- L'identifiant que j'ai choisi c'est "idCarte"

-----------------------------------------------------------------------------------

Etape 2: Nombre de plats par catégorie, y compris les catégories sans plat.
select categorie.categorie as Categories, count(*) as nombrePlat FROM carte join categorie on 
carte.idCategorie=categorie.idCategorie GROUP BY categorie.idCategorie;

Piege: 
Il est preferable de ne pas stocker directement le nom de la categorie sous forme de texte (VARCHAR) dans la table des plats car 
il entrainera un risque d'erreur de saisie (par exemple, ecrire par accident « Plat mgasy » au lieu de « Plat Malagasy ») 
provoquerait une incoherence des donnees, le systeme traitera alors ces variantes comme des categories distinctes.
L'utilisation d'une table dediee aux categories reliee par une cle etrangere permet de garantir l'unicite des donnees.

-----------------------------------------------------------------------------------

Etape 3: montant total de chaque commande

SELECT commande.dates as date,commande.idCommande as NumeroCommande,sum(carte.prix*commandePlat.quantite) as Montant FROM carte 
join commandePlat on carte.idCarte=commandePlat.idPlatCarte 
join commande on commande.idCommande=commandePlat.idCommande 
GROUP BY commande.dates, commande.idCommande
ORDER BY commande.idCommande;

Piege:
 j'ai place la quantite dans la table d'association "commandePlat".


-----------------------------------------------------------------------------------

Etape 4: Liste des commandes avec le nom du client, en affichant « client de passage » quand il n'y en a pas.

SELECT FROM commande JOIN commandeClient 
on commande.idCommande=commandeClient.idCommande 
JOIN client on commandeClient.idClient=client.idClient JOIN 


Piege: 


-----------------------------------------------------------------------------------

Etape 5: nombre de commandes et chiffre d'affaires par serveur.

SELECT count(cst.idCommandePlat) as nombreCommande,s.nomServeur as serveurNom, s.prenomServeur as serveurPrenom, sum(cp.quantite*ca.prix) as CA
FROM serveur as s JOIN commandeServeurTable as cst on s.idServeur=cst.idServeur 
join commandePlat as cp on cst.idCommandePlat=cp.idCommandePlat join tables as t on cst.idTable=t.idTable 
join carte as ca on cp.idPlatCarte=ca.idCarte group by s.idServeur;


Piege: Le mot "table" pose un probleme en sql car ca se confond avec 
le syntaxe table de la creation de table en sql "CREATE TABLE..."

-----------------------------------------------------------------------------------

Etape 6: liste des commandes non soldées avec le
montant dû, le montant payé et le reste à payer

SELECT 
    c.idCommande AS numeroCommande,
    (du.montantDu) AS montantDu,
    (paye.montantPaye) AS montantPaye,
    (du.montantDu) - COALESCE(paye.montantPaye) AS resteAPayer
FROM commande c
LEFT JOIN (
    SELECT cp.idCommande, SUM(ca.prix * cp.quantite) AS montantDu
    FROM commandePlat cp
    JOIN carte ca ON cp.idPlatCarte = ca.idCarte
    GROUP BY cp.idCommande
) du ON c.idCommande = du.idCommande
LEFT JOIN (
    SELECT idCommande, SUM(montant) AS montantPaye
    FROM payement
    GROUP BY idCommande
) paye ON c.idCommande = paye.idCommande
WHERE (du.montantDu) - (paye.montantPaye)> 0;

Piege:

-----------------------------------------------------------------------------------

Etape 7: relancement de letape 3: montant total de chaque commande

SELECT commande.dates as date,
commande.idCommande as NumeroCommande,
sum(
    COALESCE(
    (select au.nouveauPrix 
    from augmentation as au 
    where au.idCarte=carte.idCarte 
    AND au.dates<=commande.dates 
    order by au.dates LIMIT 1
    ),
    carte.prix
    )* commandePlat.quantite
    ) as Montant 
FROM carte 
join commandePlat on carte.idCarte=commandePlat.idPlatCarte 
join commande on commande.idCommande=commandePlat.idCommande
GROUP BY commande.dates, commande.idCommande
ORDER BY commande.idCommande;

Piege:


-----------------------------------------------------------------------------------

Etape 8: consommation théorique de chaque ingrédient pour la journée du 12 octobre

SELECT 
    i.nomIngredient,
    SUM(cp.quantite * cop.quantite) AS consommationTotale,
    i.unite
FROM commande c
JOIN commandePlat cp ON c.idCommande = cp.idCommande
JOIN compositionPlat cop ON cp.idPlatCarte = cop.idPlatCarte
JOIN ingredient i ON cop.idIngredient = i.idIngredient
WHERE c.dates = '2026-10-12'
GROUP BY i.idIngredient, i.nomIngredient, i.unite;

Piege: La colonne ingredients VARCHAR(500) contenant « riz, zébu, brèdes » n'est pas
conseillé', car c'est difficile de le manipuler et ca a l'air brouillant.


-----------------------------------------------------------------------------------

Etape 9: : pour chaque menu, son prix, la somme
des prix à la carte et l'économie réalisée par le client.'

SELECT m.idMenu,m.prix as menuPrix,sum(pm.quantite*c.prix) as sommePrixALaCarte,sum(pm.quantite*c.prix)-m.prix as economie 
from menu as m join PlatMenu as pm on m.idMenu=pm.idMenu 
join carte as c on pm.idCarte=c.idCarte group by m.idMenu;

Piege: