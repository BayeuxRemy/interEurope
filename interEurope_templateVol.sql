/*
Nom script : creationTemplate
Nom base : interEurope
Auteur : Rémy Bayeux
Date de création : 19/03/2018
*/

/* Suppression des tables existantes */

DROP TABLE IF EXISTS Template_Vol;


/* Creéation des tables */

CREATE TABLE Template_Vol(
	volId int(5) AUTO_INCREMENT PRIMARY KEY,
	volAeroDepart char(3),
	volAeroDestination char(3),
	volAvion int(11)
) ENGINE=INNODB DEFAULT CHARSET=utf8; 

ALTER TABLE Template_Vol
	ADD FOREIGN KEY (volAvion) REFERENCES Avion (avionId);

-- INSERT INTO Template_Vol VALUES ;