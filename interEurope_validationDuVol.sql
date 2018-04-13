DELIMITER $$

DROP TRIGGER IF EXISTS interEurope.validationDuVol $$

CREATE TRIGGER interEurope.validationDuVol 
BEFORE INSERT ON Vol 
FOR EACH ROW 
BEGIN
	DECLARE Vmsg varchar(75);
	DECLARE VavionEnVol smallint;
	
	-- vérification des aéroport saisie par l'utilisateur
	IF ( NEW.volAeroDepart = NEW.volAeroDestination ) THEN
		-- declatation du message d'erreur 
		SET Vmsg =  CONCAT(NEW.volId," - Erreur d'itinéraire du vol.");
		-- génération d'une erreur mysql
		signal sqlstate "45000" set message_text = Vmsg , MYSQL_ERRNO = 1;
	END IF;

	-- sinon vérification des heures de départ et d'arrivée saisie par l'utilisateur
	IF (NEW.volDateHeureDepart >= NEW.volDateHeureArrivee) THEN
		-- declatation du message d'erreur 
		SET Vmsg = CONCAT(NEW.volId," - Erreur des horaires du vol.");
		-- génétration d'une erreur mysql
		signal sqlstate "45000" set message_text = Vmsg , MYSQL_ERRNO =2;
	END IF;
	
	SELECT count(volId) INTO VavionEnVol FROM Vol WHERE NEW.volAvion = volAvion AND volDateHeureArrivee>NEW.volDateHeureDepart;

	IF (VavionEnVol!=0) THEN
		-- declatation du message d'erreur 
		SET Vmsg = CONCAT(NEW.volId," - Erreur de disponibilité de l'avion".);
		-- génétration d'une erreur mysql
		signal sqlstate "45000" set message_text = Vmsg , MYSQL_ERRNO =3;
	END IF;





END$$

DELIMITER ;