table carte  |                      
-------------|
- idCarte    |   
- nomPlat    |                        
- idCategorie|
- prix       |
-------------|


----------------|
table categorie |
----------------|
- idCategorie   |   
- categorie     |                        
----------------|


----------------|
table commande  |
----------------|
- idCommande    |   
- dates         |                        
----------------|


-------------------|
table commandePlat |
-------------------|
- idCommandePlat   |   
- idCommande       |
- idPlatCarte      |
- quantite         |                        
-------------------|

-------------|
table client |
-------------|
- idClient   |   
- nom        |                         
-------------|

---------------------|
table commandeClient |
---------------------|
- idcommandeClient   |
- idCommande         |
- idClient           |                              
---------------------|

