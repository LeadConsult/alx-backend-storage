-- This MySQL script creates a trigger named "decrement"
-- that is executed automatically after an INSERT operation
-- is performed on the "orders" table.

CREATE TRIGGER decrement
AFTER INSERT
ON orders
FOR EACH ROW
UPDATE items SET quantity = quantity - NEW.number WHERE NAME = NEW.item_name;
