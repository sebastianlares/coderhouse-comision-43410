USE ecommerce;

DROP FUNCTION IF EXISTS get_product_price_with_iva;

DELIMITER //
-- Esta funcion retorna un product especifico, que matchee el filtro de categoria con el id del producto y el nombre del producto

CREATE FUNCTION get_product_price_with_iva (category_filter INT, product_name VARCHAR(255))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE product_iva DECIMAL(10,2) ;
    DECLARE iva DECIMAL(10,2); SET iva = 1.21;
    SET product_iva = 
    (
		SELECT product.price from product
		WHERE product.id_category COLLATE utf8mb4_general_ci = category_filter 
       LIMIT 1
    );
    RETURN product_iva * iva;
END //
DELIMITER ;

DROP FUNCTION IF EXISTS apply_discount_to_product;

DELIMITER $$
-- Esta funcion devuelve el precio de un producto, buscando cierto producto por su id, y aplicandole cierto descuento, que es buscado por su id

CREATE FUNCTION apply_discount_to_product(id_product INT, id_discount INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE product_with_discount DECIMAL(10,2);
    DECLARE discount INT;
    DECLARE selected_product_price DECIMAL(10,2);
    SET selected_product_price = 
    (
		SELECT product.price from product
		WHERE product.id = id_product 
    );
    SET discount = 
    (
		SELECT discount.discount_percentage from discount
        WHERE discount.id = id_discount
        
	);
    SET product_with_discount = selected_product_price * (discount / 10);
    RETURN product_with_discount;
    
    
END $$

DELIMITER ;

select get_product_price_with_iva(1,"Alec");

select apply_discount_to_product(2,2);
    
