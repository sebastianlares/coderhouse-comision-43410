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

CREATE TRIGGER tr_deleted_product
BEFORE DELETE ON product
FOR EACH ROW 
INSERT INTO deleted_products_log (id, deleted_product, deleted_by, deleted_at) VALUES (OLD.id, OLD.name, USER(), CURRENT_DATE());

DELETE FROM product WHERE id = 4;

select * from deleted_products_log;