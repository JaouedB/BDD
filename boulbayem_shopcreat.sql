CREATE TABLE Produits (
    id_produit INT PRIMARY KEY,
    nom VARCHAR(100),
    marque VARCHAR(50),
    taille INT,
    couleur VARCHAR(30),
    prix DECIMAL(10, 2),
    stock INT
);

CREATE TABLE Clients (
    id_client INT PRIMARY KEY,
    nom VARCHAR(100),
    adresse TEXT,
    email VARCHAR(100),
    telephone VARCHAR(15)
);

CREATE TABLE Commandes (
    id_commande INT PRIMARY KEY,
    date_commande DATE,
    id_client INT,
    FOREIGN KEY (id_client) REFERENCES Clients(id_client)
);

CREATE TABLE Ligne_Commande (
    id_ligne INT PRIMARY KEY,
    id_commande INT,
    id_produit INT,
    quantité INT,
    FOREIGN KEY (id_commande) REFERENCES Commandes(id_commande),
    FOREIGN KEY (id_produit) REFERENCES Produits(id_produit)
);

CREATE TABLE Paiements (
    id_paiement INT PRIMARY KEY,
    id_commande INT,
    montant DECIMAL(10, 2),
    date_paiement DATE,
    méthode_paiement VARCHAR(50),
    FOREIGN KEY (id_commande) REFERENCES Commandes(id_commande)
);
