USE sdis29;

CREATE TABLE horaires(

	idHoraires int AUTO_INCREMENT,
	libelle varchar(20),
	PRIMARY KEY(idHoraires)
);

CREATE TABLE disponibilite(
	idDisponibilite int AUTO_INCREMENT, 
	libelle varchar(20),
	PRIMARY KEY(idDisponibilite)
);

CREATE TABLE feuilleGarde(

	dteJour date,
	idHoraires int,
	idCis smallint(6),
	idPompier smallint(6),
	idDispo int,
	deGarde boolean,
	PRIMARY KEY(dteJour,idHoraires,idPompier,idCis),
	FOREIGN KEY(idHoraires) REFERENCES horaires(idHoraires),
	FOREIGN KEY(idDispo) REFERENCES disponibilite(idDisponibilite),
	FOREIGN KEY(idCis,idPompier) REFERENCES pompier(pCis,pId)
);

INSERT INTO horaires(idHoraires,libelle) VALUES(1,"Nuit (0 à 6 heures)"),
										 (2,"Matinée (6 à 12 heures)"),
										 (3,"Après-Midi (12 à 18 heures)"),
										 (4,"Soirée (18 à 0 heures)");

INSERT INTO disponibilite(idDisponibilite,libelle) VALUES(0,"Indisponible"),
														 (1,"Au travail"),
														 (2,"Disponible"),
														 (3,"De Garde");

INSERT INTO feuilleGarde(dteJour,idHoraires,idCis,idPompier,idDispo, deGarde) VALUES
	("2017-12-11",1,2904,3,0,false),
	("2017-12-11",2,2904,3,0,false),
	("2017-12-11",3,2904,3,2,false),
	("2017-12-11",4,2904,3,1,false),
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

