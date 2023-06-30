USE ecommerce;
DROP procedure IF EXISTS sp_get_filtered_products;
-- Este procedure se encarga de filtrar los productos por el valor ingresado, y de manera ascendente o descendente
DELIMITER $$
CREATE PROCEDURE sp_get_filtered_products(IN filter DECIMAL(10,2), IN orderFilter INTEGER)
BEGIN
	IF orderFilter >= 1 THEN -- se inicializa la condicion para verificar si se agrupa de manera ascendente o descendente
		SELECT * FROM product 
		WHERE price > filter -- se aplica el filtro de precio 
		ORDER BY product.id ASC;
	ELSE 
		SELECT * FROM product 
		WHERE price > filter -- se aplica el filtro de precio 
		ORDER BY product.id DESC;
	END IF;
END $$

DELIMITER ;

DROP procedure IF EXISTS sp_insert_into_description_table;
-- Este procedure se encarga de de insertar nuevos registros en la tabla de category, y luego muestra todos los registros de dicha tabla
DELIMITER $$
CREATE PROCEDURE sp_insert_into_description_table (IN nameValue VARCHAR(255), IN descriptionValue VARCHAR(255))
BEGIN
INSERT INTO category (`name`,`description`) VALUES (nameValue, descriptionValue);
 
set @get_categorys = CONCAT('SELECT * FROM category ORDER BY category.id DESC');

prepare param_stmt from @get_categorys;
execute param_stmt;
deallocate prepare param_stmt;
END$$

DELIMITER ;

-- Se llaman a los stored_procedures
call sp_get_filtered_products(20,1);

call sp_insert_into_description_table('testName', 'TestDescription');
