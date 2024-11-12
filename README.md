# Projet de Base de Données : Boutique de Chaussures

## Description
Ce projet consiste à créer une base de données pour une boutique de chaussures. Nous avons conçu et créé des tables, ajouté des données d'exemple, et écrit des requêtes SQL pour manipuler et interroger les données. Ce fichier **README** décrit chaque étape du projet et fournit des exemples de requêtes pour interagir avec la base de données.

## Structure du Projet

1. Conception de la Base de Données
2. Création des Tables et Script SQL
3. Insertion de Données
4. Requêtes de Manipulation et d'Interrogation des Données

---

## Conception de la Base de Données

La base de données de la boutique de chaussures comprend les tables principales suivantes :

- **Produits** : Informations sur les produits (chaussures).
- **Clients** : Informations personnelles des clients.
- **Commandes** : Enregistre les commandes passées par les clients.
- **Ligne_Commande** : Détaille les articles de chaque commande.
- **Paiements** : Enregistre les paiements pour chaque commande.

## Dictionnaire des Données

| Attribut           | Description                            | Type                       |
|--------------------|----------------------------------------|----------------------------|
| id_produit         | Identifiant unique du produit          | INT NOT NULL AUTO_INCREMENT|
| nom                | Nom du produit                         | VARCHAR(100) DEFAULT NULL  |
| marque             | Marque du produit                      | VARCHAR(50) DEFAULT NULL   |
| taille             | Taille du produit                      | INT DEFAULT NULL           |
| couleur            | Couleur du produit                     | VARCHAR(30) DEFAULT NULL   |
| prix               | Prix du produit                        | DECIMAL(10, 2) DEFAULT NULL|
| stock              | Stock disponible                       | INT DEFAULT NULL           |
| id_client          | Identifiant unique du client           | INT NOT NULL AUTO_INCREMENT|
| nom                | Nom du client                          | VARCHAR(100) DEFAULT NULL  |
| adresse            | Adresse du client                      | TEXT DEFAULT NULL          |
| email              | Email du client                        | VARCHAR(100) DEFAULT NULL  |
| telephone          | Téléphone du client                    | VARCHAR(15) DEFAULT NULL   |
| id_commande        | Identifiant unique de la commande      | INT NOT NULL AUTO_INCREMENT|
| date_commande      | Date de la commande                    | DATE DEFAULT NULL          |
| id_ligne           | Identifiant unique de la ligne commande| INT NOT NULL AUTO_INCREMENT|
| quantité           | Quantité du produit commandée          | INT DEFAULT NULL           |
| id_paiement        | Identifiant unique du paiement         | INT NOT NULL AUTO_INCREMENT|
| montant            | Montant du paiement                    | DECIMAL(10, 2) DEFAULT NULL|
| date_paiement      | Date du paiement                       | DATE DEFAULT NULL          |
| methode_paiement   | Méthode de paiement                    | VARCHAR(50) DEFAULT NULL   |


---


## Création des Tables et Script SQL

Nous avons utilisé MySQL Workbench pour exécuter les scripts SQL suivants afin de créer les tables de la base de données.

### Script SQL

```sql
CREATE TABLE Produits (
    id_produit INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100) DEFAULT NULL,
    marque VARCHAR(50) DEFAULT NULL,
    taille INT DEFAULT NULL,
    couleur VARCHAR(30) DEFAULT NULL,
    prix DECIMAL(10, 2) DEFAULT NULL,
    stock INT DEFAULT NULL,
    PRIMARY KEY (id_produit)
);

CREATE TABLE Clients (
    id_client INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(100) DEFAULT NULL,
    adresse TEXT DEFAULT NULL,
    email VARCHAR(100) DEFAULT NULL,
    telephone VARCHAR(15) DEFAULT NULL,
    PRIMARY KEY (id_client)
);

CREATE TABLE Commandes (
    id_commande INT NOT NULL AUTO_INCREMENT,
    date_commande DATE DEFAULT NULL,
    id_client INT,
    PRIMARY KEY (id_commande),
    FOREIGN KEY (id_client) REFERENCES Clients(id_client)
);

CREATE TABLE Ligne_Commande (
    id_ligne INT NOT NULL AUTO_INCREMENT,
    id_commande INT,
    id_produit INT,
    quantité INT DEFAULT NULL,
    PRIMARY KEY (id_ligne),
    FOREIGN KEY (id_commande) REFERENCES Commandes(id_commande),
    FOREIGN KEY (id_produit) REFERENCES Produits(id_produit)
);

CREATE TABLE Paiements (
    id_paiement INT NOT NULL AUTO_INCREMENT,
    id_commande INT,
    montant DECIMAL(10, 2) DEFAULT NULL,
    date_paiement DATE DEFAULT NULL,
    methode_paiement VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (id_paiement),
    FOREIGN KEY (id_commande) REFERENCES Commandes(id_commande)
);
```


--- 


## Insertion des données

Nous avons inséré des données d'exemple pour tester la base de données.


###Script SQL Produits
```sql
INSERT INTO Produits (nom, marque, taille, couleur, prix, stock) VALUES 
('Basket Classique', 'Nike', 42, 'Noir', 79.99, 20),
('Sneaker Sport', 'Adidas', 40, 'Blanc', 89.99, 15),
('Bottes Hiver', 'Timberland', 44, 'Marron', 129.99, 10),
('Chaussure de Course', 'Puma', 38, 'Rouge', 99.99, 30),
('Espadrilles d\'été', 'Toms', 39, 'Bleu', 49.99, 25),
('Mocassins Cuir', 'Geox', 43, 'Noir', 109.99, 12),
('Chaussures de Ville', 'Clarks', 42, 'Gris', 119.99, 8),
('Sandales Légeres', 'Birkenstock', 41, 'Beige', 59.99, 18),
('Chaussure de Randonnée', 'Salomon', 45, 'Vert', 139.99, 15),
('Chaussure de Sécurité', 'Caterpillar', 42, 'Noir', 89.99, 20);
```

###Script SQL CLIENTS

```sql
INSERT INTO Clients (nom, adresse, email, telephone) VALUES 
('Alice Dupont', '123 Rue de Paris', 'alice.dupont@example.com', '0123456789'),
('Bob Martin', '456 Avenue de Lyon', 'bob.martin@example.com', '0987654321'),
('Céline Petit', '789 Rue de Marseille', 'celine.petit@example.com', '0678912345'),
('David Moreau', '321 Boulevard de Nice', 'david.moreau@example.com', '0123498765'),
('Emma Lopez', '654 Rue de Bordeaux', 'emma.lopez@example.com', '0698765432'),
('François Dubois', '987 Rue de Nantes', 'francois.dubois@example.com', '0654321897'),
('Julie Lefevre', '159 Avenue de Lille', 'julie.lefevre@example.com', '0623456789'),
('Maxime Charpentier', '753 Rue de Dijon', 'maxime.charpentier@example.com', '0612345678'),
('Sophie Lambert', '852 Rue de Toulon', 'sophie.lambert@example.com', '0789012345'),
('Thomas Leroy', '951 Avenue de Montpellier', 'thomas.leroy@example.com', '0701234567');
```
...

---

## Requêtes de Manipulation et d'Interrogation des Données

Elles seront disponibles dans le fichier boulbayem_shoprequetes.sql
