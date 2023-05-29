-- Verificar si la base de datos existe
DROP DATABASE IF EXISTS ecommerce;

-- Crear la base de datos
CREATE DATABASE ecommerce CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Utilizar la base de datos
USE ecommerce;

-- Crear la tabla
DROP TABLE IF EXISTS user;

CREATE TABLE user (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(30) NOT NULL,
    username VARCHAR (150) NOT NULL,
    password VARCHAR (20) NOT NULL,
    id_person bigint(20) unsigned NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at datetime ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; -- FK id_person

-- Crear la tabla
DROP TABLE IF EXISTS person;

CREATE TABLE person (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    telephone INT unsigned NOT NULL,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    id_address bigint(20) unsigned NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at datetime ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; -- FK id_address

-- Crear la tabla
DROP TABLE IF EXISTS person_address;

CREATE TABLE person_address (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at datetime ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Crear la tabla
DROP TABLE IF EXISTS shopping_session;

CREATE TABLE shopping_session (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    total DECIMAL unsigned NOT NULL,
    id_user bigint(20) unsigned NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at datetime ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; -- FK id_user

-- Crear la tabla
DROP TABLE IF EXISTS user_order;

CREATE TABLE user_order (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    total DECIMAL unsigned NOT NULL,
    status VARCHAR(10) NOT NULL,
    id_person_address bigint(20) unsigned NOT NULL,
    id_shopping_session bigint(20) unsigned NOT NULL,
    id_payment bigint(20) unsigned NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at datetime ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; -- FK id_person_address, id_shopping_session, id_payment

-- Crear la tabla
DROP TABLE IF EXISTS payment;

CREATE TABLE payment (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL unsigned NOT NULL,
    status  VARCHAR(10) NOT NULL,
    provider VARCHAR(50) NOT NULL,
    id_user_order bigint(20) unsigned NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at datetime ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; -- FK id_user_order

-- Crear la tabla
DROP TABLE IF EXISTS product;

CREATE TABLE product (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description VARCHAR(200) NOT NULL,
    price DECIMAL(10) unsigned NOT NULL,
    SKU VARCHAR (50) NOT NULL,
    img_url VARCHAR (200),
    quantity INT unsigned NOT NULL,
    id_discount bigint(20) unsigned NOT NULL,
    id_category bigint(20) unsigned NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at datetime ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; -- FK id_discount, id_category

-- Crear la tabla
DROP TABLE IF EXISTS category;

CREATE TABLE category (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description VARCHAR(200) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at datetime ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; 

-- Crear la tabla
DROP TABLE IF EXISTS discount;

CREATE TABLE discount (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description VARCHAR(200) NOT NULL,
    discount_percentage DECIMAL unsigned NOT NULL,
    active BOOLEAN NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at datetime ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; 

-- Crear la tabla
DROP TABLE IF EXISTS cart_item;

CREATE TABLE cart_item (
    id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
	quantity INT(5) unsigned NOT NULL,
    id_product bigint(20) unsigned NOT NULL,
    id_shopping_session bigint(20) unsigned NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at datetime ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; -- FK id_product, id_shopping_session

-- ADD TABLES FOREIGN KEYS 
-- user 
ALTER TABLE user ADD FOREIGN KEY (id_person) REFERENCES person(id);
-- person 
ALTER TABLE person ADD FOREIGN KEY (id_address) REFERENCES person_address(id);
-- shopping_session
ALTER TABLE shopping_session ADD FOREIGN KEY (id_user) REFERENCES user(id);
-- user_order
ALTER TABLE user_order ADD FOREIGN KEY (id_person_address) REFERENCES person_address(id);
ALTER TABLE user_order ADD FOREIGN KEY (id_shopping_session) REFERENCES shopping_session(id);
ALTER TABLE user_order ADD FOREIGN KEY (id_payment) REFERENCES payment(id);
-- payment
ALTER TABLE payment ADD FOREIGN KEY (id_user_order) REFERENCES user_order(id);
-- product
ALTER TABLE product ADD FOREIGN KEY (id_category) REFERENCES category(id);
ALTER TABLE product ADD FOREIGN KEY (id_discount) REFERENCES discount(id);
-- cart_item
ALTER TABLE cart_item ADD FOREIGN KEY (id_product) REFERENCES product(id);
ALTER TABLE cart_item ADD FOREIGN KEY (id_shopping_session) REFERENCES shopping_session(id);
