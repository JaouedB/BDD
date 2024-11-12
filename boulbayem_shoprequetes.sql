UPDATE Produits
SET stock = stock - 1
WHERE id_produit = 1; /*Pour mettre a jour le stock*/

UPDATE Clients
SET adresse = 'Nouvelle adresse'
WHERE id_client = 2;/*Pour changer l'adresse d'un nouveau client*/

UPDATE Paiements
SET montant = 50.00
WHERE id_paiement = 3;/*Modifier le montant d'un Paiement*/

SELECT nom, adresse, email FROM Clients;/*Afficher les informations de clients*/

SELECT * FROM Produits WHERE stock > 0; /*Quels sont les produits disponibles en stock*/

SELECT * FROM Produits WHERE marque = 'Nike';/*Quels sont les produits de la marque "Nike" */

SELECT * FROM Produits ORDER BY prix ASC;/*Affichez les produits en les triant par prix croissant*/

SELECT nom, email 
FROM Clients 
WHERE id_client NOT IN (SELECT id_client FROM Commandes);/*client qui n'ont jamais passé de commande*/

SELECT nom, marque, stock 
FROM Produits 
WHERE stock < 10;/*Les produits ou le stock est inférieur à 10*/

SELECT AVG(prix) AS prix_moyen 
FROM Produits;/*Pour trouver le prix moyen de la boutique*/



