-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 10 juin 2023 à 16:02
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_tutore1`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `id_utilisateur` int(11) NOT NULL,
  `role_administrateur` varchar(50) NOT NULL,
  `nom_utilisateur` varchar(50) NOT NULL,
  `password` char(10) NOT NULL,
  `Id_services` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `assigner`
--

CREATE TABLE `assigner` (
  `Id_taches` decimal(10,0) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `Id_departement` int(11) NOT NULL,
  `nom_departement` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `gerer`
--

CREATE TABLE `gerer` (
  `id_utilisateur` int(11) NOT NULL,
  `Id_taches` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `id_utilisateur` int(11) NOT NULL,
  `role_membre` varchar(50) DEFAULT NULL,
  `nom_utilisateur` varchar(50) NOT NULL,
  `password` char(10) NOT NULL,
  `Id_services` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `Id_projet` int(11) NOT NULL,
  `nom_projet` varchar(200) NOT NULL,
  `chef_projet` varchar(250) NOT NULL,
  `description_projet` varchar(250) NOT NULL,
  `date_debut_projet` date NOT NULL,
  `date_fin_projet` date NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `Id_services` int(11) NOT NULL,
  `nom_services` varchar(50) NOT NULL,
  `Id_departement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `taches`
--

CREATE TABLE `taches` (
  `Id_taches` decimal(10,0) NOT NULL,
  `nom_taches` varchar(250) NOT NULL,
  `description_taches` varchar(250) NOT NULL,
  `date_debut_taches` date NOT NULL,
  `date_fin_taches` date NOT NULL,
  `affecter_a` char(100) NOT NULL,
  `Id_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom_utilisateur` varchar(50) NOT NULL,
  `password` char(10) NOT NULL,
  `Id_services` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `administrateur_service0_FK` (`Id_services`);

--
-- Index pour la table `assigner`
--
ALTER TABLE `assigner`
  ADD PRIMARY KEY (`Id_taches`,`id_utilisateur`),
  ADD KEY `assigner_administrateur0_FK` (`id_utilisateur`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`Id_departement`);

--
-- Index pour la table `gerer`
--
ALTER TABLE `gerer`
  ADD PRIMARY KEY (`id_utilisateur`,`Id_taches`),
  ADD KEY `gerer_taches0_FK` (`Id_taches`);

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `membre_service0_FK` (`Id_services`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`Id_projet`),
  ADD KEY `projet_administrateur_FK` (`id_utilisateur`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`Id_services`),
  ADD KEY `service_departement_FK` (`Id_departement`);

--
-- Index pour la table `taches`
--
ALTER TABLE `taches`
  ADD PRIMARY KEY (`Id_taches`),
  ADD KEY `taches_projet_FK` (`Id_projet`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `utilisateur_service_FK` (`Id_services`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `administrateur_service0_FK` FOREIGN KEY (`Id_services`) REFERENCES `service` (`Id_services`),
  ADD CONSTRAINT `administrateur_utilisateur_FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `assigner`
--
ALTER TABLE `assigner`
  ADD CONSTRAINT `assigner_administrateur0_FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `administrateur` (`id_utilisateur`),
  ADD CONSTRAINT `assigner_taches_FK` FOREIGN KEY (`Id_taches`) REFERENCES `taches` (`Id_taches`);

--
-- Contraintes pour la table `gerer`
--
ALTER TABLE `gerer`
  ADD CONSTRAINT `gerer_membre_FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `membre` (`id_utilisateur`),
  ADD CONSTRAINT `gerer_taches0_FK` FOREIGN KEY (`Id_taches`) REFERENCES `taches` (`Id_taches`);

--
-- Contraintes pour la table `membre`
--
ALTER TABLE `membre`
  ADD CONSTRAINT `membre_service0_FK` FOREIGN KEY (`Id_services`) REFERENCES `service` (`Id_services`),
  ADD CONSTRAINT `membre_utilisateur_FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_administrateur_FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `administrateur` (`id_utilisateur`);

--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_departement_FK` FOREIGN KEY (`Id_departement`) REFERENCES `departement` (`Id_departement`);

--
-- Contraintes pour la table `taches`
--
ALTER TABLE `taches`
  ADD CONSTRAINT `taches_projet_FK` FOREIGN KEY (`Id_projet`) REFERENCES `projet` (`Id_projet`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_service_FK` FOREIGN KEY (`Id_services`) REFERENCES `service` (`Id_services`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
