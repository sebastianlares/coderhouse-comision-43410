CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_inserto_into_description_table`(nameValue VARCHAR(255), descriptionValue VARCHAR(255))
BEGIN
	INSERT INTO category (`name`,`description`) VALUES (nameValue, descriptionValue);
    SELECT * FROM category 
    ORDER BY category.id DESC;
END