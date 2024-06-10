-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 03 juin 2024 à 20:20
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `iage_3a`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `Id_classe` int(11) NOT NULL,
  `Libelle_classe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`Id_classe`, `Libelle_classe`) VALUES
(1, 'IAGE'),
(2, 'MOSIEF');

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE `classes` (
  `Id_classe` int(11) NOT NULL,
  `Libelle_classe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `classes`
--

INSERT INTO `classes` (`Id_classe`, `Libelle_classe`) VALUES
(1, 'IAGE'),
(2, 'MOSIEF'),
(3, 'GLRS'),
(4, 'MAIE');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id_etudiant` int(11) NOT NULL,
  `mat_etudiant` varchar(25) NOT NULL,
  `nom_complet` varchar(25) NOT NULL,
  `tutor_etudiant` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_etudiant`, `mat_etudiant`, `nom_complet`, `tutor_etudiant`) VALUES
(17, 'MAT-001', 'Abdou', 'Mateo'),
(18, 'matri85', 'Carlos', 'Nanou'),
(19, '845', 'SOcio', 'GHOST');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_classe`
--

CREATE TABLE `etudiant_classe` (
  `idEC` int(11) NOT NULL,
  `nom_classe` varchar(255) NOT NULL,
  `etd_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `etudiant_classe`
--

INSERT INTO `etudiant_classe` (`idEC`, `nom_classe`, `etd_id`) VALUES
(2, 'GLRS', 18),
(3, 'GLRS', 17),
(4, 'IAGE', 19);

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

CREATE TABLE `inscription` (
  `Id_inscription` int(11) NOT NULL,
  `date_inscription` varchar(255) NOT NULL,
  `nom_classe` varchar(255) NOT NULL,
  `etudiant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscription`
--

INSERT INTO `inscription` (`Id_inscription`, `date_inscription`, `nom_classe`, `etudiant_id`) VALUES
(1, '25-04-2025', '0', 18),
(2, '21-05-99', 'MOSIEF', 17),
(3, '', 'IAGE', 18),
(4, '25-04-2025', 'IAGE', 18);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `id_prof` int(11) NOT NULL,
  `nci_prof` varchar(25) NOT NULL,
  `nom_completprof` varchar(25) NOT NULL,
  `Grade` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id_prof`, `nci_prof`, `nom_completprof`, `Grade`) VALUES
(1, '25', '', 'k'),
(2, '52', 'Birane', 'Dev'),
(3, '12', 'Birane', 'Dev'),
(4, 'Des-65', 'Olivier', 'Desineur'),
(5, 'Prof-652', 'PAscal', 'Marketting'),
(6, 'music-1', 'musical', 'Music'),
(7, 'art5', 'artiste', 'art'),
(8, '02', 'fgh', 'ghj'),
(9, 'diop1', 'diop', 'droit'),
(10, 'fall1', 'fall', 'management'),
(11, 'Prof-144', 'Samsom', 'Finances');

-- --------------------------------------------------------

--
-- Structure de la table `professeur_classe`
--

CREATE TABLE `professeur_classe` (
  `idPC` int(11) NOT NULL,
  `nom_classe` varchar(255) NOT NULL,
  `id_prof` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `professeur_classe`
--

INSERT INTO `professeur_classe` (`idPC`, `nom_classe`, `id_prof`) VALUES
(1, 'IAGE', 11);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`Id_classe`);

--
-- Index pour la table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`Id_classe`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_etudiant`),
  ADD UNIQUE KEY `mat_etudiant` (`mat_etudiant`);

--
-- Index pour la table `etudiant_classe`
--
ALTER TABLE `etudiant_classe`
  ADD PRIMARY KEY (`idEC`),
  ADD KEY `etd_id` (`etd_id`);

--
-- Index pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`Id_inscription`),
  ADD KEY `etudiant_id` (`etudiant_id`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`id_prof`),
  ADD UNIQUE KEY `nci_prof` (`nci_prof`);

--
-- Index pour la table `professeur_classe`
--
ALTER TABLE `professeur_classe`
  ADD PRIMARY KEY (`idPC`),
  ADD KEY `professeur_id` (`id_prof`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `Id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `classes`
--
ALTER TABLE `classes`
  MODIFY `Id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `etudiant_classe`
--
ALTER TABLE `etudiant_classe`
  MODIFY `idEC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `inscription`
--
ALTER TABLE `inscription`
  MODIFY `Id_inscription` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `id_prof` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `professeur_classe`
--
ALTER TABLE `professeur_classe`
  MODIFY `idPC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiant_classe`
--
ALTER TABLE `etudiant_classe`
  ADD CONSTRAINT `etudiant_classe_ibfk_1` FOREIGN KEY (`etd_id`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`etudiant_id`) REFERENCES `etudiant` (`id_etudiant`);

--
-- Contraintes pour la table `professeur_classe`
--
ALTER TABLE `professeur_classe`
  ADD CONSTRAINT `professeur_classe_ibfk_1` FOREIGN KEY (`id_prof`) REFERENCES `professeur` (`id_prof`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
