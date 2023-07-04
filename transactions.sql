USE ecommerce;

SET autocommit = 0;

START TRANSACTION; -- Se inicializa la transaccion de la tabla payment

DELETE FROM payment 
WHERE amount > 800;

SELECT * FROM payment
ORDER BY id ASC;

-- ROLLBACK; Rollabck para deshacer la transaccion
-- COMMIT; Commit para guardar la transaccion

START TRANSACTION; -- Se inicializa la transaccion de la tabla category

INSERT INTO `category` (`name`,`description`) VALUES ("Electrodomestico","Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec");
INSERT INTO `category` (`name`,`description`) VALUES ("Limpieza","eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula.");
INSERT INTO `category` (`name`,`description`) VALUES ("Ropa","pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero.");
INSERT INTO `category` (`name`,`description`) VALUES ("Limpieza","tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante");
SAVEPOINT first_guard;

INSERT INTO `category` (`name`,`description`) VALUES ("Electrodomestico","Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec");
INSERT INTO `category` (`name`,`description`) VALUES ("Limpieza","eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula.");
INSERT INTO `category` (`name`,`description`) VALUES ("Ropa","pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero.");
INSERT INTO `category` (`name`,`description`) VALUES ("Limpieza","tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante");

SAVEPOINT second_guard;
  
-- RELEASE SAVEPOINT first_guard; se hace el rollback /release del primer savepoint

-- COMMIT;
 