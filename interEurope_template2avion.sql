
DELIMITER $$

drop procedure if exists template2avion$$

create procedure template2avion( IN PmodeleId smallint, IN Pcompany smallint)
begin
	-- déclaration des variables
	DECLARE VavionModele varchar(20);
	DECLARE VnbPlaces smallint;
	
	-- les données sur le modèle recherché
	SELECT avionModele, nbPlaces
	INTO VavionModele, VnbPlaces
	FROM Template_Avion
	WHERE avionModeleId=PmodeleId;

	-- création du nouvel avion
	INSERT INTO Avion VALUES (NULL, VavionModele, Pcompany, VnbPlaces);

end$$


DELIMITER ;

