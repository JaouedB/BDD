-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-boulbayem.alwaysdata.net
-- Generation Time: Nov 12, 2024 at 08:27 AM
-- Server version: 10.11.8-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boulbayem_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `Clients`
--

CREATE TABLE `Clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `adresse` text DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Clients`
--

INSERT INTO `Clients` (`id_client`, `nom`, `adresse`, `email`, `telephone`) VALUES
(1, 'Alice Dupont', '123 Rue de Paris', 'alice.dupont@example.com', '0123456789'),
(2, 'Bob Martin', 'Aix en provence Avenue ste eloi', 'bob.martin@example.com', '0987654321'),
(3, 'Céline Petit', '789 Rue de Marseille', 'celine.petit@example.com', '0678912345'),
(4, 'David Moreau', '321 Boulevard de Nice', 'david.moreau@example.com', '0123498765'),
(5, 'Emma Lopez', '654 Rue de Bordeaux', 'emma.lopez@example.com', '0698765432'),
(6, 'François Dubois', '987 Rue de Nantes', 'francois.dubois@example.com', '0654321897'),
(7, 'Julie Lefevre', '159 Avenue de Lille', 'julie.lefevre@example.com', '0623456789'),
(8, 'Maxime Charpentier', '753 Rue de Dijon', 'maxime.charpentier@example.com', '0612345678'),
(9, 'Sophie Lambert', '852 Rue de Toulon', 'sophie.lambert@example.com', '0789012345'),
(10, 'Thomas Leroy', '951 Avenue de Montpellier', 'thomas.leroy@example.com', '0701234567');

-- --------------------------------------------------------

--
-- Table structure for table `Commandes`
--

CREATE TABLE `Commandes` (
  `id_commande` int(11) NOT NULL,
  `date_commande` date DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Commandes`
--

INSERT INTO `Commandes` (`id_commande`, `date_commande`, `id_client`) VALUES
(1, '2023-11-01', 1),
(2, '2023-11-05', 2),
(3, '2023-11-07', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Ligne_Commande`
--

CREATE TABLE `Ligne_Commande` (
  `id_ligne` int(11) NOT NULL,
  `id_commande` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `quantité` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Ligne_Commande`
--

INSERT INTO `Ligne_Commande` (`id_ligne`, `id_commande`, `id_produit`, `quantité`) VALUES
(1, 1, 1, 2),
(2, 2, 3, 1),
(3, 3, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Paiements`
--

CREATE TABLE `Paiements` (
  `id_paiement` int(11) NOT NULL,
  `id_commande` int(11) DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `date_paiement` date DEFAULT NULL,
  `methode_paiement` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Paiements`
--

INSERT INTO `Paiements` (`id_paiement`, `id_commande`, `montant`, `date_paiement`, `methode_paiement`) VALUES
(1, 1, 159.98, '2023-11-01', 'Carte de Crédit'),
(2, 2, 129.99, '2023-11-05', 'PayPal'),
(3, 3, 50.00, '2023-11-07', 'Carte de Crédit');

-- --------------------------------------------------------

--
-- Table structure for table `Produits`
--

CREATE TABLE `Produits` (
  `id_produit` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `marque` varchar(50) DEFAULT NULL,
  `taille` int(11) DEFAULT NULL,
  `couleur` varchar(30) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Produits`
--

INSERT INTO `Produits` (`id_produit`, `nom`, `marque`, `taille`, `couleur`, `prix`, `stock`) VALUES
(1, 'Basket Classique', 'Nike', 42, 'Noir', 79.99, 17),
(2, 'Sneaker Sport', 'Adidas', 40, 'Blanc', 89.99, 15),
(3, 'Bottes Hiver', 'Timberland', 44, 'Marron', 129.99, 10),
(4, 'Chaussure de Course', 'Puma', 38, 'Rouge', 99.99, 30),
(5, 'Espadrilles d\'été', 'Toms', 39, 'Bleu', 49.99, 25),
(6, 'Mocassins Cuir', 'Geox', 43, 'Noir', 109.99, 12),
(7, 'Chaussures de Ville', 'Clarks', 42, 'Gris', 119.99, 8),
(8, 'Sandales Légeres', 'Birkenstock', 41, 'Beige', 59.99, 18),
(9, 'Chaussure de Randonnée', 'Salomon', 45, 'Vert', 139.99, 15),
(10, 'Chaussure de Sécurité', 'Caterpillar', 42, 'Noir', 89.99, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `Commandes`
--
ALTER TABLE `Commandes`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_client` (`id_client`);

--
-- Indexes for table `Ligne_Commande`
--
ALTER TABLE `Ligne_Commande`
  ADD PRIMARY KEY (`id_ligne`),
  ADD KEY `id_commande` (`id_commande`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Indexes for table `Paiements`
--
ALTER TABLE `Paiements`
  ADD PRIMARY KEY (`id_paiement`),
  ADD KEY `id_commande` (`id_commande`);

--
-- Indexes for table `Produits`
--
ALTER TABLE `Produits`
  ADD PRIMARY KEY (`id_produit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Clients`
--
ALTER TABLE `Clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Commandes`
--
ALTER TABLE `Commandes`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Ligne_Commande`
--
ALTER TABLE `Ligne_Commande`
  MODIFY `id_ligne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Paiements`
--
ALTER TABLE `Paiements`
  MODIFY `id_paiement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Produits`
--
ALTER TABLE `Produits`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Commandes`
--
ALTER TABLE `Commandes`
  ADD CONSTRAINT `Commandes_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `Clients` (`id_client`);

--
-- Constraints for table `Ligne_Commande`
--
ALTER TABLE `Ligne_Commande`
  ADD CONSTRAINT `Ligne_Commande_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `Commandes` (`id_commande`),
  ADD CONSTRAINT `Ligne_Commande_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `Produits` (`id_produit`);

--
-- Constraints for table `Paiements`
--
ALTER TABLE `Paiements`
  ADD CONSTRAINT `Paiements_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `Commandes` (`id_commande`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
