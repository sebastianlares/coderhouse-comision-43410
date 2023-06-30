USE ecommerce;

-- Crear la tabla
DROP TABLE IF EXISTS deleted_products_log;

CREATE TABLE deleted_products_log (
id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
deleted_product VARCHAR (150) NOT NULL,
deleted_by VARCHAR (150) NOT NULL,
deleted_at TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear el trigger
DROP TRIGGER IF EXISTS tr_deleted_product;

-- este trigger guarda informacion sobre la eliminacion de un producto de la base de datos, 
-- guardando en la tabla de logs deleted_products_log, el id del producto borrado, el nombre del producto, 
-- el usuario de la bd que borro dicho producto,
-- y la fecha en la que se elimino el producto

DELIMITER //
CREATE TRIGGER tr_deleted_product

BEFORE DELETE ON product
FOR EACH ROW 
BEGIN
	INSERT INTO deleted_products_log (id, deleted_product, deleted_by, deleted_at) VALUES (OLD.id, OLD.name, USER(), CURRENT_DATE());

	DELETE FROM product WHERE id = 4;
END // 
DELIMITER ;

select * from deleted_products_log;

-- Crear la tabla
DROP TABLE IF EXISTS new_users_log;

CREATE TABLE new_users_log (
id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
created_by VARCHAR (150) NOT NULL,
created_at TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Crear el trigger
DROP TRIGGER IF EXISTS tr_new_user;
-- este trigger guarda informacion sobre la creacion de un nuevo usuario en la base de datos, 
-- guardando en la tabla de logs user_log, el id del user creado, el usuario de la bd que creo dicho user, y la fecha de la creacion del user
DELIMITER //
CREATE TRIGGER tr_new_user
AFTER INSERT ON user
FOR EACH ROW 
BEGIN
	INSERT INTO new_users_log (id, created_by, created_at) VALUES (NEW.id, USER(), CURRENT_DATE());
END // 
DELIMITER ;

-- INSERT USER DATA
INSERT INTO `user` (`email`,`username`,`password`,`id_person`)
VALUES
  ("nisl.elementum.purus@yahoo.net","Kristen Sherman","EFB24NQT2BJ",1),
  ("cursus.vestibulum@outlook.ca","Holly Wallace","AKS33TFB6KI",2),
  ("vestibulum.ante.ipsum@aol.edu","Brendan Rodgers","GTQ82BBR5OA",3);
  
select * from new_users_log;
