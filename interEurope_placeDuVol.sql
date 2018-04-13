DELIMITER $$

DROP TRIGGER IF EXISTS interEurope.placeDuVol $$

CREATE TRIGGER interEurope.placeDuVol 
BEFORE INSERT ON Reservation 
FOR EACH ROW 
BEGIN
-- Declaration des variables
	DECLARE Vmsg varchar(75);
	DECLARE VnbPlace smallint;
	DECLARE VidVol varchar(10);
-- Récupération du nombre de place et de l'id du vol de la réservation
	SELECT volNbPlaces, volId INTO VnbPlace, VidVol FROM Vol where volId = NEW.resaVol;
-- Si il reste des places
	IF(VnbPlace > 0) THEN
-- Alors on retire une place du nombre de place disponible du vol
		UPDATE Vol SET volNbPlaces = volNbPlaces-1 WHERE volId = VidVol;
	ELSE
-- Sinon on annule l'insertion de donnée et retourne une erreur
		SET Vmsg = CONCAT(NEW.resaId," : le vol ",VidVol," n'à plus de place disponible.");
		signal sqlstate "46000" set message_text = Vmsg , MYSQL_ERRNO = 1;
	END IF;
END$$

DELIMITER ;