/*
Nom script : creationTable
Nom base : interEurope
Auteur : Rémy Bayeux
Date de création : 22/02/2018
*/

/* Suppression des tables existantes */

DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Vol;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Avion;
DROP TABLE IF EXISTS Company;
DROP TABLE IF EXISTS Aeroport;
DROP TABLE IF EXISTS Pays;

/* Creéation des tables */

CREATE TABLE Pays(
	paysId tinyint(4) AUTO_INCREMENT PRIMARY KEY,
	paysNom varchar(30)
) ENGINE=INNODB DEFAULT CHARSET=utf8; 

CREATE TABLE Client(
	clientId int(11) AUTO_INCREMENT PRIMARY KEY,
	clientNom varchar(30),
	clientPrenom varchar(30),
	clientRue varchar(100),
	clientCP varchar(6),
	clientVille varchar(30),
	clientPays tinyint(4)
) ENGINE=INNODB DEFAULT CHARSET=utf8; 

CREATE TABLE Company(
	compId smallint(6) AUTO_INCREMENT PRIMARY KEY,
	compNom varchar(30),
	compPays tinyint(4)
) ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE Avion(
	avionId int(11) AUTO_INCREMENT PRIMARY KEY,
	avionModele varchar(20),
	avionCompany smallint(6),
	nbPlaces smallint(6)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE Aeroport(
	aeroId char(3) PRIMARY KEY,
	aeroNom varchar(30),
	aeroPays tinyint(4)
) ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE Vol(
	volId varchar(10) PRIMARY KEY,
	volAeroDepart char(3),
	volAeroDestination char(3),
	volDateHeureDepart datetime,
	volDateHeureArrivee datetime,
	volNbPlaces smallint(6),
	volAvion int(11)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

CREATE TABLE Reservation(
	resaId int(11) AUTO_INCREMENT PRIMARY KEY,
	resaDate date,
	resaVol varchar(10),
	resaPlace varchar(5),
	resNomPassager varchar(60),
	resClient int(11)
) ENGINE=INNODB DEFAULT CHARSET=utf8; 

CREATE TABLE Hisorisation(
	histoId int(11) AUTO_INCREMENT PRIMARY KEY,
	histoVol varchar(10),
	retard time NULL,
	dateHeureArriveeReel datetime,
	nbPassager int(11);
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/* Ajout des clées étrangères */

ALTER TABLE Client
	ADD FOREIGN KEY (clientPays) REFERENCES Pays (paysId);

ALTER TABLE Company
	ADD FOREIGN KEY (compPays) REFERENCES Pays (paysId);

ALTER TABLE Avion
	ADD FOREIGN KEY (avionCompany) REFERENCES Company (compId);

ALTER TABLE Aeroport
	ADD FOREIGN KEY (aeroPays) REFERENCES Pays (paysId);

ALTER TABLE Vol
	ADD FOREIGN KEY (volAvion) REFERENCES Avion (avionId),
	ADD FOREIGN KEY (volAeroDepart) REFERENCES Aeroport (aeroId),
	ADD FOREIGN KEY (volAeroDestination) REFERENCES Aeroport (aeroId);

ALTER TABLE Reservation
	ADD FOREIGN KEY (resClient) REFERENCES Client (clientId),
	ADD FOREIGN KEY (resaVol) REFERENCES Vol (volId);

ALTER TABLE Hisorisation
	ADD FOREIGN KEY (histoVol) REFERENCES Vol (volId);

