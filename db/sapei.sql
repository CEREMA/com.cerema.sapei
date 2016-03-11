-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.6.25 - MySQL Community Server (GPL)
-- Serveur OS:                   Win64
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='Table des axes';

-- Export de données de la table sapei.axe: ~9 rows (environ)
DELETE FROM `axe`;
/*!40000 ALTER TABLE `axe` DISABLE KEYS */;
INSERT INTO `axe` (`Id_axe`, `Axe`, `Id_Type_Axe`) VALUES
	(3, 'A3', 2),
	(6, 'A5', 1),
	(8, '10', 2),
	(9, 'B21', 1),
	(10, 'A23', 1),
	(11, 'A23', 1),
	(36, 'multi-axes', 3),
	(42, 'RD06', 1),
	(43, 'RD30', 1);
/*!40000 ALTER TABLE `axe` ENABLE KEYS */;

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
) ENGINE=FEDERATED DEFAULT CHARSET=latin1 CONNECTION='mysql://root:root@172.23.210.13/bpclight/agents';

-- Export de la structure de table sapei. client_origine
CREATE TABLE IF NOT EXISTS `client_origine` (
  `Id_client_origine` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du client d''origine de l''affaire',
  `Lib_client_origine` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Libellé du client à l''origine de l''affaire',
  PRIMARY KEY (`Id_client_origine`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Table des clients d''origine';

-- Export de données de la table sapei.client_origine: ~17 rows (environ)
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
	(18, 'CD83');
/*!40000 ALTER TABLE `client_origine` ENABLE KEYS */;


-- Export de la structure de table sapei. client_rattache
CREATE TABLE IF NOT EXISTS `client_rattache` (
  `Id_client_rattache` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du client intervenant direct rattaché',
  `Lib_client_rattache` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Libellé du client intervenant direct',
  `Id_client_origine` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifiant du client auquel est rattaché ce client',
  PRIMARY KEY (`Id_client_rattache`),
  KEY `FK_client_rattache_contact client` (`Id_client_origine`),
  CONSTRAINT `FK_client_rattache_contact client` FOREIGN KEY (`Id_client_origine`) REFERENCES `client_origine` (`Id_client_origine`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='Table des clients rattachés';

-- Export de données de la table sapei.client_rattache: ~26 rows (environ)
DELETE FROM `client_rattache`;
/*!40000 ALTER TABLE `client_rattache` DISABLE KEYS */;
INSERT INTO `client_rattache` (`Id_client_rattache`, `Lib_client_rattache`, `Id_client_origine`) VALUES
	(1, 'DIRMED/DU/CEI Saint Martin de Crau', 2),
	(3, 'DIRMC/DS/PE/UT Grands Causses / CEI La Cavalerie', 3),
	(5, 'DIRMC/DPEE/PRI', 3),
	(6, 'DIRMC/DS/PE/UT Coeur d\'Hérault/CEI Servian', 3),
	(7, 'Agence departementale de Lunel', 13),
	(8, '-', 9),
	(9, '-', 13),
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
	(35, 'GINGER', 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Table des contacts clients';

-- Export de données de la table sapei.contact_client: ~4 rows (environ)
DELETE FROM `contact_client`;
/*!40000 ALTER TABLE `contact_client` DISABLE KEYS */;
INSERT INTO `contact_client` (`Id_contact_client`, `Id_client_rattache`, `NomPrenom_contact_client`, `Tel_contact_client`, `Mobile_contact_client`, `Mail_contact_client`, `Fonction_contact_client`, `Adresse_contact_client`, `Type_client`) VALUES
	(1, 17, 'FOUQOU Bruno', '04 12 45 12 63', '06 15 47 45 65', 'bruno.fouqou@developpement-durable.gouv.fr', 'Chef du pôle conservation du patrimoine', '16, rue Bernard du Bois\n13001 Marseille', '1'),
	(2, 1, 'FABRE Emmanuel', '04 90 18 32 53', '-', 'Emmanuel.Fabre@developpement-durable.gouv.fr', 'Chef du CEI de de Saint Martin de Crau', 'Zone du Salat\r\n13, av. Galilée\r\n13310 Saint-Martin-de-Crau', '2'),
	(3, 1, 'COUTANT Bruno', '04 67 13 74 42', '06 80 17 24 37', 'bruno.coutant@developpement-durable.gouv.fr', 'Chef de  Projet au SIR de Montpellier', NULL, '1');
/*!40000 ALTER TABLE `contact_client` ENABLE KEYS */;


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

-- Export de données de la table sapei.dpt: ~101 rows (environ)
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
	(114, '95', 'Val-d\'oise');
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
  KEY `FK_job_axe` (`Id_axe`),
  KEY `Id_contact_client` (`Id_contact_client`),
  KEY `Id_dpt` (`Id_dpt`),
  KEY `Id_client_rattache` (`Id_client_rattache`),
  KEY `Id_client_principal` (`Id_client_principal`),
  KEY `FK_job_job_statut` (`Statut_job`),
  CONSTRAINT `FK_job_axe` FOREIGN KEY (`Id_axe`) REFERENCES `axe` (`Id_axe`),
  CONSTRAINT `FK_job_client_origine` FOREIGN KEY (`Id_contact_client`) REFERENCES `client_origine` (`Id_client_origine`),
  CONSTRAINT `FK_job_contact_client` FOREIGN KEY (`Id_client_principal`) REFERENCES `contact_client` (`Id_contact_client`),
  CONSTRAINT `FK_job_dpt` FOREIGN KEY (`Id_dpt`) REFERENCES `dpt` (`IdDepartement`),
  CONSTRAINT `FK_job_job_statut` FOREIGN KEY (`Statut_job`) REFERENCES `job_statut` (`id`),
  CONSTRAINT `FK_job_sens` FOREIGN KEY (`Sens_job`) REFERENCES `sens` (`Id_sens`),
  CONSTRAINT `FK_job_type_chaussee` FOREIGN KEY (`Id_type_chaussee`) REFERENCES `type_chaussee` (`Id_type_chaussee`),
  CONSTRAINT `FK_job_type_prestation` FOREIGN KEY (`Id_type_prestation`) REFERENCES `type_prestation` (`Id_type_prestation`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Table d''initialisation de l''activité';

-- Export de données de la table sapei.job: ~2 rows (environ)
DELETE FROM `job`;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` (`Id_job`, `Id_contact_client`, `Id_client_rattache`, `Id_client_principal`, `Date_prise_job`, `Id_type_prestation`, `Intitule_job`, `Nature_job`, `Date_livrable_job`, `Id_type_chaussee`, `Date_affectation_job`, `Dmd_protection_job`, `Id_pilote_job`, `Statut_job`, `PRD_job`, `PRD`, `PRF`, `ABD_job`, `PRF_job`, `ABF_job`, `Sens_job`, `Comment_sens_job`, `Comment_avance_mesure_job`, `Comment_avance_traite_job`, `Longueur_mesure_job`, `Etat_avance_job`, `Suivi_job`, `Comment_dmd_protec_job`, `Num_SIGMA_job`, `PJ_job`, `Id_axe`, `Id_dpt`, `avancement`, `total`) VALUES
	(7, 2, 17, 1, '2015-10-23', 1, 'Retroréflexion sur l\'ensemble du réseau de la DIR MED. Commande 2016', 'test', '2016-01-28', 1, '2016-02-16', NULL, 614, 4, NULL, '0+1', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'qddqsdqsd', 'xxx', NULL, 36, 4, 2, 5),
	(9, 2, 1, 3, '2016-01-19', 1, 'test', 'dsfsdfsdf', NULL, 1, NULL, NULL, 511, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 2, 1, 2);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.job_contacts: ~0 rows (environ)
DELETE FROM `job_contacts`;
/*!40000 ALTER TABLE `job_contacts` DISABLE KEYS */;
INSERT INTO `job_contacts` (`Id_job_contact`, `Id_job`, `Id_client`) VALUES
	(5, 7, 3),
	(6, 9, 2);
/*!40000 ALTER TABLE `job_contacts` ENABLE KEYS */;


-- Export de la structure de table sapei. job_statut
CREATE TABLE IF NOT EXISTS `job_statut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statut` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.job_statut: ~6 rows (environ)
DELETE FROM `job_statut`;
/*!40000 ALTER TABLE `job_statut` DISABLE KEYS */;
INSERT INTO `job_statut` (`id`, `statut`) VALUES
	(1, 'En cours'),
	(2, 'Court terme'),
	(3, 'Moyen terme'),
	(4, 'Long terme'),
	(5, 'Transférée'),
	(6, 'Clôturée');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='Table des opérations de mesure menées dans le cadre d''une activité';

-- Export de données de la table sapei.ope: ~7 rows (environ)
DELETE FROM `ope`;
/*!40000 ALTER TABLE `ope` DISABLE KEYS */;
INSERT INTO `ope` (`Id_ope`, `Id_job`, `Id_skills`, `Id_users`, `Stat`, `type_ope`, `bool_traitement`) VALUES
	(19, 7, NULL, 13, 1, 1, NULL),
	(20, 7, NULL, 14, 2, 2, NULL),
	(21, 7, NULL, 15, 4, 4, NULL),
	(22, 7, 7, NULL, 1, 4, NULL),
	(23, 7, NULL, 16, 4, 5, NULL),
	(24, 9, NULL, 17, 4, 1, NULL),
	(25, 9, 8, NULL, 1, 1, NULL);
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

-- Export de données de la table sapei.outils: ~17 rows (environ)
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

-- Export de données de la table sapei.porteur_outils: ~17 rows (environ)
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
  `Type` int(11) NOT NULL DEFAULT '1',
  `Name` varchar(255) DEFAULT '0',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Cls` varchar(50) DEFAULT NULL,
  `User` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_schedule_skills_porteur_outils` (`ResourceId`),
  CONSTRAINT `FK_schedule_skills_porteur_outils` FOREIGN KEY (`ResourceId`) REFERENCES `porteur_outils` (`Id_porteur_outils`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.schedule_skills: ~1 rows (environ)
DELETE FROM `schedule_skills`;
/*!40000 ALTER TABLE `schedule_skills` DISABLE KEYS */;
INSERT INTO `schedule_skills` (`Id`, `ResourceId`, `Type`, `Name`, `StartDate`, `EndDate`, `Cls`, `User`) VALUES
	(7, 16, 1, NULL, '2016-02-03 09:00:00', '2016-02-04 18:00:00', 'orange', 614),
	(8, 16, 1, NULL, '2016-03-01 10:00:00', '2016-03-02 17:00:00', 'yellow', 614);
/*!40000 ALTER TABLE `schedule_skills` ENABLE KEYS */;


-- Export de la structure de table sapei. schedule_users
CREATE TABLE IF NOT EXISTS `schedule_users` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ResourceId` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(255) DEFAULT '0',
  `Type` int(11) DEFAULT '2',
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Cls` varchar(50) DEFAULT NULL,
  `User` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_schedule_users_user` (`ResourceId`),
  CONSTRAINT `FK_schedule_users_user` FOREIGN KEY (`ResourceId`) REFERENCES `user` (`Id_agent`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Export de données de la table sapei.schedule_users: ~4 rows (environ)
DELETE FROM `schedule_users`;
/*!40000 ALTER TABLE `schedule_users` DISABLE KEYS */;
INSERT INTO `schedule_users` (`Id`, `ResourceId`, `Name`, `Type`, `StartDate`, `EndDate`, `Cls`, `User`) VALUES
	(13, 823, NULL, 2, '2016-02-03 10:00:00', '2016-02-04 17:00:00', 'yellow', 614),
	(14, 1593, NULL, 2, '2016-02-03 15:00:00', '2016-02-05 08:00:00', 'yellow', 614),
	(15, 2351, NULL, 2, '2016-02-03 09:00:00', '2016-02-04 18:00:00', 'orange', 614),
	(16, 843, NULL, 2, '2016-02-04 09:00:00', '2016-02-05 17:00:00', 'red', 614),
	(17, 823, NULL, 2, '2016-03-01 09:00:00', '2016-03-02 17:00:00', 'yellow', 614);
/*!40000 ALTER TABLE `schedule_users` ENABLE KEYS */;


-- Export de la structure de table sapei. sens
CREATE TABLE IF NOT EXISTS `sens` (
  `Id_sens` int(11) NOT NULL AUTO_INCREMENT,
  `sens` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id_sens`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.sens: ~2 rows (environ)
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

-- Export de données de la table sapei.steps: ~4 rows (environ)
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

-- Export de données de la table sapei.type_axe: ~2 rows (environ)
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Table de référence des types de chaussée';

-- Export de données de la table sapei.type_chaussee: ~4 rows (environ)
DELETE FROM `type_chaussee`;
/*!40000 ALTER TABLE `type_chaussee` DISABLE KEYS */;
INSERT INTO `type_chaussee` (`Id_type_chaussee`, `Lib_type_chaussee`) VALUES
	(1, 'Autre'),
	(2, 'Bretelle'),
	(3, 'Bi-directionnelle'),
	(4, '2 x 3 voies'),
	(5, '2 x 2 voies');
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

-- Export de données de la table sapei.type_materiel: ~0 rows (environ)
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Table de référence des différents types de prestation.';

-- Export de données de la table sapei.type_prestation: ~4 rows (environ)
DELETE FROM `type_prestation`;
/*!40000 ALTER TABLE `type_prestation` DISABLE KEYS */;
INSERT INTO `type_prestation` (`Id_type_prestation`, `Libelle_type_prestation`) VALUES
	(1, 'Auscultation'),
	(2, 'Avis technique'),
	(3, 'Dimensionnement chaussées neuves'),
	(4, 'Etude d\'entretien');
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
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `job` int(11) NOT NULL DEFAULT '0',
  `blog` text,
  PRIMARY KEY (`id`),
  KEY `poster` (`poster`),
  KEY `job` (`job`),
  CONSTRAINT `FK_wiki_job` FOREIGN KEY (`job`) REFERENCES `job` (`Id_job`),
  CONSTRAINT `FK_wiki_user` FOREIGN KEY (`poster`) REFERENCES `user` (`Id_agent`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Export de données de la table sapei.wiki: ~3 rows (environ)
DELETE FROM `wiki`;
/*!40000 ALTER TABLE `wiki` DISABLE KEYS */;
INSERT INTO `wiki` (`id`, `poster`, `date`, `job`, `blog`) VALUES
	(1, 614, '2016-01-18 15:46:13', 7, 'test'),
	(2, 614, '2016-02-02 09:47:56', 7, 'test 2'),
	(3, 614, '2016-02-02 09:51:06', 7, 'démo');
/*!40000 ALTER TABLE `wiki` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
