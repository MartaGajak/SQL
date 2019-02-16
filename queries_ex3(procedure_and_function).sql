USE bookstore;
SELECT * FROM books;

-- Przygotuj procedurę SET_DISCOUNT wprowadzającą obniżkę ceny o y procent dla książki o isbn x.
-- SET_DISCOUNT(x, y)

DELIMITER //
CREATE PROCEDURE SET_DISCOUNT (IN isbn_for_discount char(17), IN discount DECIMAL(10,2))
BEGIN
UPDATE books 
SET price = price - (price*discount)/100
WHERE isbn = isbn_for_discount; 
END //
DELIMITER ;

CALL SET_DISCOUNT ('978-83-283-0849-7', 10);


-- Przygotuj funkcję WITH_DISCOUNT zwracającą cenę x książki po obniżce o y procent.
-- WITH_DISCOUNT(x, y)

DELIMITER //
CREATE FUNCTION WITH_DISCOUNT (price DECIMAL, discount DECIMAL (2,2))
RETURNS DECIMAL 
deterministic
BEGIN
RETURN (price - price*discount);
END //
DELIMITER ;

SELECT price, WITH_DISCOUNT (price, 0.50) as discounted FROM books WHERE category = 'przygodowa';

-- Utwórz tabelę to_order z jedną kolumną title. 
-- Przygotuj trigger wpisujący do tej tabeli tytuły, których dostępność po aktualizacji wpisów w tabeli books spadnie do 0.

CREATE TABLE to_order (
title VARCHAR (148)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci ;

DELIMITER //
CREATE TRIGGER add_to_order AFTER UPDATE ON books FOR EACH ROW
BEGIN
 INSERT IGNORE INTO to_order SELECT title FROM books WHERE in_stock = 0;
END//
DELIMITER ;

-- inny sposób
DELIMITER //
create trigger tr1 after update on books for each row
begin
if (new.in_stock = 0) then insert into to_order values (old.title);
end if;
end//
DELIMITER ;

drop trigger add_to_order;

UPDATE books SET in_stock=5 WHERE in_stock=0;
UPDATE books SET IN_STOCK=0 WHERE IN_STOCK=5;

select * from to_order;
