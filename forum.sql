-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 20 oct. 2020 à 12:16
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `forum`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `titre`) VALUES
(1, 'aides'),
(2, 'tout ce qui se passe'),
(3, 'informations');

-- --------------------------------------------------------

--
-- Structure de la table `dislikes`
--

DROP TABLE IF EXISTS `dislikes`;
CREATE TABLE IF NOT EXISTS `dislikes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_forum_reponses` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dislikes`
--

INSERT INTO `dislikes` (`id`, `id_forum_reponses`, `id_utilisateur`) VALUES
(31, 246, 5),
(30, 249, 5),
(24, 194, 1),
(14, 242, 4),
(12, 239, 4);

-- --------------------------------------------------------

--
-- Structure de la table `forum_reponses`
--

DROP TABLE IF EXISTS `forum_reponses`;
CREATE TABLE IF NOT EXISTS `forum_reponses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auteur` varchar(30) NOT NULL,
  `message` longtext NOT NULL,
  `date_reponse` datetime NOT NULL,
  `correspondance_sujet` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=271 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `forum_reponses`
--

INSERT INTO `forum_reponses` (`id`, `auteur`, `message`, `date_reponse`, `correspondance_sujet`) VALUES
(246, 'admin', 'test', '2020-09-07 10:53:51', 90),
(256, 'mouss', 'aller -y sur youtube, il y a des tutos pour debloquer certaines situation ', '2020-09-07 14:05:51', 95),
(255, 'mouss', 'le niveau 132 bug est-ce normal ???', '2020-09-07 14:05:06', 94),
(257, 'mouss', 'il y\'a la nouvelle version qui va sortir mais sur ps5', '2020-09-07 14:06:56', 96),
(258, 'admin', 'ici vous pouvez débattre sur ce que vous voulez', '2020-09-07 14:08:06', 97),
(259, 'mouss', 'mdr ok bien vu ;)', '2020-09-07 14:08:34', 97),
(260, 'mouss', 'dfdsfdsdfdsfd', '2020-09-07 14:09:17', 98),
(265, 'mouss', ':p', '2020-10-02 16:18:14', 100),
(264, 'mouss', 'je suis bloqué dans un niveau', '2020-10-02 12:11:33', 99),
(266, 'mouss', 'sur la psp il etait mieux', '2020-10-02 16:18:33', 92),
(267, 'admin', 'Si vous galéré, un conseil allez-y sur youtube', '2020-10-02 16:29:38', 101),
(268, 'admin', 'ici venez proposer vos solutions', '2020-10-02 16:29:59', 102),
(269, 'admin', 'venez tous parler ici !!!!', '2020-10-02 16:31:00', 103),
(270, 'admin', 'foire aux questions', '2020-10-02 16:32:02', 104);

-- --------------------------------------------------------

--
-- Structure de la table `forum_sujets`
--

DROP TABLE IF EXISTS `forum_sujets`;
CREATE TABLE IF NOT EXISTS `forum_sujets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auteur` varchar(30) NOT NULL,
  `date_derniere_reponse` datetime NOT NULL,
  `titre` longtext NOT NULL,
  `correspondance_categorie` int(11) NOT NULL,
  `topic` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `forum_sujets`
--

INSERT INTO `forum_sujets` (`id`, `auteur`, `date_derniere_reponse`, `titre`, `correspondance_categorie`, `topic`) VALUES
(94, 'mouss', '2020-09-07 14:05:06', 'bug', 1, 1),
(92, 'admin', '2020-10-02 16:18:33', 'god of war', 1, 3),
(104, 'admin', '2020-10-02 16:32:02', 'FAQ', 1, 3),
(95, 'mouss', '2020-09-07 14:05:51', 'triche', 1, 2),
(96, 'mouss', '2020-09-07 14:06:56', 'nouveaux version', 2, 4),
(97, 'admin', '2020-09-07 14:14:09', 'discussion', 3, 14),
(99, 'mouss', '2020-10-02 12:11:33', 'help', 1, 1),
(100, 'mouss', '2020-10-02 16:18:14', 'donnez vos avis', 2, 5),
(101, 'admin', '2020-10-02 16:29:38', 'youtube', 1, 2),
(102, 'admin', '2020-10-02 16:29:59', 'solution', 1, 1),
(103, 'admin', '2020-10-02 16:31:00', 'chat entre joueurs', 3, 14);

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_forum_reponses` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `likes`
--

INSERT INTO `likes` (`id`, `id_forum_reponses`, `id_utilisateur`) VALUES
(85, 251, 5),
(83, 249, 1),
(79, 248, 1),
(78, 246, 4),
(76, 247, 1),
(80, 246, 1),
(74, 197, 4),
(69, 197, 1),
(63, 244, 1),
(61, 242, 1),
(51, 194, 4),
(87, 256, 8),
(88, 257, 8),
(89, 258, 1),
(90, 260, 8);

-- --------------------------------------------------------

--
-- Structure de la table `sous_categorie`
--

DROP TABLE IF EXISTS `sous_categorie`;
CREATE TABLE IF NOT EXISTS `sous_categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sous_categorie`
--

INSERT INTO `sous_categorie` (`id`, `titre`, `id_categorie`) VALUES
(1, 'assistance technique', 1),
(2, 'Bugs : jeu, forum et site web', 1),
(3, 'Localisation / Traduction', 1),
(4, 'Acutalités et annonces', 2),
(5, 'Notes de mise à jour', 2),
(14, 'Coin de la communauté', 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `login`, `password`, `grade`) VALUES
(1, 'admin', '$2y$12$6DdTVMjrB9t6pcUoO2Gxwev2tSZFtQJVWCb9/CnhWkd3eHn3ntA4u', 1),
(4, 'non', '$2y$12$PjEtar2ZAUZIB2AbG6RNaObl9NIfQZVpM8anYKvc7Tl275EW.6Ntm', 3),
(8, 'mouss', '$2y$12$U99NysNVgYwsdgN3tEQaheZ0.POSAG.n9UFuHS/NrkXBHf9.egpyC', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
