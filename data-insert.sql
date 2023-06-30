USE ecommerce;

-- DATA INSERT

-- PERSON_ADDRESS DATA
INSERT INTO `person_address` (`country`,`city`,`postal_code`)
VALUES
  ("Spain","Chartres","656851"),
  ("Turkey","Umlazi","04601"),
  ("India","Bắc Kạn","187616"),
  ("Singapore","Balclutha","55781"),
  ("United States","Pachuca","499504"),
  ("Mexico","Kostroma","45489"),
  ("China","Querétaro","51506"),
  ("Brazil","Cereté","56291"),
  ("New Zealand","Jönköping","75897"),
  ("Brazil","Abeokuta","4756");
  
-- PERSON DATA
INSERT INTO `person` (`telephone`,`first_name`,`last_name`,`id_address`)
VALUES
  (2867825,"Brenda Justice","Kenneth",1),
  (1954572,"Amaya Meyers","Omar",2),
  (593514,"Caleb Monroe","Illiana",3),
  (3788532,"Celeste Evans","Marshall",4),
  (3389103,"Christian Mccormick","Slade",5),
  (723884,"Kasper Cox","Solomon",6),
  (700864,"Tate Hayes","Nell",7),
  (2152441,"Jocelyn Dale","Leonard",8),
  (590823,"Harper Rowland","Conan",9),
  (3316344,"Wynter Chandler","Thane",10);
  
-- USER DATA
INSERT INTO `user` (`email`,`username`,`password`,`id_person`)
VALUES
  ("nisl.elementum.purus@yahoo.net","Kristen Sherman","EFB24NQT2BJ",1),
  ("cursus.vestibulum@outlook.ca","Holly Wallace","AKS33TFB6KI",2),
  ("vestibulum.ante.ipsum@aol.edu","Brendan Rodgers","GTQ82BBR5OA",3),
  ("nam.nulla@hotmail.edu","Branden Mack","KSA25DBH1KX",4),
  ("lorem.vehicula.et@aol.couk","Kibo Herman","BXC22NYN8DE",5),
  ("sem.mollis.dui@outlook.ca","Isaac Shaffer","YKB05VEG4LL",6),
  ("aliquam.enim@hotmail.net","Nyssa Finch","HFW06HUF1YL",7),
  ("condimentum.donec@protonmail.couk","Kalia Bates","AOG35GKM7IF",8),
  ("id.sapien@yahoo.net","Xena Pate","XLW46MDQ1PL",9),
  ("libero.lacus.varius@google.net","Rahim Gay","DTJ27OSB2GS",10);

  -- SHOPPING_SESSION 
  INSERT INTO `shopping_session` (`total`,`id_user`)
VALUES
  ("706.87",1),
  ("534.39",2),
  ("671.00",3),
  ("131.19",4),
  ("319.62",5),
  ("533.78",6),
  ("804.97",7),
  ("77.09",8),
  ("100.72",9),
  ("724.58",10);
  
-- DISCOUNT 
INSERT INTO `discount` (`name`,`description`,`discount_percentage`,`active`)
VALUES
  ("Raya","ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius",12,"1"),
  ("Tara","magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor",9,"1"),
  ("Farrah","libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus",13,"1"),
  ("Daquan","et, rutrum eu, ultrices sit amet, risus. Donec nibh enim,",23,"1"),
  ("Hanna","vitae diam. Proin dolor. Nulla semper tellus id nunc interdum",15,"1"),
  ("Juliet","massa non ante bibendum ullamcorper. Duis cursus, diam at pretium",17,"1"),
  ("Kyle","augue ac ipsum. Phasellus vitae mauris sit amet lorem semper",21,"1"),
  ("Abraham","nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra.",9,"1"),
  ("Blythe","natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.",16,"1"),
  ("Nissim","sed tortor. Integer aliquam adipiscing lacus. Ut nec urna et",10,"0");
  
-- CATEGORY
INSERT INTO `category` (`name`,`description`)
VALUES
  ("Jorden","Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec"),
  ("Colin","eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula."),
  ("Colorado","pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero."),
  ("Amethyst","tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante"),
  ("Glenna","luctus sit amet, faucibus ut, nulla. Cras eu tellus eu"),
  ("Virginia","ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus."),
  ("Mikayla","Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum"),
  ("Jerry","ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor"),
  ("Martin","Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor."),
  ("Venus","magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna.");

-- PRODUCT DATA

INSERT INTO `product` (`name`,`description`,`price`,`SKU`,`img_url`,`quantity`,`id_discount`,`id_category`)
VALUES
  ("Alec","Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque.","856.33","AOF32MTV4UK","VBW68LFP8IF",244,1,1),
  ("Sean","massa non ante bibendum ullamcorper. Duis cursus, diam at pretium","48.98","EZG52DCE7ZQ","DGA88BIG2GR",224,2,2),
  ("Marshall","odio. Nam interdum enim non nisi. Aenean eget metus. In","205.61","KPT98ORH2ES","BSQ47HWL3LK",360,3,3),
  ("Portia","imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit,","88.51","IJU63UMN6FM","TII72AGR4OH",98,4,4),
  ("Darrel","nunc. In at pede. Cras vulputate velit eu sem. Pellentesque","649.49","HLJ43IVU8VV","DVB12DOF8UM",109,5,5),
  ("Rashad","accumsan convallis, ante lectus convallis est, vitae sodales nisi magna","881.31","UJR91YVG6GB","FPV27UVZ8EI",281,6,6),
  ("Tallulah","Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue","151.55","HVL23TMM4HS","PMU24OWI8ZO",310,7,7),
  ("Brenna","odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam","522.68","FGL74CBH2PH","CDG27ELE9UF",446,8,8),
  ("Melvin","habitant morbi tristique senectus et netus et malesuada fames ac","337.87","EKR06EJV4GD","ZHJ92TVN2WD",132,9,9),
  ("Rinah","lectus ante dictum mi, ac mattis velit justo nec ante.","22.02","JMR64WLW6TJ","CBS71CMU9PC",163,10,10);
  
 -- CART_ITEM
 INSERT INTO `cart_item` (`quantity`,`id_shopping_session`,`id_product`)
VALUES
  (431,1,1),
  (367,2,2),
  (117,3,3),
  (18,4,4),
  (427,5,5),
  (480,6,6),
  (76,7,7),
  (105,8,8),
  (74,9,9),
  (428,10,10);

-- PAYMENT 
INSERT INTO `payment` (`amount`,`status`,`provider`,`id_user`)
VALUES
  ("259.37","0","Proin Velit Corporation",1),
  ("270.41","1","Risus Quisque Libero Industries",2),
  ("790.36","1","Integer Mollis Integer Company",3),
  ("940.66","0","Malesuada Integer Foundation",4),
  ("333.51","0","Viverra Maecenas Limited",5),
  ("852.88","0","Vel Turpis Incorporated",6),
  ("792.41","1","Massa LLP",7),
  ("449.16","1","Integer Vitae Nibh PC",8),
  ("512.15","1","Fermentum Arcu Industries",9),
  ("192.72","1","Gravida Inc.",10);

-- USER_ORDER 
INSERT INTO `user_order` (`total`,`status`,`id_person_address`,`id_payment`,`id_shopping_session`)
VALUES
  ("486.15","0",1,1,1),
  ("229.04","1",2,2,2),
  ("472.67","1",3,3,3),
  ("316.47","0",4,4,4),
  ("954.76","1",5,5,5),
  ("363.66","0",6,6,6),
  ("453.04","1",7,7,7),
  ("415.93","0",8,8,8),
  ("783.38","1",9,9,9),
  ("674.66","1",10,10,10);