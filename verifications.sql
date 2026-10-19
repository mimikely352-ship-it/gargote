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
