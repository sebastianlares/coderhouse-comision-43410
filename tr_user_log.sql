USE ecommerce;

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
CREATE TRIGGER tr_new_user
AFTER INSERT ON user
FOR EACH ROW 
INSERT INTO new_users_log (id, created_by, created_at) VALUES (NEW.id, USER(), CURRENT_DATE());

-- INSERT USER DATA
INSERT INTO `user` (`email`,`username`,`password`,`id_person`)
VALUES
  ("nisl.elementum.purus@yahoo.net","Kristen Sherman","EFB24NQT2BJ",1),
  ("cursus.vestibulum@outlook.ca","Holly Wallace","AKS33TFB6KI",2),
  ("vestibulum.ante.ipsum@aol.edu","Brendan Rodgers","GTQ82BBR5OA",3);
  
select * from new_users_log;