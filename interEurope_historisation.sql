DELIMITER $$

DROP TRIGGER IF EXISTS interEurope.historisation $$

CREATE TRIGGER interEurope.historisation 
BEFORE INSERT ON Reservation 
FOR EACH ROW 
BEGIN