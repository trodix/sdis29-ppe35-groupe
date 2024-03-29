-- =====================================================================================================
-- Script du 16/10/2017 - SGBD cible : MySql version 5
-- > Nom de la base de données : sdis29
-- > Les n° auto pour des attributs non clé primaire ont été transformés en SMALLINT.
-- > Les tables générées sont de type InnoDb.
-- > Les clés étrangères ne sont gérées que si MySql gère les tables InnoDb.
-- > Le jeu de caractères utilisé est utf8.
-- =====================================================================================================
CREATE DATABASE `sdis29` CHARACTER SET utf8 COLLATE utf8_general_ci;
USE sdis29;

set names 'utf8';
-- ----------------------------------------------------------------------------------------------
create table caserne(cId SMALLINT not null,cNom VARCHAR(30),cAdresse VARCHAR(60),cTel VARCHAR(14),cGroupement VARCHAR(25),primary key(cId)) ENGINE=INNODB DEFAULT CHARSET=utf8;
-- 
create table parametre(pType VARCHAR(7) not null,pIndice SMALLINT not null,pLibelle VARCHAR(80),pValeur VARCHAR(25),pPlancher INT,pPlafond INT,primary key(pType,pIndice)) ENGINE=INNODB DEFAULT CHARSET=utf8;
-- 
create table pompier(pCis SMALLINT not null,pId SMALLINT not null,pNom VARCHAR(40),pPrenom VARCHAR(40),pStatut SMALLINT,pType SMALLINT,pMail VARCHAR(33),pLogin VARCHAR(10),pMdp VARCHAR(35),pAdresse VARCHAR(25),pCp VARCHAR(5),pVille VARCHAR(25),pBip VARCHAR(10),pNbGardes SMALLINT,pGrade SMALLINT,pCommentaire VARCHAR(200),pDateEnreg DATETIME,pDateModif DATETIME,primary key(pCis,pId)) ENGINE=INNODB DEFAULT CHARSET=utf8;
-- 
create table typeParametre(tpId VARCHAR(7) not null,tpLibelle VARCHAR(70),tpBooleen TINYINT(1),tpChoixMultiple TINYINT(1),primary key(tpId)) ENGINE=INNODB DEFAULT CHARSET=utf8;
-- 
-- ----------------------------------------------------------------------------------------------
insert into caserne(cId,cNom,cAdresse,cTel,cGroupement) values
     (2901,'BANNALEC','Rue Eugène Cadic - 29380','02.98.39.83.02','CONCARNEAU'),
     (2902,'BENODET','37 route de Poulpry - 29950','02.98.57.05.00','QUIMPER'),
     (2903,'BRASPARTS','Rue de la Maine - 29190','02.98.81.45.65','MORLAIX'),
     (2904,'BREST','17 rue Amiral Romain Desfossés - 29200','02.98.34.56.13','BREST'),
     (2905,'BRIEC DE Lr ODET','Ty Eugène - 29S10','02.98.57.91.67','QUIMPER'),
     (2906,'CAMARET','Place Saint- Yves - 29S70','02.98.27.90.46','BREST'),
     (2907,'CAP-SIZUN - AUDIERNE','Rue du Goyen - 29770 AUDIERNE','02.98.70.11.96','QUIMPER'),
     (2908,'CAP-SIZUN - PONT CROIX','Rue du Goyen - 29770 AUDIERNE','02.98.70.42.14','QUIMPER'),
     (2909,'CAP-SIZUN - ILE DE SEIN','Place François le Sud - 29990','02.98.70.93.64','QUIMPER'),
     (2910,'CARANTEC','Kérouguelen - 29660','02.98.78.37.46','MORLAIX'),
     (2911,'CARHAIX','Rue Jean-Sébastien Corvellec - 29270','02.98.99.34.40','MORLAIX'),
     (2912,'CHATEAULIN','Rocade dt Quimill - 29150','02.98.86.83.47','BREST'),
     (2913,'CHATEAUNEUF DU FAOU','7 place aux chevaux - 29S20','02.98.81.84.15','MORLAIX'),
     (2914,'CLOHARS CARNOËT','Rue Quilhen Langlazic - 29360','02.98.71.98.88','CONCARNEAU'),
     (2915,'CONCARNEAU','112 rue de la Gare - 29900','02.98.97.32.40','CONCARNEAU'),
     (2916,'CORAY','Zone de Lanviho - 29370','02.98.59.74.47','CONCARNEAU'),
     (2917,'CROZON','Boulevard de Pralognan-la-Vanoise - 29160','02.98.27.14.65','BREST'),
     (2918,'DOUARNENEZ','4 route de Brest - 29100','02.98.92.00.38','QUIMPER'),
     (2919,'ELLIANT','Rue Pasteur - 29370','02.98.94.14.43','CONCARNEAU'),
     (2920,'FOUESNANT','31 rue du château d\'eau - 29170','02.98.56.11.83','QUIMPER'),
     (2921,'GUERLESQUIN','Route de Bolazec - 29650','02.98.72.86.25','MORLAIX'),
     (2922,'HUELGOAT','31 rue du Général de Gaulle - 29690','02.98.99.90.76','MORLAIX'),
     (2923,'ILE DE BATZ','Route du Jardin Colonial - 292S3','02.98.61.78.43','MORLAIX'),
     (2924,'ILE DE OUESSANT','Kernigou - 29242','02.98.48.85.59','BREST'),
     (2925,'LANDERNEAU','rue ingénieur Jacques Frimot - 29800','02.98.85.16.16','BREST'),
     (2926,'LANDIVISIAU','28 rue Georges Clemenceau - 29400','02.98.68.03.18','MORLAIX'),
     (2927,'LANMEUR','Rue des Quatre Vents - 29620','02.98.67.50.31','MORLAIX'),
     (2928,'LANNILIS','Rue Mathilde Delaporte - 29870','02.98.04.17.36','BREST'),
     (2929,'LE FAOU','Place aux Foires - 29590','02.98.81.01.11','BREST'),
     (2930,'LE GUILVINEC','43 rue Jean Jaurès - 29730','02.98.58.26.48','QUIMPER'),
     (2931,'LESNEVEN','Place du Champ de Bataille - 29260','02.98.83.02.68','BREST'),
     (2932,'LEUHAN','4 rue de l\'école - 29390','02.98.82.50.87','CONCARNEAU'),
     (2933,'LOCTUDY','Place des Anciens Combattants - 29750','02.98.87.40.18','QUIMPER'),
     (2934,'MELGVEN','Rue Neuve - 29140','02.98.97.99.88','CONCARNEAU'),
     (2935,'MOELAN SUR MER','46 rue de Pont ar Laer - 29350','02.98.39.68.90','CONCARNEAU'),
     (2936,'MORLAIX','7 rue de l\'Orée du Bois - 29600','02.98.88.16.18','MORLAIX'),
     (2937,'PENMARC\'H','Rue Edmond Michelet - 29760','02.98.58.72.16','QUIMPER'),
     (2938,'PLABENNEC','7 rue du Maréchal Leclerc - 29860','02.98.40.81.81','BREST'),
     (2939,'PLEYBEN','Rue Maurice de Trésiguidy - Zone du Drevers - 29190','02.98.26.32.87','MORLAIX'),
     (2940,'PLOBANNALEC','Place du 19 mars 1962 - 29740','02.98.87.80.27','QUIMPER'),
     (2941,'PLOMEUR','Rue du Prat Don - 29120','02.98.82.05.13','QUIMPER'),
     (2942,'PLONEOUR LANVERN','Place Amiral Ronarc\'h - 29720','02.98.87.70.99','QUIMPER'),
     (2943,'PLOUDALMEZEAU','Rue de Cullompton - 29830','02.98.48.05.78','BREST'),
     (2944,'PLOUESCAT','Boulevard de l\'Europe - 29430','02.98.69.61.99','MORLAIX'),
     (2945,'PLOUGONVEN','24 rue de Morlaix - 29640','02.98.78.70.72','MORLAIX'),
     (2946,'PLOUGUERNEAU','ZA Héliez - 29880','02.98.04.61.85','BREST'),
     (2947,'PLOZEVET','Rue de l\'usine - 29710','02.98.91.46.55','QUIMPER'),
     (2948,'PONT AVEN','Rue du Général de Gaulle - 29930','02.98.06.05.15','CONCARNEAU'),
     (2949,'PONT L\'ABBE','Place de la Gare - 29120','02.98.87.08.36','QUIMPER'),
     (2950,'POULDREUZIC','Rue de la Gare - 29710','02.98.54.46.33','QUIMPER'),
     (2951,'QUERRIEN','Rue du Château d\'Eau - 29310','02.98.71.37.57','CONCARNEAU'),
     (2952,'QUIMPER','60 avenue de Kéradennec - 29000','02.98.64.88.00','QUIMPER'),
     (2953,'QUIMPERLE','15 allée Victor Schœlcher   - Z.A. de Kergoaler - 29300','02.98.96.18.18','CONCARNEAU'),
     (2954,'RIEC SUR BELON','Rue centrale - 29340','02.98.06.41.34','CONCARNEAU'),
     (2955,'ROSPORDEN','ZI de Dioulan - 29140','02.98.59.94.93','CONCARNEAU'),
     (2956,'SAINT GOAZEC','Kervoazec - 29520','02.98.26.84.76','MORLAIX'),
     (2957,'SAINT POL DE LEON','Rue du Budou - 29250','02.98.69.20.18','MORLAIX'),
     (2958,'SAINT RENAN',' Route de Plouzané - 29290','02.98.84.21.76','BREST'),
     (2959,'SAINT THEGONNEC','Penfo - 29410','02.98.79.46.00','MORLAIX'),
     (2960,'SAINT THURIEN',' Route de Scaêr - 29380','02.98.39.48.16','CONCARNEAU'),
     (2961,'SCAER','Rue Queignec - 29390','02.98.59.42.33','CONCARNEAU'),
     (2962,'SIZUN','Rue du Léon - 29450','02.98.68.87.06','MORLAIX'),
     (2963,'SPEZET','8, rue des Ecoles - 29540','02.98.93.93.65','MORLAIX'),
     (2964,'TREGOUREZ','Rue Yvon Donnard - 29970','02.98.59.14.67','QUIMPER');
-- ----------------------------------------------------------------------------------------------
insert into parametre(pType,pIndice,pLibelle,pValeur,pPlancher,pPlafond) values
     ('dispo',0,'Indisponible','gray',null,null),
     ('dispo',1,'Disponible','white',null,null),
     ('dispo',2,'Au travail','yellow',null,null),
     ('dispo',3,'Garde','lime',null,null),
     ('grade',0,'Sapeur',null,null,null),
     ('grade',1,'Adjudant',null,null,null),
     ('grade',2,'Adjudant-Chef',null,null,null),
     ('grade',3,'Capitaine',null,null,null),
     ('grade',4,'Caporal',null,null,null),
     ('grade',5,'Caporal-Chef',null,null,null),
     ('grade',6,'Commandant',null,null,null),
     ('grade',7,'Lieutenant',null,null,null),
     ('grade',8,'Lieutenant-Colonel',null,null,null),
     ('grade',9,'Major',null,null,null),
     ('grade',10,'Sergent',null,null,null),
     ('grade',11,'Sergent-chef',null,null,null),
     ('statAgt',1,'pompier',null,null,null),
     ('statAgt',2,'chef de centre',null,null,null),
     ('statAgt',3,'responsable des alertes',null,null,null),
     ('tranche',1,'nuit :  0h/6h',null,null,null),
     ('tranche',2,'matin :  6h/12 h',null,null,null),
     ('tranche',3,'après-midi : 12h/18h',null,null,null),
     ('tranche',4,'soirée : 18h/24h',null,null,null),
     ('typePer',1,'pompier professionnel',null,null,null),
     ('typePer',2,'pompier volontaire',null,null,null),
     ('typePer',3,'personnel médical',null,null,null),
     ('typePer',4,'personnel administratif',null,null,null);
-- ----------------------------------------------------------------------------------------------
INSERT INTO `pompier` (`pCis`, `pId`, `pNom`, `pPrenom`, `pStatut`, `pType`, `pMail`, `pLogin`, `pMdp`, `pAdresse`, `pCp`, `pVille`, `pBip`, `pNbGardes`, `pGrade`, `pCommentaire`, `pDateEnreg`, `pDateModif`) VALUES
(2901, 1, 'ROUAT', 'Michel', 2, 1, 'michel.rouat@sdis29.fr', 'mROUA', 'ff70d7c9ac34274ea95a1553aa2ba5cb', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2901, 2, 'RANNOU', 'Michel', 1, 2, 'michel.rannou@sdis29.fr', 'mRANN', '15671cef7fcdfd744e28a6154d1845ac', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2902, 1, 'ROSEN', 'Alain', 2, 1, 'alain.rosen@sdis29.fr', 'aROSE', '070f0a53761332b04900ac675899fc69', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2902, 2, 'LABORY', 'Bruno', 1, 2, 'bruno.labory@sdis29.fr', 'bLABO', 'bf1377631348720d4ada09b7d3bd3b00', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2903, 1, 'RIVOAL', 'Ronan', 2, 1, 'ronan.rivoal@sdis29.fr', 'rRIVO', '022a19f6ab0ca558f3433b57cc5cdb9a', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2903, 2, 'SIMON', 'Frédéric', 1, 2, 'frédéric.simon@sdis29.fr', 'fSIMO', 'b54a2286cac900096bf2e5e78e66b0c2', NULL, NULL, NULL, '2', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 1, 'FALC\'HUN', 'Jean-Luc', 2, 1, 'jean-luc.falchun@sdis29.fr', 'jFALC', '381fdf412c0ce426a439d6be1a75bde3', NULL, NULL, NULL, '1', 0, 8, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 2, 'QUERE', 'Alain', 3, 1, 'alain.quere@sdis29.fr', 'aQUER', '6e4ae952b513ee8bb1b121b7129a35ae', NULL, NULL, NULL, '2', 0, 3, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 3, 'KEREBEL', 'Erwan', 1, 2, 'erwan.kerebel@sdis29.fr', 'eKERE', '488871485a881fdc7a96443f3bb28fcf', NULL, NULL, NULL, '3', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 4, 'PAULEAU', 'Pierre', 1, 2, 'pierre.pauleau@sdis29.fr', 'pPAUL', '1dca0bb7f8452db5b9509fe799c182ea', NULL, NULL, NULL, '4', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 5, 'DEROFF', 'Jacques', 1, 2, 'jacques.deroff@sdis29.fr', 'jDERO', '2ee7af8df036b3783e2ce4357577022c', NULL, NULL, NULL, '5', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 6, 'MAZE', 'Dominique', 1, 2, 'dominique.maze@sdis29.fr', 'dMAZE', '26d239c74858cd3f1d12aecd7f82ae09', NULL, NULL, NULL, '6', 0, 6, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 7, 'TOULLEC', 'Jérôme', 1, 2, 'jérôme.toullec@sdis29.fr', 'jTOUL', '1bef8b407118d4f1ebe72357259de01a', NULL, NULL, NULL, '7', 0, 3, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 8, 'KERBERENES', 'Pascal', 1, 2, 'pascal.kerberenes@sdis29.fr', 'pKERB', 'dbbf765c454da8ff92eb45740e7b96f9', NULL, NULL, NULL, '8', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 9, 'JACQUET', 'Bertrand', 1, 2, 'bertrand.jacquet@sdis29.fr', 'bJACQ', '725a61a682f150763ed8d00deb62565d', NULL, NULL, NULL, '9', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 10, 'LE BRIS', 'Yves', 1, 2, 'yves.le_bris@sdis29.fr', 'yLE B', 'dbccc26fd8b499884b61336c75cdba46', NULL, NULL, NULL, '10', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 11, 'LE BARS', 'Yvon', 1, 2, 'yvon.le_bars@sdis29.fr', 'yLE B', 'dbccc26fd8b499884b61336c75cdba46', NULL, NULL, NULL, '11', 0, 7, '', '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 12, 'BOULIC', 'Louis', 1, 2, 'louis.boulic@sdis29.fr', 'lBOUL', 'a06e6317cf3d52c1ee6d81ec945d2e3a', NULL, NULL, NULL, '12', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 13, 'BERNARD', 'Luc', 1, 2, 'luc.bernard@sdis29.fr', 'lBERN', 'd82673400cff63b4d9d175c4cb826081', NULL, NULL, NULL, '13', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2904, 14, 'DUROSE', 'Pierre', 1, 2, 'pierre.durose@sdis29.fr', 'pDURO', '512d147b291a1f2a991c234122681c8d', NULL, NULL, NULL, '14', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2905, 1, 'PENNEC', 'Daniel', 2, 1, 'daniel.pennec@sdis29.fr', 'dPENN', 'ef37a363f4878ee660a55f98bb44371d', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2905, 2, 'GAONAC\'H', 'Jean-Claude', 1, 2, 'jean-claude.gaonach@sdis29.fr', 'jGAON', 'd92f5ba406da1380a3b90c83641c2d8b', NULL, NULL, NULL, '2', 0, 11, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2906, 1, 'DAVAIC', 'José', 2, 1, 'josé.davaic@sdis29.fr', 'jDAVA', 'f721a803e3533cf9ef1b9aba853af649', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2906, 2, 'TANIOU', 'Claude', 1, 2, 'claude.taniou@sdis29.fr', 'cTANI', '3edcaffac9a0410d130462f87b20defe', NULL, NULL, NULL, '2', 0, 11, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2907, 1, 'MARZIN', 'Jean-François', 2, 1, 'jean-françois.marzin@sdis29.fr', 'jMARZ', 'd6320a73f31bd74cd8ee0cfaa322daa6', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2907, 2, 'COÏC', 'Alain', 1, 2, 'alain.coïc@sdis29.fr', 'aCOÏC', '03dbcd2cc136d6635b7fbb119881d126', NULL, NULL, NULL, '2', 0, 5, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2908, 1, 'KERSUAL', 'Hervé', 2, 1, 'hervé.kersual@sdis29.fr', 'hKERS', 'b5bd1090562ae3f0b06c4ef59b17e994', NULL, NULL, NULL, '1', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2909, 1, 'COÏC', 'Alain', 2, 1, 'alain.coïc@sdis29.fr', 'aCOÏC', '03dbcd2cc136d6635b7fbb119881d126', NULL, NULL, NULL, '1', 0, 4, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2911, 1, 'CADIOU', 'Philippe', 2, 1, 'philippe.cadiou@sdis29.fr', 'pCADI', '47f45e21035cbf174cc3a00a43ae410a', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2911, 2, 'COCHENNEC', 'Eric', 1, 2, 'eric.cochennec@sdis29.fr', 'eCOCH', 'e74bd5173f1f9b71339f577540ff2095', NULL, NULL, NULL, '2', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2912, 1, 'DURET', 'Nicolas', 2, 1, 'nicolas.duret@sdis29.fr', 'nDURE', '9c08b2ea4805b2f3f7d1a41d34dea3f7', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2912, 2, 'SCOARNEC', 'Stéphane', 1, 2, 'stéphane.scoarnec@sdis29.fr', 'sSCOA', '467796dd1556cb2d77ce0c790298333c', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2913, 1, 'DELAPORTE', 'David', 2, 1, 'david.delaporte@sdis29.fr', 'dDELA', '7b7c9e48aa29e3b91c6fac203e87eb73', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2914, 1, 'GUERROUE', 'Eric', 2, 1, 'eric.guerroue@sdis29.fr', 'eGUER', '3e9268ea6fa741cbec5a17178d88404f', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2914, 2, 'LE BOURHIS', 'Bruno', 1, 2, 'bruno.le_bourhis@sdis29.fr', 'bLE B', '6cc36dc3f5c7843680d9e48ef2587f14', NULL, NULL, NULL, '2', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2915, 1, 'BOUSSIN', 'Cédric', 2, 1, 'cédric.boussin@sdis29.fr', 'cBOUS', 'a459930d9039520f99a68bb395c07d62', NULL, NULL, NULL, '1', 0, 6, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2915, 2, 'PITOR', 'Pascal', 3, 1, 'pascal.pitor@sdis29.fr', 'pPITO', '006bd3c3ac2fae73faaf31f7649b0718', NULL, NULL, NULL, '2', 0, 6, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2915, 3, 'GIRE', 'Gilbert', 1, 2, 'gilbert.gire@sdis29.fr', 'gGIRE', 'c18cdc3a37b14016e202a238abb470e9', NULL, NULL, NULL, '3', 0, 3, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2915, 4, 'PICAUT', 'Franck', 1, 2, 'franck.picaut@sdis29.fr', 'fPICA', '44ebff339e1b8e1a76154554b152906a', NULL, NULL, NULL, '4', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2915, 5, 'VIOL', 'Alain', 1, 2, 'alain.viol@sdis29.fr', 'aVIOL', '9e28492afea490a2864783470696fe26', NULL, NULL, NULL, '5', 0, NULL, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2915, 6, 'QUEAU', 'Erwan', 1, 2, 'erwan.queau@sdis29.fr', 'eQUEA', '927830590191a590c31364fcd0090f18', NULL, NULL, NULL, '6', 0, 3, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2915, 7, 'VAXELAIRE', 'Francis', 1, 2, 'francis.vaxelaire@sdis29.fr', 'fVAXE', '288c3a7f4664385730406ca5a9ae1173', NULL, NULL, NULL, '7', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2916, 1, 'HEMERY', 'Michel', 2, 1, 'michel.hemery@sdis29.fr', 'mHEME', 'cdfcb02fcac9206b7e55fa20d7bb0cc4', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2916, 2, 'LE BARS', 'Didier', 1, 2, 'didier.le bars@sdis29.fr', 'dLE B', 'db8e28a5090e9148d2aa56acb914703c', NULL, NULL, NULL, '2', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2917, 1, 'GAY', 'Lionel', 2, 1, 'lionel.gay@sdis29.fr', 'lGAY', '67b015c9f2a929b1429d7cb3ec2535ad', NULL, NULL, NULL, '1', 0, 3, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2917, 2, 'LARGENTON', 'Anthony', 1, 2, 'anthony.largenton@sdis29.fr', 'aLARG', 'd4a1845c488435f162dac6122b961cef', NULL, NULL, NULL, '2', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2918, 1, 'AMET', 'Olivier', 2, 1, 'olivier.amet@sdis29.fr', 'oAMET', '78d350f90cc501626d1e27a805be343a', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2918, 2, 'BIDET', 'Xavier', 1, 2, 'xavier.bidet@sdis29.fr', 'xBIDE', 'c1d554d06a7de3fe6e931d506e2c15f9', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2919, 1, 'LE ROY', 'Jean-Michel', 2, 1, 'jean-michel.le_roy@sdis29.fr', 'jLE R', '8c1b857336563356eb3182188246aa02', NULL, NULL, NULL, '1', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2919, 2, 'COTTEN', 'François', 1, 2, 'françois.cotten@sdis29.fr', 'fCOTT', 'e446c8e8561d0992f5dea06ce43b8e36', NULL, NULL, NULL, '2', 0, 5, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2920, 1, 'GOARDET', 'Christian', 2, 1, 'christian.goardet@sdis29.fr', 'cGOAR', '47b5a53f889b029d558c2fa2f5adc3a9', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2920, 2, 'CORCUFF', 'Gaël', 1, 2, 'gaël.corcuff@sdis29.fr', 'gCORC', '408f77dda7ffad34a6724b801dff5993', NULL, NULL, NULL, '2', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2921, 1, 'LE SCRAGNE', 'David', 2, 1, 'david.le scragne@sdis29.fr', 'dLE S', 'b8417c8940b67b0f51cd1256796ee4ce', NULL, NULL, NULL, '1', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2921, 2, 'GUERN', 'Jean-Luc', 1, 2, 'jean-luc.guern@sdis29.fr', 'jGUER', 'd9f84bd45a6e444084beb0f28d8def8b', NULL, NULL, NULL, '2', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2922, 1, 'MOREAU', 'Jean-Pierre', 2, 1, 'jean-pierre.moreau@sdis29.fr', 'jMORE', '62c7f75865ca633b6ad7f446ca345209', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2922, 2, 'HERVIOU', 'Patrick', 1, 2, 'patrick.herviou@sdis29.fr', 'pHERV', '588e5f1892372604d1e9559873147e35', NULL, NULL, NULL, '2', 0, 11, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2923, 1, 'MARTIN', 'Nicolas', 2, 1, 'nicolas.martin@sdis29.fr', 'nMART', '5e4aa993b426a7e5ad06fcfb4c2dbb13', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2923, 2, 'GLIDIC', 'David', 1, 2, 'david.glidic@sdis29.fr', 'dGLID', '56100506a4a016745a53e74d81b3e6ca', NULL, NULL, NULL, '2', 0, 10, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 1, 'DURAND', 'François', 2, 1, 'françois.durand@sdis29.fr', 'fDURA', 'e4635012f2ce52ac50a4f236d7d06852', NULL, NULL, NULL, '2', 12, 0, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 2, 'LEGALL', 'Yasmina', 1, 2, 'yasmina.legall@sdis29.fr', 'yLEGA', 'e898faf807c9443ea2548fe7b908d46e', NULL, NULL, NULL, '3', 10, 0, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 3, 'DUBOIS', 'Yves', 1, 2, 'yves.dubois@sdis29.fr', 'yDUBO', '8e817f5b0463be6ed6cefe521bf72eb4', NULL, NULL, NULL, '9', 14, 0, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 4, 'MARTIN', 'Alain', 1, 2, 'alain.martin@sdis29.fr', 'aMART', 'd610bed518def84789dee9b34742fd41', NULL, NULL, NULL, '17', 12, 0, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 5, 'DUPOND', 'Carole', 1, 2, 'carole.dupond@sdis29.fr', 'cDUPO', '034570a9c267a0631f48ddcd1b31a7f6', NULL, NULL, NULL, '4', 10, 0, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 6, 'YAYAOUI', 'Pierre', 1, 2, 'pierre.yayaoui@sdis29.fr', 'pYAYA', 'd6329ecaeed2b3ea36ed696ef350cb80', NULL, NULL, NULL, '11', 10, 0, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 7, 'CARETTE', 'Patrick', 1, 2, 'patrick.carette@sdis29.fr', 'pCARE', 'c73e9ec57ed7b0ce30930dfb30fcbd19', NULL, NULL, NULL, '12', 2, 0, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 8, 'FERNANDEZ', 'Henri', 1, 2, 'henri.fernandez@sdis29.fr', 'hFERN', 'b4a65778f3ff09b4efc77e67a2f7510c', NULL, NULL, NULL, '18', 14, 0, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 9, 'CABON', 'Yohann', 1, 2, 'yohann.cabon@sdis29.fr', 'yCABO', 'ccf3e1487abfcd826d150475a219868c', NULL, NULL, NULL, '6', 12, 0, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 10, 'BRETON', 'Joëlle', 1, 2, 'joëlle.breton@sdis29.fr', 'jBRET', 'bd46da5e1c435c0f5501ff044170f7d3', NULL, NULL, NULL, '5', 14, 0, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 11, 'DUJARDIN', 'Alex', 1, 2, 'alex.dujardin@sdis29.fr', 'aDUJA', 'a16439d3ed7c454b0c84fe00e7494acf', NULL, NULL, NULL, '10', 11, 0, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 12, 'CLÉBERT', 'Marc', 1, 2, 'marc.clebert@sdis29.fr', 'mCLÉB', '7f5fabc295f9356c23ec80f7a4510ea1', NULL, NULL, NULL, '19', 10, 0, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 13, 'MASSON', 'Nicolas', 1, 2, 'nicolas.masson@sdis29.fr', 'nMASS', '2bb8ebb40fa2b2c6e279b0c8e9da1a21', NULL, NULL, NULL, '13', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2924, 14, 'CORNIC', 'Patrick', 1, 2, 'patrick.cornic@sdis29.fr', 'pCORN', '06b8cbcf44f9dbdae680030152180b5c', NULL, NULL, NULL, '14', 0, 4, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2925, 1, 'LE FUR', 'Pierre', 2, 1, 'pierre.le_fur@sdis29.fr', 'pLE F', 'b055f041b0239ff20a528ab6df18740d', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2925, 2, 'BOUCHER', 'Jean-Paul', 1, 2, 'jean-paul.boucher@sdis29.fr', 'jBOUC', '034e89fecf002fc9ce9e6b585997712e', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2926, 1, 'SALAUN', 'Yvon', 2, 1, 'yvon.salaun@sdis29.fr', 'ySALA', '377642436d800fffeb2396e4da1468bb', NULL, NULL, NULL, '1', 0, 3, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2926, 2, 'LEROU', 'Philippe', 1, 2, 'philippe.lerou@sdis29.fr', 'pLERO', 'b2d4f0461d7244803cc871e7030d278a', NULL, NULL, NULL, '2', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2926, 3, 'BODILIS', 'Marc', 1, 2, 'marc.bodilis@sdis29.fr', 'mBODI', '9075b6191417dad116c16189729a3173', NULL, NULL, NULL, '3', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2927, 1, 'PUIL', 'Thierry', 2, 1, 'thierry.puil@sdis29.fr', 'tPUIL', '275119d76b2e349c5eed6bb38be84849', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2927, 2, 'FOLGALVEZ', 'Jean-Pierre', 1, 2, 'jean-pierre.folgalvez@sdis29.fr', 'jFOLG', 'd109b403c606225276976ff4bc64330b', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2928, 1, 'L\'HOURRE', 'Christian', 2, 1, 'christian.lhourre@sdis29.fr', 'cL\'HO', '0fa94cdef1f6dec8fe43f4e38cfc4f50', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2928, 2, 'MARZIN', 'Roland', 1, 2, 'roland.marzin@sdis29.fr', 'rMARZ', 'd8190ab7e8d4cde97fd38c2f3af3772c', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2929, 1, 'SALAUN', 'Mickael', 2, 1, 'mickael.salaun@sdis29.fr', 'sMick', 'f7150d27e5a14980d5e3366486e9c691', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2929, 2, 'GUEDES', 'Ambroise', 1, 2, 'ambroise.guedes@sdis29.fr', 'aGUED', '943c9f82c5be096218439be6a4d20ca7', NULL, NULL, NULL, '2', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2930, 1, 'JOLIVET', 'Patrick', 2, 1, 'patrick.jolivet@sdis29.fr', 'pJOLI', '31b185453725484a8575af5bbff341a5', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2931, 1, 'BERTRAND', 'Lionel', 2, 1, 'lionel.bertrand@sdis29.fr', 'lBERT', '211cf7b64920311674320264c01b49d0', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2931, 2, 'ABIVEN', 'Pierre', 1, 2, 'pierre.abiven@sdis29.fr', 'pABIV', '15dcff279e261b1fdb848b5e1b56bede', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2932, 1, 'BENOIT', 'Yves', 2, 1, 'yves.benoit@sdis29.fr', 'yBENO', 'e93165d1d5bc05f5ec71036c59cc9b56', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2932, 2, 'BOLZER', 'Emile', 1, 2, 'emile.bolzer@sdis29.fr', 'eBOLZ', '0a9d2a4b526d2955296f64b006075f6c', NULL, NULL, NULL, '2', 0, 10, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2933, 1, 'SPAGNOL', 'Joël', 2, 1, 'joël.spagnol@sdis29.fr', 'jSPAG', '7cb2f9c107650b927bbcda57d3444abc', NULL, NULL, NULL, '1', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2933, 2, 'THOMAS', 'Nicolas', 1, 2, 'nicolas.thomas@sdis29.fr', 'nTHOM', 'bd69813624ba91d1b2e9b337cd6728cb', NULL, NULL, NULL, '2', 0, 11, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2933, 3, 'MORVAN', 'Daniel', 1, 2, 'daniel.morvan@sdis29.fr', 'dMORV', 'cf9644ce926a668bd1205dedf2636950', NULL, NULL, NULL, '3', 0, 10, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2934, 1, 'LE DUIGOU', 'Christian', 2, 1, 'christian.le duigou@sdis29.fr', 'cLE D', '4c898674a54a678afe59c3d8703d4ec9', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2934, 2, 'LE NOC', 'Arnaud', 1, 2, 'arnaud.le_noc@sdis29.fr', 'aLE N', '6491e726551e72220912aa26faa3d8a5', NULL, NULL, NULL, '2', 0, 11, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2935, 1, 'LE DOZE', 'Serge', 2, 1, 'serge.le_doze@sdis29.fr', 'sLE D', '64bbf8112505dcecb2e9d82f3025e268', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2935, 2, 'MARCEUL', 'Patrick', 1, 2, 'patrick.marceul@sdis29.fr', 'pMARC', '41e3ac09835ddf43b93446c430c2cdb6', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2936, 1, 'MOSES', 'Didier', 2, 1, 'didier.moses@sdis29.fr', 'dMOSE', '3e5496e71694450b3d8da8ead7c1f54a', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2936, 2, 'LECLÈRE', 'Jean-Raphaël', 1, 2, 'jean-raphaël.leclère@sdis29.fr', 'jLECL', 'f597f57eed0889c4a61705cd9bc05959', NULL, NULL, NULL, '2', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2937, 1, 'GLOAGUEN', 'Christophe', 2, 1, 'christophe.gloaguen@sdis29.fr', 'cGLOA', '472d5013c4598ecb43df2e2ab0afb213', NULL, NULL, NULL, '1', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2937, 2, 'STEPHAN', 'Bertrand', 1, 2, 'bertrand.stephan@sdis29.fr', 'bSTEP', 'aca9d4ee8cee3350d966ddd409cbd416', NULL, NULL, NULL, '2', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2938, 1, 'QUERE', 'Mickaël', 2, 1, 'mickaël.quere@sdis29.fr', 'mQUER', 'b4ef7e2857f93aa3e1425ef6d80316eb', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2938, 2, 'CORCUFF', 'Thierry', 1, 2, 'thierry.corcuff@sdis29.fr', 'tCORC', '9c296d5d5aa50081f93c07e3a585f1b3', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2939, 1, 'LEVER', 'Olivier', 2, 1, 'olivier.lever@sdis29.fr', 'oLEVE', 'd26ad958e92ed47291516b807189274f', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2939, 2, 'SEVELLEC', 'Serge', 1, 2, 'serge.sevellec@sdis29.fr', 'sSEVE', 'c1092c50d1902e8d77058b6719d73c85', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2940, 1, 'KERVEC', 'Philippe', 2, 1, 'philippe.kervec@sdis29.fr', 'pKERV', '54eb3d9f94e7fafda2ef6b242e2ec9e7', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2940, 2, 'LE COSSEC', 'Stéphane', 1, 2, 'stéphane.le cossec@sdis29.fr', 'sLE C', '02d7e08db30e813d26a44c705948102e', NULL, NULL, NULL, '2', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2941, 1, 'BLERIOT', 'Sylvain', 2, 1, 'sylvain.bleriot@sdis29.fr', 'sBLER', 'd56231064d4ad2a655d74bd3d02ff857', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2941, 2, 'LAGADIC', 'Philippe', 1, 2, 'philippe.lagadic@sdis29.fr', 'pLAGA', '3b30ef92284abbcddd551f9703764c47', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2942, 1, 'RIOUAL', 'Johann', 2, 1, 'johann.rioual@sdis29.fr', 'jRIOU', '308e0e335ad6b4c9ecec0d5171a8d3ec', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2942, 2, 'QUINIOU', 'Arnaud', 1, 2, 'arnaud.quiniou@sdis29.fr', 'aQUIN', '147fcf6a975255705306d5534e76480e', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2943, 1, 'NORMANT', 'Philippe', 2, 1, 'philippe.normant@sdis29.fr', 'pNORM', 'a42271f2c279c9a592c917ee91c64736', NULL, NULL, NULL, '1', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2943, 2, 'BONNIN', 'Antoine', 1, 2, 'antoine.bonnin@sdis29.fr', 'aBONN', 'e57614252c18ab6a270acd508e134bd5', NULL, NULL, NULL, '2', 0, 10, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2944, 1, 'QUEFFEULOU', 'Mickaël', 2, 1, 'mickaël.queffeulou@sdis29.fr', 'mQUEF', 'a2bd678e10cd6df31b1b6e7f5e46918c', NULL, NULL, NULL, '1', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2944, 2, 'LE DUFF', 'Guy', 1, 2, 'guy.le_duff@sdis29.fr', 'gLE D', '0922dc3f92ac7b89c8b833d2cdaf8ad8', NULL, NULL, NULL, '2', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2945, 1, 'COQUIL', 'Jean-Yves', 2, 1, 'jean-yves.coquil@sdis29.fr', 'jCOQU', 'd438d5e4a934a830a0ede46f2a90379e', NULL, NULL, NULL, '1', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2945, 2, 'REIG', 'Christophe', 1, 2, 'christophe.reig@sdis29.fr', 'cREIG', '5d28b3bfd238409299ee620d3201d275', NULL, NULL, NULL, '2', 0, 11, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2946, 1, 'JAMBET', 'Laurent', 2, 1, 'laurent.jambet@sdis29.fr', 'lJAMB', '32cf0ece9260d611d3b9ab18601c9853', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2946, 2, 'LOAEC', 'Olivier', 1, 2, 'olivier.loaec@sdis29.fr', 'oLOAE', '99e584e00263ba6e83f1c156f748be82', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2947, 1, 'LE FLOCH', 'André', 2, 1, 'andré.le_floch@sdis29.fr', 'aLE F', '8ba965804b44810779c5ff8ae1c6b787', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2947, 2, 'LE GOFF', 'Robert', 1, 2, 'robert.le_goff@sdis29.fr', 'rLE G', '87f5306211daffffd8694f0ef88c21c3', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2948, 1, 'POSTIC', 'Bruno', 2, 1, 'bruno.postic@sdis29.fr', 'bPOST', '03e49a0e3a25864270efd11a82e0c13d', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2948, 2, 'VERNON', 'Claude', 1, 2, 'claude.vernon@sdis29.fr', 'cVERN', '93f8d5bd86630c72fffd0efffa1e645a', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2949, 1, 'CREIGNOU', 'Pierre', 2, 1, 'pierre.creignou@sdis29.fr', 'pCREI', 'c221eb3b37a03fe63cefc9cc2dda198d', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2949, 2, 'BUANIC', 'Christophe', 1, 2, 'christophe.buanic@sdis29.fr', 'cBUAN', '40d8457579922b0f5d4582a6d905be5b', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2949, 3, 'ROLLAND', 'Pascal', 1, 2, 'pascal.rolland@sdis29.fr', 'pROLL', '2c8397311ae9e1d4580dc57bb52fc87b', NULL, NULL, NULL, '3', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2950, 1, 'L\'HELGUEN', 'Jean-Jacques', 2, 1, 'jean-jacques.lhelguen@sdis29.fr', 'jL\'HE', '4773eda09479d2104bbacb1435cd241e', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2950, 2, 'ANDRO', 'Guy', 1, 2, 'guy.andro@sdis29.fr', 'gANDR', '0494d72ed8b5c15c0584f7c9d92fdf7c', NULL, NULL, NULL, '2', 0, 9, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2951, 1, 'ROBIN', 'Michel', 2, 1, 'michel.robin@sdis29.fr', 'mROBI', 'd7483abd136825eff6abe7f6729418ac', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2951, 2, 'MOYSAN', 'Ronan', 1, 2, 'ronan.moysan@sdis29.fr', 'rMOYS', 'ef7b88a68b77359b5fd7439cd9ce5b7c', NULL, NULL, NULL, '2', 0, 11, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2952, 1, 'BOURGOIN', 'Géraldine', 2, 1, 'géraldine.bourgoin@sdis29.fr', 'gBOUR', 'ee534bab887573e3e4fe502ebfdea8f6', NULL, NULL, NULL, '1', 0, 6, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2952, 2, 'RICHARD', 'Timothée', 3, 1, 'timothée.richard@sdis29.fr', 'tRICH', '947f700f3e622dd063e1f5ae6d4e230a', NULL, NULL, NULL, '2', 0, NULL, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2952, 3, 'MAHOUDO', 'Hervé', 1, 2, 'hervé.mahoudo@sdis29.fr', 'hMAHO', '1f3d00c691ac79b60eaf7ef72220351f', NULL, NULL, NULL, '3', 0, 8, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2952, 4, 'GOURVENNEC', 'Claudine', 1, 2, 'claudine.gourvennec@sdis29.fr', 'cGOUR', 'bf72eae7b12279516597e1f598ab7fe2', NULL, NULL, NULL, '4', 0, 6, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2952, 5, 'RICHARD', 'Philippe', 1, 2, 'philippe.richard@sdis29.fr', 'pRICH', '42ec3e8022590ff68560c1494efbda72', NULL, NULL, NULL, '5', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2952, 6, 'DREAN', 'Matthieu', 1, 2, 'matthieu.drean@sdis29.fr', 'mDREA', '5b37c9c7d4dd5c934ebe977b7f029733', NULL, NULL, NULL, '6', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2952, 7, 'TREFAULT', 'Pascal', 1, 2, 'pascal.trefault@sdis29.fr', 'pTREF', '02e18d12d1611d8fcdf33a75594a1f1d', NULL, NULL, NULL, '7', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2952, 8, 'REINS', 'Nicolas', 1, 2, 'nicolas.reins@sdis29.fr', 'nREIN', 'f6c5d81eac5c61942b996fb1138cb578', NULL, NULL, NULL, '8', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2952, 9, 'LAURET-CATROS', 'Christine', 1, 2, 'christine.lauret-catros@sdis29.fr', 'cLAUR', '3a673e181cafbdb7e9762592133b67f9', NULL, NULL, NULL, '9', 0, NULL, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2953, 1, 'CHEVALIER', 'Fabrice', 2, 1, 'fabrice.chevalier@sdis29.fr', 'fCHEV', 'f01b3d1c2274a82c4ee367ddd3b5bbf2', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2953, 2, 'LANDREIN', 'Jean-Luc', 1, 2, 'jean-luc.landrein@sdis29.fr', 'jLAND', 'b7e568a8de36046c293edd8a11550b4f', NULL, NULL, NULL, '2', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2954, 1, 'DREO', 'Jacques', 2, 1, 'jacques.dreo@sdis29.fr', 'jDREO', '9c5ccefd7ccacb5822260d198aec3e50', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2954, 2, 'GUILLOU', 'Yvan', 1, 2, 'yvan.guillou@sdis29.fr', 'yGUIL', 'f6b4ab52ee0fe6732743fa53a347fadd', NULL, NULL, NULL, '2', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2955, 1, 'CAUDAL', 'Xavier', 2, 1, 'xavier.caudal@sdis29.fr', 'xCAUD', '557fe7fdbe5497d2502a51c2630ff4f2', NULL, NULL, NULL, '1', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2955, 2, 'FOURRIER', 'Eric', 1, 2, 'eric.fourrier@sdis29.fr', 'eFOUR', '14b684e77ba5e7d1dc1686544097916b', NULL, NULL, NULL, '2', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2956, 1, 'MORVAN', 'Didier', 2, 1, 'didier.morvan@sdis29.fr', 'dMORV', 'cf9644ce926a668bd1205dedf2636950', NULL, NULL, NULL, '1', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2956, 2, 'STEPHAN', 'David', 1, 2, 'david.stephan@sdis29.fr', 'dSTEP', 'd23211a6ce9582119fa34894c861b396', NULL, NULL, NULL, '2', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2957, 1, 'MARTIN', 'Nicolas', 2, 1, 'nicolas.martin@sdis29.fr', 'nMART', '5e4aa993b426a7e5ad06fcfb4c2dbb13', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2957, 2, 'COMBOT', 'Christophe', 3, 1, 'christophe.combot@sdis29.fr', 'cCOMB', 'b4ff98abe503f804dd92d24349a37305', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2957, 3, 'BOUKELIFA', 'David', 1, 2, 'david.boukelifa@sdis29.fr', 'dBOUK', '7a55777df2188cd7295fcab3d117afb8', NULL, NULL, NULL, '3', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2958, 2, 'PELLEN', 'Roland', 1, 2, 'roland.pellen@sdis29.fr', 'rPELL', '711b22c8c8c6cf4d190aa95d492e4917', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2959, 1, 'TREICHEL', 'Bruno', 2, 1, 'bruno.treichel@sdis29.fr', 'bTREI', '457fd3db643c616b20fe73dcd6a11c5d', NULL, NULL, NULL, '1', 0, 11, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2959, 2, 'ABGRALL', 'Jean-Michel', 1, 2, 'jean-michel.abgrall@sdis29.fr', 'jABGR', '812e55e86121f2d93644668304935f30', NULL, NULL, NULL, '2', 0, 2, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2960, 1, 'SINIC', 'Philippe', 2, 1, 'philippe.sinic@sdis29.fr', 'pSINI', 'c33937bb7e9e4cdd6de10d6992603132', NULL, NULL, NULL, '1', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2960, 2, 'SINIC', 'Frédéric', 1, 2, 'frédéric.sinic@sdis29.fr', 'fSINI', '953477a87b649ca2b35e901d118e2117', NULL, NULL, NULL, '2', 0, 11, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2961, 1, 'LENNON', 'Michel', 2, 1, 'michel.lennon@sdis29.fr', 'mLENN', '3e0587ad2cafe64467c1f4da42736a6d', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2961, 2, 'VIEZ', 'Laurent', 1, 2, 'laurent.viez@sdis29.fr', 'lVIEZ', '41cf83d292851dac38060082da1aff52', NULL, NULL, NULL, '2', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2962, 1, 'JEGOU', 'Patrick', 2, 1, 'patrick.jegou@sdis29.fr', 'pJEGO', 'cde628820b8ac2a3cb4f2023e61d794d', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2962, 2, 'MORIZUR', 'Stéphane', 1, 2, 'stéphane.morizur@sdis29.fr', 'sMORI', '067c64e4e49bf20c036c4ec7271fb5b4', NULL, NULL, NULL, '2', 0, 11, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2963, 1, 'PICHON', 'Yannick', 2, 1, 'yannick.pichon@sdis29.fr', 'yPICH', '1f609fb8525947e4f02e407a2039a791', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2963, 2, 'DANIEL', 'Yannick', 1, 2, 'yannick.daniel@sdis29.fr', 'yDANI', '18bb9e9a6fc35ccb7d15e052ff1e59ad', NULL, NULL, NULL, '2', 0, 1, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2964, 1, 'QUINIOU', 'Christian', 2, 1, 'christian.quiniou@sdis29.fr', 'cQUIN', 'c9227e9c80036eeb71ac1f29f49ce544', NULL, NULL, NULL, '1', 0, 7, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00'),
(2964, 2, 'RANNOU', 'Jean', 1, 2, 'jean.rannou@sdis29.fr', 'jRANN', '5d75934700fd944bca1c26c056343da7', NULL, NULL, NULL, '2', 0, 9, NULL, '2016-09-13 00:00:00', '2016-09-13 00:00:00');

-- ----------------------------------------------------------------------------------------------
insert into typeParametre(tpId,tpLibelle,tpBooleen,tpChoixMultiple) values
     ('dispo','type de disponibilité',0,0),
     ('grade','Grade de l\'agent',0,0),
     ('statAgt','Statut de l\'agent',0,1),
     ('tranche','Tranche horaire',0,0),
     ('typePer','Type de personnel',0,0);
-- ----------------------------------------------------------------------------------------------
-- contraintes d'intégrité référentielles
alter table pompier add foreign key (pCis) references caserne(cId);
alter table parametre add foreign key (pType) references typeParametre(tpId);
commit;

-- --##################

ALTER TABLE pompier ADD IF NOT EXISTS  pUrlPhoto varchar(100);

ALTER TABLE pompier ADD IF NOT EXISTS  EmpRaisonSoc varchar(30);

ALTER TABLE pompier ADD IF NOT EXISTS  EmpAdresse varchar(30);

ALTER TABLE pompier ADD IF NOT EXISTS  pIdCreation int;

ALTER TABLE  pompier ADD IF NOT EXISTS  pIdModif int;
	
-- --##################

-- ------------------------------------------------------------------------------------------------

CREATE TABLE horaires(

	idHoraires int AUTO_INCREMENT,
	libelle varchar(20),
	PRIMARY KEY(idHoraires)
);

CREATE TABLE disponibilite(
	idDisponibilite int, 
	libelle varchar(40),
	PRIMARY KEY(idDisponibilite)
);

CREATE TABLE feuilleGarde(

	dteJour date,
	idHoraires int,
	idCis smallint(6),
	idPompier smallint(6),
	idDispo int,
	valider boolean,
	PRIMARY KEY(dteJour,idHoraires,idPompier,idCis),
	FOREIGN KEY(idHoraires) REFERENCES horaires(idHoraires),
	FOREIGN KEY(idDispo) REFERENCES disponibilite(idDisponibilite),
	FOREIGN KEY(idCis,idPompier) REFERENCES pompier(pCis,pId)
);

INSERT INTO horaires(idHoraires,libelle) VALUES(1,"Nuit (0 à 6 heures)"),
										 (2,"Matinée (6h à 12h)"),
										 (3,"Après-Midi (12h à 18h)"),
										 (4,"Soirée (18h à 0h)");

INSERT INTO disponibilite(idDisponibilite,libelle) VALUES(0,"Indisponible"),
														 (1,"Au travail"),
														 (2,"Disponible"),
														 (3,"De Garde");

INSERT INTO feuilleGarde(dteJour,idHoraires,idCis,idPompier,idDispo,valider) VALUES
	("2017-12-11",1,2904,3,0,true),
	("2017-12-11",2,2904,3,0,true),
	("2017-12-11",3,2904,3,2,true),
	("2017-12-11",4,2904,3,1,true),
	("2017-12-12",1,2904,3,2,false),
	("2017-12-12",2,2904,3,1,false),
	("2017-12-12",3,2904,3,1,false),
	("2017-12-12",4,2904,3,0,false),
	("2017-12-13",1,2904,3,2,false),
	("2017-12-13",2,2904,3,1,false),
	("2017-12-13",3,2904,3,1,false),
	("2017-12-13",4,2904,3,0,false),
	("2017-12-14",1,2904,3,2,false),
	("2017-12-14",2,2904,3,1,false),
	("2017-12-14",3,2904,3,1,false),
	("2017-12-14",4,2904,3,0,false),
	("2017-12-15",1,2904,3,2,false),
	("2017-12-15",2,2904,3,1,false),
	("2017-12-15",3,2904,3,1,false),
	("2017-12-15",4,2904,3,0,false),
	("2017-12-16",1,2904,3,2,false),
	("2017-12-16",2,2904,3,1,false),
	("2017-12-16",3,2904,3,1,false),
	("2017-12-16",4,2904,3,0,false),
	("2017-12-17",1,2904,3,2,false),
	("2017-12-17",2,2904,3,1,false),
	("2017-12-17",3,2904,3,1,false),
	("2017-12-17",4,2904,3,0,false),

	("2017-12-12",1,2904,4,1,false),
	("2017-12-12",2,2904,4,2,false),
	("2017-12-12",3,2904,4,2,false),
	("2017-12-12",4,2904,4,2,false),
	("2017-12-13",1,2904,4,0,false),
	("2017-12-13",2,2904,4,0,false),
	("2017-12-13",3,2904,4,0,false),
	("2017-12-13",4,2904,4,0,false),
	("2017-12-14",1,2904,4,1,false),
	("2017-12-14",2,2904,4,2,false),
	("2017-12-14",3,2904,4,2,false),
	("2017-12-14",4,2904,4,1,false),
	("2017-12-15",1,2904,4,1,false),
	("2017-12-15",2,2904,4,1,false),
	("2017-12-15",3,2904,4,2,false),
	("2017-12-15",4,2904,4,1,false),
	("2017-12-16",1,2904,4,0,false),
	("2017-12-16",2,2904,4,0,false),
	("2017-12-16",3,2904,4,2,false),
	("2017-12-16",4,2904,4,0,false),
	("2017-12-17",1,2904,4,2,false),
	("2017-12-17",2,2904,4,1,false),
	("2017-12-17",3,2904,4,1,false),
	("2017-12-17",4,2904,4,0,false);

CREATE TABLE lieu(

	id int AUTO_INCREMENT,
	adresse VARCHAR(30),
	cp VARCHAR(5),
	ville VARCHAR(25),
	libelle VARCHAR(30),
	PRIMARY KEY(id)
);

CREATE TABLE typeAccident(
	id int AUTO_INCREMENT,
	type VARCHAR(30),
	PRIMARY KEY(id)
);

CREATE TABLE equipeVolontaire(
	idEquipe int AUTO_INCREMENT,
	idCis smallint(6),
	idPompier smallint(6),
	PRIMARY KEY(idEquipe),
	FOREIGN KEY(idCis,idPompier) REFERENCES pompier(pCis,pId)
);

CREATE TABLE intervention(
	idLieu int,
	idTypeA int,
	idEquipe int,
	description VARCHAR(200),
	PRIMARY KEY(idLieu,idTypeA,idEquipe),
	FOREIGN KEY(idLieu) REFERENCES lieu(id),
	FOREIGN KEY(idTypeA) REFERENCES typeAccident(id),
	FOREIGN KEY(idEquipe) REFERENCES equipeVolontaire(idEquipe)
);


-- user
CREATE USER 'adminBDsdis'@'localhost' IDENTIFIED BY 'mdpBDsdis';
GRANT ALL PRIVILEGES ON sdis29.* to "adminBDsdis"@"localhost";

CREATE USER 'adminBDsdis'@'%' IDENTIFIED BY 'mdpBDsdis';
GRANT ALL PRIVILEGES ON sdis29.* to "adminBDsdis"@"%";