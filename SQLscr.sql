CREATE DATABASE my_database;

USE my_database;

DELIMITER //
CREATE FUNCTION FormatTime(seconds INT) 
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE secs INT;
    DECLARE result VARCHAR(100);
    
    SET days = FLOOR(seconds / 86400);
    SET seconds = seconds % 86400;
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutes = FLOOR(seconds / 60);
    SET secs = seconds % 60;
    
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', secs, ' seconds');
    RETURN result;
END; //
DELIMITER ;

SELECT FormatTime(123456) AS formatted_time;

DELIMITER //
CREATE PROCEDURE EvenNumbers()
BEGIN
    DECLARE i INT DEFAULT 2;
    WHILE i <= 10 DO
        SELECT i;
        SET i = i + 2;
    END WHILE;
END; //
DELIMITER ;

CALL EvenNumbers();