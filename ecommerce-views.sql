USE ecommerce;

DROP VIEW IF EXISTS user_info;

CREATE VIEW user_info 
AS (
SELECT u.username, u.email, u.password, u.id_person, 
p.first_name, p.last_name, p.telephone,
pa.country, pa.city, pa.postal_code
FROM user u
INNER JOIN person p ON p.id = u.id_person
INNER JOIN person_address pa on pa.id = u.id_person
);

DROP VIEW IF EXISTS product_info;

CREATE VIEW product_info
AS (
SELECT p.name, p.price, p.description,
 d.description as discount_description, d.discount_percentage as product_discount,
 c.description as product_category_description
FROM product p
INNER JOIN discount d ON d.id = p.id_discount
INNER JOIN category c ON c.id = p.id_category
WHERE p.price > 300
);

DROP VIEW IF EXISTS user_order_info;

CREATE VIEW user_order_info 
AS (
SELECT DISTINCT uo.total, uo.status, 
pa.country, pa.city, pa.postal_code, 
p.first_name, p.last_name, p.telephone
FROM user_order uo
INNER JOIN person_address pa ON pa.id = uo.id
INNER JOIN person p ON p.id_address = pa.id
WHERE uo.status = 1
);

DROP VIEW IF EXISTS products_quantity;

CREATE VIEW products_quantity
AS (
SELECT DISTINCT * 
FROM product p
WHERE p.quantity >= 200
);

DROP VIEW IF EXISTS shopping_session_info;

CREATE VIEW shopping_session_info
AS (
SELECT DISTINCT sp.total, 
u.username, 
p.first_name, p.last_name, p.telephone, 
pa.country, pa.city, pa.postal_code
FROM shopping_session sp 
INNER JOIN user u ON u.id = sp.id
INNER JOIN person p ON p.id = u.id
INNER JOIN person_address pa ON pa.id = u.id
WHERE sp.total < 300
);
