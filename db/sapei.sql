-- --------------------------------------------------------
-- Hôte:                         172.23.210.221
-- Version du serveur:           5.5.44-0ubuntu0.14.04.1 - (Ubuntu)
-- Serveur OS:                   debian-linux-gnu
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export de la structure de la base pour sapei
CREATE DATABASE IF NOT EXISTS `sapei` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sapei`;


-- Export de la structure de table sapei. axe
CREATE TABLE IF NOT EXISTS `axe` (
  `Id_axe` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''axe concerné',
  `Axe` varchar(50) NOT NULL DEFAULT '0',
  `Id_Type_Axe` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifiant du type d''axe',
  PRIMARY KEY (`Id_axe`),
  KEY `FK_axe_axe` (`Id_Type_Axe`),
  CONSTRAINT `FK_axe_axe` FOREIGN KEY (`Id_Type_Axe`) REFERENCES `type_axe` (`Id_type_axe`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='Table des axes';

-- Export de données de la table sapei.axe: ~44 rows (environ)
DELETE FROM `axe`;
/*!40000 ALTER TABLE `axe` DISABLE KEYS */;
INSERT INTO `axe` (`Id_axe`, `Axe`, `Id_Type_Axe`) VALUES
	(1, 'A517', 1),
	(2, 'A515', 2),
	(3, 'A568', 3),
	(4, 'RD62', 3),
	(5, 'RD106', 3),
	(6, 'RD601', 3),
	(7, 'RD128', 3),
	(8, 'RD612', 3),
	(9, 'RN113', 3),
	(10, 'A75', 3),
	(11, 'RN88', 3),
	(12, 'RN106', 3),
	(13, 'RN9', 3),
	(14, 'RN122', 3),
	(15, 'RN109', 3),
	(16, 'A750', 3),
	(17, 'A54', 3),
	(18, 'RD4', 3),
	(19, 'RD21', 3),
	(20, 'RD65', 3),
	(21, 'RD142E5', 3),
	(22, 'RD14', 3),
	(23, 'RD68', 3),
	(24, 'RD135', 3),
	(25, 'A55', 3),
	(26, 'Multi-axes', 3),
	(27, 'RN568', 3),
	(28, 'VC', 3),
	(29, 'RN85', 3),
	(30, 'RD6202', 3),
	(31, 'RN202', 3),
	(32, 'RD28', 3),
	(33, 'RN569', 3),
	(34, 'RN193', 3),
	(35, 'LGV CNM', 3),
	(36, 'RD9', 3),
	(37, 'RD994', 3),
	(38, 'RD177E15', 3),
	(39, 'RD936', 3),
	(40, 'RD986', 3),
	(41, 'RD13', 3),
	(42, 'A57', 3),
	(43, 'Aéroport', 3),
	(44, 'RN102', 3);
/*!40000 ALTER TABLE `axe` ENABLE KEYS */;


-- Export de la structure de table sapei. bpclight_agents
CREATE TABLE IF NOT EXISTS `bpclight_agents` (
  `Kage` int(11) NOT NULL AUTO_INCREMENT,
  `Kuni` int(11) DEFAULT NULL,
  `Ksub` int(11) DEFAULT NULL,
  `Kser` int(11) DEFAULT NULL,
  `Kbat` int(11) DEFAULT NULL,
  `Kgra` int(11) DEFAULT NULL,
  `Kbur` int(11) DEFAULT NULL,
  `Kres` int(11) DEFAULT NULL,
  `Ksec` int(11) DEFAULT NULL,
  `Nom` varchar(250) DEFAULT NULL,
  `Prenom` varchar(250) DEFAULT NULL,
  `Matri` varchar(10) NOT NULL,
  `DatCre` datetime DEFAULT NULL,
  `DatOuv` datetime DEFAULT NULL,
  `DatMod` datetime DEFAULT NULL,
  `DatClo` datetime DEFAULT NULL,
  `HorSect` varchar(10) DEFAULT NULL,
  `CodHie` smallint(6) DEFAULT NULL,
  `CodHor` varchar(6) DEFAULT NULL,
  `LibHor` varchar(100) DEFAULT NULL,
  `Telephone` varchar(20) DEFAULT NULL,
  `Poste` varchar(10) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `Portable` varchar(20) DEFAULT NULL,
  `Bureau` varchar(20) DEFAULT NULL,
  `RoleDeta` longtext,
  `DatMaj` datetime DEFAULT NULL,
  `DatNai` datetime DEFAULT NULL,
  `VilNai` varchar(250) DEFAULT NULL,
  `DepNai` varchar(5) DEFAULT NULL,
  `NomPre` varchar(30) DEFAULT NULL,
  `Actif` tinyint(4) NOT NULL,
  `IneTP` smallint(6) DEFAULT NULL,
  `HSLabo` smallint(6) DEFAULT NULL,
  `MissioLabo` tinyint(4) NOT NULL,
  `LogUse` varchar(100) DEFAULT NULL,
  `NumImmo` varchar(50) DEFAULT NULL,
  `INSEE` varchar(16) DEFAULT NULL,
  `Circe` tinyint(4) NOT NULL,
  `PaysNai` varchar(250) DEFAULT NULL,
  `Signat` tinyint(4) NOT NULL,
  `Temptation` tinyint(4) NOT NULL,
  `Verrou` varchar(50) DEFAULT NULL,
  `NumautCond` int(11) DEFAULT NULL,
  `Autorise` int(11) DEFAULT NULL,
  `INM` char(5) DEFAULT NULL,
  `AgGesper` varchar(12) DEFAULT NULL,
  `AgRe` varchar(20) DEFAULT NULL,
  `AgRisques` int(11) DEFAULT NULL,
  `Ksec2` int(11) DEFAULT NULL,
  `REHUCIT` varchar(255) DEFAULT NULL,
  `libelle_poste` longtext,
  `dossier_d` int(11) DEFAULT NULL,
  `dossier_r` int(11) DEFAULT NULL,
  `libelle_doc` longblob NOT NULL,
  PRIMARY KEY (`Kage`)
) ENGINE=FEDERATED DEFAULT CHARSET=latin1 CONNECTION='mysql://root@127.0.0.1:3306/bpclight/agents';


-- Export de la structure de table sapei. client_origine
CREATE TABLE IF NOT EXISTS `client_origine` (
  `Id_client_origine` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du client d''origine de l''affaire',
  `Lib_client_origine` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Libellé du client à l''origine de l''affaire',
  PRIMARY KEY (`Id_client_origine`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='Table des clients d''origine';

-- Export de données de la table sapei.client_origine: ~24 rows (environ)
DELETE FROM `client_origine`;
/*!40000 ALTER TABLE `client_origine` DISABLE KEYS */;
INSERT INTO `client_origine` (`Id_client_origine`, `Lib_client_origine`) VALUES
	(1, 'GINGER'),
	(2, 'DIRMED'),
	(3, 'DIRMC'),
	(4, 'CD04'),
	(5, 'GPMM'),
	(6, 'Base Navale de Toulon'),
	(7, 'CECP'),
	(8, 'COLAS Midi Méditerranée'),
	(9, 'CD06'),
	(10, 'Toulon Provence Métropole'),
	(11, 'DteclTM'),
	(12, 'Eiffage'),
	(13, 'CD34'),
	(14, 'CD13'),
	(15, 'CEREMA/DTerMed'),
	(16, 'DREAL PACA'),
	(17, 'DDTM 2B'),
	(18, 'CD83'),
	(19, 'USID Draguignan'),
	(20, 'DEAL Mayotte'),
	(21, 'EUROVIA Méditerranée'),
	(22, 'FONDASOL'),
	(23, 'VINCI CONSTRUCTION'),
	(24, 'Conseil Régional de la Réunion');
/*!40000 ALTER TABLE `client_origine` ENABLE KEYS */;


-- Export de la structure de table sapei. client_rattache
CREATE TABLE IF NOT EXISTS `client_rattache` (
  `Id_client_rattache` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du client intervenant direct rattaché',
  `Lib_client_rattache` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Libellé du client intervenant direct',
  `Id_client_origine` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifiant du client auquel est rattaché ce client',
  PRIMARY KEY (`Id_client_rattache`),
  KEY `FK_client_rattache_contact client` (`Id_client_origine`),
  CONSTRAINT `FK_client_rattache_contact client` FOREIGN KEY (`Id_client_origine`) REFERENCES `client_origine` (`Id_client_origine`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='Table des clients rattachés';

-- Export de données de la table sapei.client_rattache: ~36 rows (environ)
DELETE FROM `client_rattache`;
/*!40000 ALTER TABLE `client_rattache` DISABLE KEYS */;
INSERT INTO `client_rattache` (`Id_client_rattache`, `Lib_client_rattache`, `Id_client_origine`) VALUES
	(1, 'DIRMED/DU/CEI Saint Martin de Crau', 2),
	(3, 'DIRMC/DS/PE/UT Grands Causses / CEI La Cavalerie', 3),
	(5, 'DIRMC/DPEE/PRI', 3),
	(6, 'DIRMC/DS/PE/UT Coeur d\'Hérault/CEI Servian', 3),
	(7, 'Agence departementale de Lunel', 13),
	(8, 'CD06', 9),
	(9, 'CD34', 13),
	(10, 'DIRMED/SIR de Montpellier/Projets', 2),
	(11, 'DIRMC/DS/PE/UT Grands  Causses/CEI Sévérac', 3),
	(12, 'DIRMC/DC/UT Vivarais-Cévennes/CEI Mende', 3),
	(13, 'CD13/Service Etudes et travaux', 14),
	(17, 'DIRMED/SPEP/PCP', 2),
	(18, 'DIRMC/DPEE/PRI', 3),
	(22, 'CD04', 4),
	(23, 'GPMM', 5),
	(24, 'ESID Toulon', 6),
	(25, 'CECP', 7),
	(26, 'COLAS/Direction', 8),
	(27, 'CD06/DRIT/SESR', 9),
	(28, 'Toulon Provence Métropole', 10),
	(29, 'CD83', 18),
	(30, 'DtecITM', 11),
	(31, 'Eiffage', 12),
	(33, 'DREAL PACA', 16),
	(34, 'DDTM2B/SRCS/SRCS/SER', 17),
	(35, 'GINGER', 1),
	(36, 'PDA/Département des routes/DPTI', 13),
	(37, 'Pôle entretien CD13', 14),
	(38, 'CEREMA/DTERMED/DCEDI', 15),
	(39, 'DDTM2B/SRCS/SRCS/SER', 17),
	(40, 'USID Draguignan', 19),
	(41, 'DEAL Mayotte', 20),
	(42, 'EUROVIA Méditerranée', 21),
	(43, 'FONDASOL', 22),
	(44, 'SGE C Congo', 23),
	(45, 'Service Exploitation et sécurité Routière / Base de données Routières', 24);
/*!40000 ALTER TABLE `client_rattache` ENABLE KEYS */;


-- Export de la structure de table sapei. contact_chantier
CREATE TABLE IF NOT EXISTS `contact_chantier` (
  `Id_contact_chantier` int(11) NOT NULL AUTO_INCREMENT,
  `Id_job` int(11) NOT NULL DEFAULT '0',
  `Id_contact` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id_contact_chantier`),
  KEY `FK__job` (`Id_job`),
  KEY `FK__contact client` (`Id_contact`),
  CONSTRAINT `FK__contact client` FOREIGN KEY (`Id_contact`) REFERENCES `contact_client` (`Id_contact_client`),
  CONSTRAINT `FK__job` FOREIGN KEY (`Id_job`) REFERENCES `job` (`Id_job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table de relation entre job et contact';

-- Export de données de la table sapei.contact_chantier: ~0 rows (environ)
DELETE FROM `contact_chantier`;
/*!40000 ALTER TABLE `contact_chantier` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_chantier` ENABLE KEYS */;


-- Export de la structure de table sapei. contact_client
CREATE TABLE IF NOT EXISTS `contact_client` (
  `Id_contact_client` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du contact  client',
  `Id_client_rattache` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifiant du client rattaché à l''activité',
  `NomPrenom_contact_client` varchar(255) NOT NULL DEFAULT '-' COMMENT 'Nom et prénom du contact du client',
  `Tel_contact_client` varchar(20) DEFAULT '-' COMMENT 'Téléphone du contact du client',
  `Mobile_contact_client` varchar(20) DEFAULT '-' COMMENT 'Mobile du contact du client',
  `Mail_contact_client` varchar(255) DEFAULT '-' COMMENT 'Mail du contact du client',
  `Fonction_contact_client` text COMMENT 'Fonction du contact du client',
  `Adresse_contact_client` text COMMENT 'Adresse du contact du client',
  `Type_client` varchar(2) NOT NULL COMMENT 'Type client (Chantier, Client, Client-Chantier)',
  PRIMARY KEY (`Id_contact_client`),
  KEY `FK_contact client_type_contact` (`Type_client`),
  KEY `FK_contact_client_client_rattache` (`Id_client_rattache`),
  CONSTRAINT `FK_contact client_type_contact` FOREIGN KEY (`Type_client`) REFERENCES `type_contact` (`Id_type_contact`),
  CONSTRAINT `FK_contact_client_client_rattache` FOREIGN KEY (`Id_client_rattache`) REFERENCES `client_rattache` (`Id_client_rattache`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='Table des contacts clients';

-- Export de données de la table sapei.contact_client: ~43 rows (environ)
DELETE FROM `contact_client`;
/*!40000 ALTER TABLE `contact_client` DISABLE KEYS */;
INSERT INTO `contact_client` (`Id_contact_client`, `Id_client_rattache`, `NomPrenom_contact_client`, `Tel_contact_client`, `Mobile_contact_client`, `Mail_contact_client`, `Fonction_contact_client`, `Adresse_contact_client`, `Type_client`) VALUES
	(1, 17, 'FOUQOU Bruno', '04 12 45 12 63', '06 15 47 45 65', 'bruno.fouqou@developpement-durable.gouv.fr', 'Chef du pôle conservation du patrimoine', '16, rue Bernard du Bois \n13001 MARSEILLE', '1'),
	(2, 5, 'MARIOT Pascal', '04 73 29 79 38', NULL, 'pascal.mariot@developpement-durable.gouv.fr', NULL, '32, rue de Rabanesse \nBP 90 447 \n63012 CLERMONT FERRAND CEDEX', '1'),
	(3, 9, 'MUZEAU Philippe', NULL, NULL, 'philippe.muzeau@le04.fr', NULL, NULL, '1'),
	(4, 22, 'BENRENGUIER Pascal', NULL, NULL, 'p.berenguier@cg04.fr', NULL, NULL, '1'),
	(5, 23, '???', NULL, NULL, NULL, NULL, NULL, '1'),
	(6, 24, 'SILVESTRINI Aurélie', '04 22 42 58 73', NULL, 'aurelie.silvestrini@intradef.gouv.fr', NULL, NULL, '1'),
	(7, 25, 'Matignon Christophe', '02 41 27 51 51', NULL, 'christophe.matignon@cerema.fr', NULL, NULL, '1'),
	(8, 25, 'Bertrand Xavier', '02 41 27 51 34', NULL, 'xavier.bertrand@cerema.fr', NULL, NULL, '1'),
	(9, 26, 'Gileni Frédéric', '04 42 16 38 79', '06 65 53 40 60', 'frederic.gileni@colas-mm.com', 'Directeur technique Adjoint', 'COLAS MIDI-MÉDITERRANÉE La Duranne\n345, rue Louis de Broglie\nBP 20070\n13792 Aix-en-Provence cedex 3', '1'),
	(10, 27, 'Hugues Laure', '04 97 18 70 41', '07 89 04 06 00', 'lhugues@departement06.fr', NULL, '147 Bld du Mercantour \nBP N°300\nBât Le Cheiron - Bureau 537\n06201 NICE CEDEX 3 ', '1'),
	(11, 28, '???', NULL, NULL, NULL, NULL, NULL, '1'),
	(12, 29, '???', NULL, NULL, NULL, NULL, NULL, '1'),
	(13, 30, '???', NULL, NULL, NULL, NULL, NULL, '1'),
	(14, 31, 'Gorretta Philippe', NULL, NULL, NULL, NULL, NULL, '1'),
	(15, 36, 'Michel Christophe', '04 67 67 64 63', '06 29 66 24 36', 'cmichel@herault34.fr', 'Responsable unité Politique d\'Entretien des routes', 'Hotel du département \n1000 Rue d\'Alco \n34087 MONTPELLIER Cedex 4', '1'),
	(16, 37, 'Lemoine Daniel', '04 13 31 24 26', NULL, 'daniel.lemoine@cg13.fr', 'Pôle entretien chef projet auscultation', NULL, '1'),
	(17, 38, 'Cardusi Olivier', '04 42 24 77 25', NULL, 'olivier.cardusi@cerema.fr', NULL, NULL, '1'),
	(18, 33, '???', NULL, NULL, NULL, NULL, NULL, '1'),
	(19, 34, 'Dufour Béatrice', '04 95 32 97 59', '06 23 22 48 80', 'beatrice.dufour@haute-corse.gouv.fr', 'Chef d\'unité SER', '8 Bd Benoîte Danesi \n20411 BASTIA CEDEX', '1'),
	(20, 35, 'Hoareau Michel', NULL, NULL, NULL, NULL, NULL, '1'),
	(21, 40, 'Clouchoux Eric', '04 98 11 76 28', '06 42 42 18 30', 'eric.clouchoux@intradef.gouv.fr', 'Adjt Antenne Cannet des Maures', 'Base école général Lejay \n83340 LE CANNET DES MAURES', '1'),
	(22, 41, 'Mauduit Valery', '02 69 64 83 66', '06 39 09 10 06', 'valery.mauduit@developpement-durable.gouv.fr', 'Adjt chef de service SIST', 'BP 10997600 MAMOUDZOU', '1'),
	(23, 42, 'Bonnet Jérôme', NULL, '06 20 39 53 26', 'jerome.bonnet@eurovia.com', NULL, NULL, '1'),
	(24, 43, 'Meneroud Thierry', '04 93 14 12 88', '06 12 44 17 22', 'thierry.meneroud@fondasol.fr', 'Directeur régional Centre sud', NULL, '1'),
	(25, 44, 'Gajac Jean-François', NULL, NULL, 'jean-francois@vinci-construction.com', 'Directeur Exploitation', NULL, '1'),
	(26, 45, 'Nassibou Pierre', '02 62 90 84 09', '06 93 39 75 08', 'pierre.nassibou@cr-reunion.fr', NULL, NULL, '1'),
	(27, 1, 'FABRE Emmanuel', '04 90 18 32 53', NULL, 'Emmanuel.Fabre@developpement-durable.gouv.fr', 'Chef du CEI de de Saint Martin de Crau', 'Zone du Salat\n13, av. Galilée\n13310 Saint-Martin-de-Crau', '2'),
	(28, 3, 'AYRINHAC Jean-Pierre', '05 65 61 46 21', NULL, 'Jean-pierre.Ayrinhac@developpement-durable.gouv.fr', 'Chef du CEI "La cavalerie"', 'route saint Rome de Cernon', '2'),
	(29, 5, 'VERGNOL Jean-Louis', '04 73 29 79 25', NULL, 'jean-louis.vergnol@developpement-durable.gouv.fr', 'Chargé d\'études chaussées', NULL, '2'),
	(30, 6, 'SCHNEIDER Stéphane', '04 67 30 78 40', NULL, 'stephane.schneider@developpement-durable.gouv.fr', 'Chef du CEI de Servian', 'Lieu dit, Les champs noirs', '2'),
	(31, 7, 'BOYER Daniel', '04 67 17 91 57', NULL, 'dboyer@cd34.fr', 'Responsable Exploitation du centre de Lunel', NULL, '2'),
	(32, 8, 'SIGAUD Jacques', NULL, '06 99 80 39 80', 'jsigaud@departement06.fr', 'Responsable du centre d\'exploitation de Villars sur Var', NULL, '2'),
	(33, 10, 'COUTANT Bruno', '04 67 13 74 42', '06 80 17 24 37', 'bruno.coutant@developpement-durable.gouv.fr', 'Chef de  Projet au SIR de Montpellier', '520, allée Henri II de Montmorency', '2'),
	(34, 9, 'AFFRE Claude', NULL, NULL, 'caffre@herault.fr', 'Chef du centre de Beziers', NULL, '2'),
	(35, 11, 'CAUMES Francis', '05 65 70 26 43', NULL, 'Francis.Caumes@developpement-durable.gouv.fr', 'Chef du CEI de Séverac-Le-Château', 'rue Garenne\n48000 Mende', '2'),
	(36, 12, 'TREMOULLET Gilles', '04 66 42 66 67', '06 66 42 99 47', 'gilles.tremoulet@developpement-durable.gouv.fr', 'Chef du CEI de Mende', 'rue Garenne\n48000 Mende', '2'),
	(37, 13, 'BONET Joël', '04 13 31 94 82', '06 11 72 57 53', NULL, NULL, NULL, '2'),
	(38, 31, 'ESTRADE Christophe', '04 66 28 22 22', '06 23 84 30 48', 'Christophe.ESTRADE@eiffage.com', 'Conducteur de travaux', '166, Route de Beaucaire - CS 20001 - 30034 NIMES Cedex 1', '2'),
	(39, 26, 'Martin Sébastien', '04 42 15 12 27', '06 71 90 47 25', 'sebastien.martin@colas-mm.com', 'Adjoint Technique Provences-Alpes', NULL, '2'),
	(40, 26, 'NEIGE Raymond', '04 42 15 12 27', '06 71 90 47 25', 'raymond.nege@colas-mm.com', NULL, NULL, '2'),
	(41, 9, 'JORDY Stéphane', '04 68 27 82 50', NULL, NULL, 'chef d\'agence OLONZAC', NULL, '2'),
	(42, 42, 'ROUX Jean-Charles', '04 42 06 70 31', NULL, 'jean-charles.roux@eurovia.com', 'Ingénieur travaux', NULL, '2'),
	(43, 31, 'BOREL Thierry', NULL, '06 86 41 01 08', 'thierry.borel@eiffage.com', 'Conducteur de travaux', NULL, '2');
/*!40000 ALTER TABLE `contact_client` ENABLE KEYS */;


-- Export de la structure de table sapei. corresp
CREATE TABLE IF NOT EXISTS `corresp` (
  `id_sapei` int(11) DEFAULT NULL,
  `kage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.corresp: ~12 rows (environ)
DELETE FROM `corresp`;
/*!40000 ALTER TABLE `corresp` DISABLE KEYS */;
INSERT INTO `corresp` (`id_sapei`, `kage`) VALUES
	(1, 2703),
	(2, 1796),
	(3, 1599),
	(4, 1593),
	(5, 2351),
	(6, 314),
	(7, 453),
	(8, 1707),
	(9, 148),
	(10, 843),
	(11, 2407),
	(12, 823);
/*!40000 ALTER TABLE `corresp` ENABLE KEYS */;


-- Export de la structure de table sapei. docs
CREATE TABLE IF NOT EXISTS `docs` (
  `docId` varchar(255) NOT NULL DEFAULT 'NO' COMMENT 'Identifiant du document',
  `_blob` longtext COMMENT 'Le document encodé au format BASE64',
  `filename` varchar(255) DEFAULT NULL COMMENT 'Le nom du fichier',
  `type` varchar(50) DEFAULT NULL COMMENT 'Le type MIME du fichier',
  `size` int(11) DEFAULT NULL COMMENT 'La taille du fichier',
  PRIMARY KEY (`docId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.docs: ~0 rows (environ)
DELETE FROM `docs`;
/*!40000 ALTER TABLE `docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `docs` ENABLE KEYS */;


-- Export de la structure de table sapei. dpt
CREATE TABLE IF NOT EXISTS `dpt` (
  `IdDepartement` int(11) NOT NULL COMMENT 'Ordre',
  `Num_dpt` varchar(3) NOT NULL DEFAULT '' COMMENT 'Numéro du département',
  `Lib_dpt` varchar(255) NOT NULL DEFAULT '' COMMENT 'Libellé du département',
  PRIMARY KEY (`IdDepartement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des départements';

-- Export de données de la table sapei.dpt: ~102 rows (environ)
DELETE FROM `dpt`;
/*!40000 ALTER TABLE `dpt` DISABLE KEYS */;
INSERT INTO `dpt` (`IdDepartement`, `Num_dpt`, `Lib_dpt`) VALUES
	(1, '04', 'Alpes de Haute Provence'),
	(2, '05', 'Hautes Alpes'),
	(3, '06', 'Alpes Maritimes'),
	(4, '13', 'Bouches du Rhone'),
	(5, '83', 'Var'),
	(6, '84', 'Vaucluse'),
	(7, '11', 'Aude'),
	(8, '30', 'Gard'),
	(9, '34', 'Hérault'),
	(10, '48', 'Lozère'),
	(11, '66', 'Pyrénées orientales'),
	(12, '2A', 'Corse du Sud'),
	(13, '2B', 'Haute Corse'),
	(14, '971', 'Guadeloupe'),
	(15, '972', 'Martinique'),
	(16, '973', 'Guyane'),
	(17, '974', 'Réunion'),
	(18, '975', 'Saint Pierre et Miquelon'),
	(19, '01', 'Ain'),
	(20, '02', 'Aisne'),
	(21, '03', 'Allier'),
	(25, '07', 'Ardèche'),
	(26, '08', 'Ardennes'),
	(27, '09', 'Ariège'),
	(28, '10', 'Aube'),
	(30, '12', 'Aveyron'),
	(32, '14', 'Calvados'),
	(33, '15', 'Cantal'),
	(34, '16', 'Charente'),
	(35, '17', 'Charente-Maritime'),
	(36, '18', 'Cher'),
	(37, '19', 'Corrèze'),
	(40, '21', 'Côte-d\'or'),
	(41, '22', 'Côtes-d\'armor'),
	(42, '23', 'Creuse'),
	(43, '24', 'Dordogne'),
	(44, '25', 'Doubs'),
	(45, '26', 'Drôme'),
	(46, '27', 'Eure'),
	(47, '28', 'Eure-et-Loir'),
	(48, '29', 'Finistère'),
	(50, '31', 'Haute-Garonne'),
	(51, '32', 'Gers'),
	(52, '33', 'Gironde'),
	(54, '35', 'Ile-et-Vilaine'),
	(55, '36', 'Indre'),
	(56, '37', 'Indre-et-Loire'),
	(57, '38', 'Isère'),
	(58, '39', 'Jura'),
	(59, '40', 'Landes'),
	(60, '41', 'Loir-et-Cher'),
	(61, '42', 'Loire'),
	(62, '43', 'Haute-Loire'),
	(63, '44', 'Loire-Atlantique'),
	(64, '45', 'Loiret'),
	(65, '46', 'Lot'),
	(66, '47', 'Lot-et-Garonne'),
	(68, '49', 'Maine-et-Loire'),
	(69, '50', 'Manche'),
	(70, '51', 'Marne'),
	(71, '52', 'Haute-Marne'),
	(72, '53', 'Mayenne'),
	(73, '54', 'Meurthe-et-Moselle'),
	(74, '55', 'Meuse'),
	(75, '56', 'Morbihan'),
	(76, '57', 'Moselle'),
	(77, '58', 'Nièvre'),
	(78, '59', 'Nord'),
	(79, '60', 'Oise'),
	(80, '61', 'Orne'),
	(81, '62', 'Pas-de-Calais'),
	(82, '63', 'Puy-de-Dôme'),
	(83, '64', 'Pyrénées-Atlantiques'),
	(84, '65', 'Hautes-Pyrénées'),
	(86, '67', 'Bas-Rhin'),
	(87, '68', 'Haut-Rhin'),
	(88, '69', 'Rhône'),
	(89, '70', 'Haute-Saône'),
	(90, '71', 'Saône-et-Loire'),
	(91, '72', 'Sarthe'),
	(92, '73', 'Savoie'),
	(93, '74', 'Haute-Savoie'),
	(94, '75', 'Paris'),
	(95, '76', 'Seine-Maritime'),
	(96, '77', 'Seine-et-Marne'),
	(97, '78', 'Yvelines'),
	(98, '79', 'Deux-Sèvres'),
	(99, '80', 'Somme'),
	(100, '81', 'Tarn'),
	(101, '82', 'Tarn-et-Garonne'),
	(104, '85', 'Vendée'),
	(105, '86', 'Vienne'),
	(106, '87', 'Haute-Vienne'),
	(107, '88', 'Vosges'),
	(108, '89', 'Yonne'),
	(109, '90', 'Territoire de Belfort'),
	(110, '91', 'Essonne'),
	(111, '92', 'Hauts-de-Seine'),
	(112, '93', 'Seine-Saint-Denis'),
	(113, '94', 'Val-de-Marne'),
	(114, '95', 'Val-d\'oise'),
	(115, '999', 'Etranger');
/*!40000 ALTER TABLE `dpt` ENABLE KEYS */;


-- Export de la structure de table sapei. etat_avancement_job
CREATE TABLE IF NOT EXISTS `etat_avancement_job` (
  `Id_Stat` int(11) NOT NULL DEFAULT '0' COMMENT 'Id Avancement',
  `Valeur_Stat` varchar(50) NOT NULL DEFAULT '0' COMMENT 'Etat d''avancement',
  PRIMARY KEY (`Id_Stat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Etat d''avancement du job';

-- Export de données de la table sapei.etat_avancement_job: ~0 rows (environ)
DELETE FROM `etat_avancement_job`;
/*!40000 ALTER TABLE `etat_avancement_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `etat_avancement_job` ENABLE KEYS */;


-- Export de la structure de table sapei. etat_avancement_ope
CREATE TABLE IF NOT EXISTS `etat_avancement_ope` (
  `Id_Stat_ope` int(11) NOT NULL DEFAULT '0' COMMENT 'Id Avancement opération',
  `Valeur_Stat_ope` varchar(50) NOT NULL DEFAULT '0' COMMENT 'Etat d''avancement de l''opération',
  PRIMARY KEY (`Id_Stat_ope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Etat d''avancement opération';

-- Export de données de la table sapei.etat_avancement_ope: ~0 rows (environ)
DELETE FROM `etat_avancement_ope`;
/*!40000 ALTER TABLE `etat_avancement_ope` DISABLE KEYS */;
/*!40000 ALTER TABLE `etat_avancement_ope` ENABLE KEYS */;


-- Export de la structure de table sapei. etude
CREATE TABLE IF NOT EXISTS `etude` (
  `Id_etude` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''étude',
  `Id_job` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifiant du job concerné',
  `Id_agent` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifiant de l''agent chargé de l''étude',
  `Id_Etape` int(11) NOT NULL DEFAULT '0' COMMENT 'Etat d''avancement de l''étape de l''étude',
  `Rang` int(11) NOT NULL DEFAULT '0' COMMENT 'Rang de l''étape concernée dans cette étude pour ce job',
  PRIMARY KEY (`Id_etude`),
  KEY `FK_Etude_job` (`Id_job`),
  KEY `FK_etude_steps` (`Id_Etape`),
  CONSTRAINT `FK_Etude_job` FOREIGN KEY (`Id_job`) REFERENCES `job` (`Id_job`),
  CONSTRAINT `FK_etude_steps` FOREIGN KEY (`Id_Etape`) REFERENCES `steps` (`Id_step`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table des études';

-- Export de données de la table sapei.etude: ~0 rows (environ)
DELETE FROM `etude`;
/*!40000 ALTER TABLE `etude` DISABLE KEYS */;
/*!40000 ALTER TABLE `etude` ENABLE KEYS */;


-- Export de la structure de table sapei. job
CREATE TABLE IF NOT EXISTS `job` (
  `Id_job` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''activité',
  `Id_contact_client` int(11) DEFAULT NULL,
  `Id_client_rattache` int(11) DEFAULT NULL,
  `Id_client_principal` int(11) DEFAULT NULL,
  `Date_prise_job` date DEFAULT NULL COMMENT 'Date de la prise en comtpe de l''activité',
  `Id_type_prestation` int(11) DEFAULT NULL COMMENT 'Identifiant de la prestation',
  `Intitule_job` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Inititulé de l''activité',
  `Nature_job` text COMMENT 'Nature de l''activité',
  `Date_livrable_job` date DEFAULT NULL COMMENT 'Date de remise du livrable attendue',
  `Id_type_chaussee` int(11) DEFAULT NULL COMMENT 'Identifiant du type de chaussée',
  `Date_affectation_job` date DEFAULT NULL COMMENT 'Date d''initialisation de l''activité',
  `Dmd_protection_job` varchar(255) DEFAULT NULL COMMENT 'Demande de protection pour l''activité',
  `Id_pilote_job` int(11) DEFAULT NULL COMMENT 'Identifiant de l''agent pilote de l''activité (kage)',
  `Statut_job` int(11) DEFAULT NULL COMMENT 'Clos/Pas clos',
  `PRD_job` int(11) DEFAULT NULL COMMENT 'Point départ des mesures',
  `PRD` varchar(50) DEFAULT NULL,
  `PRF` varchar(50) DEFAULT NULL,
  `ABD_job` int(11) DEFAULT NULL COMMENT 'Point abscisse début des mesures',
  `PRF_job` int(11) DEFAULT NULL COMMENT 'Point fin des mesures',
  `ABF_job` int(11) DEFAULT NULL COMMENT 'Point abscisse fin mesures',
  `Sens_job` int(11) DEFAULT NULL COMMENT 'Sens de la circulation sur l''axe',
  `Comment_sens_job` text COMMENT 'Commentaire sur le sens de circulation',
  `Comment_avance_mesure_job` text COMMENT 'Commentaire sur l''avancement des mesures',
  `Comment_avance_traite_job` text COMMENT 'Commentaire sur l''avancement des traitements',
  `Longueur_mesure_job` int(11) DEFAULT NULL COMMENT 'Longueur de l''axe à traiter (en mètre)',
  `Etat_avance_job` int(11) DEFAULT NULL COMMENT 'Etat d''avancement global de l''activité',
  `Suivi_job` varchar(255) DEFAULT NULL COMMENT 'Suivi de l''activité',
  `Comment_dmd_protec_job` text COMMENT 'Commentaire sur la demande de protection',
  `Num_SIGMA_job` varchar(50) DEFAULT NULL COMMENT 'Numéro SIGMA affecté à l''activité',
  `PJ_job` text COMMENT 'Pièce jointe pour complément',
  `Id_axe` int(11) DEFAULT NULL,
  `Id_dpt` int(11) DEFAULT NULL,
  `avancement` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_job`),
  KEY `FK_job_type_prestation` (`Id_type_prestation`),
  KEY `FK_job_type_chaussee` (`Id_type_chaussee`),
  KEY `FK_job_sens` (`Sens_job`),
  KEY `Id_contact_client` (`Id_contact_client`),
  KEY `Id_dpt` (`Id_dpt`),
  KEY `Id_client_rattache` (`Id_client_rattache`),
  KEY `Id_client_principal` (`Id_client_principal`),
  KEY `FK_job_axe` (`Id_axe`),
  KEY `FK_job_job_statut` (`Statut_job`),
  CONSTRAINT `FK_job_axe` FOREIGN KEY (`Id_axe`) REFERENCES `axe` (`Id_axe`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_job_client_origine` FOREIGN KEY (`Id_contact_client`) REFERENCES `client_origine` (`Id_client_origine`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_job_contact_client` FOREIGN KEY (`Id_client_principal`) REFERENCES `contact_client` (`Id_contact_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_job_dpt` FOREIGN KEY (`Id_dpt`) REFERENCES `dpt` (`IdDepartement`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_job_job_statut` FOREIGN KEY (`Statut_job`) REFERENCES `job_statut` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_job_sens` FOREIGN KEY (`Sens_job`) REFERENCES `sens` (`Id_sens`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_job_type_chaussee` FOREIGN KEY (`Id_type_chaussee`) REFERENCES `type_chaussee` (`Id_type_chaussee`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_job_type_prestation` FOREIGN KEY (`Id_type_prestation`) REFERENCES `type_prestation` (`Id_type_prestation`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='Table d''initialisation de l''activité';

-- Export de données de la table sapei.job: ~119 rows (environ)
DELETE FROM `job`;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` (`Id_job`, `Id_contact_client`, `Id_client_rattache`, `Id_client_principal`, `Date_prise_job`, `Id_type_prestation`, `Intitule_job`, `Nature_job`, `Date_livrable_job`, `Id_type_chaussee`, `Date_affectation_job`, `Dmd_protection_job`, `Id_pilote_job`, `Statut_job`, `PRD_job`, `PRD`, `PRF`, `ABD_job`, `PRF_job`, `ABF_job`, `Sens_job`, `Comment_sens_job`, `Comment_avance_mesure_job`, `Comment_avance_traite_job`, `Longueur_mesure_job`, `Etat_avance_job`, `Suivi_job`, `Comment_dmd_protec_job`, `Num_SIGMA_job`, `PJ_job`, `Id_axe`, `Id_dpt`, `avancement`, `total`) VALUES
	(2, 2, 17, 1, NULL, 1, 'APL + RUGO + ECODYN  sur RN113 entre PR 71+500 à 78+400 et PR65+300 à 61+500', 'Mesures d&apos;APL sur RN113 entre PR 71+500 à 78+400 et PR65+300 à 61+500 en VL+VR\n+ Rugo en VL et VR\n+ Ecodyn', NULL, 2, '2015-09-30', NULL, 2703, 7, 71, '71+500', '78+400', 500, 78, 400, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 4, 1, 10),
	(4, 11, 30, 13, '2015-09-30', 1, 'Multi-mesures Plan 44T. Mesures de suivi de l&apos;A75', 'Mesures  radar, APL, Rugo sur les VL et VR\nRugo rive +axe, sur les 2 voies\nUn passage IRCAN', NULL, 2, '2015-10-28', NULL, 2703, 7, 248, '248+0', '228+0', 0, 228, 0, 3, NULL, NULL, NULL, 40000, NULL, NULL, NULL, NULL, NULL, 10, 30, 1, 10),
	(5, 8, 26, 9, '2015-10-01', 1, 'Déflexions sur les planches expérimentales COLGRILL R de l&apos;A54 entre Arles &amp; Nîmes\nPrestation identique à celle réalisée en 2013', 'Mesures de déflexions au déflectographe sur les planches expérimentales COLGRILL R de l&apos;A54 entre Arles &amp; Nîmes\nPrestation identique à celle réalisée en 2013\nDevis à établir\nTraitement déflecto en WFLX &#40;A préciser&#41;', NULL, 2, '2015-10-01', NULL, 2703, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 8, 3, 10),
	(8, 3, 5, 2, '2015-03-08', 2, '48 RN88 Traversée de la gare de Chanac PR70+810 à 73+000 - priorité P1', 'Définir les zones de purges pour travaux 2015/2016', '2015-12-14', 1, '2015-12-03', NULL, 1599, 7, 70, '70+810', '73+0', 810, 73, 0, 1, NULL, NULL, NULL, 4000, NULL, NULL, NULL, 'C15MX0156', NULL, 11, 10, 6, 10),
	(9, 3, 5, 2, '2015-03-08', 2, '48 RN88 Cultures 67+040 au 69+850 - prioirité P1\nEtude.', 'Etude d&apos;entretien à réaliser', '2015-11-30', 1, '2015-11-05', NULL, 1599, 7, 67, '67+40', '69+850', 40, 69, 850, 1, NULL, NULL, NULL, 6000, NULL, NULL, NULL, 'C15MX0156', NULL, 11, 10, 2, 10),
	(10, 3, 5, 2, '2015-03-08', 2, '48 RN106 Florac / Nozières 51+500 à 58+500 - prioirité P2', 'Etude d&apos;entretien à réaliser', NULL, NULL, NULL, NULL, 1599, 4, 51, '51+500', '58+500', 500, 58, 500, 2, NULL, NULL, NULL, 14000, NULL, NULL, NULL, NULL, NULL, 12, 10, 1, 10),
	(11, 3, 5, 2, '2015-03-08', 2, '48 RN106 Suite du PAI &#40;se rapprocher du SIR de Mende&#41; - prioirité P2', 'Etude d&apos;entretien à réaliser', NULL, NULL, NULL, NULL, 1599, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 10, 1, 10),
	(13, 3, 5, 2, '2015-10-06', 1, 'Carottage sur 48A75 Le Monastier / Montjezieu PR159+320 à 169+270\n+ déflexion  Sens 2 PR159  à  PR170 &#40;commande JL Vergnol&#41;', 'Vérification du collage des couches + déflexion', NULL, 2, '2015-11-09', NULL, 2703, 1, 159, '159+320', '169+270', 320, 169, 270, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, 2, 10),
	(14, 3, 5, 2, '2015-10-06', 1, 'Carottage 12A75 La cavalerie PR234+100 à 240+025', 'Carottage 12A75 La cavalerie PR234+100 à 240+025', NULL, 2, NULL, NULL, 2703, 8, 234, '234+100', '240+25', 100, 240, 25, 2, NULL, NULL, NULL, 5925, NULL, NULL, NULL, NULL, NULL, 10, 30, 1, 10),
	(16, 3, 5, 2, '2015-10-06', 1, 'Carottage 12A75 campagnac PR181+000 à 186+140 &#40;travaux 2017&#41;', 'Carottage épaisseur couche de roulement &#40;fissures BDR&#41;', NULL, 2, NULL, NULL, 2703, 8, 181, '181+0', '186+140', 0, 186, 140, 2, NULL, NULL, NULL, 5140, NULL, NULL, NULL, NULL, NULL, 10, 30, NULL, 1),
	(17, 3, 5, 2, '2015-10-06', 1, 'Carottage 34A75 Escalette Pr261+700 à 262+589', NULL, NULL, 2, NULL, NULL, 2703, 8, 261, '261+700', '262+589', 700, 262, 589, 2, NULL, NULL, NULL, 889, NULL, NULL, NULL, NULL, NULL, 10, 9, 1, 10),
	(18, 3, 5, 2, '2015-10-06', 1, 'APL 48A75 Le Monastier / Montjezieu PR159+320 à 169+270\nSOUS TRAITEE !', NULL, NULL, 2, NULL, NULL, 2703, 11, 159, '159+320', '169+270', 320, 169, 270, 2, NULL, NULL, NULL, 9950, NULL, NULL, NULL, NULL, NULL, 10, 10, 5, 10),
	(19, 3, 5, 2, '2015-10-06', 1, 'APL Campagnac PR181+000 à 186+140\nPriorité 2', NULL, NULL, 2, NULL, NULL, 2703, 8, 181, '181+0', '186+140', 0, 186, 140, 2, NULL, NULL, NULL, 5140, NULL, NULL, NULL, NULL, NULL, 10, 30, 2, 10),
	(20, 3, 5, 2, '2015-10-06', 1, 'APL  48N88 Pelouse Pr38+800 à 43+000\nPriorité 3', 'Analyse des des fissures transversales', NULL, 2, NULL, NULL, 2703, 8, 38, '38+800', '43+0', 800, 43, 0, 2, NULL, NULL, NULL, 4200, NULL, NULL, NULL, NULL, NULL, 11, 10, 1, 10),
	(21, 3, 5, 2, '2015-03-08', 1, 'Déflexion  A75D 180+000 à 252+705\nECF Juin 2015 &#40;PR 244  à 256&#41;', 'Traitement déflecto en FOMEC', NULL, 2, NULL, NULL, 2703, 7, 180, '180+0', '252+705', 0, 252, 705, 2, NULL, NULL, NULL, 70721, NULL, NULL, NULL, NULL, NULL, 10, 30, 5, 10),
	(22, 3, 5, 2, '2015-03-08', 1, 'Déflexion  A75G 180+000 à 228+000\nReste à faire PR 228 - 223 etPR 219 -216', 'Traitement déflecto en FOMEC', NULL, 2, '2015-11-09', NULL, 2703, 7, 180, '180+0', '228+0', 0, 228, 0, 3, NULL, NULL, NULL, 45924, NULL, NULL, NULL, NULL, NULL, 10, 30, 2, 10),
	(23, 3, 5, 2, '2015-03-08', 1, 'Déflexion  A75G 248+000 à 252+710\nECF juin 2015 &#40;PR 244 à 256&#41;', 'Traitement déflecto en FOMEC car transmis au Labo de Clermont-Ferrand', NULL, 2, NULL, NULL, 2703, 7, 248, '248+0', '252+710', 0, 252, 710, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 30, 5, 10),
	(24, 3, 5, 2, '2015-03-08', 1, 'Déflexion RN88  0+000 à 2+800', NULL, NULL, 2, NULL, NULL, 2703, 1, 0, '0+0', '2+800', 0, 2, 800, 2, NULL, NULL, NULL, 2800, NULL, NULL, NULL, NULL, NULL, 11, 30, 5, 10),
	(25, 3, 5, 2, '2015-03-08', 1, 'Déflexion RN88G  0+000 à 2+800', NULL, NULL, 2, '2015-10-12', NULL, 2703, 1, 0, '0+0', '2+800', 0, 2, 800, 3, NULL, NULL, NULL, 1791, NULL, NULL, NULL, NULL, NULL, 11, 30, 5, 10),
	(26, 11, 30, 13, NULL, 1, 'Multi-mesures Veille technique 3E+R et PlanB 44 tonnes &#40;DIR MC&#41;\n34 A75  PR 316 à 318, veille 3E+R : Chantier de 2008. Durée du suivi prolongée à 4 ans\n34 A75  PR 316 à 330+481, plan B 44T', 'Essais à réaliser veille technique : En novembre 2015\nimages, relevé de dégradations, mesures CFL, uni longitudinal &#40;QSPO&#41;; macrotexture &#40;rugo rive et axe&#41; ,  essais de module &#40;traction directe et compression diamétrale&#41;, caractéri', NULL, 2, NULL, NULL, 2703, 8, 316, '316+0', '318+0', 0, 318, 0, 2, NULL, NULL, NULL, 4000, NULL, NULL, NULL, NULL, NULL, 10, 9, 10, 10),
	(28, 11, 30, 13, NULL, 1, 'Multi-mesures  VEGELIA - Programme de soutien innovation routière. \nRD 4 PR12+564 à 13+153. Septembre 2012. Durée 3 ans. MOA CD83', 'RUGO + IRCAN + TUS + SSV\nRUGO + IRCAN + TUS suivi abandonné car mise en œuvre d&apos;un tapis\nIl n&apos;y aura qu&quot;un passage SSV en M2 en juin 2016', NULL, NULL, '2015-10-28', NULL, 2703, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 5, 2, 10),
	(29, 11, 30, 13, NULL, 1, 'Multi-mesures  BIOCOLD - Programme de soutien innovation routière. RD21 PR 20+000 à 21+270. Chantier de septembre 2014. Durée 3ans\nSitué sur le réseau du CD06', 'Septembre - octobre 2015 :\nRUGO + IRCAN + TUS + SSV', NULL, 1, '2015-10-13', NULL, 2703, 7, 20, '20+0', '21+270', 0, 21, 270, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, 3, 3, 10),
	(31, 12, 31, 14, NULL, 1, 'APL avant et après Tx - Commune  de Marguerites', 'APL avant et après Tx', NULL, NULL, '2015-10-28', NULL, 2703, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, 8, 2, 10),
	(32, 11, 36, 15, NULL, 1, 'Mesures APL avant et Après Tx 2015 Commande annuelle . Le bon de commande concerne les Rd613,32,612,908,909', NULL, NULL, NULL, '2015-10-28', NULL, 2703, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'C15MX0140', NULL, 26, 9, 3, 10),
	(33, 2, 17, 1, NULL, 1, 'Commande annuelle de 2014  concernant le District urbain de la DIR MED. Passage IRCAN dans les 2 sens de circulation sur l&apos;ensemble du réseau', 'Passage IRCAN. En plus de la commande DtecITM.', NULL, 2, '2015-10-28', NULL, 2703, 7, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 4, 4, 10),
	(34, 2, 17, 1, NULL, 1, 'Commande annuelle 2015 du District Rhônes Cévennes &#40;DRC&#41; pour passage IRCAN.\nPlusieurs axes et départements sont concernés. Un sens sur BIDI et 2 sens sur chaussées séparées.', NULL, NULL, NULL, '2015-10-28', NULL, 2703, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 8, 2, 10),
	(38, 3, 5, 2, NULL, 1, 'Visuline District Centre 485 Km de réseau bidirectionnel', 'VISULINE', NULL, 1, NULL, NULL, 2703, 8, 0, '0+0', '136+150', 0, 136, 150, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 33, 1, 10),
	(39, 3, 5, 2, NULL, 1, 'ECODYN 350Km de réseau 2x2 \nDépartt 63,15,43,48,12,34', NULL, NULL, 2, NULL, NULL, 2703, 6, 0, '0+0', NULL, 0, 330, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 2, 10),
	(40, 2, 17, 1, '2015-10-18', 1, 'ECODYN sur tout le réseau de la DIR MED. Commande de 2014', NULL, NULL, 2, NULL, NULL, 2703, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 4, 3, 10),
	(41, 3, 5, 2, '2015-03-10', 2, '48 RN88 Pierre Planté PR29 à 31+800', 'Définition des zones de purge à partir du radar', '2015-12-14', 1, '2015-12-03', NULL, 1599, 7, 29, '29+0', '31+800', 0, 31, 800, 1, NULL, NULL, NULL, 4000, NULL, NULL, NULL, 'C15MX0156', NULL, 11, 10, 2, 10),
	(42, 3, 5, 2, '2015-03-10', 2, '48 RN88 Les Salleles PR80 à 75+500', 'Définition des zones de purges &#40;problème géotechnique&#41;', '2015-12-14', 1, '2015-12-03', NULL, 1599, 7, 80, '80+0', '75+500', 0, 75, 500, 1, NULL, NULL, NULL, 10000, NULL, NULL, NULL, 'C15MX0156', NULL, 11, 10, 1, 10),
	(45, 2, 17, 1, '2015-01-04', 2, '13 RN568 PR0 à PR20', 'Etude d&apos;entretien', NULL, 2, '2015-11-05', NULL, 1599, 2, 0, '0+0', '20+0', 0, 20, 0, 1, NULL, NULL, NULL, 40000, NULL, NULL, NULL, NULL, NULL, 27, 4, 2, 10),
	(46, 11, 36, 15, '2015-07-22', 2, '34 RD610 PR0+725 à PR2+190 et 34 RD65 PR1+556 à PR4+232', 'Etude d&apos;entretien\nTraitement Déflecto WFLX', '2016-04-10', 1, '2015-11-05', NULL, 1599, 2, 0, '0+725', '4+232', 725, 4, 232, 1, NULL, NULL, NULL, 10000, NULL, NULL, NULL, 'C15MX0301', NULL, 26, 9, 2, 10),
	(47, 11, 36, 15, '2015-09-20', 2, '34 RD128 PR17+800 à 19+050', 'Etude de faisabilité de retraitement à froid', NULL, 1, NULL, NULL, 1599, 8, 17, '17+800', '19+50', 800, 19, 50, 1, NULL, NULL, NULL, 2400, NULL, NULL, NULL, NULL, NULL, 7, 9, 1, 10),
	(49, 15, 38, 17, '2015-03-10', 2, 'CEA Cadarache - Etude prélimianire de réouverture du barrage pont, partie Chaussées', 'diagnostic de la section et dimensionnement des besoins d&apos;entretien\nTraitement déflecto en WFLX\nIRCAN', NULL, 1, '2015-08-02', NULL, 1599, 7, 0, '0+0', '4+900', 0, 4, 900, 1, NULL, NULL, NULL, 5800, NULL, NULL, NULL, NULL, NULL, 28, 4, 4, 10),
	(50, 6, 24, 6, '2014-11-24', 2, 'Diagnostic du réseau routier de la base navale de Toulon et définition d&apos;un programme de travaux', 'Auscultation et programmation des travaux', '2015-12-14', 5, '2015-05-17', NULL, 1599, 1, 0, '0+0', '23+0', 0, 23, 0, 1, NULL, NULL, NULL, 23000, NULL, NULL, NULL, 'C15MX0255', NULL, 26, 5, 5, 10),
	(51, 2, 17, 1, '2015-10-22', 1, 'Retroréflexion sur l&apos;ensemble du réseau de la DIR MED. Commande 2016\nDADS - DU - DRC', 'Retroréflexion sur l&apos;ensemble du réseau de la DIR MED. Commande 2016\nCommencer par le district des Alpes du sud', NULL, NULL, NULL, NULL, 2703, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 4, 1, 10),
	(52, 2, 17, 1, NULL, 1, 'Commande 2016 IRCAN District Alpes du Sud &#40;pour 17 K€&#41;\n + ECODYN ??&#40;à confirmer&#41;', NULL, NULL, NULL, NULL, NULL, 2703, 8, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 4, 1, 10),
	(53, 11, 30, 13, NULL, 5, 'Multi-mesures COLGRILL Alco - Programme de soutien innovation routière - CD34 - Chantier de juillet 2012 -  Durée du suivi : 5 ans\nImages, relevé dégradations, macro, orniérage, APL, déflexion. RD65 PR 12+900 à 13+575', 'Pour septembre 2015:\nRUGO + APL + IRCAN + TUS + SSV + déflexion\nDurée du suivi : 5 ans', NULL, 2, NULL, NULL, 2703, 1, 12, '12+900', '13+575', 900, 13, 575, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 9, 3, 10),
	(54, 11, 30, 13, NULL, 1, 'Multi mesures - Veille technique COLBIFIBRE - CD 34 - chantier de septembre 2013 - Durée du suivi 7 ans\nImages, relevé de dégradations RD14E25 PR0+820 à 2+412', 'Septembre 2015\nRUGO + IRCAN + TUS + SSV\nDurée du suivi 7 ans', NULL, 1, '2015-10-28', NULL, 2703, 7, 0, '0+820', '2+412', 820, 2, 412, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, 9, 4, 10),
	(55, 11, 30, 13, NULL, 5, 'Multi mesures - Veille technique - GB5 - CD34 - Chantier de novembre 2011 - Durée du suivi 8 ans\nImages, relevé de dégradations, déflexion, orniérage. RD612 PR56+200 à 62', 'Mars 2015 &#40;normalement novembre 2014&#41;\nImages, relevé de dégradations, déflexion, orniérage\nDurée du suivi 8 ans', NULL, 1, '2015-10-28', NULL, 2703, 1, 56, '56+200', '62+0', 200, 62, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 9, 3, 10),
	(56, 11, 36, 15, NULL, 5, 'Multi-mesures - Veille Technique - RECYCLOVIA - CD34 - Chantier de  mars 2012. Durée du suivi 5ans.  Convention  locale DTerMed / EUROVIA / CG34\nRD14 PR69+600 à 74+710', 'Mars 2015\nimages, relevé de dégradations, mesures de déflexion, orniérage, essais module\nrendu déflexion : Soit en WFLX soit en SI soit en PRA &#40;A PRECISER&#41;', NULL, 1, '2015-10-28', NULL, 2703, 1, 68, '68+600', '74+710', 600, 74, 710, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, 9, 2, 10),
	(57, 11, 30, 13, NULL, 1, 'Multi-mesures - BIOCOLD - Programme soutien innovation routière - CG34. Chantier réalisé en juin 2015 - Durée de suivi 3 ans RD128 PR6 à 9', 'Septembre Octobre 2015\nRUGO + APL+ IRCAN + TUS + SSV', NULL, 1, NULL, NULL, 2703, 7, 6, '6+0', '9+0', 0, 9, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 9, 3, 10),
	(58, 11, 36, 15, NULL, 1, 'Multi-Mesures - Veille Technique - Convention Locale DTerMed / EUROVIA / CD34 - RD68  PR11 à 19 &#40;2 sens&#41;', 'Mai 2015\nimages, relevé dégradations, ovalisation.', NULL, 1, '2015-10-28', NULL, 2703, 7, 11, '11+0', '19+0', 0, 19, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, 9, 2, 10),
	(59, 14, 37, 16, '2015-10-19', 1, 'Muti mesures - Marché Lot1 &quot;Réalisation de mesures et recensement à grand rendement&quot; ATTENTION : SCRIM  Bon de commande n°1', 'Bdc n°1\nTUS, RUGO, SCRIM, SSV, + radar sur réseau rouge + jaune 930km', '2016-05-15', NULL, '2015-10-28', NULL, 2703, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Protection pour SSV à caler\nContacter TechniSign.', NULL, NULL, 26, 4, 6, 10),
	(61, 9, 27, 10, '2015-10-18', 1, 'Mesure déflexion', 'Rendu WFLX  + note', NULL, 1, '2015-10-26', NULL, 2703, 7, 64, '64+800', '77+0', 800, 77, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, 3, 5, 10),
	(62, 11, 30, 13, NULL, 1, 'VISIODEC sur les Départements 12;13;30;34;48', 'Relevés de dégradations de l&apos;imagerie IQRN', NULL, NULL, '2015-11-09', NULL, 2703, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, 5, 10),
	(63, 11, 30, 13, '2015-10-27', 1, 'Multi Mesures - RN568 PR0 à 21 &#40;2 sens&#41; - Opération recherche DEDIR', 'Août -Octobre 2015\nMOGEO + RUGO + APL &#40;QSPO&#41; + TUS + SSV en M1', NULL, 1, NULL, NULL, 2703, 8, 0, '0+0', '21+0', 0, 21, 0, 1, NULL, NULL, NULL, 42000, NULL, NULL, NULL, NULL, NULL, 27, 4, 1, 10),
	(64, 11, 30, 13, '2015-10-27', 1, 'Multi Mesures - RN 85 PR60 à 75 Sens Plus - Opération de recherche DEDIR', 'Août -Octobre 2015\nMOGEO + RUGO + APL &#40;QSPO&#41; + TUS + SSV en M1', NULL, 2, NULL, NULL, 2703, 8, 60, '60+0', '75+0', 0, 75, 0, 2, NULL, NULL, NULL, 15000, NULL, NULL, NULL, NULL, NULL, 29, 1, 1, 10),
	(65, 11, 30, 13, '2015-10-27', 1, 'Multi Mesures  - RN202 PR0 à 30 sens plus - Opération de recherche DEDIR', 'Août -Octobre 2015\nMOGEO + RUGO + APL &#40;QSPO&#41; + TUS + SSV en M1', NULL, 2, NULL, NULL, 2703, 8, 0, '0+0', '30+0', 0, 30, 0, 2, NULL, NULL, NULL, 30000, NULL, NULL, NULL, NULL, NULL, 31, 1, 1, 10),
	(67, 11, 36, 15, NULL, 1, 'Déflexion RD 28  PR 13+500 à 17+000. &#40;2 voies&#41;. Entre Béziers et Bessan', NULL, '2015-12-20', NULL, '2015-10-29', NULL, 2703, 7, 13, '13+500', '17+0', 500, 17, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, 9, 5, 10),
	(68, 16, 33, 18, NULL, 1, 'Multi mesures RN569  RUGO + APL', 'RUGO + APL', NULL, NULL, NULL, NULL, 2703, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, 4, 1, 10),
	(69, 17, 34, 19, '2015-10-29', 1, 'Devis Griptester + Rugo   RN193 entre Bastia et Corte 50 Km dans les 2 sens', 'Réalisation du devis', NULL, 1, NULL, NULL, 2703, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, 3, 1, 10),
	(70, 2, 17, 1, NULL, 1, 'APL - RN85 PRAS-TAC- contrôle extérieur', 'Pour 2016\nAPL dans le cadre du contrôle extérieur du marché TAC.\nDemande de Bruno COUTANT Chef de projet au SIR de Montpellier', NULL, NULL, NULL, NULL, 2703, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, 1, 1, 10),
	(71, 1, 35, 20, '2015-11-09', 1, 'LGV CNM Lots 1 et 2 b - Déflecto sur PST', 'Déflecto sur PST', NULL, NULL, NULL, NULL, 2703, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'C15MX0402', NULL, 35, 9, 5, 10),
	(73, 11, 36, 15, NULL, 1, 'Déflecto RD 9', NULL, NULL, NULL, NULL, NULL, 2703, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 9, 5, 10),
	(75, 12, 31, 14, '2016-01-26', 1, 'APL sur voie de substitution RD936 entre giratoire RD114 c et giratoire RD225. Dans les 2 sens de circulation', NULL, NULL, 1, '2016-01-31', NULL, 2703, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, 8, 5, 10),
	(76, 8, 26, 9, '2015-11-23', 1, 'APL sur RD994 Veynes du carrefour DAI au carrefour de la Madeleine\nMesures à réaliser sur reprofilage avant mise en œuvre de la couche de roulement &#40;BBTM au liant modifié&#41;\nFin de section en agglomération. Exploitant : conseil départemental05', 'APL\nAPL avant travaux de 2012 dossier APEI/NS/JC/12-142', NULL, 1, '2015-11-29', NULL, 2703, 7, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 2200, NULL, NULL, NULL, NULL, NULL, 37, 2, 5, 10),
	(77, 11, 30, 13, NULL, 5, 'VEGELIA  - Veille technique - Avenue de Digne-La garde &#40;83&#41; - MOA : Toulon Provence Métropole &#40;83&#41;\nIRCAN + SSV', 'VEGELIA  - Veille technique - Avenue de Digne-La garde &#40;83&#41; - MOA : Toulon Provence Métropole &#40;83&#41;\nIRCAN + SSV\nChantier réalisé en novembre 2010. Durée du suivi 3 ans', NULL, NULL, NULL, NULL, 2703, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'C15ISO190', NULL, NULL, 5, 6, 10),
	(78, 15, 38, 17, '2015-11-29', 1, 'Mesures UNIBOX  / APL - PR71 à 78 et PR61 à 63+500 2 sens. Sur VL et VR', 'Mesures UNIBOX  / APL - PR71 à 78 et PR61 à 63+500 2 sens. Sur VL et VR', NULL, 2, '2015-11-29', NULL, 1796, 7, 71, NULL, NULL, NULL, 78, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 4, 1, 10),
	(79, 15, 38, 17, '2015-11-18', 3, 'Contournement Malijai - Digne RN85 PR 28 à 40', 'Demande par DCEDI - Pilote du projet Olivier Cardusi\nDossier d&apos;étude préalable pour DREAL PACA', '2016-04-14', 1, '2015-12-03', NULL, 1599, 1, 28, '28+0', '40+0', 0, 40, 0, 1, NULL, NULL, NULL, 24000, NULL, NULL, NULL, NULL, NULL, 29, 1, 10, 10),
	(80, 19, 40, 21, '2015-08-02', 1, 'Auscultation des chaussées de l&apos;aérodrome - priorité P1\nPiste 13/31 et 09/27\nTaxiway Echo, Fox et Golf\nParking NH90', 'Ausculation pour déterminer les structures de chaussée', '2016-01-14', 5, '2015-09-06', NULL, 1599, 1, 0, '0+0', '6+0', 0, 6, 0, 2, NULL, NULL, NULL, 6000, NULL, NULL, NULL, 'C15MX0309', NULL, 26, 5, 10, 10),
	(81, 20, 41, 22, '2015-02-15', 2, 'IQRN et IQRD Mayotte\nDéfintion du programme d&apos;entretien sur le RRN et RRD', 'Auscultation &#40;SSV,TUS, Adherence&#41; et établissement programme d&apos;entretein &#40;outil GiRR&#41;\nAdherence à réaliser par DLL &#40;DTer CE&#41;\nC14IS0070 = mesures\nC15MX0048 = intervention sur RD\nC15MX0249 = programmation RRN', '2016-01-28', 1, '2015-02-15', NULL, 1599, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'C15MX0249', NULL, 26, 18, 2, 10),
	(82, 11, 36, 15, '2015-11-04', 2, 'Etude d&apos;entretien RD177E15 Aigne -agence d&apos;Olonzac\nPR0+0 à 4 ou 3+895', 'Etude d&apos;entretien', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, 9, 1, 10),
	(84, 20, 41, 22, '2015-12-16', 1, 'Relevé IRCAN  DEAL Mayotte', NULL, NULL, NULL, NULL, NULL, 2703, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 18, 1, 10),
	(85, 15, 38, 17, '2015-12-16', 1, 'Modernisation POMMAR 2016', 'Réception et aménagement du nouveau Renault traffic.', NULL, NULL, NULL, NULL, 2703, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 10),
	(87, 21, 42, 23, '2016-01-18', 1, 'Mesures de déflexion de nuit RN113G PR 61+500 à PR 60+000 et PR 78+400 à 67+000 en VL', 'Mesure de déflexion', NULL, 2, '2016-01-18', NULL, 2703, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 4, 2, 10),
	(88, 1, 35, 20, '2016-01-11', 1, 'Déflexion CNM Lot 1 . Linéaire de 4 km sur 2 voies soit 8 Km de mesures', 'Déflexion CNM Lot 1 . Linéaire de 4 km sur 2 voies soit 8 Km de mesures', NULL, 5, '2016-01-12', NULL, 2703, 1, 67, '67+364', '65+800', 364, 65, 800, 1, NULL, NULL, NULL, 8000, NULL, NULL, NULL, 'C16MX0015-01', NULL, 35, 9, 5, 10),
	(89, 12, 31, 14, '2016-01-26', 1, 'Mesures APL RN106 PR9+600 à 10+400  suite à la mise en œuvre d&apos;un BB\n2x1 voie', 'Traiter les raccordements comme des points singuliers', NULL, NULL, '2016-01-31', NULL, 2703, 1, 9, '9+600', '10+400', 600, 10, 400, NULL, NULL, NULL, NULL, 1600, NULL, NULL, NULL, NULL, NULL, 12, 8, 5, 10),
	(90, 11, 36, 15, '2016-01-27', 1, 'Mesures APL sur RD 986 entre Montpellier et Saint-Gely du Fesc  PR 37+1400 à 39+ 860', 'Mesures d&apos;uni sur toutes les voies de la chaussée', NULL, 2, '2016-02-01', NULL, 2703, 1, 37, '37+1400', '39+860', 1400, 39, 860, 1, NULL, NULL, NULL, 8000, NULL, NULL, NULL, NULL, NULL, 40, 9, 2, 10),
	(92, 11, 30, NULL, '2016-01-27', 1, 'Mesure APL RD13 entre Pezenas et Saint-Thibery PR11+000 à 16+500 bidi\nsur GB5\nAvant Pose de BBTM prévue en avril 2016', 'CD 34 Agence de Pezenas\nMesure APL RD13 entre Pezenas et Saint-Thibery PR 11+000 à 16+500 bidi\nSur GB5\nAvant Pose de BBTM prévue en avril 2016', '2016-04-03', 1, '2016-02-16', NULL, 2703, 1, 11, '11+0', '16+500', 0, 16, 500, NULL, NULL, NULL, NULL, 15000, NULL, NULL, NULL, 'C15MX0422', NULL, 41, 9, 5, 10),
	(93, 11, 36, 15, '2016-02-02', 4, 'Assistance mises au point CCTP, analyse technique des offres et mis au point du suivi sur projet innovant RD 9 PR 0 à PR10\nMise en consultation en Septembre 2016\nAnalyse Octobre novembre 2016\nTravaux avril 2017', 'Définition des critères techniques, &#40;CCAP&#41;\nDéfinition des critères de performance dans le cadre du suivi\nCala ge des modalités de suivi\nAssistance dans l&apos;analyse des offres', NULL, 1, '2016-02-03', NULL, 2703, 1, 1, '1+0', '10+0', 0, 10, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, 9, 2, 10),
	(94, 12, 31, 14, '2016-02-08', 1, 'Mesures APL Avt Tx RN85 PR 31+540 à 33+876  dans les 2 sens.', 'APL sur les toutes les voies de chaussée', '2016-02-28', NULL, '2016-02-21', NULL, 2703, 1, 31, '31+540', '33+876', 540, 33, 876, NULL, NULL, NULL, NULL, 4600, NULL, NULL, NULL, NULL, NULL, 29, 1, 2, 10),
	(95, 22, 43, 24, '2016-02-15', 1, 'Mesure de déflexion + rayon de courbure projet de mise à 2x3 voies de l&apos;A57 sur 14 km \nSous traitance dans le cadre d&apos;un AO', NULL, NULL, 3, NULL, NULL, 2703, 10, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, 4, 2, 10),
	(98, 23, 44, 25, '2016-02-23', 1, 'Aéroport de Pointe Noire au Congo \nMesures APL sur piste  sur 3 couches + CFL sur couche de Roulement', 'Mesures + rapport &#40;sur place&#41;', NULL, NULL, NULL, NULL, 2703, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, 115, 1, 10),
	(100, 24, 45, 26, '2016-02-23', 1, 'Relevé IQRN + Visuline sur RN en 2x2 voies &#40;142 Km&#41;', NULL, NULL, NULL, NULL, NULL, 2703, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, 17, 4, 10),
	(101, 3, 5, 2, '2016-02-23', 1, 'Commande 2016 Passage Radar sur OA  PR 129+180 à 133+260 &#40;2 sens&#41; Lieu dit Rimeize\nPR 143+840 à 154+280 &#40;sens 1&#41; Lieu dit Le Piou\nDistrict Nord', NULL, NULL, 2, NULL, NULL, 2703, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, 1, 10),
	(103, 3, 5, 2, '2016-02-23', 1, 'Commande 2016 Radar sur OA PR 31+410 à 31+370 &#40;sens2&#41;\nLieu dit La Couze Pavin District Nord', NULL, NULL, 2, NULL, NULL, 2703, 1, 31, '31+410', '31+370', 410, 31, 370, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 82, 1, 10),
	(104, 3, 5, 2, '2016-02-23', 1, 'Commande 2016 IRCAN Totalité A75', 'Au pas de 10m sur A75, 5m sur échangeur et reste', NULL, NULL, NULL, NULL, 2703, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, 1, 10),
	(105, 3, 5, 2, '2016-02-23', 1, 'Commande 2016 IRCAN totalité de la RN122', NULL, NULL, NULL, NULL, NULL, 2703, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, 1, 10),
	(106, 3, 5, 2, '2016-02-23', 1, 'Commande 2016 IRCAN totalité RN106\nSi choix à faire pas la RN106', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, 1, 10),
	(107, 3, 5, 2, '2016-02-23', 1, 'Commande 2016 IRCAN totalité A750', NULL, NULL, NULL, NULL, NULL, 2703, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, 1, 10),
	(108, 3, 5, 2, '2016-02-23', 1, 'Commande 2017 IRCAN totalité RN88', NULL, NULL, NULL, NULL, NULL, 2703, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, 1, 10),
	(110, 3, 5, 2, '2016-02-23', 1, 'Commande 2017 IRCAN totalité RN102', NULL, NULL, NULL, NULL, NULL, 2703, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, NULL, 1, 10),
	(111, 3, 5, 2, '2016-02-23', 1, 'Commande 2018 IRCAN totalité A750', NULL, NULL, NULL, NULL, NULL, 2703, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, 1, 10),
	(112, 3, 5, 2, '2016-02-23', 1, 'Commande 2018 IRCAN totalité RN106', NULL, NULL, NULL, NULL, NULL, 2703, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, 1, 10),
	(113, 3, 5, 2, '2016-02-23', 1, 'commande 2018 IRCAN totalité RN 122', NULL, NULL, NULL, NULL, NULL, 2703, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, 1, 10),
	(114, 3, 5, 2, '2016-02-29', 1, 'Commande  2016 déflexion  48 RN106, 3 sections de GE à contrôler\nEnviron 13 Km de mesures', NULL, NULL, NULL, NULL, NULL, 2703, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 1, 10),
	(115, 3, 5, 2, '2016-02-29', 4, 'Commande 2016 Déflexion 48 RN88 dans sa intégralité dans le sens 1\nSauf PR29 à 32 dans les 2 sens  80 Km environ', NULL, NULL, NULL, NULL, NULL, 2703, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 10, 1, 10),
	(116, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;


-- Export de la structure de table sapei. job_axe
CREATE TABLE IF NOT EXISTS `job_axe` (
  `id_job_axe` int(11) NOT NULL AUTO_INCREMENT,
  `job` int(11) DEFAULT NULL,
  `axe` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_job_axe`),
  KEY `job` (`job`),
  KEY `axe` (`axe`),
  CONSTRAINT `FK_job_axe_axe` FOREIGN KEY (`axe`) REFERENCES `axe` (`Id_axe`),
  CONSTRAINT `FK_job_axe_job` FOREIGN KEY (`job`) REFERENCES `job` (`Id_job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.job_axe: ~0 rows (environ)
DELETE FROM `job_axe`;
/*!40000 ALTER TABLE `job_axe` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_axe` ENABLE KEYS */;


-- Export de la structure de table sapei. job_client
CREATE TABLE IF NOT EXISTS `job_client` (
  `Id_job_client` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de la relation',
  `Id_Client_origine` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifiant du client à l''origine de l''affaire',
  `Id_job` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifiant du job concerné',
  PRIMARY KEY (`Id_job_client`),
  KEY `FK_job_client_client_origine` (`Id_Client_origine`),
  KEY `FK_job_client_job` (`Id_job`),
  CONSTRAINT `FK_job_client_client_origine` FOREIGN KEY (`Id_Client_origine`) REFERENCES `client_origine` (`Id_client_origine`),
  CONSTRAINT `FK_job_client_job` FOREIGN KEY (`Id_job`) REFERENCES `job` (`Id_job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table de liaison entre le job et le client d''affaire';

-- Export de données de la table sapei.job_client: ~0 rows (environ)
DELETE FROM `job_client`;
/*!40000 ALTER TABLE `job_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_client` ENABLE KEYS */;


-- Export de la structure de table sapei. job_contacts
CREATE TABLE IF NOT EXISTS `job_contacts` (
  `Id_job_contact` int(11) NOT NULL AUTO_INCREMENT,
  `Id_job` int(11) NOT NULL DEFAULT '0',
  `Id_client` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id_job_contact`),
  KEY `Id_job` (`Id_job`),
  KEY `Id_client` (`Id_client`),
  CONSTRAINT `FK_job_contacts_contact_client` FOREIGN KEY (`Id_client`) REFERENCES `contact_client` (`Id_contact_client`),
  CONSTRAINT `FK_job_contacts_job` FOREIGN KEY (`Id_job`) REFERENCES `job` (`Id_job`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.job_contacts: ~0 rows (environ)
DELETE FROM `job_contacts`;
/*!40000 ALTER TABLE `job_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_contacts` ENABLE KEYS */;


-- Export de la structure de table sapei. job_statut
CREATE TABLE IF NOT EXISTS `job_statut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statut` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.job_statut: ~11 rows (environ)
DELETE FROM `job_statut`;
/*!40000 ALTER TABLE `job_statut` DISABLE KEYS */;
INSERT INTO `job_statut` (`id`, `statut`) VALUES
	(1, 'En cours'),
	(2, 'Court terme'),
	(3, 'Moyen terme'),
	(4, 'Long terme'),
	(5, 'Transférée'),
	(6, 'Clôturée'),
	(7, 'Affecté'),
	(8, 'Non affecté'),
	(9, 'A étudier'),
	(10, 'Commande en attente'),
	(11, 'Sous traité');
/*!40000 ALTER TABLE `job_statut` ENABLE KEYS */;


-- Export de la structure de table sapei. mesure_agent_ope
CREATE TABLE IF NOT EXISTS `mesure_agent_ope` (
  `Id_affectation_mesure` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''affectation des mesures',
  `Id_ope` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifiant de l''opération concerné',
  `Id_agent` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifiant de l''agent qui a réalisé ces mesures (kage)',
  PRIMARY KEY (`Id_affectation_mesure`),
  KEY `FK__ope` (`Id_ope`),
  CONSTRAINT `FK__ope` FOREIGN KEY (`Id_ope`) REFERENCES `ope` (`Id_ope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table de liaison entre l''agent effectuant les mesures et les informations liées à la mesure';

-- Export de données de la table sapei.mesure_agent_ope: ~0 rows (environ)
DELETE FROM `mesure_agent_ope`;
/*!40000 ALTER TABLE `mesure_agent_ope` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesure_agent_ope` ENABLE KEYS */;


-- Export de la structure de table sapei. ope
CREATE TABLE IF NOT EXISTS `ope` (
  `Id_ope` int(11) NOT NULL AUTO_INCREMENT,
  `Id_job` int(11) NOT NULL DEFAULT '0',
  `Id_skills` int(11) DEFAULT NULL,
  `Id_users` int(11) DEFAULT NULL,
  `Stat` int(11) DEFAULT NULL,
  `type_ope` int(11) DEFAULT NULL,
  `bool_traitement` int(11) DEFAULT NULL COMMENT 'Différence traitements',
  PRIMARY KEY (`Id_ope`),
  KEY `FK_ope_job` (`Id_job`),
  KEY `FK_ope_etat_avancement_ope_2` (`Stat`),
  KEY `Id_users` (`Id_users`),
  KEY `type_ope` (`type_ope`),
  KEY `FK_ope_schedule_skills` (`Id_skills`),
  CONSTRAINT `FK_ope_job` FOREIGN KEY (`Id_job`) REFERENCES `job` (`Id_job`),
  CONSTRAINT `FK_ope_schedule_skills` FOREIGN KEY (`Id_skills`) REFERENCES `schedule_skills` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ope_schedule_users` FOREIGN KEY (`Id_users`) REFERENCES `schedule_users` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ope_steps` FOREIGN KEY (`Stat`) REFERENCES `steps` (`Id_step`),
  CONSTRAINT `FK_ope_type_ope` FOREIGN KEY (`type_ope`) REFERENCES `type_ope` (`id_type_ope`)
) ENGINE=InnoDB AUTO_INCREMENT=10437 DEFAULT CHARSET=utf8 COMMENT='Table des opérations de mesure menées dans le cadre d''une activité';

-- Export de données de la table sapei.ope: ~389 rows (environ)
DELETE FROM `ope`;
/*!40000 ALTER TABLE `ope` DISABLE KEYS */;
INSERT INTO `ope` (`Id_ope`, `Id_job`, `Id_skills`, `Id_users`, `Stat`, `type_ope`, `bool_traitement`) VALUES
	(9254, 87, 8626, NULL, 4, 4, NULL),
	(9255, 88, 8627, NULL, 4, 4, NULL),
	(9256, 89, 8628, NULL, 4, 4, NULL),
	(9257, 92, 8629, NULL, 4, 4, NULL),
	(9258, 94, 8630, NULL, 4, 4, NULL),
	(9259, 95, 8631, NULL, 4, 4, NULL),
	(9260, 84, 8632, NULL, 4, 4, NULL),
	(9261, 90, 8633, NULL, 4, 4, NULL),
	(9262, 98, 8634, NULL, 4, 4, NULL),
	(9263, 100, 8635, NULL, 4, 4, NULL),
	(9264, 101, 8636, NULL, 4, 4, NULL),
	(9266, 103, 8638, NULL, 4, 4, NULL),
	(9267, 104, 8639, NULL, 4, 4, NULL),
	(9268, 105, 8640, NULL, 4, 4, NULL),
	(9269, 108, 8641, NULL, 4, 4, NULL),
	(9270, 110, 8642, NULL, 4, 4, NULL),
	(9271, 114, 8643, NULL, 4, 4, NULL),
	(9272, 115, 8644, NULL, 4, 4, NULL),
	(9273, 111, 8645, NULL, 4, 4, NULL),
	(9274, 112, 8646, NULL, 4, 4, NULL),
	(9275, 80, 8647, NULL, 4, 4, NULL),
	(9276, 80, 8648, NULL, 4, 4, NULL),
	(9277, 81, 8649, NULL, 4, 4, NULL),
	(9278, 9, 8650, NULL, 4, 4, NULL),
	(9279, 9, 8704, NULL, 4, 4, NULL),
	(9280, 9, 8651, NULL, 4, 4, NULL),
	(9281, 9, 8652, NULL, 4, 4, NULL),
	(9282, 10, 8654, NULL, 4, 4, NULL),
	(9283, 10, 8655, NULL, 4, 4, NULL),
	(9284, 10, 8656, NULL, 4, 4, NULL),
	(9285, 10, 8657, NULL, 4, 4, NULL),
	(9286, 11, 8658, NULL, 4, 4, NULL),
	(9287, 11, 8659, NULL, 4, 4, NULL),
	(9288, 11, 8660, NULL, 4, 4, NULL),
	(9289, 2, 8661, NULL, 4, 4, NULL),
	(9290, 2, 8663, NULL, 4, 4, NULL),
	(9292, 4, 8664, NULL, 4, 4, NULL),
	(9293, 4, 8665, NULL, 4, 4, NULL),
	(9294, 4, 8667, NULL, 4, 4, NULL),
	(9296, 5, 8668, NULL, 4, 4, NULL),
	(9297, 8, 8669, NULL, 4, 4, NULL),
	(9298, 8, 8670, NULL, 4, 4, NULL),
	(9299, 8, 8671, NULL, 4, 4, NULL),
	(9300, 13, 8672, NULL, 4, 4, NULL),
	(9301, 13, 8673, NULL, 4, 4, NULL),
	(9302, 14, 8674, NULL, 4, 4, NULL),
	(9303, 16, 8675, NULL, 4, 4, NULL),
	(9304, 17, 8676, NULL, 4, 4, NULL),
	(9305, 18, 8677, NULL, 4, 4, NULL),
	(9306, 19, 8678, NULL, 4, 4, NULL),
	(9307, 20, 8679, NULL, 4, 4, NULL),
	(9308, 21, 8680, NULL, 4, 4, NULL),
	(9309, 22, 8681, NULL, 4, 4, NULL),
	(9310, 23, 8682, NULL, 4, 4, NULL),
	(9311, 24, 8683, NULL, 4, 4, NULL),
	(9312, 25, 8684, NULL, 4, 4, NULL),
	(9313, 26, 8685, NULL, 4, 4, NULL),
	(9314, 26, 8687, NULL, 4, 4, NULL),
	(9316, 28, 8688, NULL, 4, 4, NULL),
	(9317, 29, 8689, NULL, 4, 4, NULL),
	(9318, 29, 8691, NULL, 4, 4, NULL),
	(9320, 31, 8692, NULL, 4, 4, NULL),
	(9321, 32, 8693, NULL, 4, 4, NULL),
	(9322, 33, 8694, NULL, 4, 4, NULL),
	(9323, 34, 8695, NULL, 4, 4, NULL),
	(9324, 38, 8696, NULL, 4, 4, NULL),
	(9325, 39, 8697, NULL, 4, 4, NULL),
	(9326, 40, 8698, NULL, 4, 4, NULL),
	(9327, 41, 8699, NULL, 4, 4, NULL),
	(9328, 42, 8700, NULL, 4, 4, NULL),
	(9329, 42, 8701, NULL, 4, 4, NULL),
	(9330, 45, 8702, NULL, 4, 4, NULL),
	(9331, 45, 8703, NULL, 4, 4, NULL),
	(9332, 45, 8705, NULL, 4, 4, NULL),
	(9333, 45, 8706, NULL, 4, 4, NULL),
	(9335, 46, 8707, NULL, 4, 4, NULL),
	(9336, 46, 8708, NULL, 4, 4, NULL),
	(9337, 46, 8709, NULL, 4, 4, NULL),
	(9338, 46, 8710, NULL, 4, 4, NULL),
	(9339, 49, 8711, NULL, 4, 4, NULL),
	(9340, 49, 8712, NULL, 4, 4, NULL),
	(9341, 49, 8713, NULL, 4, 4, NULL),
	(9342, 50, 8714, NULL, 4, 4, NULL),
	(9343, 50, 8715, NULL, 4, 4, NULL),
	(9344, 50, 8716, NULL, 4, 4, NULL),
	(9345, 50, 8717, NULL, 4, 4, NULL),
	(9346, 50, 8718, NULL, 4, 4, NULL),
	(9347, 51, 8719, NULL, 4, 4, NULL),
	(9348, 52, 8720, NULL, 4, 4, NULL),
	(9349, 53, 8721, NULL, 4, 4, NULL),
	(9350, 53, 8722, NULL, 4, 4, NULL),
	(9351, 53, 8723, NULL, 4, 4, NULL),
	(9352, 53, 8725, NULL, 4, 4, NULL),
	(9354, 54, 8726, NULL, 4, 4, NULL),
	(9355, 54, 8728, NULL, 4, 4, NULL),
	(9357, 55, 8729, NULL, 4, 4, NULL),
	(9358, 55, 8730, NULL, 4, 4, NULL),
	(9359, 55, 8732, NULL, 4, 4, NULL),
	(9361, 56, 8733, NULL, 4, 4, NULL),
	(9362, 56, 8734, NULL, 4, 4, NULL),
	(9363, 56, 8736, NULL, 4, 4, NULL),
	(9365, 57, 8737, NULL, 4, 4, NULL),
	(9366, 57, 8738, NULL, 4, 4, NULL),
	(9367, 57, 8740, NULL, 4, 4, NULL),
	(9369, 58, 8741, NULL, 4, 4, NULL),
	(9370, 58, 8743, NULL, 4, 4, NULL),
	(9371, 58, 8744, NULL, 4, 4, NULL),
	(9374, 59, 8746, NULL, 4, 4, NULL),
	(9375, 59, 8745, NULL, 4, 4, NULL),
	(9376, 61, 8748, NULL, 4, 4, NULL),
	(9377, 62, 8749, NULL, 4, 4, NULL),
	(9378, 63, 8750, NULL, 4, 4, NULL),
	(9379, 63, 8751, NULL, 4, 4, NULL),
	(9380, 63, 8753, NULL, 4, 4, NULL),
	(9382, 64, 8754, NULL, 4, 4, NULL),
	(9383, 64, 8755, NULL, 4, 4, NULL),
	(9384, 64, 8757, NULL, 4, 4, NULL),
	(9386, 65, 8758, NULL, 4, 4, NULL),
	(9387, 65, 8759, NULL, 4, 4, NULL),
	(9388, 65, 8761, NULL, 4, 4, NULL),
	(9390, 67, 8762, NULL, 4, 4, NULL),
	(9391, 68, 8763, NULL, 4, 4, NULL),
	(9392, 68, 8763, NULL, 4, 4, NULL),
	(9394, 70, 8766, NULL, 4, 4, NULL),
	(9395, 71, 8767, NULL, 4, 4, NULL),
	(9396, 73, 8768, NULL, 4, 4, NULL),
	(9397, 75, 8769, NULL, 4, 4, NULL),
	(9398, 76, 8770, NULL, 4, 4, NULL),
	(9399, 82, 8771, NULL, 4, 4, NULL),
	(9400, 82, 8772, NULL, 4, 4, NULL),
	(9401, 82, 8773, NULL, 4, 4, NULL),
	(9402, 82, 8774, NULL, 4, 4, NULL),
	(9403, 77, 8775, NULL, 4, 4, NULL),
	(9404, 77, 8776, NULL, 4, 4, NULL),
	(9405, 78, 8777, NULL, 4, 4, NULL),
	(10182, 87, NULL, 1643, 4, 4, NULL),
	(10183, 87, NULL, 1644, 4, 4, NULL),
	(10184, 88, NULL, 1645, 4, 4, NULL),
	(10185, 88, NULL, 1646, 4, 4, NULL),
	(10186, 89, NULL, 1647, 4, 4, NULL),
	(10187, 92, NULL, 1648, 4, 4, NULL),
	(10188, 94, NULL, 1649, 4, 4, NULL),
	(10189, 95, NULL, 1650, 4, 4, NULL),
	(10190, 95, NULL, 1651, 4, 4, NULL),
	(10191, 90, NULL, 1652, 4, 4, NULL),
	(10192, 101, NULL, 1653, 4, 4, NULL),
	(10194, 103, NULL, 1655, 4, 4, NULL),
	(10195, 114, NULL, 1656, 4, 4, NULL),
	(10196, 114, NULL, 1657, 4, 4, NULL),
	(10197, 115, NULL, 1658, 4, 4, NULL),
	(10198, 115, NULL, 1659, 4, 4, NULL),
	(10199, 80, NULL, 1660, 4, 4, NULL),
	(10200, 80, NULL, 1661, 4, 4, NULL),
	(10201, 80, NULL, 1662, 4, 4, NULL),
	(10202, 81, NULL, 1663, 4, 4, NULL),
	(10203, 81, NULL, 1664, 4, 4, NULL),
	(10204, 9, NULL, 1665, 4, 4, NULL),
	(10205, 9, NULL, 1666, 4, 4, NULL),
	(10206, 9, NULL, 1667, 4, 4, NULL),
	(10207, 9, NULL, 1668, 4, 4, NULL),
	(10208, 9, NULL, 1669, 4, 4, NULL),
	(10209, 9, NULL, 1670, 4, 4, NULL),
	(10210, 9, NULL, 1671, 4, 4, NULL),
	(10211, 9, NULL, 1672, 4, 4, NULL),
	(10212, 2, NULL, 1673, 4, 4, NULL),
	(10213, 2, NULL, 1674, 4, 4, NULL),
	(10214, 2, NULL, 1675, 4, 4, NULL),
	(10215, 2, NULL, 1676, 4, 4, NULL),
	(10216, 2, NULL, 1677, 4, 4, NULL),
	(10217, 2, NULL, 1678, 4, 4, NULL),
	(10218, 4, NULL, 1679, 4, 4, NULL),
	(10219, 4, NULL, 1680, 4, 4, NULL),
	(10220, 4, NULL, 1681, 4, 4, NULL),
	(10221, 4, NULL, 1682, 4, 4, NULL),
	(10222, 4, NULL, 1683, 4, 4, NULL),
	(10223, 4, NULL, 1684, 4, 4, NULL),
	(10224, 4, NULL, 1685, 4, 4, NULL),
	(10225, 4, NULL, 1686, 4, 4, NULL),
	(10226, 5, NULL, 1687, 4, 4, NULL),
	(10227, 5, NULL, 1688, 4, 4, NULL),
	(10228, 8, NULL, 1689, 4, 4, NULL),
	(10229, 8, NULL, 1690, 4, 4, NULL),
	(10230, 8, NULL, 1691, 4, 4, NULL),
	(10231, 8, NULL, 1692, 4, 4, NULL),
	(10232, 8, NULL, 1693, 4, 4, NULL),
	(10233, 8, NULL, 1694, 4, 4, NULL),
	(10234, 13, NULL, 1695, 4, 4, NULL),
	(10235, 13, NULL, 1696, 4, 4, NULL),
	(10236, 19, NULL, 1697, 4, 4, NULL),
	(10237, 19, NULL, 1698, 4, 4, NULL),
	(10238, 20, NULL, 1699, 4, 4, NULL),
	(10239, 20, NULL, 1700, 4, 4, NULL),
	(10240, 21, NULL, 1701, 4, 4, NULL),
	(10241, 21, NULL, 1702, 4, 4, NULL),
	(10242, 22, NULL, 1703, 4, 4, NULL),
	(10243, 22, NULL, 1704, 4, 4, NULL),
	(10244, 23, NULL, 1705, 4, 4, NULL),
	(10245, 23, NULL, 1706, 4, 4, NULL),
	(10246, 24, NULL, 1707, 4, 4, NULL),
	(10247, 24, NULL, 1708, 4, 4, NULL),
	(10248, 25, NULL, 1709, 4, 4, NULL),
	(10249, 25, NULL, 1710, 4, 4, NULL),
	(10250, 26, NULL, 1711, 4, 4, NULL),
	(10251, 26, NULL, 1712, 4, 4, NULL),
	(10252, 26, NULL, 1713, 4, 4, NULL),
	(10253, 26, NULL, 1714, 4, 4, NULL),
	(10254, 26, NULL, 1715, 4, 4, NULL),
	(10255, 26, NULL, 1716, 4, 4, NULL),
	(10256, 26, NULL, 1717, 4, 4, NULL),
	(10257, 26, NULL, 1718, 4, 4, NULL),
	(10258, 26, NULL, 1719, 4, 4, NULL),
	(10259, 26, NULL, 1720, 4, 4, NULL),
	(10260, 28, NULL, 1721, 4, 4, NULL),
	(10261, 28, NULL, 1722, 4, 4, NULL),
	(10262, 29, NULL, 1723, 4, 4, NULL),
	(10263, 29, NULL, 1724, 4, 4, NULL),
	(10264, 29, NULL, 1725, 4, 4, NULL),
	(10265, 29, NULL, 1726, 4, 4, NULL),
	(10266, 29, NULL, 1727, 4, 4, NULL),
	(10267, 29, NULL, 1728, 4, 4, NULL),
	(10268, 29, NULL, 1729, 4, 4, NULL),
	(10269, 29, NULL, 1730, 4, 4, NULL),
	(10270, 31, NULL, 1731, 4, 4, NULL),
	(10271, 31, NULL, 1732, 4, 4, NULL),
	(10272, 32, NULL, 1733, 4, 4, NULL),
	(10273, 32, NULL, 1734, 4, 4, NULL),
	(10274, 33, NULL, 1735, 4, 4, NULL),
	(10275, 33, NULL, 1736, 4, 4, NULL),
	(10276, 34, NULL, 1737, 4, 4, NULL),
	(10277, 34, NULL, 1738, 4, 4, NULL),
	(10278, 39, NULL, 1739, 4, 4, NULL),
	(10279, 39, NULL, 1740, 4, 4, NULL),
	(10280, 40, NULL, 1741, 4, 4, NULL),
	(10281, 40, NULL, 1742, 4, 4, NULL),
	(10282, 41, NULL, 1743, 4, 4, NULL),
	(10283, 41, NULL, 1744, 4, 4, NULL),
	(10284, 42, NULL, 1745, 4, 4, NULL),
	(10285, 42, NULL, 1746, 4, 4, NULL),
	(10286, 42, NULL, 1747, 4, 4, NULL),
	(10287, 42, NULL, 1748, 4, 4, NULL),
	(10288, 45, NULL, 1749, 4, 4, NULL),
	(10289, 45, NULL, 1750, 4, 4, NULL),
	(10290, 45, NULL, 1751, 4, 4, NULL),
	(10291, 46, NULL, 1752, 4, 4, NULL),
	(10292, 46, NULL, 1753, 4, 4, NULL),
	(10293, 46, NULL, 1754, 4, 4, NULL),
	(10294, 46, NULL, 1755, 4, 4, NULL),
	(10295, 46, NULL, 1756, 4, 4, NULL),
	(10296, 49, NULL, 1757, 4, 4, NULL),
	(10297, 49, NULL, 1758, 4, 4, NULL),
	(10298, 49, NULL, 1759, 4, 4, NULL),
	(10299, 49, NULL, 1760, 4, 4, NULL),
	(10300, 49, NULL, 1761, 4, 4, NULL),
	(10301, 49, NULL, 1762, 4, 4, NULL),
	(10302, 50, NULL, 1763, 4, 4, NULL),
	(10303, 50, NULL, 1764, 4, 4, NULL),
	(10304, 50, NULL, 1765, 4, 4, NULL),
	(10305, 50, NULL, 1766, 4, 4, NULL),
	(10306, 50, NULL, 1767, 4, 4, NULL),
	(10307, 50, NULL, 1768, 4, 4, NULL),
	(10308, 50, NULL, 1769, 4, 4, NULL),
	(10309, 50, NULL, 1770, 4, 4, NULL),
	(10310, 50, NULL, 1771, 4, 4, NULL),
	(10311, 50, NULL, 1772, 4, 4, NULL),
	(10312, 50, NULL, 1773, 4, 4, NULL),
	(10313, 50, NULL, 1774, 4, 4, NULL),
	(10314, 51, NULL, 1775, 4, 4, NULL),
	(10315, 51, NULL, 1776, 4, 4, NULL),
	(10316, 53, NULL, 1777, 4, 4, NULL),
	(10317, 53, NULL, 1778, 4, 4, NULL),
	(10318, 53, NULL, 1779, 4, 4, NULL),
	(10319, 53, NULL, 1780, 4, 4, NULL),
	(10320, 53, NULL, 1781, 4, 4, NULL),
	(10321, 53, NULL, 1782, 4, 4, NULL),
	(10322, 53, NULL, 1783, 4, 4, NULL),
	(10323, 53, NULL, 1784, 4, 4, NULL),
	(10324, 53, NULL, 1785, 4, 4, NULL),
	(10325, 53, NULL, 1786, 4, 4, NULL),
	(10326, 53, NULL, 1787, 4, 4, NULL),
	(10327, 53, NULL, 1788, 4, 4, NULL),
	(10328, 54, NULL, 1789, 4, 4, NULL),
	(10329, 54, NULL, 1790, 4, 4, NULL),
	(10330, 54, NULL, 1791, 4, 4, NULL),
	(10331, 54, NULL, 1792, 4, 4, NULL),
	(10332, 54, NULL, 1793, 4, 4, NULL),
	(10333, 54, NULL, 1794, 4, 4, NULL),
	(10334, 54, NULL, 1795, 4, 4, NULL),
	(10335, 54, NULL, 1796, 4, 4, NULL),
	(10336, 55, NULL, 1797, 4, 4, NULL),
	(10337, 55, NULL, 1798, 4, 4, NULL),
	(10338, 55, NULL, 1799, 4, 4, NULL),
	(10339, 55, NULL, 1800, 4, 4, NULL),
	(10340, 55, NULL, 1801, 4, 4, NULL),
	(10341, 55, NULL, 1802, 4, 4, NULL),
	(10342, 55, NULL, 1803, 4, 4, NULL),
	(10343, 55, NULL, 1804, 4, 4, NULL),
	(10344, 55, NULL, 1805, 4, 4, NULL),
	(10345, 55, NULL, 1806, 4, 4, NULL),
	(10346, 56, NULL, 1807, 4, 4, NULL),
	(10347, 56, NULL, 1808, 4, 4, NULL),
	(10348, 56, NULL, 1809, 4, 4, NULL),
	(10349, 56, NULL, 1810, 4, 4, NULL),
	(10350, 56, NULL, 1811, 4, 4, NULL),
	(10351, 56, NULL, 1812, 4, 4, NULL),
	(10352, 56, NULL, 1813, 4, 4, NULL),
	(10353, 56, NULL, 1814, 4, 4, NULL),
	(10354, 56, NULL, 1815, 4, 4, NULL),
	(10355, 56, NULL, 1816, 4, 4, NULL),
	(10356, 57, NULL, 1817, 4, 4, NULL),
	(10357, 57, NULL, 1818, 4, 4, NULL),
	(10358, 57, NULL, 1819, 4, 4, NULL),
	(10359, 57, NULL, 1820, 4, 4, NULL),
	(10360, 57, NULL, 1821, 4, 4, NULL),
	(10361, 57, NULL, 1822, 4, 4, NULL),
	(10362, 57, NULL, 1823, 4, 4, NULL),
	(10363, 57, NULL, 1824, 4, 4, NULL),
	(10364, 57, NULL, 1825, 4, 4, NULL),
	(10365, 57, NULL, 1826, 4, 4, NULL),
	(10366, 58, NULL, 1827, 4, 4, NULL),
	(10367, 58, NULL, 1828, 4, 4, NULL),
	(10368, 58, NULL, 1829, 4, 4, NULL),
	(10369, 58, NULL, 1830, 4, 4, NULL),
	(10370, 58, NULL, 1831, 4, 4, NULL),
	(10371, 58, NULL, 1832, 4, 4, NULL),
	(10372, 58, NULL, 1833, 4, 4, NULL),
	(10373, 58, NULL, 1834, 4, 4, NULL),
	(10374, 59, NULL, 1835, 4, 4, NULL),
	(10375, 59, NULL, 1836, 4, 4, NULL),
	(10376, 59, NULL, 1837, 4, 4, NULL),
	(10377, 59, NULL, 1838, 4, 4, NULL),
	(10378, 59, NULL, 1839, 4, 4, NULL),
	(10379, 59, NULL, 1840, 4, 4, NULL),
	(10380, 61, NULL, 1841, 4, 4, NULL),
	(10381, 61, NULL, 1842, 4, 4, NULL),
	(10382, 62, NULL, 1843, 4, 4, NULL),
	(10383, 62, NULL, 1844, 4, 4, NULL),
	(10384, 62, NULL, 1845, 4, 4, NULL),
	(10385, 62, NULL, 1846, 4, 4, NULL),
	(10386, 63, NULL, 1847, 4, 4, NULL),
	(10387, 63, NULL, 1848, 4, 4, NULL),
	(10388, 63, NULL, 1849, 4, 4, NULL),
	(10389, 63, NULL, 1850, 4, 4, NULL),
	(10390, 63, NULL, 1851, 4, 4, NULL),
	(10391, 63, NULL, 1852, 4, 4, NULL),
	(10392, 63, NULL, 1853, 4, 4, NULL),
	(10393, 63, NULL, 1854, 4, 4, NULL),
	(10394, 63, NULL, 1855, 4, 4, NULL),
	(10395, 63, NULL, 1856, 4, 4, NULL),
	(10396, 64, NULL, 1857, 4, 4, NULL),
	(10397, 64, NULL, 1858, 4, 4, NULL),
	(10398, 64, NULL, 1859, 4, 4, NULL),
	(10399, 64, NULL, 1860, 4, 4, NULL),
	(10400, 64, NULL, 1861, 4, 4, NULL),
	(10401, 64, NULL, 1862, 4, 4, NULL),
	(10402, 64, NULL, 1863, 4, 4, NULL),
	(10403, 64, NULL, 1864, 4, 4, NULL),
	(10404, 64, NULL, 1865, 4, 4, NULL),
	(10405, 64, NULL, 1866, 4, 4, NULL),
	(10406, 65, NULL, 1867, 4, 4, NULL),
	(10407, 65, NULL, 1868, 4, 4, NULL),
	(10408, 65, NULL, 1869, 4, 4, NULL),
	(10409, 65, NULL, 1870, 4, 4, NULL),
	(10410, 65, NULL, 1871, 4, 4, NULL),
	(10411, 65, NULL, 1872, 4, 4, NULL),
	(10412, 65, NULL, 1873, 4, 4, NULL),
	(10413, 65, NULL, 1874, 4, 4, NULL),
	(10414, 65, NULL, 1875, 4, 4, NULL),
	(10415, 65, NULL, 1876, 4, 4, NULL),
	(10416, 67, NULL, 1877, 4, 4, NULL),
	(10417, 67, NULL, 1878, 4, 4, NULL),
	(10418, 68, NULL, 1879, 4, 4, NULL),
	(10419, 68, NULL, 1880, 4, 4, NULL),
	(10420, 68, NULL, 1881, 4, 4, NULL),
	(10421, 68, NULL, 1882, 4, 4, NULL),
	(10422, 70, NULL, 1883, 4, 4, NULL),
	(10423, 70, NULL, 1884, 4, 4, NULL),
	(10424, 71, NULL, 1885, 4, 4, NULL),
	(10425, 71, NULL, 1886, 4, 4, NULL),
	(10426, 73, NULL, 1887, 4, 4, NULL),
	(10427, 73, NULL, 1888, 4, 4, NULL),
	(10428, 75, NULL, 1889, 4, 4, NULL),
	(10429, 76, NULL, 1890, 4, 4, NULL),
	(10430, 76, NULL, 1891, 4, 4, NULL),
	(10431, 77, NULL, 1892, 4, 4, NULL),
	(10432, 77, NULL, 1893, 4, 4, NULL),
	(10433, 77, NULL, 1894, 4, 4, NULL),
	(10434, 77, NULL, 1895, 4, 4, NULL),
	(10435, 78, NULL, 1896, 4, 4, NULL),
	(10436, 78, NULL, 1897, 4, 4, NULL);
/*!40000 ALTER TABLE `ope` ENABLE KEYS */;


-- Export de la structure de table sapei. outils
CREATE TABLE IF NOT EXISTS `outils` (
  `Id_materiel` int(11) NOT NULL AUTO_INCREMENT,
  `Id_type_materiel` int(11) NOT NULL DEFAULT '0',
  `Libelle_materiel` varchar(255) NOT NULL DEFAULT '0',
  `Inventaire_materiel` varchar(50) NOT NULL DEFAULT '0',
  `Id_Etat_materiel` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id_materiel`),
  KEY `FK__type_materiel` (`Id_type_materiel`),
  CONSTRAINT `FK__type_materiel` FOREIGN KEY (`Id_type_materiel`) REFERENCES `type_materiel` (`Id_type_materiel`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Table des matériels';

-- Export de données de la table sapei.outils: ~19 rows (environ)
DELETE FROM `outils`;
/*!40000 ALTER TABLE `outils` DISABLE KEYS */;
INSERT INTO `outils` (`Id_materiel`, `Id_type_materiel`, `Libelle_materiel`, `Inventaire_materiel`, `Id_Etat_materiel`) VALUES
	(1, 1, 'TUS', '0', 0),
	(2, 1, 'RUGO', '0', 0),
	(3, 1, 'MOGEO', '0', 0),
	(4, 1, 'IRCAN', '0', 0),
	(5, 1, 'SSV', '0', 0),
	(6, 1, 'APL', '0', 0),
	(7, 1, 'DEFLECTO', '0', 0),
	(8, 1, 'SSV Portable', '0', 0),
	(9, 1, 'VISULINE', '0', 0),
	(10, 1, 'TUS', '0', 0),
	(11, 1, 'ECODYN', '0', 0),
	(12, 1, 'CAROTTEUSE', '0', 0),
	(13, 1, 'OVALISATION', '0', 0),
	(14, 1, 'IRCAN PORTABLE', '0', 0),
	(15, 1, 'SSV Portable', '0', 0),
	(16, 1, 'VISULINE', '0', 0),
	(17, 1, 'TUS', '0', 0),
	(18, 1, 'RADAR', '0', 0),
	(19, 1, 'OVALISATION', '0', 0);
/*!40000 ALTER TABLE `outils` ENABLE KEYS */;


-- Export de la structure de table sapei. porteur
CREATE TABLE IF NOT EXISTS `porteur` (
  `Id_porteur` int(11) NOT NULL AUTO_INCREMENT,
  `Porteur_libelle` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id_porteur`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Table porteur';

-- Export de données de la table sapei.porteur: ~8 rows (environ)
DELETE FROM `porteur`;
/*!40000 ALTER TABLE `porteur` DISABLE KEYS */;
INSERT INTO `porteur` (`Id_porteur`, `Porteur_libelle`) VALUES
	(1, 'Renault Trafic POMMAR'),
	(2, 'Remorques APL Renault Scenic 3'),
	(3, 'Renault Premium'),
	(4, 'Renault Scenic 3 (études)'),
	(5, 'Renault Scenic 3 ECODYN'),
	(6, 'Renault Mascott (tracteur carotteuse)'),
	(7, 'Renault KANGOO 2'),
	(8, 'Renault Trafic (Radar)');
/*!40000 ALTER TABLE `porteur` ENABLE KEYS */;


-- Export de la structure de table sapei. porteur_outils
CREATE TABLE IF NOT EXISTS `porteur_outils` (
  `Id_porteur_outils` int(11) NOT NULL AUTO_INCREMENT,
  `Id_porteur` int(11) DEFAULT '0',
  `Id_outils` int(11) DEFAULT '0',
  PRIMARY KEY (`Id_porteur_outils`),
  KEY `FK__porteur` (`Id_porteur`),
  KEY `FK__outils` (`Id_outils`),
  CONSTRAINT `FK__outils` FOREIGN KEY (`Id_outils`) REFERENCES `outils` (`Id_materiel`),
  CONSTRAINT `FK__porteur` FOREIGN KEY (`Id_porteur`) REFERENCES `porteur` (`Id_porteur`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.porteur_outils: ~19 rows (environ)
DELETE FROM `porteur_outils`;
/*!40000 ALTER TABLE `porteur_outils` DISABLE KEYS */;
INSERT INTO `porteur_outils` (`Id_porteur_outils`, `Id_porteur`, `Id_outils`) VALUES
	(3, 1, 1),
	(4, 1, 2),
	(5, 1, 3),
	(6, 1, 4),
	(7, 1, 5),
	(9, 2, 6),
	(10, 3, 7),
	(11, 4, 8),
	(12, 4, 9),
	(13, 4, 10),
	(14, 5, 11),
	(16, 6, 12),
	(17, 6, 13),
	(18, 7, 14),
	(19, 7, 15),
	(21, 7, 16),
	(22, 7, 17),
	(23, 8, 18),
	(24, 8, 19);
/*!40000 ALTER TABLE `porteur_outils` ENABLE KEYS */;


-- Export de la structure de table sapei. role
CREATE TABLE IF NOT EXISTS `role` (
  `Id_role_agent` int(11) NOT NULL AUTO_INCREMENT,
  `Descriptif_role_agent` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id_role_agent`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Table des roles des agents';

-- Export de données de la table sapei.role: ~2 rows (environ)
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`Id_role_agent`, `Descriptif_role_agent`) VALUES
	(1, 'Administrateur'),
	(2, 'Agents');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Export de la structure de table sapei. schedule_skills
CREATE TABLE IF NOT EXISTS `schedule_skills` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ResourceId` int(11) NOT NULL DEFAULT '0',
  `Job` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `Name` varchar(255) DEFAULT '0',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Cls` varchar(50) DEFAULT NULL,
  `User` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_schedule_skills_porteur_outils` (`ResourceId`),
  CONSTRAINT `FK_schedule_skills_porteur_outils` FOREIGN KEY (`ResourceId`) REFERENCES `porteur_outils` (`Id_porteur_outils`)
) ENGINE=InnoDB AUTO_INCREMENT=8778 DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.schedule_skills: ~136 rows (environ)
DELETE FROM `schedule_skills`;
/*!40000 ALTER TABLE `schedule_skills` DISABLE KEYS */;
INSERT INTO `schedule_skills` (`Id`, `ResourceId`, `Job`, `Type`, `Name`, `StartDate`, `EndDate`, `Cls`, `User`) VALUES
	(8626, 7, 87, 2, NULL, '2016-01-18 09:00:00', '2016-01-18 18:00:00', 'orange', 614),
	(8627, 7, 88, 2, NULL, '2016-01-11 09:00:00', '2016-01-11 18:00:00', 'orange', 614),
	(8628, 6, 89, 2, NULL, '2016-01-26 09:00:00', '2016-01-26 18:00:00', 'orange', 614),
	(8629, 6, 92, 2, NULL, '2016-01-27 09:00:00', '2016-01-27 18:00:00', 'orange', 614),
	(8630, 6, 94, 2, NULL, '2016-02-08 09:00:00', '2016-02-08 18:00:00', 'orange', 614),
	(8631, 7, 95, 2, NULL, '2016-02-15 09:00:00', '2016-02-15 18:00:00', 'orange', 614),
	(8632, 4, 84, 2, NULL, '2015-12-16 09:00:00', '2015-12-16 18:00:00', 'orange', 614),
	(8633, 6, 90, 2, NULL, '2016-01-27 09:00:00', '2016-01-27 18:00:00', 'orange', 614),
	(8634, 6, 98, 2, NULL, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(8635, 9, 100, 2, NULL, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(8636, 18, 101, 2, NULL, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(8637, 18, 102, 2, NULL, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(8638, 18, 103, 2, NULL, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(8639, 4, 104, 2, NULL, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(8640, 4, 105, 2, NULL, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(8641, 4, 108, 2, NULL, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(8642, 4, 110, 2, NULL, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(8643, 7, 114, 2, NULL, '2016-02-29 09:00:00', '2016-02-29 18:00:00', 'orange', 614),
	(8644, 7, 115, 2, NULL, '2016-02-29 09:00:00', '2016-02-29 18:00:00', 'orange', 614),
	(8645, 4, 111, 2, NULL, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(8646, 4, 112, 2, NULL, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(8647, 18, 80, 2, NULL, '2015-08-02 09:00:00', '2015-08-02 18:00:00', 'orange', 614),
	(8648, 12, 80, 2, NULL, '2015-08-02 09:00:00', '2015-08-02 18:00:00', 'orange', 614),
	(8649, 5, 81, 2, NULL, '2015-02-15 09:00:00', '2015-02-15 18:00:00', 'orange', 614),
	(8650, 7, 9, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8651, 18, 9, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8652, 5, 9, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8653, 12, 9, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8654, 7, 10, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8655, 18, 10, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8656, 5, 10, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8657, 12, 10, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8658, 7, 11, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8659, 18, 11, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8660, 5, 11, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8661, 6, 2, 2, NULL, '2016-03-18 09:00:00', '2016-03-18 18:00:00', 'orange', 614),
	(8663, 11, 2, 2, NULL, '2016-03-18 09:00:00', '2016-03-18 18:00:00', 'orange', 614),
	(8664, 18, 4, 2, NULL, '2015-09-30 09:00:00', '2015-09-30 18:00:00', 'orange', 614),
	(8665, 6, 4, 2, NULL, '2015-09-30 09:00:00', '2015-09-30 18:00:00', 'orange', 614),
	(8667, 4, 4, 2, NULL, '2015-09-30 09:00:00', '2015-09-30 18:00:00', 'orange', 614),
	(8668, 7, 5, 2, NULL, '2015-10-01 09:00:00', '2015-10-01 18:00:00', 'orange', 614),
	(8669, 7, 8, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8670, 18, 8, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8671, 5, 8, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8672, 7, 13, 2, NULL, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(8673, 12, 13, 2, NULL, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(8674, 12, 14, 2, NULL, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(8675, 12, 16, 2, NULL, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(8676, 12, 17, 2, NULL, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(8677, 6, 18, 2, NULL, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(8678, 6, 19, 2, NULL, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(8679, 6, 20, 2, NULL, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(8680, 7, 21, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8681, 7, 22, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8682, 7, 23, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8683, 7, 24, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8684, 7, 25, 2, NULL, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(8685, 6, 26, 2, NULL, '2016-03-19 09:00:00', '2016-03-19 18:00:00', 'orange', 614),
	(8687, 4, 26, 2, NULL, '2016-03-19 09:00:00', '2016-03-19 18:00:00', 'orange', 614),
	(8688, 5, 28, 2, NULL, '2016-03-20 09:00:00', '2016-03-20 18:00:00', 'orange', 614),
	(8689, 5, 29, 2, NULL, '2016-03-21 09:00:00', '2016-03-21 18:00:00', 'orange', 614),
	(8691, 4, 29, 2, NULL, '2016-03-21 09:00:00', '2016-03-21 18:00:00', 'orange', 614),
	(8692, 6, 31, 2, NULL, '2016-03-22 09:00:00', '2016-03-22 18:00:00', 'orange', 614),
	(8693, 6, 32, 2, NULL, '2016-03-23 09:00:00', '2016-03-23 18:00:00', 'orange', 614),
	(8694, 4, 33, 2, NULL, '2016-03-24 09:00:00', '2016-03-24 18:00:00', 'orange', 614),
	(8695, 4, 34, 2, NULL, '2016-03-25 09:00:00', '2016-03-25 18:00:00', 'orange', 614),
	(8696, 9, 38, 2, NULL, '2016-03-26 09:00:00', '2016-03-26 18:00:00', 'orange', 614),
	(8697, 11, 39, 2, NULL, '2016-03-27 09:00:00', '2016-03-27 18:00:00', 'orange', 614),
	(8698, 11, 40, 2, NULL, '2015-10-18 09:00:00', '2015-10-18 18:00:00', 'orange', 614),
	(8699, 18, 41, 2, NULL, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(8700, 18, 42, 2, NULL, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(8701, 5, 42, 2, NULL, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(8702, 7, 45, 2, NULL, '2015-01-04 09:00:00', '2015-01-04 18:00:00', 'orange', 614),
	(8703, 18, 45, 2, NULL, '2015-01-04 09:00:00', '2015-01-04 18:00:00', 'orange', 614),
	(8704, 5, 45, 2, NULL, '2015-01-04 09:00:00', '2015-01-04 18:00:00', 'orange', 614),
	(8705, 12, 45, 2, NULL, '2015-01-04 09:00:00', '2015-01-04 18:00:00', 'orange', 614),
	(8706, 4, 45, 2, NULL, '2015-01-04 09:00:00', '2015-01-04 18:00:00', 'orange', 614),
	(8707, 7, 46, 2, NULL, '2015-07-22 09:00:00', '2015-07-22 18:00:00', 'orange', 614),
	(8708, 18, 46, 2, NULL, '2015-07-22 09:00:00', '2015-07-22 18:00:00', 'orange', 614),
	(8709, 5, 46, 2, NULL, '2015-07-22 09:00:00', '2015-07-22 18:00:00', 'orange', 614),
	(8710, 12, 46, 2, NULL, '2015-07-22 09:00:00', '2015-07-22 18:00:00', 'orange', 614),
	(8711, 7, 49, 2, NULL, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(8712, 5, 49, 2, NULL, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(8713, 4, 49, 2, NULL, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(8714, 7, 50, 2, NULL, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(8715, 18, 50, 2, NULL, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(8716, 5, 50, 2, NULL, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(8717, 12, 50, 2, NULL, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(8718, 4, 50, 2, NULL, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(8719, 11, 51, 2, NULL, '2015-10-22 09:00:00', '2015-10-22 18:00:00', 'orange', 614),
	(8720, 4, 52, 2, NULL, '2016-03-28 09:00:00', '2016-03-28 18:00:00', 'orange', 614),
	(8721, 7, 53, 2, NULL, '2016-03-29 09:00:00', '2016-03-29 18:00:00', 'orange', 614),
	(8722, 5, 53, 2, NULL, '2016-03-29 09:00:00', '2016-03-29 18:00:00', 'orange', 614),
	(8723, 6, 53, 2, NULL, '2016-03-29 09:00:00', '2016-03-29 18:00:00', 'orange', 614),
	(8725, 4, 53, 2, NULL, '2016-03-29 09:00:00', '2016-03-29 18:00:00', 'orange', 614),
	(8726, 5, 54, 2, NULL, '2016-03-30 09:00:00', '2016-03-30 18:00:00', 'orange', 614),
	(8728, 4, 54, 2, NULL, '2016-03-30 09:00:00', '2016-03-30 18:00:00', 'orange', 614),
	(8729, 7, 55, 2, NULL, '2016-03-31 09:00:00', '2016-03-31 18:00:00', 'orange', 614),
	(8730, 5, 55, 2, NULL, '2016-03-31 09:00:00', '2016-03-31 18:00:00', 'orange', 614),
	(8732, 4, 55, 2, NULL, '2016-03-31 09:00:00', '2016-03-31 18:00:00', 'orange', 614),
	(8733, 7, 56, 2, NULL, '2016-04-01 09:00:00', '2016-04-01 18:00:00', 'orange', 614),
	(8734, 5, 56, 2, NULL, '2016-04-01 09:00:00', '2016-04-01 18:00:00', 'orange', 614),
	(8736, 4, 56, 2, NULL, '2016-04-01 09:00:00', '2016-04-01 18:00:00', 'orange', 614),
	(8737, 5, 57, 2, NULL, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(8738, 6, 57, 2, NULL, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(8740, 4, 57, 2, NULL, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(8741, 5, 58, 2, NULL, '2016-04-03 09:00:00', '2016-04-03 18:00:00', 'orange', 614),
	(8743, 4, 58, 2, NULL, '2016-04-03 09:00:00', '2016-04-03 18:00:00', 'orange', 614),
	(8744, 13, 58, 2, NULL, '2016-04-03 09:00:00', '2016-04-03 18:00:00', 'orange', 614),
	(8745, 18, 59, 2, NULL, '2015-10-19 09:00:00', '2015-10-19 18:00:00', 'orange', 614),
	(8746, 5, 59, 2, NULL, '2015-10-19 09:00:00', '2015-10-19 18:00:00', 'orange', 614),
	(8748, 7, 61, 2, NULL, '2015-10-18 09:00:00', '2015-10-18 18:00:00', 'orange', 614),
	(8749, 5, 62, 2, NULL, '2016-04-04 09:00:00', '2016-04-04 18:00:00', 'orange', 614),
	(8750, 5, 63, 2, NULL, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(8751, 6, 63, 2, NULL, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(8753, 3, 63, 2, NULL, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(8754, 5, 64, 2, NULL, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(8755, 6, 64, 2, NULL, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(8757, 3, 64, 2, NULL, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(8758, 5, 65, 2, NULL, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(8759, 6, 65, 2, NULL, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(8761, 3, 65, 2, NULL, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(8762, 7, 67, 2, NULL, '2016-04-05 09:00:00', '2016-04-05 18:00:00', 'orange', 614),
	(8763, 6, 68, 2, NULL, '2016-04-06 09:00:00', '2016-04-06 18:00:00', 'orange', 614),
	(8766, 6, 70, 2, NULL, '2016-04-07 09:00:00', '2016-04-07 18:00:00', 'orange', 614),
	(8767, 7, 71, 2, NULL, '2015-11-09 09:00:00', '2015-11-09 18:00:00', 'orange', 614),
	(8768, 7, 73, 2, NULL, '2016-04-08 09:00:00', '2016-04-08 18:00:00', 'orange', 614),
	(8769, 6, 75, 2, NULL, '2016-01-26 09:00:00', '2016-01-26 18:00:00', 'orange', 614),
	(8770, 6, 76, 2, NULL, '2015-11-23 09:00:00', '2015-11-23 18:00:00', 'orange', 614),
	(8771, 7, 82, 2, NULL, '2015-11-04 09:00:00', '2015-11-04 18:00:00', 'orange', 614),
	(8772, 18, 82, 2, NULL, '2015-11-04 09:00:00', '2015-11-04 18:00:00', 'orange', 614),
	(8773, 5, 82, 2, NULL, '2015-11-04 09:00:00', '2015-11-04 18:00:00', 'orange', 614),
	(8774, 12, 82, 2, NULL, '2015-11-04 09:00:00', '2015-11-04 18:00:00', 'orange', 614),
	(8775, 5, 77, 2, NULL, '2016-04-10 09:00:00', '2016-04-10 18:00:00', 'orange', 614),
	(8776, 4, 77, 2, NULL, '2016-04-10 09:00:00', '2016-04-10 18:00:00', 'orange', 614),
	(8777, 6, 78, 2, NULL, '2015-11-29 09:00:00', '2015-11-29 18:00:00', 'orange', 614);
/*!40000 ALTER TABLE `schedule_skills` ENABLE KEYS */;


-- Export de la structure de table sapei. schedule_users
CREATE TABLE IF NOT EXISTS `schedule_users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ResourceId` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(255) DEFAULT '0',
  `Job` int(11) DEFAULT '0',
  `Type` int(11) DEFAULT '2',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Cls` varchar(50) DEFAULT NULL,
  `User` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_schedule_users_user` (`ResourceId`),
  CONSTRAINT `FK_schedule_users_user` FOREIGN KEY (`ResourceId`) REFERENCES `user` (`Id_agent`)
) ENGINE=InnoDB AUTO_INCREMENT=1898 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Export de données de la table sapei.schedule_users: ~237 rows (environ)
DELETE FROM `schedule_users`;
/*!40000 ALTER TABLE `schedule_users` DISABLE KEYS */;
INSERT INTO `schedule_users` (`Id`, `ResourceId`, `Name`, `Job`, `Type`, `StartDate`, `EndDate`, `Cls`, `User`) VALUES
	(1643, 2351, '0', 87, 2, '2016-01-18 09:00:00', '2016-01-18 18:00:00', 'orange', 614),
	(1644, 1593, '0', 87, 2, '2016-01-18 09:00:00', '2016-01-18 18:00:00', 'orange', 614),
	(1645, 2351, '0', 88, 2, '2016-01-11 09:00:00', '2016-01-11 18:00:00', 'orange', 614),
	(1646, 1593, '0', 88, 2, '2016-01-11 09:00:00', '2016-01-11 18:00:00', 'orange', 614),
	(1647, 314, '0', 89, 2, '2016-01-26 09:00:00', '2016-01-26 18:00:00', 'orange', 614),
	(1648, 314, '0', 92, 2, '2016-01-27 09:00:00', '2016-01-27 18:00:00', 'orange', 614),
	(1649, 314, '0', 94, 2, '2016-02-08 09:00:00', '2016-02-08 18:00:00', 'orange', 614),
	(1650, 2351, '0', 95, 2, '2016-02-15 09:00:00', '2016-02-15 18:00:00', 'orange', 614),
	(1651, 1593, '0', 95, 2, '2016-02-15 09:00:00', '2016-02-15 18:00:00', 'orange', 614),
	(1652, 314, '0', 90, 2, '2016-01-27 09:00:00', '2016-01-27 18:00:00', 'orange', 614),
	(1653, 453, '0', 101, 2, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(1654, 453, '0', 102, 2, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(1655, 453, '0', 103, 2, '2016-02-23 09:00:00', '2016-02-23 18:00:00', 'orange', 614),
	(1656, 2351, '0', 114, 2, '2016-02-29 09:00:00', '2016-02-29 18:00:00', 'orange', 614),
	(1657, 1593, '0', 114, 2, '2016-02-29 09:00:00', '2016-02-29 18:00:00', 'orange', 614),
	(1658, 2351, '0', 115, 2, '2016-02-29 09:00:00', '2016-02-29 18:00:00', 'orange', 614),
	(1659, 1593, '0', 115, 2, '2016-02-29 09:00:00', '2016-02-29 18:00:00', 'orange', 614),
	(1660, 2351, '0', 80, 2, '2015-08-02 09:00:00', '2015-08-02 18:00:00', 'orange', 614),
	(1661, 1599, '0', 80, 2, '2015-08-02 09:00:00', '2015-08-02 18:00:00', 'orange', 614),
	(1662, 453, '0', 80, 2, '2015-08-02 09:00:00', '2015-08-02 18:00:00', 'orange', 614),
	(1663, 1599, '0', 81, 2, '2015-02-15 09:00:00', '2015-02-15 18:00:00', 'orange', 614),
	(1664, 1707, '0', 81, 2, '2015-02-15 09:00:00', '2015-02-15 18:00:00', 'orange', 614),
	(1665, 453, '0', 9, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1666, 2351, '0', 9, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1667, 2351, '0', 9, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1668, 1593, '0', 9, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1669, 843, '0', 9, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1670, 148, '0', 9, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1671, 453, '0', 9, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1672, 1593, '0', 9, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1673, 314, '0', 2, 2, '2016-03-22 09:00:00', '2016-03-22 18:00:00', 'orange', 614),
	(1674, 823, '0', 2, 2, '2016-03-22 09:00:00', '2016-03-22 18:00:00', 'orange', 614),
	(1675, 2351, '0', 2, 2, '2016-03-22 09:00:00', '2016-03-22 18:00:00', 'orange', 614),
	(1676, 1707, '0', 2, 2, '2016-03-22 09:00:00', '2016-03-22 18:00:00', 'orange', 614),
	(1677, 453, '0', 2, 2, '2016-03-22 09:00:00', '2016-03-22 18:00:00', 'orange', 614),
	(1678, 1593, '0', 2, 2, '2016-03-22 09:00:00', '2016-03-22 18:00:00', 'orange', 614),
	(1679, 314, '0', 4, 2, '2015-09-30 09:00:00', '2015-09-30 18:00:00', 'orange', 614),
	(1680, 823, '0', 4, 2, '2015-09-30 09:00:00', '2015-09-30 18:00:00', 'orange', 614),
	(1681, 823, '0', 4, 2, '2015-09-30 09:00:00', '2015-09-30 18:00:00', 'orange', 614),
	(1682, 314, '0', 4, 2, '2015-09-30 09:00:00', '2015-09-30 18:00:00', 'orange', 614),
	(1683, 823, '0', 4, 2, '2015-09-30 09:00:00', '2015-09-30 18:00:00', 'orange', 614),
	(1684, 314, '0', 4, 2, '2015-09-30 09:00:00', '2015-09-30 18:00:00', 'orange', 614),
	(1685, 823, '0', 4, 2, '2015-09-30 09:00:00', '2015-09-30 18:00:00', 'orange', 614),
	(1686, 314, '0', 4, 2, '2015-09-30 09:00:00', '2015-09-30 18:00:00', 'orange', 614),
	(1687, 1593, '0', 5, 2, '2015-10-01 09:00:00', '2015-10-01 18:00:00', 'orange', 614),
	(1688, 2351, '0', 5, 2, '2015-10-01 09:00:00', '2015-10-01 18:00:00', 'orange', 614),
	(1689, 2351, '0', 8, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1690, 453, '0', 8, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1691, 843, '0', 8, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1692, 148, '0', 8, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1693, 453, '0', 8, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1694, 1593, '0', 8, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1695, 1593, '0', 13, 2, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(1696, 2351, '0', 13, 2, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(1697, 314, '0', 19, 2, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(1698, 823, '0', 19, 2, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(1699, 823, '0', 20, 2, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(1700, 314, '0', 20, 2, '2015-10-06 09:00:00', '2015-10-06 18:00:00', 'orange', 614),
	(1701, 2351, '0', 21, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1702, 1593, '0', 21, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1703, 1593, '0', 22, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1704, 2351, '0', 22, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1705, 2351, '0', 23, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1706, 1593, '0', 23, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1707, 2351, '0', 24, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1708, 453, '0', 24, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1709, 453, '0', 25, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1710, 2351, '0', 25, 2, '2015-03-08 09:00:00', '2015-03-08 18:00:00', 'orange', 614),
	(1711, 314, '0', 26, 2, '2016-03-23 09:00:00', '2016-03-23 18:00:00', 'orange', 614),
	(1712, 823, '0', 26, 2, '2016-03-23 09:00:00', '2016-03-23 18:00:00', 'orange', 614),
	(1713, 314, '0', 26, 2, '2016-03-23 09:00:00', '2016-03-23 18:00:00', 'orange', 614),
	(1714, 823, '0', 26, 2, '2016-03-23 09:00:00', '2016-03-23 18:00:00', 'orange', 614),
	(1715, 823, '0', 26, 2, '2016-03-23 09:00:00', '2016-03-23 18:00:00', 'orange', 614),
	(1716, 314, '0', 26, 2, '2016-03-23 09:00:00', '2016-03-23 18:00:00', 'orange', 614),
	(1717, 823, '0', 26, 2, '2016-03-23 09:00:00', '2016-03-23 18:00:00', 'orange', 614),
	(1718, 314, '0', 26, 2, '2016-03-23 09:00:00', '2016-03-23 18:00:00', 'orange', 614),
	(1719, 823, '0', 26, 2, '2016-03-23 09:00:00', '2016-03-23 18:00:00', 'orange', 614),
	(1720, 314, '0', 26, 2, '2016-03-23 09:00:00', '2016-03-23 18:00:00', 'orange', 614),
	(1721, 823, '0', 28, 2, '2016-03-24 09:00:00', '2016-03-24 18:00:00', 'orange', 614),
	(1722, 314, '0', 28, 2, '2016-03-24 09:00:00', '2016-03-24 18:00:00', 'orange', 614),
	(1723, 823, '0', 29, 2, '2016-03-25 09:00:00', '2016-03-25 18:00:00', 'orange', 614),
	(1724, 314, '0', 29, 2, '2016-03-25 09:00:00', '2016-03-25 18:00:00', 'orange', 614),
	(1725, 823, '0', 29, 2, '2016-03-25 09:00:00', '2016-03-25 18:00:00', 'orange', 614),
	(1726, 314, '0', 29, 2, '2016-03-25 09:00:00', '2016-03-25 18:00:00', 'orange', 614),
	(1727, 823, '0', 29, 2, '2016-03-25 09:00:00', '2016-03-25 18:00:00', 'orange', 614),
	(1728, 314, '0', 29, 2, '2016-03-25 09:00:00', '2016-03-25 18:00:00', 'orange', 614),
	(1729, 823, '0', 29, 2, '2016-03-25 09:00:00', '2016-03-25 18:00:00', 'orange', 614),
	(1730, 314, '0', 29, 2, '2016-03-25 09:00:00', '2016-03-25 18:00:00', 'orange', 614),
	(1731, 823, '0', 31, 2, '2016-03-26 09:00:00', '2016-03-26 18:00:00', 'orange', 614),
	(1732, 314, '0', 31, 2, '2016-03-26 09:00:00', '2016-03-26 18:00:00', 'orange', 614),
	(1733, 823, '0', 32, 2, '2016-03-27 09:00:00', '2016-03-27 18:00:00', 'orange', 614),
	(1734, 314, '0', 32, 2, '2016-03-27 09:00:00', '2016-03-27 18:00:00', 'orange', 614),
	(1735, 823, '0', 33, 2, '2016-03-28 09:00:00', '2016-03-28 18:00:00', 'orange', 614),
	(1736, 314, '0', 33, 2, '2016-03-28 09:00:00', '2016-03-28 18:00:00', 'orange', 614),
	(1737, 823, '0', 34, 2, '2016-03-29 09:00:00', '2016-03-29 18:00:00', 'orange', 614),
	(1738, 314, '0', 34, 2, '2016-03-29 09:00:00', '2016-03-29 18:00:00', 'orange', 614),
	(1739, 1593, '0', 39, 2, '2016-03-31 09:00:00', '2016-03-31 18:00:00', 'orange', 614),
	(1740, 453, '0', 39, 2, '2016-03-31 09:00:00', '2016-03-31 18:00:00', 'orange', 614),
	(1741, 453, '0', 40, 2, '2015-10-18 09:00:00', '2015-10-18 18:00:00', 'orange', 614),
	(1742, 1593, '0', 40, 2, '2015-10-18 09:00:00', '2015-10-18 18:00:00', 'orange', 614),
	(1743, 453, '0', 41, 2, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(1744, 1593, '0', 41, 2, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(1745, 843, '0', 42, 2, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(1746, 148, '0', 42, 2, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(1747, 1593, '0', 42, 2, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(1748, 453, '0', 42, 2, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(1749, 2351, '0', 45, 2, '2015-01-04 09:00:00', '2015-01-04 18:00:00', 'orange', 614),
	(1750, 1593, '0', 45, 2, '2015-01-04 09:00:00', '2015-01-04 18:00:00', 'orange', 614),
	(1751, 2351, '0', 45, 2, '2015-01-04 09:00:00', '2015-01-04 18:00:00', 'orange', 614),
	(1752, 2351, '0', 46, 2, '2015-07-22 09:00:00', '2015-07-22 18:00:00', 'orange', 614),
	(1753, 1593, '0', 46, 2, '2015-07-22 09:00:00', '2015-07-22 18:00:00', 'orange', 614),
	(1754, 2351, '0', 46, 2, '2015-07-22 09:00:00', '2015-07-22 18:00:00', 'orange', 614),
	(1755, 843, '0', 46, 2, '2015-07-22 09:00:00', '2015-07-22 18:00:00', 'orange', 614),
	(1756, 148, '0', 46, 2, '2015-07-22 09:00:00', '2015-07-22 18:00:00', 'orange', 614),
	(1757, 1593, '0', 49, 2, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(1758, 2703, '0', 49, 2, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(1759, 2351, '0', 49, 2, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(1760, 148, '0', 49, 2, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(1761, 148, '0', 49, 2, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(1762, 823, '0', 49, 2, '2015-03-10 09:00:00', '2015-03-10 18:00:00', 'orange', 614),
	(1763, 2351, '0', 50, 2, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(1764, 453, '0', 50, 2, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(1765, 2351, '0', 50, 2, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(1766, 843, '0', 50, 2, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(1767, 843, '0', 50, 2, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(1768, 148, '0', 50, 2, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(1769, 843, '0', 50, 2, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(1770, 148, '0', 50, 2, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(1771, 314, '0', 50, 2, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(1772, 1599, '0', 50, 2, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(1773, 453, '0', 50, 2, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(1774, 1599, '0', 50, 2, '2014-11-24 09:00:00', '2014-11-24 18:00:00', 'orange', 614),
	(1775, 1593, '0', 51, 2, '2015-10-22 09:00:00', '2015-10-22 18:00:00', 'orange', 614),
	(1776, 453, '0', 51, 2, '2015-10-22 09:00:00', '2015-10-22 18:00:00', 'orange', 614),
	(1777, 1593, '0', 53, 2, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(1778, 2351, '0', 53, 2, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(1779, 823, '0', 53, 2, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(1780, 314, '0', 53, 2, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(1781, 823, '0', 53, 2, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(1782, 314, '0', 53, 2, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(1783, 823, '0', 53, 2, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(1784, 314, '0', 53, 2, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(1785, 823, '0', 53, 2, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(1786, 314, '0', 53, 2, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(1787, 823, '0', 53, 2, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(1788, 314, '0', 53, 2, '2016-04-02 09:00:00', '2016-04-02 18:00:00', 'orange', 614),
	(1789, 823, '0', 54, 2, '2016-04-03 09:00:00', '2016-04-03 18:00:00', 'orange', 614),
	(1790, 314, '0', 54, 2, '2016-04-03 09:00:00', '2016-04-03 18:00:00', 'orange', 614),
	(1791, 823, '0', 54, 2, '2016-04-03 09:00:00', '2016-04-03 18:00:00', 'orange', 614),
	(1792, 314, '0', 54, 2, '2016-04-03 09:00:00', '2016-04-03 18:00:00', 'orange', 614),
	(1793, 823, '0', 54, 2, '2016-04-03 09:00:00', '2016-04-03 18:00:00', 'orange', 614),
	(1794, 314, '0', 54, 2, '2016-04-03 09:00:00', '2016-04-03 18:00:00', 'orange', 614),
	(1795, 823, '0', 54, 2, '2016-04-03 09:00:00', '2016-04-03 18:00:00', 'orange', 614),
	(1796, 314, '0', 54, 2, '2016-04-03 09:00:00', '2016-04-03 18:00:00', 'orange', 614),
	(1797, 2351, '0', 55, 2, '2016-04-04 09:00:00', '2016-04-04 18:00:00', 'orange', 614),
	(1798, 1593, '0', 55, 2, '2016-04-04 09:00:00', '2016-04-04 18:00:00', 'orange', 614),
	(1799, 823, '0', 55, 2, '2016-04-04 09:00:00', '2016-04-04 18:00:00', 'orange', 614),
	(1800, 314, '0', 55, 2, '2016-04-04 09:00:00', '2016-04-04 18:00:00', 'orange', 614),
	(1801, 823, '0', 55, 2, '2016-04-04 09:00:00', '2016-04-04 18:00:00', 'orange', 614),
	(1802, 314, '0', 55, 2, '2016-04-04 09:00:00', '2016-04-04 18:00:00', 'orange', 614),
	(1803, 823, '0', 55, 2, '2016-04-04 09:00:00', '2016-04-04 18:00:00', 'orange', 614),
	(1804, 314, '0', 55, 2, '2016-04-04 09:00:00', '2016-04-04 18:00:00', 'orange', 614),
	(1805, 823, '0', 55, 2, '2016-04-04 09:00:00', '2016-04-04 18:00:00', 'orange', 614),
	(1806, 314, '0', 55, 2, '2016-04-04 09:00:00', '2016-04-04 18:00:00', 'orange', 614),
	(1807, 453, '0', 56, 2, '2016-04-05 09:00:00', '2016-04-05 18:00:00', 'orange', 614),
	(1808, 2351, '0', 56, 2, '2016-04-05 09:00:00', '2016-04-05 18:00:00', 'orange', 614),
	(1809, 823, '0', 56, 2, '2016-04-05 09:00:00', '2016-04-05 18:00:00', 'orange', 614),
	(1810, 314, '0', 56, 2, '2016-04-05 09:00:00', '2016-04-05 18:00:00', 'orange', 614),
	(1811, 823, '0', 56, 2, '2016-04-05 09:00:00', '2016-04-05 18:00:00', 'orange', 614),
	(1812, 314, '0', 56, 2, '2016-04-05 09:00:00', '2016-04-05 18:00:00', 'orange', 614),
	(1813, 823, '0', 56, 2, '2016-04-05 09:00:00', '2016-04-05 18:00:00', 'orange', 614),
	(1814, 314, '0', 56, 2, '2016-04-05 09:00:00', '2016-04-05 18:00:00', 'orange', 614),
	(1815, 823, '0', 56, 2, '2016-04-05 09:00:00', '2016-04-05 18:00:00', 'orange', 614),
	(1816, 314, '0', 56, 2, '2016-04-05 09:00:00', '2016-04-05 18:00:00', 'orange', 614),
	(1817, 823, '0', 57, 2, '2016-04-06 09:00:00', '2016-04-06 18:00:00', 'orange', 614),
	(1818, 314, '0', 57, 2, '2016-04-06 09:00:00', '2016-04-06 18:00:00', 'orange', 614),
	(1819, 823, '0', 57, 2, '2016-04-06 09:00:00', '2016-04-06 18:00:00', 'orange', 614),
	(1820, 314, '0', 57, 2, '2016-04-06 09:00:00', '2016-04-06 18:00:00', 'orange', 614),
	(1821, 823, '0', 57, 2, '2016-04-06 09:00:00', '2016-04-06 18:00:00', 'orange', 614),
	(1822, 314, '0', 57, 2, '2016-04-06 09:00:00', '2016-04-06 18:00:00', 'orange', 614),
	(1823, 823, '0', 57, 2, '2016-04-06 09:00:00', '2016-04-06 18:00:00', 'orange', 614),
	(1824, 314, '0', 57, 2, '2016-04-06 09:00:00', '2016-04-06 18:00:00', 'orange', 614),
	(1825, 823, '0', 57, 2, '2016-04-06 09:00:00', '2016-04-06 18:00:00', 'orange', 614),
	(1826, 314, '0', 57, 2, '2016-04-06 09:00:00', '2016-04-06 18:00:00', 'orange', 614),
	(1827, 823, '0', 58, 2, '2016-04-07 09:00:00', '2016-04-07 18:00:00', 'orange', 614),
	(1828, 314, '0', 58, 2, '2016-04-07 09:00:00', '2016-04-07 18:00:00', 'orange', 614),
	(1829, 823, '0', 58, 2, '2016-04-07 09:00:00', '2016-04-07 18:00:00', 'orange', 614),
	(1830, 314, '0', 58, 2, '2016-04-07 09:00:00', '2016-04-07 18:00:00', 'orange', 614),
	(1831, 823, '0', 58, 2, '2016-04-07 09:00:00', '2016-04-07 18:00:00', 'orange', 614),
	(1832, 314, '0', 58, 2, '2016-04-07 09:00:00', '2016-04-07 18:00:00', 'orange', 614),
	(1833, 823, '0', 58, 2, '2016-04-07 09:00:00', '2016-04-07 18:00:00', 'orange', 614),
	(1834, 314, '0', 58, 2, '2016-04-07 09:00:00', '2016-04-07 18:00:00', 'orange', 614),
	(1835, 823, '0', 59, 2, '2015-10-19 09:00:00', '2015-10-19 18:00:00', 'orange', 614),
	(1836, 314, '0', 59, 2, '2015-10-19 09:00:00', '2015-10-19 18:00:00', 'orange', 614),
	(1837, 823, '0', 59, 2, '2015-10-19 09:00:00', '2015-10-19 18:00:00', 'orange', 614),
	(1838, 314, '0', 59, 2, '2015-10-19 09:00:00', '2015-10-19 18:00:00', 'orange', 614),
	(1839, 823, '0', 59, 2, '2015-10-19 09:00:00', '2015-10-19 18:00:00', 'orange', 614),
	(1840, 314, '0', 59, 2, '2015-10-19 09:00:00', '2015-10-19 18:00:00', 'orange', 614),
	(1841, 1593, '0', 61, 2, '2015-10-18 09:00:00', '2015-10-18 18:00:00', 'orange', 614),
	(1842, 2351, '0', 61, 2, '2015-10-18 09:00:00', '2015-10-18 18:00:00', 'orange', 614),
	(1843, 1707, '0', 62, 2, '2016-04-08 09:00:00', '2016-04-08 18:00:00', 'orange', 614),
	(1844, 1593, '0', 62, 2, '2016-04-08 09:00:00', '2016-04-08 18:00:00', 'orange', 614),
	(1845, 823, '0', 62, 2, '2016-04-08 09:00:00', '2016-04-08 18:00:00', 'orange', 614),
	(1846, 2351, '0', 62, 2, '2016-04-08 09:00:00', '2016-04-08 18:00:00', 'orange', 614),
	(1847, 823, '0', 63, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1848, 314, '0', 63, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1849, 823, '0', 63, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1850, 314, '0', 63, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1851, 823, '0', 63, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1852, 314, '0', 63, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1853, 823, '0', 63, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1854, 314, '0', 63, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1855, 823, '0', 63, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1856, 314, '0', 63, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1857, 823, '0', 64, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1858, 314, '0', 64, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1859, 823, '0', 64, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1860, 314, '0', 64, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1861, 823, '0', 64, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1862, 314, '0', 64, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1863, 823, '0', 64, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1864, 314, '0', 64, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1865, 823, '0', 64, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1866, 314, '0', 64, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1867, 823, '0', 65, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1868, 314, '0', 65, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1869, 823, '0', 65, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1870, 314, '0', 65, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1871, 823, '0', 65, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1872, 314, '0', 65, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1873, 823, '0', 65, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1874, 314, '0', 65, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1875, 823, '0', 65, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1876, 314, '0', 65, 2, '2015-10-27 09:00:00', '2015-10-27 18:00:00', 'orange', 614),
	(1877, 2351, '0', 67, 2, '2016-04-09 09:00:00', '2016-04-09 18:00:00', 'orange', 614),
	(1878, 1593, '0', 67, 2, '2016-04-09 09:00:00', '2016-04-09 18:00:00', 'orange', 614),
	(1879, 823, '0', 68, 2, '2016-04-10 09:00:00', '2016-04-10 18:00:00', 'orange', 614),
	(1880, 314, '0', 68, 2, '2016-04-10 09:00:00', '2016-04-10 18:00:00', 'orange', 614),
	(1881, 823, '0', 68, 2, '2016-04-10 09:00:00', '2016-04-10 18:00:00', 'orange', 614),
	(1882, 314, '0', 68, 2, '2016-04-10 09:00:00', '2016-04-10 18:00:00', 'orange', 614),
	(1883, 823, '0', 70, 2, '2016-04-11 09:00:00', '2016-04-11 18:00:00', 'orange', 614),
	(1884, 314, '0', 70, 2, '2016-04-11 09:00:00', '2016-04-11 18:00:00', 'orange', 614),
	(1885, 2351, '0', 71, 2, '2015-11-09 09:00:00', '2015-11-09 18:00:00', 'orange', 614),
	(1886, 1593, '0', 71, 2, '2015-11-09 09:00:00', '2015-11-09 18:00:00', 'orange', 614),
	(1887, 453, '0', 73, 2, '2016-04-12 09:00:00', '2016-04-12 18:00:00', 'orange', 614),
	(1888, 2351, '0', 73, 2, '2016-04-12 09:00:00', '2016-04-12 18:00:00', 'orange', 614),
	(1889, 314, '0', 75, 2, '2016-01-26 09:00:00', '2016-01-26 18:00:00', 'orange', 614),
	(1890, 1707, '0', 76, 2, '2015-11-23 09:00:00', '2015-11-23 18:00:00', 'orange', 614),
	(1891, 314, '0', 76, 2, '2015-11-23 09:00:00', '2015-11-23 18:00:00', 'orange', 614),
	(1892, 823, '0', 77, 2, '2016-04-14 09:00:00', '2016-04-14 18:00:00', 'orange', 614),
	(1893, 314, '0', 77, 2, '2016-04-14 09:00:00', '2016-04-14 18:00:00', 'orange', 614),
	(1894, 2351, '0', 77, 2, '2016-04-14 09:00:00', '2016-04-14 18:00:00', 'orange', 614),
	(1895, 148, '0', 77, 2, '2016-04-14 09:00:00', '2016-04-14 18:00:00', 'orange', 614),
	(1896, 314, '0', 78, 2, '2015-11-29 09:00:00', '2015-11-29 18:00:00', 'orange', 614),
	(1897, 1796, '0', 78, 2, '2015-11-29 09:00:00', '2015-11-29 18:00:00', 'orange', 614);
/*!40000 ALTER TABLE `schedule_users` ENABLE KEYS */;


-- Export de la structure de table sapei. sens
CREATE TABLE IF NOT EXISTS `sens` (
  `Id_sens` int(11) NOT NULL AUTO_INCREMENT,
  `sens` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id_sens`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.sens: ~3 rows (environ)
DELETE FROM `sens`;
/*!40000 ALTER TABLE `sens` DISABLE KEYS */;
INSERT INTO `sens` (`Id_sens`, `sens`) VALUES
	(1, '2 sens'),
	(2, 'Sens des PR croissants'),
	(3, 'Sens des PR décroissants');
/*!40000 ALTER TABLE `sens` ENABLE KEYS */;


-- Export de la structure de table sapei. steps
CREATE TABLE IF NOT EXISTS `steps` (
  `Id_step` int(11) NOT NULL DEFAULT '0' COMMENT 'Id étape',
  `Lib_step` varchar(50) NOT NULL DEFAULT '0' COMMENT 'Libellé étape',
  PRIMARY KEY (`Id_step`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Etapes';

-- Export de données de la table sapei.steps: ~5 rows (environ)
DELETE FROM `steps`;
/*!40000 ALTER TABLE `steps` DISABLE KEYS */;
INSERT INTO `steps` (`Id_step`, `Lib_step`) VALUES
	(1, 'Effectué'),
	(2, 'En cours'),
	(3, 'Non réalisé'),
	(4, 'Programmé'),
	(5, 'Reporté');
/*!40000 ALTER TABLE `steps` ENABLE KEYS */;


-- Export de la structure de table sapei. tasks
CREATE TABLE IF NOT EXISTS `tasks` (
  `id_task` int(11) NOT NULL AUTO_INCREMENT,
  `id_job` int(11) NOT NULL DEFAULT '0',
  `task_type` int(11) NOT NULL DEFAULT '0',
  `task_step` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_task`),
  KEY `task_type` (`task_type`),
  KEY `task_step` (`task_step`),
  KEY `FK_tasks_job` (`id_job`),
  CONSTRAINT `FK_tasks_job` FOREIGN KEY (`id_job`) REFERENCES `job` (`Id_job`),
  CONSTRAINT `FK_tasks_steps` FOREIGN KEY (`task_step`) REFERENCES `steps` (`Id_step`),
  CONSTRAINT `FK_tasks_type_ope` FOREIGN KEY (`task_type`) REFERENCES `type_ope` (`id_type_ope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.tasks: ~0 rows (environ)
DELETE FROM `tasks`;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;


-- Export de la structure de table sapei. traite_agent_ope
CREATE TABLE IF NOT EXISTS `traite_agent_ope` (
  `Id_affectation_traitement` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''affectation des traitements',
  `Id_ope` int(11) DEFAULT NULL COMMENT 'Identifiant de l''opération concernée',
  `Id_agent` int(11) DEFAULT NULL COMMENT 'Identifiant de l''agent qui a réalisé ces mesures',
  PRIMARY KEY (`Id_affectation_traitement`),
  KEY `FK_traite_agent_ope_ope` (`Id_ope`),
  CONSTRAINT `FK_traite_agent_ope_ope` FOREIGN KEY (`Id_ope`) REFERENCES `ope` (`Id_ope`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table de liaison entre l''agent effectuant les traitements et les informations liées à ce traitement';

-- Export de données de la table sapei.traite_agent_ope: ~0 rows (environ)
DELETE FROM `traite_agent_ope`;
/*!40000 ALTER TABLE `traite_agent_ope` DISABLE KEYS */;
/*!40000 ALTER TABLE `traite_agent_ope` ENABLE KEYS */;


-- Export de la structure de table sapei. type_axe
CREATE TABLE IF NOT EXISTS `type_axe` (
  `Id_type_axe` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de l''axe',
  `Lib_type_axe` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Libellé de l''axe',
  PRIMARY KEY (`Id_type_axe`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Table de référence des types d''axe';

-- Export de données de la table sapei.type_axe: ~3 rows (environ)
DELETE FROM `type_axe`;
/*!40000 ALTER TABLE `type_axe` DISABLE KEYS */;
INSERT INTO `type_axe` (`Id_type_axe`, `Lib_type_axe`) VALUES
	(1, 'RD'),
	(2, 'RN'),
	(3, 'MULTI-AXE');
/*!40000 ALTER TABLE `type_axe` ENABLE KEYS */;


-- Export de la structure de table sapei. type_chaussee
CREATE TABLE IF NOT EXISTS `type_chaussee` (
  `Id_type_chaussee` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id type chaussée',
  `Lib_type_chaussee` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Libellé du type de chaussée',
  PRIMARY KEY (`Id_type_chaussee`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Table de référence des types de chaussée';

-- Export de données de la table sapei.type_chaussee: ~6 rows (environ)
DELETE FROM `type_chaussee`;
/*!40000 ALTER TABLE `type_chaussee` DISABLE KEYS */;
INSERT INTO `type_chaussee` (`Id_type_chaussee`, `Lib_type_chaussee`) VALUES
	(1, 'Bi-directionnelle'),
	(2, '2 x 2 voies'),
	(3, '2 x 3 voies'),
	(4, 'Bretelles'),
	(5, 'Autres'),
	(6, '2 x 1 voie');
/*!40000 ALTER TABLE `type_chaussee` ENABLE KEYS */;


-- Export de la structure de table sapei. type_contact
CREATE TABLE IF NOT EXISTS `type_contact` (
  `Id_type_contact` varchar(2) NOT NULL COMMENT 'Id type contact',
  `Lib_type_contact` varchar(50) DEFAULT NULL COMMENT 'Libellé type contact',
  PRIMARY KEY (`Id_type_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Type de contact CH -> Chantier, CC -> Client';

-- Export de données de la table sapei.type_contact: ~2 rows (environ)
DELETE FROM `type_contact`;
/*!40000 ALTER TABLE `type_contact` DISABLE KEYS */;
INSERT INTO `type_contact` (`Id_type_contact`, `Lib_type_contact`) VALUES
	('1', 'PRINCIPAL'),
	('2', 'CHANTIER');
/*!40000 ALTER TABLE `type_contact` ENABLE KEYS */;


-- Export de la structure de table sapei. type_materiel
CREATE TABLE IF NOT EXISTS `type_materiel` (
  `Id_type_materiel` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du type de matériel',
  `Libelle_type_materiel` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Libellé de la typologie du matériel',
  PRIMARY KEY (`Id_type_materiel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Table de référence des différents types de matériels';

-- Export de données de la table sapei.type_materiel: ~1 rows (environ)
DELETE FROM `type_materiel`;
/*!40000 ALTER TABLE `type_materiel` DISABLE KEYS */;
INSERT INTO `type_materiel` (`Id_type_materiel`, `Libelle_type_materiel`) VALUES
	(1, 'Divers');
/*!40000 ALTER TABLE `type_materiel` ENABLE KEYS */;


-- Export de la structure de table sapei. type_ope
CREATE TABLE IF NOT EXISTS `type_ope` (
  `id_type_ope` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `libelle_ope` varchar(150) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_type_ope`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.type_ope: ~5 rows (environ)
DELETE FROM `type_ope`;
/*!40000 ALTER TABLE `type_ope` DISABLE KEYS */;
INSERT INTO `type_ope` (`id_type_ope`, `order_id`, `libelle_ope`) VALUES
	(1, 2, 'Etudes : Contact client - Définition du cahier des charges'),
	(2, 3, 'Etudes : Diagnostic, modélisation'),
	(3, 4, 'Etudes : Rapport et solution de travaux'),
	(4, 1, 'Mesures'),
	(5, 5, 'Traitement des données');
/*!40000 ALTER TABLE `type_ope` ENABLE KEYS */;


-- Export de la structure de table sapei. type_prestation
CREATE TABLE IF NOT EXISTS `type_prestation` (
  `Id_type_prestation` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id type prestation',
  `Libelle_type_prestation` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Libellé type prestation',
  PRIMARY KEY (`Id_type_prestation`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Table de référence des différents types de prestation.';

-- Export de données de la table sapei.type_prestation: ~6 rows (environ)
DELETE FROM `type_prestation`;
/*!40000 ALTER TABLE `type_prestation` DISABLE KEYS */;
INSERT INTO `type_prestation` (`Id_type_prestation`, `Libelle_type_prestation`) VALUES
	(1, 'Auscultation'),
	(2, 'Etude d\'entretien'),
	(3, 'Dimensionnement chaussées neuves'),
	(4, 'Avis technique'),
	(5, 'Suivi pluriannuel'),
	(6, 'Suivi innovation');
/*!40000 ALTER TABLE `type_prestation` ENABLE KEYS */;


-- Export de la structure de table sapei. user
CREATE TABLE IF NOT EXISTS `user` (
  `Id_user` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant de l''utilisateur de l''application',
  `Id_agent` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifiant de l''agent dans BPC',
  `Id_role_agent` int(11) NOT NULL DEFAULT '0' COMMENT 'Rôle de l''agent dans l''application',
  `Droit_agent` int(11) NOT NULL DEFAULT '0' COMMENT 'Droit de l''agent dans l''application',
  `Etat_droit_agent` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Booléen Utilisateur actif',
  PRIMARY KEY (`Id_user`),
  KEY `FK_user_role` (`Id_role_agent`),
  KEY `Id_agent` (`Id_agent`),
  CONSTRAINT `FK_user_role` FOREIGN KEY (`Id_role_agent`) REFERENCES `role` (`Id_role_agent`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Table des utilisateurs de l''application';

-- Export de données de la table sapei.user: ~13 rows (environ)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`Id_user`, `Id_agent`, `Id_role_agent`, `Droit_agent`, `Etat_droit_agent`) VALUES
	(2, 614, 2, 0, 0),
	(3, 2703, 2, 0, 0),
	(4, 1796, 2, 0, 0),
	(5, 1599, 2, 0, 0),
	(6, 1593, 2, 0, 0),
	(7, 2351, 2, 0, 0),
	(8, 314, 2, 0, 0),
	(9, 453, 2, 0, 0),
	(10, 1707, 2, 0, 0),
	(11, 148, 2, 0, 0),
	(12, 843, 2, 0, 0),
	(13, 2407, 2, 0, 0),
	(14, 823, 2, 0, 0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Export de la structure de table sapei. wiki
CREATE TABLE IF NOT EXISTS `wiki` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poster` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `job` int(11) NOT NULL DEFAULT '0',
  `blog` text,
  PRIMARY KEY (`id`),
  KEY `poster` (`poster`),
  KEY `job` (`job`),
  CONSTRAINT `FK_wiki_job` FOREIGN KEY (`job`) REFERENCES `job` (`Id_job`),
  CONSTRAINT `FK_wiki_user` FOREIGN KEY (`poster`) REFERENCES `user` (`Id_agent`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.wiki: ~152 rows (environ)
DELETE FROM `wiki`;
/*!40000 ALTER TABLE `wiki` DISABLE KEYS */;
INSERT INTO `wiki` (`id`, `poster`, `date`, `job`, `blog`) VALUES
	(34, 2703, '2016-01-19 00:00:00', 87, 'Contact téléphonique pris avec E. fabre de la DIR Med. En attente de proposition de dates pour une nuit, semaine 6                  &#40;OR&#41;'),
	(35, 2703, '2016-01-27 00:00:00', 87, 'Deux propositions ont été faites à J.BONNET soit la nuit du 9 soit la nuit du 10/02\nEn attente de sa réponse                                                                                                                                                         &#40;OR&#41;'),
	(36, 2703, '2016-01-28 00:00:00', 87, 'Mail de J.Bonnet indiquant la nuit du 9 au 10 /02.Appel de Jéremy au CEI qui annonce la nuit du 11 au 12. \nJ&apos;ai appelé J.BONNET pour lui demander de voir cela avec le CEI/ Doit me rappeler millieu de semaine  5  pour confirmation.    &#40;OR&#41;'),
	(37, 2703, '2016-01-28 00:00:00', 87, 'mesure déflecto réalisées du PR 78+400 au PR68+0\npuis du PR 61+500 au PR60+200\nimpossibilité de réaliser jusqu&apos;au PR 67+0 et au PR 60+0 car brettelle de sortie RN568 et début d&apos;autoroute.\n\nJC'),
	(38, 2703, '2016-12-26 00:00:00', 88, 'A priori seule la note d&apos;accompagnement n&apos;a pas été transmise au client.\nElements transmis par Nicolas le 25/01.\nDevis envoyé et facture reçue.                                                                      &#40;OR&#41;'),
	(39, 2703, '2016-01-29 00:00:00', 88, 'Vu aavec client. Affaires terminée.      &#40;OR&#41;'),
	(40, 2703, '2016-01-27 00:00:00', 89, 'Demande reçu par mail par eiffage le 26/01. Suite à échange téléphonique avec M.ESTRADE, un complément d&apos;info sur la localisation de la zone a été demandé à G.MONIS du SIR de Montpellier.                                         &#40;OR&#41;'),
	(41, 2703, '2016-01-28 00:00:00', 89, 'G.MONIS a donné les PR Exacts et précisé qu&apos;il s&apos;agit d&apos;une 2x1 voie.        &#40;OR&#41;'),
	(42, 2703, '2016-02-01 00:00:00', 89, 'Mesures après travaux programmées 29/02. Pierre+ Badou.     Au niveau du traitement neutraliser les notes aux raccordements &#40;Pour éviter les discussions stériles avec l&apos;entreprise&#41;    &#40;OR&#41;'),
	(43, 2703, '2016-03-02 00:00:00', 89, 'Traitement effectués et résultats envoyés par Pierre par Mail ce jour                   &#40;OR&#41;'),
	(44, 2703, '2016-01-28 00:00:00', 92, 'Point d&apos;échange avec J.Quittard qui réalise le devis        \nJe dois le recontacter pour lui indiquer la période  à laquelle  les mesures pour être réalisées.         &#40;OR&#41;'),
	(45, 2703, '2016-02-01 00:00:00', 92, 'Mesures  programmées le 1/03. Pierre+ Badou.          &#40;OR&#41;'),
	(46, 2703, '2016-02-20 00:00:00', 92, 'Traitement effectué et  résultats envoyés par mail par Pierre ce jour                                   &#40;OR&#41;'),
	(47, 2703, '2016-02-04 00:00:00', 93, 'Etablir un devis pour la prestation assistance sur la base des prix marché auscultation en cours\nEtablir un devis pour une prestation TUS pour RD9 + axes prochés. En attente d&apos;éléménts de la part du CD34     &#40;OR&#41;'),
	(48, 2703, '2016-02-22 00:00:00', 93, ''),
	(49, 2703, '2016-02-09 00:00:00', 94, 'Le client demandeune procédure d&apos;exécution pour la transmettre à son client la DIR MED.         \nDevis à établir et date à caler avec Pierre.                         &#40;OR&#41;'),
	(50, 2703, '2016-02-23 00:00:00', 94, ''),
	(51, 2703, '2016-02-23 00:00:00', 95, 'Devis adressé par OR au client. Stade actuel : réponse à l&apos;AO.                    &#40;OR&#41;'),
	(52, 2703, '2016-02-23 00:00:00', 84, 'Au 17/12/2015\nEchange de mail entre V.MAUDUIT et D.JAN sur la problématique de la prise en charge des coûts de transport des matériels dans le cadre du pré programmé. Rép positive de V. MAUDUIT par mail du 16/12/2015. V.MAUDUIT nous recontacte pour caler la programmation.              &#40;O.R&#41;'),
	(53, 2703, '2016-02-23 00:00:00', 85, 'Au &#40;17/12/2015&#41;\nPar mail du 25/09/2015 Roland BLANC du SPMG indique :\n&quot; La commande de la suspension hydropneumatique va être commandée chez JSA pour un montant de :\n- 3 530.00€HT &#40;travaux&#41; pris sur des crédits GESI Labo\n- 4 000.00€HT pris sur des crédits fonctionnement SPMG\nLe délai total est de 3 mois à réception de commande. L&apos;objectif est de passer rapidement les commandes.&quot;\nCommande passée ?                                                                 &#40;OR&#41;'),
	(54, 2703, '2016-01-28 00:00:00', 90, 'Prise de contact par mail du client. Un mail lui a été adressé pour compléter le formulaire. \nFormuilaire rempli par le client sans soucis \nContact pris avec J.Quittard. Qui prépare le devis. Je dois lui transmettre nos dispo dès que Pierre rentre     &#40;OR&#41;'),
	(55, 2703, '2016-02-01 00:00:00', 90, 'Mesures  programmées entre le 22 et le 24/02. Pierre+ Badou.          &#40;OR&#41;'),
	(56, 2703, '2016-03-09 00:00:00', 90, 'Pierre a fait une demande de protection par mail le 26/02 à Cgiraud et a proposé une intervention le 3 mars 2016\nPas de réponse à ce jour.                                                                                          &#40;OR&#41;'),
	(57, 2703, '2016-02-17 00:00:00', 98, 'Préalable à l&apos;acceptation de la prestation  : récupérer les remorques bloquées par Rincent &#40;Affaire de Tahiti&#41; + trouver des volontaires            &#40;OR&#41;'),
	(58, 2703, '2016-01-27 00:00:00', 100, ''),
	(59, 2703, '2016-02-14 00:00:00', 101, 'Mesurer à réaliser au cours de 2016 pas d epriorité données par le client.                    &#40;OR&#41;'),
	(61, 2703, '2016-02-14 00:00:00', 103, 'Mesurer à réaliser au cours de 2016 pas d epriorité données par le client.                    &#40;OR&#41;'),
	(62, 2703, '2016-02-24 00:00:00', 104, 'Se coordonner avec  Lyon et Autun pour satisfaire la demande                  &#40;OR&#41;'),
	(63, 2703, '2016-02-24 00:00:00', 105, 'Se coordonner avec  Lyon et Autun pour satisfaire la demande                  &#40;OR&#41;'),
	(64, 2703, '2016-02-24 00:00:00', 106, 'Se coordonner avec  Lyon et Autun pour satisfaire la demande                  &#40;OR&#41;'),
	(65, 2703, '2016-02-24 00:00:00', 107, 'Se coordonner avec  Lyon et Autun pour satisfaire la demande                  &#40;OR&#41;'),
	(66, 2703, '2016-01-20 00:00:00', 114, 'En attente de confirmation et de précision de P.DUARTE                          &#40;OR&#41;'),
	(67, 2703, '2016-01-20 00:00:00', 115, 'En attente de confirmation et de précision de P.DUARTE                          &#40;OR&#41;'),
	(68, 1599, '2016-01-20 00:00:00', 79, 'Le 04/12/15 &#40;Point fixe&#41;\nRéunion avec DCEDI le 19/11/15 :\nCréation de créneau - élargissement &#40;travaux neufs&#41; mais aussi renforcement de la structure existante\nTravail à faire par SAPEI :\nRecherche bibliographique par rapport à la structure existante -&gt; délai mi-janvier, une note par NS\nDimensionnement des élargissements neufs &#40;PF2, 20 ans,k repartir avec les hypothèses de dimensionnement du secteur PRAS&#41; -&gt; délai mars\nO. Cardusi enverra les détails du projet &#40;localisation des secteurs avec les créneaux&#41;\n\nSi l&apos;étude bibliographique indique l&apos;absence de données ou peu de données sur la structure , il est à prévoir une étude d&apos;entretien qui serait décalée par rapport au rendu du dossier préalable. Indiquer dans ce dossier, la necessité de réaliser une telle étude.\nSi étude, auscultation en avril 2016.\n&#40;Nadège&#41;'),
	(69, 1599, '2016-01-20 00:00:00', 81, 'Au 22/01/16 &#40;Point Fixe&#41;\nPremieres investigations --&gt; il y a des donnes dans les études archivées.\nEtude biblio à faire\n&#40;Sophie&#41;\nLe 04/12/15 &#40;Point Fixe&#41;\nTraitement radar fait avec implantation des carottes\nDiagnostic amainte non fait sur l&apos;ensemble des chaussées\nLe diagnostic amainte sera fait par ECSA  Habitat en présence de NS\nRéunion de calage le 14/12/15 - présence USID/ECSA/NS\nLes carottes amainte = carottes pour auscultation\nSAPEI ne devrait pas réaliser de carottages\nA planifier début janvier 2016\n&#40;Nadège&#41;\nLe 04/12/15 &#40;Point Fixe&#41;\nEtude en cours pour le RRN \nEchange tél avec Valery Mauduit pour caler les satrégies et rendu rapport le 05/11/15\n&#40;Nadège&#41;'),
	(70, 1599, '2016-01-20 00:00:00', 9, 'Au 22/01/16 &#40;Point Fixe &#41;\nSI des RD et RN envoyées\nSI alert comparaison 2009/2015 envoyés\nPlan du rapport à faire\n&#40;Sophie &#41;\nLe 21/10/2015\nObjectif = Etude d&apos;entretien\nAuscultation radar et deflexions faites\nTraitement du signal radar par SM, trairement des deflexions par NS.\n Reponse JL Vergnol par mail le 22/09/15 pour les carottages amainte :\n&quot;à ce jour, il n&apos;y a pas de recherche amiante réalisée sur ces sections. Tu peux te rapprocher de Patrick TESTUD, responsable du Pôle Ingénierie du district centre, pour commander des carottages par le marché que la DIR MC a passé avec QUALYS TPI.&quot;\n                                                                                  \nCarottages amiante à réaliser avant opération carottages -&gt; optimisation de leurs emplacement fonction diagnostic étude,\nCarottages &#40;si il y a fonction retour carottes amiante&#41; plutôt en janvier….\n                                                                                                                                                                                                                                     &#40;Nadège&#41;'),
	(71, 1599, '2016-01-20 00:00:00', 9, 'Le 06/11/2015 &#40;Point Fixe&#41;\nSSV planifié le 12/11/2015 &#40;SF/TC&#41;\nTraitement radar à reprendre\nResponsable étude : SF\n&#40;Nadège&#41;'),
	(72, 1599, '2016-01-20 00:00:00', 9, 'Le 04/12/15 &#40;Point Fixe&#41;\nSSV fait le 12/11/15\nTraitement radar à reprendre le 07/12/15 par NS  : image radar pour implanter les carottes\nCarottages programmés les 10 et 11/12/15 à confirmer\nRelance à faire pour l&apos;amiante auprès de P. Testud &#40;y compris les 2 autres sections&#41;\nDT/DICT lancé par Simon toujuurs valide\n&#40;Nadège&#41;'),
	(73, 1599, '2016-01-20 00:00:00', 9, 'Le 07/12/15\nErreur de lecture du fichier transmis par JL Vergnol par NS :\n Carotte amiante faite au PR68 -&gt; diagnostic amiante négatif'),
	(74, 1599, '2016-01-20 00:00:00', 9, 'Le 21/01/15\nCarottages effectués les 10 et 11 décembre 2015\nRelevé des carottes, fiches carottes, insertion carottes dans SI  FAIT\nAjustement des ZH\nRecherche biblio --&gt; FAIT\nReste à faire : phase diagnostic, modélisations, détermination des solutions, vérification au gel et rédaction du rapport\n&#40;Sophie&#41;'),
	(75, 1599, '2016-01-20 00:00:00', 9, 'Au 22/01/16 &#40;Point Fixe &#41;\nObjectif rendu étude : mars 2016\n&#40;Sophie&#41;'),
	(76, 2703, '2016-01-20 00:00:00', 2, 'Au 04/02/16\nRetour du formulaire &quot;hypothèses de dimensionnement&quot; par JLV le 26/01/16\nPBm sur données de trafic pas assez précises &#40;classe trafic PL T3 pris en compte : entre 50 et 150PL !!!!! : pas possible de dimensionner avec ça!&#41;\nDonnées de trafic  issues de comptages 2015 envoyées  par JLV le 3/02/16.\n&#40;Sophie &#41;\n21/10/15\nContact non pris avec le SIR Mende\nAu 14/10/2015\nvoir avec Pierre la date à laquelle le traitement des données APL sera fait.                                       &#40;O.RUIZ&#41;'),
	(77, 2703, '2016-01-20 00:00:00', 2, 'Au &#40;29/10/2015&#41;\nProtection à caler pour Rugo en VR\nPassage rugo à caler                                          &#40;O.R&#41;'),
	(78, 2703, '2016-01-20 00:00:00', 2, 'Au &#40;30/10/2015&#41;\nLaure  essaie de caler une intervention RUGO dans les 15 j. Un passage ECODYN est également désormais demandé par le SIR de Montpellier.\nPour le passage ecodyn en attente de la réponse de B.FOUQOU.         &#40;O.R&#41;'),
	(79, 2703, '2016-01-20 00:00:00', 2, 'Au &#40;10/10/2015&#41;\nAccord de B.FOUQOU pour effectuer les mesures écodyn pour le compte du SIR\nRugo : mesures effectuées en Rive et Axe le 9/10 &#40;Par Jéremy + Dominique&#41;. Affectation du Traitement à caler\nMesures ECODYN prévues les 9 et 10 Novembre.                                               &#40;O.R&#41;'),
	(80, 2703, '2016-01-20 00:00:00', 2, 'Au &#40;20/11/2015&#41;\nEnvoi des mesures ECODYN au client effectué ce jour par Nicolas.         &#40;OR&#41;'),
	(81, 2703, '2016-01-29 00:00:00', 2, 'Voir avec Pierre, dominique qui réalise le traitement, rendu de forme SI ?           &#40;OR&#41;'),
	(82, 2703, '2016-01-29 00:00:00', 4, 'Au &#40; 01/03/16&#41;\nNote accompagnement APL réaliser par Pierre et envoyée.\nMesures RUGO réalisées par Dominique et Jérémy le 18/11/2015. Reste à réaliser l&apos;exploitation et la note d&apos;accompagnement.                  &#40;LB&#41;\nAU 2/10/2015 :\nDes demandes séparées de mise en protection pour le déflecto et l&apos;APL ont été effectuées.\nMail de Nicolas le ../../…., Mail de Pierre le 2/10/2015\nLe gestionnaire n&apos;est pas d&apos;accord pour assurer une protection commune au déflecto et à l&apos;APL &#40;Mail du 2/10/2015&#41;.\nEn attente de sa réponse pour la protection de l&apos;APL'),
	(83, 2703, '2016-01-29 00:00:00', 4, 'Au 14/10/2015\nVoir avec Pierre les réponses obtenues par téléphone au sujet de la protection.\nIl a été convenu avec M.AYRINHAC qu&apos;un contact téléphonique pour valider l&apos;intervention soit effectué vendredi 16/10 ou lundi 19/10. Pas d&apos;intervention en cas de route humide &#40;pb avec Rugo&#41;                                                                                                                                                                   &#40;O.RUIZ&#41;'),
	(84, 2703, '2016-01-29 00:00:00', 4, 'Au &#40;27/10/2015&#41;\nAffaire Terminée pour  Laure, pour Pierre à voir…                                &#40;O.R&#41; '),
	(85, 2703, '2016-01-29 00:00:00', 5, 'Le 10/11/2015\nMesures défleto  programmée finalement le 18/11. Mail d&apos;OR le 10/11 pour confirmation et demande de protection à M.GILENI  \nNicolas + Jéremy    \nDevis envoyé ce jour                                                                                   &#40;O.R&#41;'),
	(86, 2703, '2016-01-29 00:00:00', 5, 'Le 18/11/2015\nNC + JC se sont rendus sur place. La protection n&apos;était pas à la hauteur &#40;Fiche CM 143&#41;. Aucune mesure n&apos;a été effectuée. M. GILENI a été informé par téléphone.\nDate à recaler. Voir si le déplacement est à compter dans la facturation ?                            &#40;O.R&#41;'),
	(87, 2703, '2016-01-29 00:00:00', 5, 'Au 30/11/2015\nM. GILENI a été  contacté par S. WASNER reconnait le Pb. Nicolas devra recontacter les gens d&apos;ASF pour caler un nouveau RdV.             &#40;OR&#41;'),
	(88, 2703, '2016-01-29 00:00:00', 5, 'Au 18/12/2015\nPascal Robin nous a transmis le bon de commande signé. Nicolas merci de recaler un rendez-vous avec M.GILENI si possible avant la mi-janvier.    &#40;OR&#41;'),
	(89, 2703, '2016-01-29 00:00:00', 5, 'Rendez vous au mardi 9/02                           &#40;OR&#41;\nTraitement à faire pour fin de semaine 6\n______________________________________________\nau 10/02/16\nmesures déflecto terminées , traitement en cours et à terminer vendredi suivant la demande…\nJC'),
	(90, 1599, '2016-01-29 00:00:00', 8, 'Le 21/10/15\nContact client et accord le 08/06/15 :\nDéfintion de zones de purges à partir des données de deflexions et du radar.\nCalage du signal radar à partir des carottes faites dans le cadre de la recherche amiante &#40;NS a pris contact avec JL Vergnol pour les carottes&#41;\nReponse JL Vergnol par mail le 22/09/15 :\n&quot;à ce jour, il n&apos;y a pas de recherche amiante réalisée sur ces sections. Tu peux te rapprocher de Patrick TESTUD, responsable du Pôle Ingénierie du district centre, pour commander des carottages par le marché que la DIR MC a passé avec QUALYS TPI.&quot;\n\n&#40;Nadège&#41;'),
	(91, 1599, '2016-01-29 00:00:00', 8, 'Le 06/11/2015 &#40;Point Fixe&#41;\nSSV planifié le 12/11/2015 &#40;SF/TC&#41;\nTraitement radar à reprendre\n&#40;Nadège&#41;'),
	(92, 1599, '2016-01-29 00:00:00', 8, 'Le 04/12/15 &#40;Point Fixe&#41;\nSSV fait le 12/11/15 &#40;SF/TC&#41;\nPas d&apos;avancement \nA prendre en charge en janvier\n&#40;Nadège&#41;'),
	(93, 2703, '2016-01-29 00:00:00', 13, 'Au 22/01/16 &#40;Point Fixe &#41;\nNS envoie un mail à JLV pour voir ce qu&apos;ils attendent réellement.\n&#40;Sophie&#41;\nAu &#40;19/10/2015&#41;\nMail de S.WASNER à J.QUITTARD du 26/05/2015 &#40;12h39&#41;\nAffaire transférée à l&apos;antenne de Montpellier. Même pour le déflecto ?\nPas de nouvelle à ce jour.                                                          &#40;O.RUIZ&#41;'),
	(94, 2703, '2016-01-29 00:00:00', 13, 'Au &#40;30/11/2015&#41;\nSuite à échange pail avec P.MORIOT pour confirmation. Il apparaît que le besoin en déflecto porte sur le sens 2 PR 159  à PR170. &#40;Mail de JL Vergnol Chargé d&apos;étude à la DIR MC&#41;                                                    \nVoir avec Sébastien si c&apos;est montpellier ou nous qui assuront la mesure en déflecto.              &#40;O.RUIZ&#41;'),
	(95, 2703, '2016-01-29 00:00:00', 14, 'Au &#40;19/10/2015&#41;\nMail de S.WASNER à J.QUITTARD du 26/05/2015 &#40;12h39&#41;\nAffaire transférée à l&apos;antenne de Montpellier.\nPas de nouvelle à ce jour.                                                          &#40;O.RUIZ&#41;'),
	(96, 2703, '2016-01-29 00:00:00', 16, 'Au &#40;19/10/2015&#41;\nMail de S.WASNER à J.QUITTARD du 26/05/2015 &#40;12h39&#41;\nAffaire transférée à l&apos;antenne de Montpellier.\nPas de nouvelle à ce jour.                                                          &#40;O.RUIZ&#41;'),
	(97, 2703, '2016-01-29 00:00:00', 17, 'Au &#40;19/10/2015&#41;\nMail de S.WASNER à J.QUITTARD du 26/05/2015 &#40;12h39&#41;\nAffaire transférée à l&apos;antenne de Montpellier.\nPas de nouvelle à ce jour.                                                          &#40;O.RUIZ&#41;'),
	(98, 2703, '2016-01-29 00:00:00', 18, 'Réponse du 30/04 14h35\nClermont accepte de prendre l&apos;affaire                                                                      &#40;O.RUIZ&#41;'),
	(99, 2703, '2016-01-29 00:00:00', 21, 'Au 13/10/2015\nAix : traitement FOMEC. Le reste est traité par le Labo de Clermont pour le rentrer dans la Base de la DIR MC   &#40;O.RUIZ&#41;'),
	(100, 2703, '2016-01-29 00:00:00', 21, 'au 09/12/2015\ntraitement fomec et fichiers top envoyé à P,duarte                     JC'),
	(101, 2703, '2016-01-29 00:00:00', 22, 'Au &#40;13/10/2015&#41;\nSens gauche mesures du PR 215 +000 au PR180 +000\nReste mesure du 228 au 223 et 219 au 216 . Soucis avec le CEI de la Cavalerie'),
	(102, 2703, '2016-01-29 00:00:00', 22, 'Au &#40;27/10/2015&#41;\nEn attente de réponse du mail adressé à P.MARIOT envoyé  le 28/10          &#40;O.R&#41;'),
	(103, 2703, '2016-01-29 00:00:00', 22, 'Au &#40;10/11:2015&#41;\nReponse de P.MARIOT. En attente d&apos;un interlocuteur pour caler les 8 km restants.                         &#40;O.R&#41;'),
	(104, 2703, '2016-01-29 00:00:00', 22, 'au 09/12/2015\ntraitement fomec et fichier top envoyé à philippe duarte \nreste du pr 228 au pr216                                                                                         JC'),
	(105, 2703, '2016-01-29 00:00:00', 22, 'Contact entre P.DUARTE et Jérémy. Ok pour les mesures envoyées. Mesures restantes abandonnées ? Un mail sera adressé à P. Mariot pour confirmation.\n&#40;OR&#41;'),
	(106, 2703, '2016-02-18 00:00:00', 22, 'La DIR MC confirme à priori le besoin en déflexion sur la zone 228 - 223 et 219 -216\n&quot;Je vous confirme que nous désirons toujours avoir ces mesures de déflexions. Je les ai inscrites dans le programme 2016 qui est piloté par le DLCF. Philippe Duarte vous contactera  à ce sujet.&quot; &#40;Mail du 15/02 de BOFILL Yann&#41;              &#40;OR&#41;'),
	(107, 2703, '2016-02-18 00:00:00', 23, 'Au &#40;13/10/2015&#41;\nPré Traitement par Aix. Envoie des données au LR de Clermont.                  &#40;O.RUIZ&#41;'),
	(108, 2703, '2016-02-18 00:00:00', 23, 'au 09/12/2015\ntraitement fomec et fichiers top envoyé à P,duarte                     JC'),
	(109, 2703, '2016-02-18 00:00:00', 24, 'Au 13/10/2015\nTraitement dans les 2 sens effectués.\n                                                                                                                   &#40;O.RUIZ&#41;'),
	(110, 2703, '2016-02-18 00:00:00', 24, 'Au &#40;12/11/2015&#41;\nThierry a réalisé le traitement. Mais rien n&apos;a été envoyé.                     &#40;O.R&#41;'),
	(111, 2703, '2016-01-29 00:00:00', 24, 'Jérémy a envoyé par mail le fichier à Philippe Duarte                     &#40;OR&#41;'),
	(112, 2703, '2016-01-29 00:00:00', 25, 'Au &#40;13/10/2015&#41;\nTraitement dans les 2 sens effectués.\n                                                                                                                   &#40;O.RUIZ&#41;'),
	(113, 2703, '2016-01-29 00:00:00', 25, 'Au &#40;12/11/2015&#41;\nThierry a réalisé le traitement. Mais rien n&apos;a été envoyé.                     &#40;O.R&#41;'),
	(114, 2703, '2016-01-29 00:00:00', 25, 'Jérémy a envoyé par mail le fichier à Philippe Duarte                     &#40;OR&#41;'),
	(115, 2703, '2016-01-29 00:00:00', 26, 'Au 14/10/2015\nReste la question du traitement des données.\nIRCAN, rugo, TUS mesures prévues le 19 ou le 20.\nFaire point sur la demande de protection avec Pierre.                                                 &#40;O.RUIZ&#41;'),
	(116, 2703, '2016-01-29 00:00:00', 26, 'Au &#40;29/10/2015&#41;\nL&apos;ensemble des mesures sur le 3E+R ont été  terminées en 2014\nPas de passage SSV car Utilisation de VISIODEC\nReste sur le plan B 44T : le Tus + RUGO &#40;en Rive et axe&#41;  et IRCAN                                                 &#40;O.R&#41;'),
	(117, 2703, '2016-01-29 00:00:00', 28, 'Au 14/10/2015\nSuivi terminé. Prévoir un relevé de dégradations M2 ou M3 en 2016. Dans le cadre du suivi du M2 a été réalisé.                              &#40; O.RUIZ &#41;\nVoir si les SI ont été transmis au client ?'),
	(118, 2703, '2016-01-29 00:00:00', 28, 'Au 28 /10/ 2015\nMe confirmer que l&apos;ensemble des relevés demandés ont été effectué. A l&apos;origine il n&apos;y avait que du TUS ?                                         &#40;O.R&#41;'),
	(119, 2703, '2016-01-29 00:00:00', 29, 'Au 14/10/2015\nA définir? Voir si c&apos;est Laure qui réalise le traitement.                                                                &#40;O.RUIZ&#41;'),
	(120, 2703, '2016-01-29 00:00:00', 29, 'Au19/10/2015\nLes mesures ont été effectuées                                                                                                             &#40;O.RUIZ&#41;'),
	(121, 2703, '2016-01-29 00:00:00', 31, 'Au 14/10/2015\nLaure doit faire un point avec Nadège au sujet des critères à appliquer.                                   &#40;O.RUIZ&#41;'),
	(122, 2703, '2016-01-29 00:00:00', 31, 'Au &#40;29/10/2015&#41;\nRapport réalisé par Laure et envoyé par Nadège. Affaire Cloturée                                      &#40;O.R&#41;'),
	(123, 2703, '2016-01-29 00:00:00', 32, 'Au 14/10/2015\nRefaire un point à 3 pour programmer les mesures après travaux. Les mesures avant tX ont réalisés ainsi que le traitement sur tous les axes.    &#40;O.RUIZ&#41;'),
	(124, 2703, '2016-01-29 00:00:00', 32, 'Au &#40;30/11/2015&#41;\nVu avec Pierre Traitement avant travaux APL réalisés                                   &#40;OR&#41;'),
	(125, 2703, '2016-02-01 00:00:00', 32, 'Mesures après travaux programmées entre le 22 et le 24/02. Pierre+ Badou.          &#40;OR&#41;'),
	(126, 2703, '2016-02-01 00:00:00', 33, 'Au 14/10/2015\nPar rapport à la commande initiale il ne reste que l&apos;A55 à réaliser  &#40;passage Pommar prévu le 19/10&#41;                                         &#40;O.RUIZ&#41;'),
	(127, 2703, '2016-02-01 00:00:00', 33, 'Au &#40;29/10/2015&#41;\nCaler une date pour passage IRCAN                                                         &#40;O.R&#41;'),
	(128, 2703, '2016-02-01 00:00:00', 33, 'Reste images à réaliser sur A55, A551 et A552 plus l&apos;exploitation sur IREVE   &#40;LB&#41;'),
	(129, 2703, '2016-02-01 00:00:00', 34, 'Au 14/10/2015\nPassage effectué sur  RN106 dans le 30.\nReste à programmer la suite.                                                                                        &#40;O.RUIZ&#41;'),
	(130, 2703, '2016-02-01 00:00:00', 34, 'Au &#40;29/10/2015&#41;\nA priori reporté au printemps 2016 . A confirmer.                                                   &#40;O.R&#41;'),
	(131, 2703, '2016-02-01 00:00:00', 38, 'Au &#40;19/10/2015&#41;\n\nFormation sur VISULINE assurée par Pierre auprès des agents du labo de Nice.\nEn attente d&apos;une date de la part du labo de nice . Patrice MAURIN.    \n\nMail du 23/09/2015 &#40;11h45&#41; de S.WASNER à P.MAURIN :\n\n&quot;Je te confirme notre intérêt que que les agents de Nice soient formés aux relevés Visuline. L&apos;objectif seraient qu&apos;ils réalisent eux-mêmes les relevés sur la DIR MC &#40;2 à 3 jours de mesures&#41; et sur ESCOTA, ayant été relancé durant l&apos;été par M.Meneroud.\n\nPeux-tu indiquer à Pierre, référent pour APEI les interlocuteurs et leur disponibilité afin qu&apos;il organise une journée de formation à Aix?\n\nMerci&quot;                                                                                                                                                       &#40;O.RUIZ&#41;'),
	(132, 2703, '2016-02-01 00:00:00', 39, 'Au 19/10/2015\nLe rendu a-t-il été envoyé à la DIR MC ?                                                           &#40;O.RUIZ&#41;'),
	(133, 2703, '2016-02-01 00:00:00', 39, 'Au 27/10/2015\nVoir entre Thierry et Nicolas qui réalise la note + Les SI + tableaux de synthèse.                   &#40;O.RUIZ&#41;'),
	(134, 2703, '2016-02-01 00:00:00', 40, 'Au 29/10/2015\nNote signée. Note + SI envoyés ce jour par mail par Nicolas. Affaire Clôturée\nAu &#40;19/10/2015&#41;\nTout le réseau des départements 04 et 05 a  été effectué en octobre 2014 par Th.PAYA.\nReste le District Urbain et District Cévennes Rhône.\nDémarrage sur district urbain le 20/10                                                                                               &#40;O.RUIZ&#41;'),
	(135, 2703, '2016-02-01 00:00:00', 40, 'Au 27/10/2015\nObjectif: rendre le District Urbain &#40;DU&#41; pour fin 2015.                                                              &#40;O.RUIZ&#41;'),
	(136, 2703, '2016-02-01 00:00:00', 40, 'Au 13/11/2015\nJérémy réalisera les mesure sur le district RC  &#40;2 nuits ecodyn&#41;                                           &#40;OR&#41;'),
	(137, 2703, '2016-02-01 00:00:00', 40, 'Au 20/11/2015\nVu avec Thierry. 50% du linéaire du district Urbain reste à traité ce qui nécessite 13 journées de mesures.\nReste 100% du district Cévennes Rhône à faire.                                                                     &#40;OR&#41;'),
	(138, 2703, '2016-02-01 00:00:00', 40, 'Au 17/12/2015\nLe district urbain est relevéà 100%  manque 10 Km sur A7G\nNicolas + Dominique +Jérémy sont sur le DRC                                                                        &#40;OR&#41;'),
	(139, 2703, '2016-01-07 00:00:00', 40, 'Sur Le District DRC,\n il reste la   _ 30N0106 en TPC du 0+0 au 40+00 et reste sur toutes les bandes en bidirectionnel du 40+00 au chgt de dep avec le le 48\n                       _48N0106 du 0+0 au 23+00 toutes les bandes\n                       _30N0113 et 34N0113 toutes les bandes\nToutes les routes autours de Avignon Orange et Bagnole sur ceze sont terminées.\nIl reste 2 a 3 jours de mesures sur le terrain pour finir le DRC et toute la campagne.                       &#40;NC&#41;'),
	(140, 2703, '2016-01-18 00:00:00', 40, 'mail de thierry :\nDistrict Rhône Cévennes\nPour info:\nIl resterai environ 3 jours d travail répartis comme suit :\n\nLa 106 dans le Gard 1 journée\nLa 113 dans le gars et Hérault 1 journée \nLa 106 en Lozère 1 journée mais pas avant cet été .\nSur A7 10 km environ\n\n                                                                                                                                                                                               &#40;OR&#41;'),
	(141, 1599, '2016-01-18 00:00:00', 41, 'Le 21/10/15\nContact client et accord le 08/06/15 :\nDéfintion de zones de purges à partir des données du radar, complétées avec campagne IQRN.\nCalage du signal radar à partir des carottes faites dans le cadre de la recherche amiante &#40;NS a pris contact avec JL Vergnol pour les carottes&#41;\nReponse JL Vergnol par mail le 22/09/15 :\n&quot;à ce jour, il n&apos;y a pas de recherche amiante réalisée sur ces sections. Tu peux te rapprocher de Patrick TESTUD, responsable du Pôle Ingénierie du district centre, pour commander des carottages par le marché que la DIR MC a passé avec QUALYS TPI.&quot;\n\n&#40;Nadège&#41;'),
	(142, 1599, '2016-01-18 00:00:00', 41, 'Le 06/11/15 &#40;point Fixe&#41;\nTraitement radar à reprendre\n&#40;Nadège&#41;'),
	(143, 1599, '2016-01-18 00:00:00', 41, 'Le 04/12/15\nPas d&apos;avancement \nReport en janvier\n&#40;Nadège&#41;'),
	(144, 1599, '2016-01-18 00:00:00', 42, 'Au 22/01/16 &#40;Point Fixe &#41;\nTravaux prévus en juin 2016\nRadar à faire en mars 2016\n&#40;Sophie&#41;\nLe 21/10/15\nContact client et accord le 08/06/15 :\nDéfintion de zones de purges à partir des données de deflexions et du radar\nEtude à affectér - non communiquée aux CE\n\nCarottage amiante non réalisé - réponse de JL Vergnol le 22/09/15 :\n&quot;à ce jour, il n&apos;y a pas de recherche amiante réalisée sur ces sections. Tu peux te rapprocher de Patrick TESTUD, responsable du Pôle Ingénierie du district centre, pour commander des carottages par le marché que la DIR MC a passé avec QUALYS TPI.&quot;\n\nSi carottages, demande faite à l&apos;antenne de Montpellier et GER par mail le 09/06/15 :\n&quot;Suite à la visite réseau sur la RN88 le 2 juin dernier, il y a un besoin de carottages complémentaires sur 3 sections de la RN88, à la suite de l&apos;auscultation radar prévue courant juillet :\n    * PR80 à 75+500 - Salelles -&gt; objectif = connaissance structure\n    * PR73 à 71+149 &#40;chgt tapis&#41; - Traversée gare de Chanac, en fonction de l&apos;existence ou non de carottes Amiante par la DIR MC sur cette zone &#40;pour caler le signal radar&#41;\n    * PR43 à 38+800 - descente de la Tourette -&gt; objectif = verif. collage des couches &#40;de surface&#41;&quot;\n\n&#40;Nadège&#41;'),
	(145, 1599, '2016-01-18 00:00:00', 42, 'Au 10/11/2015\nCalage déflecto à effectuer.                            &#40;OR&#41;'),
	(146, 1599, '2016-01-18 00:00:00', 42, 'Le 06/11/2015 &#40;Point Fixe&#41;\nPas de deflexions sur cette zone &#40;erreur notes du 21/10/15&#41; - uniquement radar\nSSV planifié le 12/11/2015 &#40;SF/TC&#41;\nTraitement radar à faire\n&#40;Nadège&#41;'),
	(147, 1599, '2016-01-18 00:00:00', 42, 'Le 04/12/15 &#40;Point Fixe&#41;\nSSV fait le 12/11/15 &#40;SF/TC&#41;\nA prendre en charge en janvier\nPas d&apos;avancement\nResponsable : SF\n&#40;Nadège&#41;'),
	(148, 1599, '2016-01-18 00:00:00', 45, 'Au 22/01/16 &#40;Point Fixe &#41;\nVoir avec JL Vergnol si section remontée ?\nNS envoie un mail à JLV pour voir ce qu&apos;ils attendent réellement.\n&#40;Sophie&#41;\nLe 21/10/15\nDeflexions et SSV à programmer\n&#40;Nadège&#41;'),
	(149, 1599, '2016-01-18 00:00:00', 45, 'Au 10/11/2015\nPositionnement de JC+ NC sur déflecto et caro                      &#40;OR&#41;'),
	(150, 1599, '2016-01-18 00:00:00', 45, 'Le 06/11/2015 &#40;Point Fixe&#41;\nSSV à planifier en décembre &#40;SF/TC&#41;\nPrévoir déflexions &#40;à caler avec OR&#41;\nResponsable de l&apos;étude : TC\n&#40;Nadège&#41;'),
	(151, 1599, '2016-01-18 00:00:00', 45, 'Le 04/12/15 &#40;point fixe&#41;\nSSV planifié le 08/12\ndeflexions à programmer en début d&apos;année &#40;janvier - vu avec OR&#41;\nCarottage 1er trimestre\nRendu étude : mars 2016\n&#40;Nadège&#41;'),
	(152, 1599, '2016-02-01 00:00:00', 45, 'Jérémy a prit les RDV\n&#40;NC&#41;'),
	(153, 1599, '2016-02-01 00:00:00', 45, 'le 11/01/16, recherche biblio = fait\nPas de données trafic sur VR\nMesures Tus+Ircan le 12\nMesures Radar le 18\nFiche de renseignement envoyé, retour le 20/01\nSEMI terminé pour l&apos;instant\nSillage à faire\nRapport au stade : Etat actuel : relevé de dégradations et ornièrages le 24/01\n&#40;TC&#41;'),
	(154, 1599, '2016-02-01 00:00:00', 45, 'Au 22/01/16 &#40;Point Fixe &#41;\nTC questionne le controleur du CEI &#40;Serge &#41; sur longueur balisage pour déflexions\nCarottages prévus en mars\n&#40;Sophie&#41;'),
	(155, 1599, '2016-02-01 00:00:00', 45, 'mesure déflecto terminées , effectuées du PR 0 au PR 20 en voie lente deux sens\ndu PR 15 au PR20 en voie rapide deux sens\ntraitement à venir\nJC'),
	(156, 1599, '2016-02-01 00:00:00', 46, 'Le 21/10/15\nSSV à programmer avant 2016\ndeflexions faites la nuit du 21 au 22/09         &#40;Nadège&#41;'),
	(157, 1599, '2016-02-01 00:00:00', 46, 'Le 06/11/2015 &#40;Point Fixe&#41;\nSSV à planifier en décembre\nResponsable etude : SF\n&#40;Nadège&#41;'),
	(158, 1599, '2016-02-01 00:00:00', 46, 'Le 04/12/15 &#40;Point Fixe&#41;\nSSV réalisé le 30/11/15\nMail à faire auprès de D.Boyer : des travaux récents sur la section, besoin du diagnostioc amiante avant carottages, demande DT/DICT pour début janvier, formulaire de renseignement à transmettre début janvier\nObjectif du rendu : mi-mars 2016\n&#40;Nadège&#41;'),
	(159, 1599, '2016-02-01 00:00:00', 46, 'Au 08/12/15 &#40;pour Olivier&#41;\nPrévoir carottages en début d&apos;année\n&#40;Nadège&#41;'),
	(160, 1599, '2016-01-21 00:00:00', 46, 'A faire : SI - définition des ZH - localisation des carottes\n&#40;Sophie&#41;'),
	(161, 1599, '2016-01-21 00:00:00', 47, 'Au 22/01/16 &#40;Point Fixe&#41;\nCM du CD34 a renvoyé à SF les coupes des carottes amiante de la RD65 le 22/01.\nMail de SF à DB du CD34 pourêtre présente sur carottages amiante RD610.\n&#40;Sophie&#41;\nLe 21/10/15\nDemande faite auprès de l&apos;antenne de Montpellier par mail du 24/09/15 pour prise en charge de la partie &quot;faisabilité&quot;, dans le cadre du marché de contrôle :\n&quot;Sur cette section de 1km200, il est à prévoir :\n-Opération de carottage : 1 carotte tous les 200m en alternant axe et rive droite ou gauche pour les deux sens de circulation &#40;chaussée étroite&#41; - 6 carottes en axe, 3 en rive droite et 3 en rive gauche par exemple\n-Deflexions à la poutre Benkelmann\n-2-3 sondages à la pelle &#40;en regardant la route sur google map, on dirait une succession d&apos;enduits avec un patchwork de réparation -&gt; structure souple&#41; à organiser avec l&apos;agence du CG. Ces sondages seraient implanté à partir des deflexions &#40;zones homogènes et/ou anomalies&#41;\nSur les granulats, il faudrait réaliser les essais suivants :\n-propreté &#40;MB&#41;\n-granulométrie\nEt en fonction des premiers résultats, caractéristiques du liant : péné et TBA&quot;\nAPEI verifiera ensuite le dimensionnement\n&#40;Nadège&#41;'),
	(162, 1599, '2016-01-21 00:00:00', 47, 'Le 06/11/15\nRelance à faire auprès de J. Quittard par NS -&gt; fait oralment le 12/11/15\n&#40;Nadège&#41;'),
	(163, 1599, '2016-01-21 00:00:00', 47, 'Le 22/01/16 &#40;point fixe &#41;\nJQ a fait un devis auprés du CD34 &#40;déflexions, carottages, sondages à la pelle  qu&apos;ils réaliseront localement&#41;\nAnalyses chmiques également prévues.\nEtude sera affectée après vérification faisabilité.\n&#40;Sophie &#41;'),
	(164, 1599, '2016-01-21 00:00:00', 49, 'Le 21/10/15\nDefinition des zones homogènes avant fin octobre\nRéunion interne DCEDI debut novembre\n&#40;Nadège&#41;'),
	(165, 1599, '2016-01-21 00:00:00', 49, 'Au &#40;29/10/2015&#41;\nAffaire Terminée pour Laure                              &#40;O.R&#41;'),
	(166, 1599, '2016-01-21 00:00:00', 49, 'Le 06/11/2015 &#40;Point Fixe&#41;\nRéunion de travail avec DCEDI &#40;L. PATTE&#41; le 05/11/15 : Elements pour dimensionnement chaussées OK, En attente des éléments pour la digue fusible, Dimensionnement barreau de raccordement à faire.\nRéunion avec DREAL le 09/12/15\nElements chaussées pour le 24/11/15\n&#40;Nadège&#41;'),
	(167, 1599, '2016-01-21 00:00:00', 49, 'Le 04/12/15 &#40;Point Fixe&#41;\nElements transmis à Lionel Patte le 02/12/15\nPrévoir un point Tristan + Lionel pour les scénarios &#40;PL curage&#41; avant le 09/12/15\nMettre un résumé dans le rapport général de Lionel -&gt; TC\nSynoptique à faire par TC \n&#40;Nadège&#41;'),
	(168, 1599, '2016-01-21 00:00:00', 49, 'Le 04/12/15 &#40;Point tél avec Lionel&#41;\nVerification uniquement du dimensionnement sur le projet neuf &#40;barreau de raccordement&#41; avec le trafic PL lié au curage &#40;60PL/J/sens&#41; sur la durée de 20 ans\nEnvoi des classes de trafic à Lionel &#40;T5 ,….&#41;\n&#40;Nadège&#41;'),
	(169, 1599, '2016-01-21 00:00:00', 49, 'Le 08/12/15\nEnvoi de la note complémentaire fait le 08/12/15\n&#40;Nadège&#41;'),
	(170, 1599, '2016-01-21 00:00:00', 50, 'Au 22/01/16 &#40;point fixe &#41;\ndossier terminé\n&#40;Sophie&#41;\nLe 21/10/15\nSI prêts, calcul des notes faits\nDeux rapports : \nun rapport auscultation &#40;TC&#41; - délai semaine 45\nun rapport diagnostic/programmation &#40;SF&#41; - delai fin novembre\nTraitement des trajets des convois exceptionnels - delai fin novembre &#40;SF/NS&#41;\nRéunion avec BNT du 16/10/15 : délai remise rapports = le 18/12/15 &#40;avant vacances de Noël&#41;\n&#40;Nadège&#41;'),
	(171, 1599, '2016-01-21 00:00:00', 50, 'Le 06/11/2015 &#40;Point Fixe&#41;\nRapport auscultation &#40;TC&#41; fini - mise en page à faire - à transmettre pour relecture à NS le 16/11/2015\nRapport diagnostic &#40;SF&#41; : en cours, réunion travail GiRR SF/NS le 13/11/15 - délai fin novembre\nTraitement des trajets des convois exceptionnels - delai fin novembre &#40;SF/NS&#41;\n&#40;Nadège&#41;'),
	(172, 1599, '2016-01-21 00:00:00', 50, 'Le 04/12/15 &#40;Point Fixe&#41;\nRapport auscultation &#40;TC&#41; fini - transmis à Sébastien le 23/11/156\nRapport diagnostic &#40;SF&#41; : Notation et programmation GiRR terminés - Calculs Alizé en cours\nrapport à finaliser avec les calculs Alizé &#40;valeur mediane de la classe de trafic de la voie&#41;\nTraitement des trajets des convois exceptionnels &#40;SF&#41; : convoi n°1 en cours avec le seuil max. de la classe de trafic de la voie, pas de données sur le convoi n°2\nDélai Rapport diagnostic inclus les convois : le 14/12/15\nPoint téléphonique à prévoir avec Aurélie Silvestrini le 07 ou 08/12\n&#40;Nadège&#41;'),
	(173, 1599, '2016-01-21 00:00:00', 50, 'Le 07/12/15 &#40;Point téléphonique SF+NS+Aurélie Silvestrini+Pierre Ballandras&#41;\nExplication des tableaux et SI issus de GiRR transmis par mail semaine 49.\nValidation faite des stratégies choisies.\nConvoi n°2 &#40;convoi des missiles&#41; : aucun élément transmis à Aurélie par le service concerné &#40;secret/défense&#41; -&gt; nous ne réaliserons donc pas de calcul pour ce convoi\n&#40;Nadège&#41;'),
	(174, 1599, '2016-01-21 00:00:00', 50, 'Rapport Programmation des travaux terminé et transmis à NS pour lecture le 8/01.'),
	(175, 2703, '2016-02-04 00:00:00', 53, 'Corrections apportées au rapport suite aux remarques de NS le 21/01 - Rapport transmis à SW le 25/01\nEnvoi du rapport à Aurélie Silvestrini en version provisoire, format pdf le 1/02/16.\n&#40;Sophie&#41;\nAu 23/10/2015\nS.W doit relancer le CG sur la réalisatiion des différents types de mesures hormis les déflexions déjà réalisées le 25/09             &#40;O.RUIZ&#41;'),
	(176, 2703, '2016-02-04 00:00:00', 53, 'Au &#40;29/10/2015&#41;\nMalgré plusieurs relances difficultés d&apos;obtenir une réponse de l&apos;exploitant. Mais rendez-vous pris par tel le 28/10 pour le 30/10          &#40;O.R&#41;'),
	(177, 2703, '2016-02-04 00:00:00', 53, 'Au &#40;12/11/2015&#41;\nLaure a traité les images.                                               &#40;OR&#41;'),
	(178, 2703, '2016-02-04 00:00:00', 53, 'Au &#40;26/11/2015&#41;\nToutes les mesures ont été effectuées. &#40;Vu avec S.W&#41;                  &#40;OR&#41;'),
	(179, 2703, '2016-02-04 00:00:00', 54, 'Au &#40;29/10/2015&#41;\nToutes les mesures + traitement IRCAN ont été effectuées                        &#40;O.R&#41;'),
	(180, 2703, '2016-02-04 00:00:00', 55, 'Au &#40;29/10/2015&#41;\nReste SSV . Protection et mesures à caler.                      &#40;O.R&#41;'),
	(181, 2703, '2016-02-04 00:00:00', 55, 'Au &#40;10/11/2015&#41;\nTraitement du déflecto à définir.             &#40;O.R&#41;'),
	(182, 2703, '2016-02-04 00:00:00', 55, 'Au &#40;25/11/2015&#41;\nLe pré-traitement des données pour une utilisation dans un SI doit ëtre réalisé par les agents ayant éffectuées les mesures. Un SI dédié au suivi des chantiers innovants doit être élaboré. L&apos;analyse des données et le rapport qui s&apos;en suivra sera réalisé par OR &#40;et, ou&#41; NS, SW.              &#40;OR&#41;'),
	(183, 2703, '2016-02-04 00:00:00', 56, 'Au 27/10/2015\nPréciser le mode de rendu attendu pour le déflecto. Nicolas regarde cela.                         &#40;O.RUIZ&#41;'),
	(184, 2703, '2016-02-04 00:00:00', 56, 'Au 29/10/2015\nCaler la date d&apos;intervention SSV et demander une protection au CD34                     &#40;O.R&#41;'),
	(185, 2703, '2016-02-04 00:00:00', 56, 'Au 12/11/2015\nTraitement effectué par Thierry, manque note d&apos;accompagnement. Pas envoyé au client à priori                 &#40;O.R&#41;'),
	(186, 2703, '2016-02-04 00:00:00', 56, 'Au 30/11/2015\nVu avec Pierre. SSV non effectué car route neuve.                                           &#40;OR&#41;'),
	(187, 2703, '2016-02-04 00:00:00', 57, 'Au &#40;29/10/2015&#41;\nReste l&apos;APL à programmer.                               &#40;O.R&#41;'),
	(188, 2703, '2016-02-04 00:00:00', 57, 'Au &#40;30/11/2015&#41;\nVu avec Pierre.\nPassage APL avant et après travaux réalisés. Traitement jusqu&apos;à présent effectué par S.WASNER                     &#40;OR&#41;'),
	(189, 2703, '2016-02-04 00:00:00', 58, 'Au  29 / 10 / 2015\nProtection SSV + date intervention à caler                            &#40;O.R&#41;'),
	(190, 2703, '2016-02-04 00:00:00', 59, 'Au 27/10/2015\nRéunion de lancement le 9/10.\nCR envoyé en attente de validation.\nContacter le labo de Lyon pour qu&apos;ils programment le passage du SCRIM.              &#40;OR&#41;'),
	(191, 2703, '2016-02-04 00:00:00', 59, 'Au28/10/2015\nRetour rq CD13 : Désormais 930 Km de mesure : 760 Km de Bidi + 85 Km de 2x2 \nLe radar est également rajouté.\nMail envoyé à lyon.\nContact tel avec cédric CLAUDE. Compter 3 semaines de mesures + 3semaines de rédaction. Réponse à apporter à son mail           &#40;OR&#41;'),
	(192, 2703, '2016-02-04 00:00:00', 59, 'Au 30/11/2015\nVu avec Pierre . Définir un découpage par zones des 800 Km de mesures à effectuer. La protection n&apos;est pas assurée par le CD13 mais sous traitée à Technisign. 2 équipes à prévoir au SSV.                                                         &#40;OR&#41;'),
	(193, 2703, '2016-02-04 00:00:00', 61, 'Au &#40;27/10/2015&#41;\nObjectif  d&apos;envoi du rendu à caler.                 &#40;OR&#41;'),
	(194, 2703, '2016-02-04 00:00:00', 61, 'Au &#40;25/11/2015&#41;\nMesures  envoyée au client par Nicolas le 27/10. Reste le comparatif avec les mesures de Vectra à réaliser. Plusieurs questions ont été posées dans le mail de Nicolas :\n\n&quot;Concernant l&apos;analyse des résultats et la comparaison avec les mesures Vectra, nous avons plusieurs questions:\n\nA quoi correspond la courbe noire dans la ligne déflexion du schéma?\n\nComment est calculée la déflexion caractéristique &#40;Axe? Rive? Max&#40;axe;rive&#41;&#41;?\n\nA quoi correspondent les notes de déflexions? Calculées au pas de 200 mètres.\n\nConnaissez vous la structure, type de la chaussées, et le trafic PL?\n\nA partir de vos éléments nous complèterons notre analyse et nous vous ferons parvenir une note d&apos;accompagnement des résultats. &quot;\n                                                                                         &#40;OR&#41;'),
	(195, 2703, '2016-01-29 00:00:00', 61, 'Le CD13 pose toute une série de questions.\nAnalyse à mener par un chargé d&apos;étude &#40;vu avec sébastien&#41;.Mail de demande adressé à Nadège ce jour.  &#40;OR&#41;'),
	(196, 2703, '2016-02-24 00:00:00', 61, 'Mail très complet de Nadège le 12/02. Réponse et satisfaction du client par mail le 22/02. On peut clôturer          &#40;OR&#41;'),
	(197, 2703, '2016-02-24 00:00:00', 62, 'Au 27/10/2015\n4 agents sur ce dossier\nLaure : Relevé de dégradation terminé - \nDominique : Relevé de dégradation terminé - \nNicolas : relevé en cours.\nJérémy : relevé en cours.                                              &#40;O.RUIZ&#41;'),
	(198, 2703, '2016-02-24 00:00:00', 62, 'Au &#40;29/10/2015&#41;\nDominique assure le traitement .                            &#40;O.R&#41;'),
	(199, 2703, '2016-01-29 00:00:00', 62, 'Affaire Terminée fin 2015               &#40;OR&#41;'),
	(200, 2703, '2016-01-29 00:00:00', 67, 'Au &#40;29/10/2015&#41;\nAffaire remontée par J.QUITTARD. Résultats demandés pour fin 2015. Devis ou marché.\nMail adressé à J. QUITTARD. Intervention à priori pour la fin novembre.                                       &#40;O.R&#41;'),
	(201, 2703, '2016-01-29 00:00:00', 67, 'Au 10/11/2015\nVu avec Jérémy, intervention à caler semaine 48.                                                                      &#40;OR&#41;'),
	(202, 2703, '2016-01-14 00:00:00', 67, '\nTout le traitement a été éffectué\nNote d&apos;accompagnement en attente de signature\n'),
	(203, 2703, '2016-01-14 00:00:00', 68, 'Au &#40;30/10/2015&#41;\nContrôle extérieur pour DREAL PACA / RN 569 Miramas ARCE TF+TC1+TC2\nNécessité de compléter le niveau d&apos;information linéaire, délais...                                &#40;O.R&#41;'),
	(204, 2703, '2016-01-14 00:00:00', 69, 'Au &#40;30/10/2015&#41;\nDemande transmise par ricochet de mails &#40;Mail d&apos;O.PEREZ&#41; du 20/10.\nRépondre rapidement.          \nMail de réponse de prise en charge faite au client le 30/10, avec engagement réponse sous 15 aine                                                                                         &#40;O.R&#41;'),
	(205, 2703, '2016-01-14 00:00:00', 69, 'Au 30/11/2015\nPlusieurs échange avec le client et le Labo de Lyon, qui a pris l&apos;initiative de contacter en direct le client afin de lui demander si un financement en argent frais permettant le paiement du transport était possible. Pas de réponse du client à ce jour.\nEchange Téléphonique entre Lyon et Aix sur cette initiative.                                &#40;OR&#41;'),
	(206, 2703, '2016-01-14 00:00:00', 70, 'Au 30/10/2015\nDemande B.COUTANT Chef de projet au  SIR de montpellier pour chantier 2016.\nEngagement pris par S.W par mail le 13/10/2015                                                                             &#40;O.R&#41;'),
	(207, 2703, '2016-01-14 00:00:00', 71, 'Au 18/11/2015\nNote envoyée par Nicolas  au client le 16/11.                   &#40;OR&#41;'),
	(208, 2703, '2016-11-20 00:00:00', 71, ''),
	(209, 2703, '2016-11-20 00:00:00', 73, 'Au &#40;13/11/2015&#41;\nVu avec Thierry le 12/11. Traitement effectué mais résultat non envoyé au client.                          &#40;OR&#41;'),
	(210, 2703, '2016-01-29 00:00:00', 73, 'Jéremy a retrouver une note du 18/09. Voir avec Thierry si elle a bien été envoyée au client.          &#40;OR&#41;'),
	(211, 2703, '2016-01-29 00:00:00', 75, 'Au &#40;13/11/2015&#41;\nMail daté du 10/11/2015 reçu par sébastien. \nLe Conducteur demande à être contacté pour fxer les modalités d&apos;intervention.                                  &#40;OR&#41;'),
	(212, 2703, '2016-01-29 00:00:00', 75, 'Au &#40;25/11/2015&#41;\nEnvoi du 1er formulaire de commande par mail au client ce jour.                                                                         &#40;OR&#41;'),
	(213, 2703, '2016-02-01 00:00:00', 75, 'Mesures programmées le 29/02. Pierre+ Badou.  \nDevis  + note mis à la signature d&apos; Annick ce jour.        &#40;OR&#41;'),
	(214, 2703, '2016-03-02 00:00:00', 75, 'Bon de commande signé\nTraitement  effectué et envoi des résultats par mail ce jour par Pierre                                    &#40;OR&#41;'),
	(215, 2703, '2016-03-02 00:00:00', 76, 'Au &#40;30/11/2015&#41;\nDevis accepté par le Client qui retourné également un bon de commande signé. &#40;Mailde BLEVIN Solen 27/11/2015&#41;\nBinôme &#40;Pierre + Dominique&#41;                                                            &#40;OR&#41;'),
	(216, 2703, '2016-02-01 00:00:00', 76, 'Affaire terminée. Rapport envoyé au client le 6/12/2015 par Pierre           &#40;OR&#41;'),
	(217, 2703, '2016-02-01 00:00:00', 82, 'Le 04/12/15 &#40;Point Fixe&#41;\nNS doit réaliser le devis et prendre contact avec Christophe Michel sur l&apos;urgence de cette étude\n&#40;Nadège&#41;'),
	(218, 2703, '2016-02-01 00:00:00', 77, 'Au 22/01/16 &#40;point fixe &#41;\nAnnulée par le CD34 --&gt; faible enjeu\n&#40;Sophie&#41;\nAu &#40;26/11/2015&#41;\nReste SSV à faire.                                                &#40;OR&#41;'),
	(227, 2703, '2016-03-21 15:03:08', 2, 'zzz'),
	(228, 2703, '2016-03-21 15:11:38', 21, 'zz');
/*!40000 ALTER TABLE `wiki` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
