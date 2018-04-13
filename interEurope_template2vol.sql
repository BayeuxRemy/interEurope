DELIMITER $$

drop procedure if exists template2vol$$

create procedure template2vol(IN PvolId int(5), IN PdateDepart datetime, IN PdateArrivée dateTime)
begin
	-- déclaration des variables
	DECLARE VaeroDepart char(3);
	DECLARE VaeroArrivée char(3);
	DECLARE Vavion int(11);
	DECLARE Vplaces smallint(6);
	DECLARE VidNewVol varchar(10);
	DECLARE VidVol varchar(10);
	DECLARE VnumVol varchar(5);
	DECLARE cpt smallint;
	DECLARE Vnum int(2);
	DECLARE Vnum1 char(1);
	DECLARE Vnum2 char(1);
	DECLARE Vnum3 char(1);
	DECLARE Vnum4 char(1);
	DECLARE Vnum5 char(1);
	
	-- les données sur le modèle recherché
	SELECT volAeroDepart, volAeroDestination, volAvion
	INTO VaeroDepart, VaeroArrivée, Vavion
	FROM Template_Vol
	WHERE volId=PvolId;

	SELECT nbPlaces 
	INTO Vplaces
	FROM Avion
	WHERE avionId = Vavion;

	-- création d'un nouvel ID --
	SET VidNewVol = CONCAT(VaeroDepart,right(year(current_date()),2)); 

	SELECT volId
	INTO VidVol
	FROM Vol
	WHERE volId LIKE CONCAT(VidNewVol,"%")
	ORDER BY volId DESC LIMIT 1;

	SET VnumVol = right(VidVol,5);

	SET cpt=0;

	WHILE cpt<5 DO

		-- récupération du caractère à traiter
		SET Vnum=ASCII(SUBSTRING(VnumVol,5-cpt,1));

		-- si le caractère est un '9'
		IF Vnum=57 THEN -- caractère 9
			SET Vnum=65; -- on passe au A
		ELSEIF Vnum=90 THEN -- caractere Z
			SET Vnum=48; -- on passe au 0
		ELSE
			-- incrémentation de ce caractère
			SET Vnum=Vnum+1;
		END IF;
		SET cpt=cpt+1;
	END WHILE;


	SET VidNewVol = CONCAT(VaeroDepart,right(year(current_date()),2), CONCAT(Vnum1,Vnum2,Vnum3,Vnum4,Vnum5));


	-- création du nouvel templateVol
	INSERT INTO Vol VALUES (VidNewVol, VaeroDepart, VaeroArrivée, PdateDepart, PdateArrivée, Vplaces, Vavion);

end$$


DELIMITER ;

