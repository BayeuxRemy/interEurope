/*
Nom script : creationTemplate
Nom base : interEurope
Auteur : Rémy Bayeux
Date de création : 22/02/2018
*/

/* Suppression des tables existantes */

DROP TABLE IF EXISTS Template_Avion;


/* Creéation des tables */

CREATE TABLE Template_Avion(
	avionModeleId smallint(6),
	avionModele varchar(20),
	nbPlaces smallint(6)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

ALTER TABLE Template_Avion
	ADD PRIMARY KEY (avionModeleId);

INSERT INTO Template_Avion VALUES (1,'A320-200',200),
								  (2,'A320-250',250),
								  (3,'A380-800',300),								  
								  (4,'Boeing 727',250),
								  (5,'Boeing 737',300),
								  (6,'Boeing 747',350),
								  (7,'Falcon 2000',280),							  
								  (8,'Falcon 2000 LX',320);
