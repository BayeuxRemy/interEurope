
DELIMITER $$

drop procedure if exists vol2template$$

create procedure vol2template( IN PvolId varchar(10))
begin
	-- déclaration des variables
	DECLARE Vdepart char(3);
	DECLARE Varrivée char(3);
	DECLARE Vavion int(11);
	
	-- les données sur le modèle recherché
	SELECT volAeroDepart, volAeroDestination, volAvion
	INTO Vdepart, Varrivée, Vavion
	FROM Vol
	WHERE volId=PvolId;

	-- création du nouvel templateVol
	INSERT INTO Template_Vol VALUES (NULL, Vdepart, Varrivée, Vavion);

end$$


DELIMITER ;

