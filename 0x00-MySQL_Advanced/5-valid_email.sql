--This is a MySQL script that creates a trigger named "reset".
-- The trigger is executed before an update is made on the "users" table.

DELIMITER $$
CREATE TRIGGER reset 
BEFORE UPDATE
ON users
FOR EACH ROW
BEGIN
    IF NEW.email != OLD.email THEN
        SET NEW.valid_email = 0;
    END IF;
END $$

DELIMITER;
