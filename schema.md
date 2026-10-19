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


----------------|
table serveur   |
----------------|
- idServeur     |
- nomServeur    |
- prenomServeur |                              
----------------|

-------------|
table tables |
-------------|
- idTable    |
- tables     |                              
-------------|


---------------------------|
table commandeServeurTable |
---------------------------|
- idCommandeServeurTable   |
- idServeur                |
- idCommandePlat           |            
- idTable                  |                  
---------------------------|


---------------------|
table modeDePayement |
---------------------|
- idModeDePayement   |
- modeDePayement     |                              
---------------------|

---------------------|
table payement       |
---------------------|
- idPayement         |
- idCommande         |      
- idModeDePayement   |
- montant            |
- reference          |                       
---------------------|
