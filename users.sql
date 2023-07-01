DROP USER IF EXISTS 'user_read_only'@'localhost'; -- se elimina el usuario si existe

DROP USER IF EXISTS 'simple_user'@'localhost'; -- se elimina el usuario si existe

FLUSH PRIVILEGES;

CREATE USER 'user_read_only'@'localhost' IDENTIFIED BY 'Mypassword123!'; -- Se crea el usuario que tiene solo accesos de lectura

GRANT SELECT ON ecommerce.* TO 'read_only'@'localhost'; -- Se le otorgan los accesos de lectura al usuario _user_read_only

CREATE USER 'simple_user'@'localhost' IDENTIFIED BY 'Mypassword123!'; -- Se crea el usuario que tiene solo accesos de lectura, insercion y actualizacion pero no eliminacion

GRANT SELECT, INSERT, UPDATE ON ecommerce.* TO 'simple_user'@'localhost'; -- Se le otorgan los accesos de lectura al usuario simple_user

FLUSH PRIVILEGES;
