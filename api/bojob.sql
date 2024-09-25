-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 05 avr. 2024 à 15:47
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
-- Base de données : `bojob`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidature`
--

CREATE TABLE `candidature` (
  `ID_candidature` int(11) NOT NULL,
  `CV` text DEFAULT NULL,
  `lettre_motivation` text DEFAULT NULL,
  `date_candidature` date DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `ID_stage` int(11) NOT NULL,
  `ID_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `candidature`
--

INSERT INTO `candidature` (`ID_candidature`, `CV`, `lettre_motivation`, `date_candidature`, `etat`, `ID_stage`, `ID_utilisateur`) VALUES
(1, 'CV_JohnDoe.pdf', 'Lettre_Motivation_JohnDoe.pdf', '2022-05-15', 0, 1, 1),
(2, 'CV_JaneSmith.pdf', 'Lettre_Motivation_JaneSmith.pdf', '2022-06-01', 1, 2, 2),
(3, 'CV_TechGuru.pdf', 'Lettre_Motivation_TechGuru.pdf', '2022-07-01', 3, 2, 3),
(5, 'CV_OliviaWhite.pdf', 'Lettre_Motivation_OliviaWhite.pdf', '2022-09-01', 1, 5, 5),
(6, 'CV_SamJohnson.pdf', 'Lettre_Motivation_SamJohnson.pdf', '2022-10-01', 2, 6, 6),
(7, 'CV_EmmaGreenwood.pdf', 'Lettre_Motivation_EmmaGreenwood.pdf', '2022-11-15', 0, 7, 7),
(8, 'CV_RobertHarrison.pdf', 'Lettre_Motivation_RobertHarrison.pdf', '2023-01-01', 1, 8, 8),
(9, 'CV_AliceJohnson.pdf', 'Lettre_Motivation_AliceJohnson.pdf', '2023-02-01', 2, 9, 9),
(10, 'CV_CharlieBaker.pdf', 'Lettre_Motivation_CharlieBaker.pdf', '2023-03-15', 0, 10, 10),
(11, 'CV_LauraBrown.pdf', 'Lettre_Motivation_LauraBrown.pdf', '2023-04-15', 1, 11, 11),
(12, 'CV_AlexClark.pdf', 'Lettre_Motivation_AlexClark.pdf', '2023-05-01', 2, 12, 12),
(13, 'CV_MiaRobinson.pdf', 'Lettre_Motivation_MiaRobinson.pdf', '2023-06-01', 3, 13, 13),
(14, 'CV_NathanMartinez.pdf', 'Lettre_Motivation_NathanMartinez.pdf', '2023-07-15', 0, 14, 14),
(15, 'CV_SophieYoung.pdf', 'Lettre_Motivation_SophieYoung.pdf', '2023-08-01', 1, 15, 15),
(16, 'CV_LucasTaylor.pdf', 'Lettre_Motivation_LucasTaylor.pdf', '2023-09-01', 2, 16, 16),
(17, 'CV_EllaScott.pdf', 'Lettre_Motivation_EllaScott.pdf', '2023-10-15', 0, 17, 17),
(18, 'CV_JacobEvans.pdf', 'Lettre_Motivation_JacobEvans.pdf', '2023-11-01', 1, 18, 18),
(19, 'CV_ChloeKing.pdf', 'Lettre_Motivation_ChloeKing.pdf', '2023-12-01', 3, 19, 19),
(20, 'CV_LiamWright.pdf', 'Lettre_Motivation_LiamWright.pdf', '2024-01-15', 0, 20, 20),
(21, 'CV_EmilyParker.pdf', 'Lettre_Motivation_EmilyParker.pdf', '2024-02-01', 2, 21, 21),
(22, 'CV_LoganAdams.pdf', 'Lettre_Motivation_LoganAdams.pdf', '2024-03-01', 1, 22, 22),
(23, 'CV_LilyHall.pdf', 'Lettre_Motivation_LilyHall.pdf', '2024-04-15', 3, 23, 23),
(24, 'CV_OscarAllen.pdf', 'Lettre_Motivation_OscarAllen.pdf', '2024-05-01', 0, 24, 24),
(25, 'CV_HannahMorris.pdf', 'Lettre_Motivation_HannahMorris.pdf', '2024-06-01', 1, 25, 25),
(26, 'CV_MasonBaker.pdf', 'Lettre_Motivation_MasonBaker.pdf', '2024-07-15', 0, 26, 26),
(27, 'CV_AvaCarter.pdf', 'Lettre_Motivation_AvaCarter.pdf', '2024-08-01', 2, 27, 27),
(28, 'CV_EthanRivera.pdf', 'Lettre_Motivation_EthanRivera.pdf', '2024-09-01', 1, 28, 28),
(29, 'CV_ScarlettGarcia.pdf', 'Lettre_Motivation_ScarlettGarcia.pdf', '2024-10-15', 3, 29, 29),
(30, 'CV_AidenLong.pdf', 'Lettre_Motivation_AidenLong.pdf', '2024-11-01', 0, 30, 30),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', '', NULL, 0, 8, 1),
(0, 'CV_test.pdf', 'AAA', NULL, 0, 8, 1),
(0, 'CV_test.pdf', 'AAA', NULL, 0, 8, 1),
(0, 'CV_test.pdf', 'AAA', NULL, 0, 8, 1);

-- --------------------------------------------------------

--
-- Structure de la table `competence`
--

CREATE TABLE `competence` (
  `ID_competence` int(11) NOT NULL,
  `competence` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `competence`
--

INSERT INTO `competence` (`ID_competence`, `competence`) VALUES
(1, 'Développement Web'),
(2, 'Analyse Financière'),
(3, 'Gestion de Projet'),
(4, 'Conception Mécanique'),
(5, 'Programmation Mobile'),
(6, 'Génie Civil'),
(7, 'Architecture Réseau'),
(8, 'Électricité Bâtiment'),
(9, 'Systèmes d exploitation'),
(10, 'Maçonnerie');

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

CREATE TABLE `demande` (
  `ID_stage` int(11) NOT NULL,
  `ID_competence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `demande`
--

INSERT INTO `demande` (`ID_stage`, `ID_competence`) VALUES
(1, 1),
(2, 2),
(2, 9),
(3, 3),
(4, 1),
(4, 4),
(5, 8),
(6, 9),
(7, 10),
(8, 6),
(9, 7),
(10, 1),
(10, 5);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `ID_entreprise` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,,
  `nom_entreprise` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `Web` varchar(50) DEFAULT NULL,
  `nb_collab` int(11) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `age_moyen` decimal(15,2) DEFAULT NULL,
  `CA` decimal(15,2) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `description_` varchar(200) DEFAULT NULL,
  `chemin_logo` varchar(1000) DEFAULT NULL,
  `chemin_banniere` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`ID_entreprise`, `nom_entreprise`, `mail`, `Web`, `nb_collab`, `date_creation`, `age_moyen`, `CA`, `etat`, `description_`, `chemin_logo`, `chemin_banniere`) VALUES
(1, 'Acme Corp', 'acme@mail.com', 'www.acmecorp.com', 200, '0000-00-00', 35.20, 5000000.00, 0, 'Une entreprise innovante dans le domaine de la technologie.', 'https://ih1.redbubble.net/image.4682657530.4264/st,small,507x507-pad,600x600,f8f8f8.jpg', 'https://media.wired.com/photos/59327085a312645844994df3/191:100/w_1280,c_limit/ACME-Logo.png'),
(2, 'Finance Pro', 'financepro@mail.com', 'www.financepro.com', 120, '2010-05-20', 28.70, 3000000.00, 1, 'Une entreprise leader dans le secteur financier.', 'https://financepro.co.il/wp-content/uploads/2020/12/Finance-logo-1-1.png', 'https://img.squadhelp.com/story_images/visual_images/1698035052-FinancePro.png?class=show'),
(3, 'Eco Green Solutions', 'ecogreen@mail.com', 'www.ecogreensolutions.com', 50, '2015-08-12', 22.50, 800000.00, 1, 'Spécialisée dans les solutions écologiques et durables.', 'https://images-platform.99static.com/HOqllVnsYLFQyKC74CqwPTVVLK4=/500x500/top/smart/99designs-contests-attachments/12/12534/attachment_12534178', 'https://calevip.org/sites/default/files/2020-01/ECO%20Green%20Solutions_%20Logo.jpg'),
(4, 'Global Motors', 'globalmotors@mail.com', 'www.globalmotors.com', 300, '1995-03-03', 40.00, 10000000.00, 1, 'Fabricant mondial de véhicules de haute qualité.', NULL, NULL),
(5, 'Health InnovationsA', 'healthinnovations@mail.com', 'www.healthinnovations.com', 150, '0000-00-00', 32.10, 4000000.00, 1, 'Pionnier dans les technologies médicales avancées.', NULL, NULL),
(6, 'Tech Solutions Co.', 'techsolutions@mail.com', 'www.techsolutions.com', 80, '2013-09-25', 27.80, 2500000.00, 1, 'Fournisseur de solutions technologiques pour les entreprises.', NULL, NULL),
(7, 'Green Energy Ltd.', 'greenenergy@mail.com', 'www.greenenergy.com', 120, '2005-06-14', 30.50, 3500000.00, 1, 'Leader dans la production d énergie renouvelable.', NULL, NULL),
(8, 'InnoTech Labs', 'innotech@mail.com', 'www.innotechlabs.com', 40, '2018-03-02', 25.30, 1200000.00, 1, 'Centre de recherche et développement pour l innovation technologique.', NULL, NULL),
(9, 'Food Delights', 'fooddelights@mail.com', 'www.fooddelights.com', 69, '0000-00-00', 32.90, 1800000.00, 1, 'Cuisine de qualité supérieure avec des ingrédients locaux.', NULL, NULL),
(10, 'Sky High Airlines', 'skyhigh@mail.com', 'www.skyhighairlines.com', 200, '2007-07-07', 37.60, 6000000.00, 1, 'Compagnie aérienne offrant des vols internationaux.', NULL, NULL),
(11, 'FashionStyle', 'fashionstyle@mail.com', 'www.fashionstyle.com', 150, '2010-04-15', 30.20, 4500000.00, 1, 'Une entreprise de mode offrant des vêtements et des accessoires tendance pour hommes et femmes.', NULL, NULL),
(12, 'RealEstate Group', 'realestate@mail.com', 'www.realestategroup.com', 80, '2006-09-28', 35.70, 3800000.00, 1, 'Une entreprise spécialisée dans l achat, la vente et la gestion de biens immobiliers résidentiels et commerciaux.', NULL, NULL),
(13, 'Consulting Experts', 'consultingexperts@mail.com', 'www.consultingexperts.com', 50, '2015-11-10', 28.90, 1500000.00, 1, 'Une entreprise de conseil offrant des services de consultation stratégique et opérationnelle aux entreprises.', NULL, NULL),
(14, 'Tech Innovators', 'techinnovators@mail.com', 'www.techinnovators.com', 100, '2012-07-22', 31.40, 2800000.00, 1, 'Une entreprise axée sur la fourniture de solutions technologiques innovantes pour les entreprises.', NULL, NULL),
(15, 'Healthy Living Co.', 'healthyliving@mail.com', 'www.healthylivingco.com', 70, '2018-01-05', 33.20, 2000000.00, 1, 'Une entreprise qui se spécialise dans la préparation et la livraison de repas sains et équilibrés, adaptés à différents régimes alimentaires et styles de vie.', NULL, NULL),
(16, 'Green Technologies', 'greentechnologies@mail.com', 'www.greentechnologies.com', 45, '2016-05-12', 26.80, 1300000.00, 1, 'Une entreprise axée sur le développement et la promotion de technologies respectueuses de l environnement pour réduire l empreinte carbone et favoriser la durabilité.', NULL, NULL),
(17, 'Artisan Creations', 'artisancreations@mail.com', 'www.artisancreations.com', 60, '2013-08-30', 42.10, 1700000.00, 1, 'Une entreprise dédiée à la préservation et à la promotion des métiers d art traditionnels, proposant des produits uniques fabriqués à la main par des artisans talentueux.', NULL, NULL),
(18, 'Financial Solutions Ltd.', 'financialsolutions@mail.com', 'www.financialsolutionsltd.com', 90, '2009-11-17', 37.20, 5000000.00, 1, 'Une entreprise de services financiers offrant des conseils en investissement, des services de planification financière et des solutions d assurance pour aider les clients à atteindre leurs objectifs f', NULL, NULL),
(19, 'Education Excellence', 'educationexcellence@mail.com', 'www.educationexcellence.com', 110, '2011-03-25', 34.50, 4200000.00, 1, 'Une entreprise qui fournit des ressources éducatives en ligne, des programmes de formation et des cours spécialisés pour soutenir l apprentissage tout au long de la vie.', NULL, NULL),
(20, 'Adventure Seekers', 'adventureseekers@mail.com', 'www.adventureseekers.com', 40, '2019-06-18', 29.80, 800000.00, 1, 'Une entreprise spécialisée dans la planification et la réservation de voyages d aventure sur mesure, offrant des expériences uniques dans des destinations exotiques à travers le monde.', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `ID_evaluation` int(11) NOT NULL,
  `note` decimal(15,2) DEFAULT NULL,
  `ID_entreprise` int(11) NOT NULL,
  `ID_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`ID_evaluation`, `note`, `ID_entreprise`, `ID_utilisateur`) VALUES
(1, 0.00, 1, 10),
(2, 2.50, 2, 9),
(3, 3.50, 3, 8),
(4, 4.50, 4, 7),
(5, 0.00, 5, 6),
(6, 4.00, 6, 5),
(8, 2.00, 8, 3),
(9, 0.00, 9, 2),
(10, 3.00, 10, 1),
(11, 4.20, 11, 20),
(12, 3.80, 12, 19),
(13, 4.10, 13, 18),
(14, 3.90, 14, 17),
(15, 4.50, 15, 16),
(16, 3.70, 16, 15),
(17, 4.30, 17, 14),
(18, 3.60, 18, 13),
(19, 4.00, 19, 12),
(20, 3.50, 20, 11);

-- --------------------------------------------------------

--
-- Structure de la table `favori`
--

CREATE TABLE `favori` (
  `ID_favori` int(11) NOT NULL,
  `ID_stage` int(11) NOT NULL,
  `ID_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `favori`
--

INSERT INTO `favori` (`ID_favori`, `ID_stage`, `ID_utilisateur`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20);

-- --------------------------------------------------------

--
-- Structure de la table `gere`
--

CREATE TABLE `gere` (
  `ID_utilisateur` int(11) NOT NULL,
  `ID_promo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `gere`
--

INSERT INTO `gere` (`ID_utilisateur`, `ID_promo`) VALUES
(1, 2),
(7, 3),
(8, 4),
(10, 5),
(13, 1),
(15, 2),
(16, 3),
(19, 4),
(20, 5),
(37, 3);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE `lieu` (
  `ID_ville` int(11) NOT NULL,
  `ID_stage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`ID_ville`, `ID_stage`) VALUES
(1, 6),
(1, 7),
(3, 5),
(4, 8),
(9, 9),
(13, 1),
(13, 2),
(14, 1),
(15, 3),
(21, 8),
(25, 4),
(28, 10),
(30, 10),
(2, 11),
(5, 12),
(6, 13),
(7, 14),
(8, 15),
(10, 16),
(11, 17);

-- --------------------------------------------------------

--
-- Structure de la table `localise`
--

CREATE TABLE `localise` (
  `ID_entreprise` int(11) NOT NULL,
  `ID_ville` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `localise`
--

INSERT INTO `localise` (`ID_entreprise`, `ID_ville`) VALUES
(1, 5),
(2, 2),
(3, 17),
(4, 12),
(5, 29),
(6, 5),
(7, 10),
(8, 22),
(9, 1),
(10, 6),
(11, 15),
(12, 25),
(13, 8),
(14, 14),
(15, 30),
(16, 3),
(17, 20),
(18, 27),
(19, 9),
(20, 4);

-- --------------------------------------------------------

--
-- Structure de la table `offre_stage`
--

CREATE TABLE `offre_stage` (
  `ID_stage` int(11) NOT NULL,
  `nom_stage` varchar(50) DEFAULT NULL,
  `place_etudiant` int(11) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `salaire` decimal(15,2) DEFAULT NULL,
  `description_` varchar(200) DEFAULT NULL,
  `chemin_banniere` varchar(100) DEFAULT NULL,
  `ID_entreprise` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `offre_stage`
--

INSERT INTO `offre_stage` (`ID_stage`, `nom_stage`, `place_etudiant`, `date_debut`, `date_fin`, `salaire`, `description_`, `chemin_banniere`, `ID_entreprise`) VALUES
(1, 'Développeur Webaa', 1, '2022-03-01', '2022-06-15', 2000.00, 'Opportunité de stage pour développer des applications web.', 'banniere_stage_devweb.png', 1),
(2, 'Analyste Financier', 2, '2022-04-15', '2022-09-15', 2500.00, 'Stage en analyse financière pour les étudiants en finance.', 'banniere_stage_analyste.png', 2),
(3, 'Ingénieur en Environnement', 1, '2022-05-01', '2022-10-01', 1800.00, 'Opportunité de stage pour travailler sur des projets environnementaux.', 'banniere_stage_environnement.png', 3),
(4, 'Responsable des Ressources Humaines', 1, '2022-06-01', '2022-11-01', 2200.00, 'Stage en gestion des ressources humaines pour les futurs professionnels.', 'banniere_stage_rrh.png', 4),
(5, 'Concepteur de Véhicules', 2, '2022-07-10', '2022-08-01', 2800.00, 'Stage de conception de véhicules pour les passionnés d automobile.', 'banniere_stage_concepteur.png', 5),
(6, 'Développeur d Applications Mobiles', 1, '2022-08-01', '2023-08-18', 2100.00, 'Opportunité de stage pour développer des applications mobiles innovantes.', 'banniere_stage_devmobile.png', 6),
(7, 'Ingénieur en Énergie Renouvelable', 2, '2022-09-01', '2023-03-01', 2400.00, 'Stage axé sur les technologies d énergie renouvelable et le développement durable.', 'banniere_stage_energie.png', 7),
(8, 'Chercheur en Intelligence Artificielle', 1, '2022-10-18', '2022-11-01', 2600.00, 'Stage de recherche en intelligence artificielle pour les esprits innovants.', 'banniere_stage_ai.png', 8),
(9, 'Chef de Cuisine', 1, '2022-09-01', '2022-12-01', 1900.00, 'Stage dans une cuisine professionnelle pour les passionnés de gastronomie.', 'banniere_stage_chefcuisine.png', 9),
(10, 'Agent de Bord', 2, '2023-01-01', '2023-03-01', 2300.00, 'Stage pour découvrir les aspects opérationnels du secteur de l aviation.', 'banniere_stage_agentbord.png', 10),
(11, 'Développeur de Logiciels', 1, '2023-02-01', '2023-03-05', 2000.00, 'Opportunité de stage pour développer des logiciels innovants.', 'banniere_stage_devlogiciels.png', 11),
(12, 'Analyste en Sécurité Informatique', 2, '2023-03-01', '2023-04-08', 2500.00, 'Stage axé sur l analyse et la protection des systèmes informatiques.', 'banniere_stage_analystesecurite.png', 12),
(13, 'Gestionnaire de Base de Données', 1, '2023-04-08', '2023-05-01', 1800.00, 'Opportunité de stage pour gérer et administrer des bases de données.', 'banniere_stage_gestionnairebdd.png', 13),
(14, 'Développeur de Jeux Vidéo', 1, '2023-08-01', '2023-10-15', 2200.00, 'Stage pour concevoir et développer des jeux vidéo interactifs.', 'banniere_stage_developpeurjeux.png', 14),
(15, 'Administrateur Réseau', 2, '2023-08-01', '2023-11-08', 2800.00, 'Stage pour administrer et maintenir les réseaux informatiques.', 'banniere_stage_adminreseaux.png', 15),
(16, 'Ingénieur Civil', 1, '2023-07-01', '2023-09-05', 2100.00, 'Opportunité de stage pour concevoir et superviser des projets de construction civile.', 'banniere_stage_ingenieurecivil.png', 16),
(17, 'Technicien en Électricité', 2, '2023-08-01', '2023-10-12', 2400.00, 'Stage pour installer, entretenir et réparer des systèmes électriques.', 'banniere_stage_technicienelectricite.png', 17),
(18, 'Architecte du Paysage', 1, '2023-12-01', '2024-01-01', 2600.00, 'Stage pour concevoir et aménager des espaces paysagers.', 'banniere_stage_architectepaysage.png', 18),
(19, 'Technicien en Génie Civil', 1, '2023-10-01', '2023-11-08', 1900.00, 'Stage pour assister les ingénieurs civils dans leurs tâches techniques.', 'banniere_stage_techniciengeniecivil.png', 19),
(20, 'Opérateur de Grue', 2, '2023-11-01', '2024-01-15', 2300.00, 'Stage pour manipuler et contrôler les grues sur les chantiers de construction.', 'banniere_stage_operateurgrue.png', 20),
(0, 'AA', NULL, NULL, NULL, 1800.00, 'test', NULL, 5);

-- --------------------------------------------------------

--
-- Structure de la table `possede`
--

CREATE TABLE `possede` (
  `ID_entreprise` int(11) NOT NULL,
  `ID_secteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `possede`
--

INSERT INTO `possede` (`ID_entreprise`, `ID_secteur`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 6),
(17, 7),
(18, 8),
(19, 9),
(20, 10);

-- --------------------------------------------------------

--
-- Structure de la table `prend`
--

CREATE TABLE `prend` (
  `ID_stage` int(11) NOT NULL,
  `ID_promo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `prend`
--

INSERT INTO `prend` (`ID_stage`, `ID_promo`) VALUES
(1, 3),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 1),
(17, 2),
(18, 3),
(19, 4),
(20, 5);

-- --------------------------------------------------------

--
-- Structure de la table `promo`
--

CREATE TABLE `promo` (
  `ID_promo` int(11) NOT NULL,
  `promo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `promo`
--

INSERT INTO `promo` (`ID_promo`, `promo`) VALUES
(1, 'A1 informatique'),
(2, 'A2 informatique'),
(3, 'A1 BTP'),
(4, 'A2 BTP'),
(5, 'A3 BTP');

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE `secteur` (
  `ID_secteur` int(11) NOT NULL,
  `activite` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `secteur`
--

INSERT INTO `secteur` (`ID_secteur`, `activite`) VALUES
(1, 'Développement logiciel'),
(2, 'Analyse de données'),
(3, 'Cybersécurité'),
(4, 'Intelligence artificielle'),
(5, 'Réseaux informatiques'),
(6, 'Construction de bâtiments résidentiels'),
(7, 'Construction de routes et dinfrastructures'),
(8, 'Génie civil'),
(9, 'Travaux de démolition'),
(10, 'Aménagement paysager');

-- --------------------------------------------------------

--
-- Structure de la table `situe`
--

CREATE TABLE `situe` (
  `ID_ville` int(11) NOT NULL,
  `ID_promo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `situe`
--

INSERT INTO `situe` (`ID_ville`, `ID_promo`) VALUES
(1, 1),
(2, 2),
(14, 3),
(22, 4),
(23, 5);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `ID_utilisateur` int(11) NOT NULL,
  `login_` varchar(50) DEFAULT NULL,
  `Mot_de_passe` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `description_` varchar(200) DEFAULT NULL,
  `chemin_img` varchar(100) DEFAULT NULL,
  `type_utilisateur` int(11) DEFAULT NULL,
  `ID_promo` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID_utilisateur`, `login_`, `Mot_de_passe`, `prenom`, `nom`, `mail`, `description_`, `chemin_img`, `type_utilisateur`, `ID_promo`, `age`) VALUES
(1, 'john_doe', 'undefined', 'Doe', 'John', 'john.doe@mail.com', 'JOHN DOE', 'random', 1, NULL, 25),
(2, 'jane_smith', 'pass123', 'Jane', 'Smith', 'jane.smith@mail.com', 'Étudiante en finance avec une passion pour l analyse des marchés.', 'jane_img.png', 0, 2, 6),
(3, 'tech_guru', 'techpass', 'Tech', 'Guru', 'tech.guru@mail.com', 'Expert en technologies émergentes et innovation.', 'tech_img.png', 2, NULL, 753),
(5, 'finance_whiz', 'finance456', 'Olivia', 'White', 'olivia.white@mail.com', 'Spécialiste en finance d entreprise et analyse financière.', 'olivia_img.png', 0, 3, 52),
(6, 'dev_ninja', 'ninjaPass', 'Sam', 'Johnson', 'sam.johnson@mail.com', 'Développeur passionné avec une expertise dans divers langages de programmation.', 'sam_img.png', 2, NULL, 64),
(7, 'eco_enthusiast', 'ecoPass', 'Emma', 'Greenwood', 'emma.greenwood@mail.com', 'Adoratrice de la nature et des pratiques écologiques.', 'emma_img.png', 1, NULL, 78),
(8, 'hr_expert', 'hr567', 'Robert', 'Harrison', 'robert.harrison@mail.com', 'Professionnel des ressources humaines avec une expérience approfondie.', 'robert_img.png', 1, NULL, NULL),
(9, 'ai_researcher', 'aiResearch123', 'Alice', 'Johnson', 'alice.johnson@mail.com', 'Chercheuse en intelligence artificielle avec un intérêt pour l éthique dans l IA.', 'alice_img.png', 2, NULL, NULL),
(10, 'culinary_artist', 'foodiePass', 'Charlie', 'Baker', 'charlie.baker@mail.com', 'Chef culinaire créatif passionné par l innovation gastronomique.', 'charlie_img.png', 1, NULL, NULL),
(11, 'aviation_enthusiast', 'flyHigh', 'Pilot', 'Skyler', 'pilot.skyler@mail.com', 'Amateur d aviation rêvant de voler dans les cieux.', 'skyler_img.png', 0, 4, NULL),
(12, 'lisa_anderson', 'passLisa', 'Lisa', 'Anderson', 'lisa.anderson@mail.com', 'Étudiante en sciences informatiques passionnée par l apprentissage automatique.', 'lisa_img.png', 2, NULL, NULL),
(13, 'mark_innovator', 'innovate123', 'Mark', 'Innovator', 'mark.innovator@mail.com', 'Entrepreneur innovant dans le domaine des technologies émergentes.', 'mark_img.png', 1, NULL, NULL),
(14, 'eco_warrior', 'ecoWarrior22', 'Eva', 'Williams', 'eva.williams@mail.com', 'Défenseur de l environnement engagé dans des actions pour un monde plus vert.', 'eva_img.png', 0, 5, NULL),
(15, 'finance_expert', 'financeExpert', 'Frank', 'Robinson', 'frank.robinson@mail.com', 'Expert en gestion financière et stratégies d investissement.', 'frank_img.png', 1, NULL, NULL),
(16, 'dev_prodigy', 'codeMaster', 'Lucas', 'Parker', 'lucas.parker@mail.com', 'Prodige du développement logiciel depuis un jeune âge.', 'lucas_img.png', 1, NULL, NULL),
(17, 'healthcare_innovator', 'healthInnovate', 'Hannah', 'Taylor', 'hannah.taylor@mail.com', 'Innovatrice dans le domaine des technologies de la santé.', 'hannah_img.png', 0, 4, NULL),
(18, 'marketing_maven', 'maven456', 'Mia', 'Miller', 'mia.miller@mail.com', 'Experte en stratégies marketing créatives et efficaces.', 'mia_img.png', 2, NULL, NULL),
(19, 'cyber_security_pro', 'secureTech', 'Connor', 'Barnes', 'connor.barnes@mail.com', 'Professionnel de la sécurité informatique avec une expertise en cyberdéfense.', 'connor_img.png', 1, NULL, NULL),
(20, 'creative_designer', 'designGenius', 'Grace', 'Cooper', 'grace.cooper@mail.com', 'Designer créatif avec une passion pour l innovation visuelle', 'grace_img.png', 1, NULL, NULL),
(21, 'louis_lefebvre', 'undefined', 'Louis', 'Lefebvreaaa', 'louis.lefebvre@mail.com', 'Étudiant en informatique passionné par la programmation.', 'random', 0, 1, 24),
(22, 'amelie_petit', 'amelie456', 'Amélie', 'Petit', 'amelie.petit@mail.com', 'Étudiante en finance avec un intérêt pour les marchés internationaux.', 'amelie_img.png', 2, NULL, 22),
(23, 'sophie_martin', 'sophie789', 'Sophie', 'Martin', 'sophie.martin@mail.com', 'Passionnée par les technologies émergentes et leur impact sur la société.', 'sophie_img.png', 2, NULL, 23),
(24, 'paul_durand', 'paulpass', 'Paul', 'Durand', 'paul.durand@mail.com', 'Développeur expérimenté spécialisé dans le développement web.', 'paul_img.png', 0, 2, 28),
(25, 'emma_dubois', 'emma123', 'Emma', 'Dubois', 'emma.dubois@mail.com', 'Spécialiste en gestion environnementale avec un engagement pour le développement durable.', 'emma_img.png', 2, NULL, 26),
(26, 'antoine_garcia', 'antoine456', 'Antoine', 'Garcia', 'antoine.garcia@mail.com', 'Passionné par la conception de véhicules et l industrie automobile.', 'antoine_img.png', 0, 1, 25),
(27, 'julie_robert', 'julie789', 'Julie', 'Robert', 'julie.robert@mail.com', 'Étudiante en management avec une forte orientation vers le leadership.', 'julie_img.png', 2, NULL, 24),
(28, 'lucas_leroy', 'lucaspass', 'Lucas', 'Leroy', 'lucas.leroy@mail.com', 'Chercheur en intelligence artificielle passionné par l apprentissage automatique.', 'lucas_img.png', 0, 5, 27),
(29, 'clara_moreau', 'clara123', 'Clara', 'Moreau', 'clara.moreau@mail.com', 'Chef cuisinier spécialisé dans la cuisine fusion et les techniques modernes.', 'clara_img.png', 2, NULL, 29),
(30, 'leo_guerin', 'leo456', 'Léo', 'Guerin', 'leo.guerin@mail.com', 'Passionné par l aviation et rêvant de devenir pilote professionnel.', 'leo_img.png', 0, 3, 23),
(31, 'jade_fournier', 'jade789', 'Jade', 'Fournier', 'jade.fournier@mail.com', 'Étudiante en sciences informatiques avec un intérêt pour la cybersécurité.', 'jade_img.png', 2, NULL, 22),
(32, 'adam_martin', 'adam123', 'Adam', 'Martin', 'adam.martin@mail.com', 'Entrepreneur technologique innovant avec une passion pour les startups.', 'adam_img.png', 0, 4, 27),
(33, 'eva_brun', 'eva456', 'Eva', 'Brun', 'eva.brun@mail.com', 'Militante écologiste engagée dans la sensibilisation aux problèmes environnementaux.', 'eva_img.png', 2, NULL, 28),
(34, 'louis_petit', 'louispass', 'Louis', 'Petit', 'louis.petit@mail.com', 'Consultant financier expérimenté spécialisé dans les marchés émergents.', 'louis_img.png', 0, 1, 25),
(35, 'camille_rodriguez', 'camille123', 'Camille', 'Rodriguez', 'camille.rodriguez@mail.com', 'Ingénieure en mécanique avec une passion pour l innovation dans l industrie automobile.', 'camille_img.png', 2, NULL, 26),
(36, 'mathis_garcia', 'mathis456', 'Mathis', 'Garcia', 'mathis.garcia@mail.com', 'Expert en management des opérations avec une expérience internationale.', 'mathis_img.png', 0, 5, 29),
(37, 'julia_moreau', 'julia789', 'Julia', 'Moreau', 'julia.moreau@mail.com', 'Designer graphique créatif spécialisé dans les interfaces utilisateur.', 'julia_img.png', 1, NULL, NULL),
(38, 'louis_dubois', 'louispass', 'Louis', 'Dubois', 'louis.dubois@mail.com', 'Ingénieur énergétique passionné par les énergies renouvelables.', 'louis_img.png', 0, 2, 27),
(39, 'emma_guerin', 'emma123', 'Emma', 'Guerin', 'emma.guerin@mail.com', 'Spécialiste en santé publique engagée dans l amélioration des soins de santé.', 'emma_img.png', 2, NULL, 25),
(40, 'antoine_fournier', 'antoine456', 'Antoine', 'Fournier', 'antoine.fournier@mail.com', 'Expert en marketing digital avec une expérience dans le commerce électronique.', 'antoine_img.png', 0, 4, 22),
(41, 'admin', 'admin', 'admin', 'admin', 'admin@admin.fr', 'admin', NULL, 2, NULL, NULL),
(85, 'random ta capte', '', 'a', 'a', '', '', 'testrandom.jpg', 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `ID_ville` int(11) NOT NULL,
  `nom_ville` varchar(50) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`ID_ville`, `nom_ville`, `adresse`) VALUES
(1, 'Paris', '1 Rue de la Ville'),
(2, 'Marseille', '2 Avenue de la Mer'),
(3, 'Lyon', '3 Place du Centre'),
(4, 'Toulouse', '4 Rue de la Libération'),
(5, 'Nice', '5 Boulevard des Fleurs'),
(6, 'Nantes', '6 Avenue de la Loire'),
(7, 'Strasbourg', '7 Rue de la Cathédrale'),
(8, 'Montpellier', '8 Place de la Comédie'),
(9, 'Bordeaux', '9 Rue du Vin'),
(10, 'Lille', '10 Boulevard de la République'),
(11, 'Rennes', '11 Place du Parlement'),
(12, 'Reims', '12 Rue des Vins'),
(13, 'Le Havre', '13 Quai de la Mer'),
(14, 'Saint-Étienne', '14 Rue des Montagnes'),
(15, 'Toulon', '15 Avenue des Plages'),
(16, 'Grenoble', '16 Place de la Libération'),
(17, 'Dijon', '17 Rue de la Moutarde'),
(18, 'Nîmes', '18 Avenue de l Arenas'),
(19, 'Angers', '19 Rue du Château'),
(20, 'Villeurbanne', '20 Boulevard des Étudiants'),
(21, 'Le Mans', '21 Place de la Course'),
(22, 'Aix-en-Provence', '22 Cours Mirabeau'),
(23, 'Brest', '23 Quai de la Liberté'),
(24, 'Limoges', '24 Rue des Arts'),
(25, 'Amiens', '25 Place Notre-Dame'),
(26, 'Perpignan', '26 Avenue des Palmiers'),
(27, 'Metz', '27 Rue de la Moselle'),
(28, 'Besançon', '28 Place du Marché'),
(29, 'Orléans', '29 Rue de la République'),
(30, 'Mulhouse', '30 Avenue des Tissus');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`ID_utilisateur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `ID_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
