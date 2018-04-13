DELETE FROM Pays;
DELETE FROM Company;
DELETE FROM Avion;
DELETE FROM Aeroport;
DELETE FROM Vol;
DELETE FROM Client;
DELETE FROM Reservation;


INSERT INTO Pays VALUES (1,'France'),(2,'Angleterre'),(3,'Portugal'),(4,'Espagne');

INSERT INTO Company VALUES (1,'Air France',1),(2,'RyanAir',2);

INSERT INTO Avion VALUES (1,'A320-200',1,200),(2,'A320-200',2,200),(3,'A320-250',2,250);

INSERT INTO Aeroport VALUES ('BCL','Barcelone',4),('CDG','Paris Charles de Gaule',1),('MRS','Marseille Marignane',1),('OPO','Porto',3),('STX','Lyon Saint Exupéry',1),('LDN','Gare de Londre',2);


INSERT INTO Vol VALUES 	('MRS1600001','MRS','OPO','2017-03-01 17:50:00','2018-03-01 19:10:00',200,1),
						('MRS1600011','OPO','MRS','2017-03-01 23:00:00','2018-04-01 00:20:00',200,1),
						('MRS16AAAAA','MRS','OPO','2018-03-21 10:00:00','2018-03-21 11:20:00',200,1),
						('MRS16BBBBB','MRS','OPO','2018-03-10 23:00:00','2018-03-11 00:20:00',200,1);


INSERT INTO Client VALUES (1,'TOTO','Robert','102 missile fixe','05000','Gap',1),
						  (2,'MACRON','Emmanuel','1 rue Elysée','750000','Paris',1),
						  (3,'CRUZ','Penelope','Plaça Sant Jaume','08002','Barcelone',4),
						  (4,'BAYEUX','Rémy','Résidence honoré Romane','05200','Embrun',1);

INSERT INTO Reservation VALUES (1,'2018-01-03','MRS1600001','A12','BOYER',1),
							   (2,'2018-01-03','MRS1600001','A13','TOTO',1),	
							   (3,'2018-02-10','MRS16AAAAA','C03','ANASSALON',2),
							   (4,'2018-02-10','MRS16AAAAA','C04','MACRON',2),
							   (5,'2018-03-01','MRS16AAAAA','B12','CRUZ',3),
							   (6,'2018-02-18','MRS16BBBBB','A50','GARIN',4),
							   (7,'2018-02-18','MRS16BBBBB','A51','BAYEUX',4);




