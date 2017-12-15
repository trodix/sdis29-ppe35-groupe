USE sdis29;

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
	idEquipe int,
	description VARCHAR(200),
	PRIMARY KEY(idLieu,idEquipe),
	FOREIGN KEY(idLieu) REFERENCES lieu(id),
	FOREIGN KEY(idEquipe) REFERENCES equipeVolontaire(idEquipe)
);
