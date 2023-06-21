CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_filtered_products`(IN filter VARCHAR(255), IN orderFilter INTEGER)
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
END