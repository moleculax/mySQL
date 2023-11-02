DELIMITER //
CREATE OR REPLACE FUNCTION example() RETURNS varchar(1000) DETERMINISTIC
BEGIN
  DECLARE _result varchar(1000) DEFAULT '';
  DECLARE _counter INT DEFAULT 0;
  DECLARE _value varchar(50);

  SET @myjson = '["gmail.com","mail.ru","arcor.de","gmx.de","t-online.de",
                "web.de","googlemail.com","freenet.de","yahoo.de","gmx.net",
                "me.com","bluewin.ch","hotmail.com","hotmail.de","live.de",
                "icloud.com","hotmail.co.uk","yahoo.co.jp","yandex.ru"]';

  WHILE _counter < JSON_LENGTH(@myjson) DO
    
    SET _result = CONCAT(_result, _counter, '-', JSON_VALUE(@myjson, CONCAT('$[',_counter,']')), '#');

    SET _counter = _counter + 1;
  END WHILE;

  RETURN _result;
END //
DELIMITER ;

SELECT example();


--  ===========   OTRO EJEMPLO ===============

SET @myjson = '["gmail.com","mail.ru","arcor.de","gmx.de","t-online.de",
                "web.de","googlemail.com","freenet.de","yahoo.de","gmx.net",
                "me.com","bluewin.ch","hotmail.com","hotmail.de","live.de",
                "icloud.com","hotmail.co.uk","yahoo.co.jp","yandex.ru"]';

SELECT JSON_LENGTH(@myjson);
-- ======================

SELECT JSON_VALUE(@myjson, '$[0]');

SET @JSONRES ='{"NOMBRE": "PEPE","APELLIDO": "CORTIZONA", "EDAD": 60 }';
SELECT  @JSONRES;
SELECT JSON_VALUE(@JSONRES, '$.NOMBRE') AS NOMBRE
		, JSON_VALUE(@JSONRES, '$.APELLIDO') AS APELLIDO
		, JSON_VALUE(@JSONRES, '$.EDAD') AS EDAD;