USE [classicmodels];
GO

-- 1. OFFICES (Already completed in previous steps)

-- 2. EMPLOYEES (Next 9 rows to reach the total of 23)
INSERT INTO [employees] ([employeeNumber],[lastName],[firstName],[extension],[email],[officeCode],[reportsTo],[jobTitle]) VALUES 
(1401,'Castillo','Pamela','x2759','pcastillo@classicmodelcars.com','4',1102,'Sales Rep'),
(1501,'Bott','Larry','x2311','lbott@classicmodelcars.com','7',1102,'Sales Rep'),
(1504,'Jones','Barry','x102','bjones@classicmodelcars.com','7',1102,'Sales Rep'),
(1611,'Fixter','Andy','x101','afixter@classicmodelcars.com','6',1088,'Sales Rep'),
(1612,'Marsh','Peter','x102','pmarsh@classicmodelcars.com','6',1088,'Sales Rep'),
(1619,'King','Tom','x103','tking@classicmodelcars.com','6',1088,'Sales Rep'),
(1621,'Nishi','Mami','x101','mnishi@classicmodelcars.com','5',1056,'Sales Rep'),
(1625,'Kato','Yoshimi','x102','ykato@classicmodelcars.com','5',1621,'Sales Rep'),
(1702,'Gerard','Martin','x2312','mgerard@classicmodelcars.com','4',1102,'Sales Rep');

-- 3. CUSTOMERS (Next 10 Rows)
INSERT INTO [customers] ([customerNumber],[customerName],[contactLastName],[contactFirstName],[phone],[addressLine1],[addressLine2],[city],[state],[postalCode],[country],[salesRepEmployeeNumber],[creditLimit]) VALUES 
(148,'Dragon Souveniers, Ltd.','Natividad','Eric','+65 221 7555','Bronz Sok.','Bronz Apt. 3/6 Tesvikiye','Singapore',NULL,'079903','Singapore',1621,'103800.00'),
(151,'Muscle Machine Inc','Young','Jeff','2125557413','4092 Furth Circle','Suite 400','NYC','NY','10022','USA',1286,'138500.00'),
(157,'Diecast Classics Inc.','Leong','Kelvin','2155551555','7586 Pompton St.',NULL,'Allentown','PA','70267','USA',1216,'100600.00'),
(161,'Technics Stores Inc.','Hashimoto','Juri','6505556809','9408 Furth Circle',NULL,'Burlingame','CA','94217','USA',1165,'84600.00'),
(166,'Handji Gifts& Co','Victorino','Wendy','+65 224 1555','106 Linden Road Sandown','2nd Floor','Singapore',NULL,'069045','Singapore',1612,'97900.00'),
(167,'Herkku Gifts','Oeztan','Veysel','+47 2267 3215','Brehmen St. 121','PR 334 Sentrum','Bergen',NULL,'N 5804','Norway',1504,'96800.00'),
(168,'American Souvenirs Inc','Franco','Keith','2035557845','149 Spinnaker Dr.','Suite 101','New Haven','CT','97823','USA',1286,'0.00'),
(169,'Porto Imports Co.','de Castro','Isabel ','(1) 356-5555','Estrada da saúde n. 58',NULL,'Lisboa',NULL,'1756','Portugal',NULL,'0.00'),
(171,'Daedalus Designs Imports','Rancé','Martine ','20.16.1555','184, chaussée de Tournai',NULL,'Lille',NULL,'59000','France',1370,'82900.00'),
(172,'La Corne D''abondance, Co.','Bertrand','Marie','(1) 42.34.2555','265, boulevard Charonne',NULL,'Paris',NULL,'75012','France',1337,'84300.00');

-- 4. PRODUCTS (Next 10 Rows)
INSERT INTO [products] ([productCode],[productName],[productLine],[productScale],[productVendor],[productDescription],[quantityInStock],[buyPrice],[MSRP]) VALUES 
('S12_4473','1957 Chevy Pickup','Trucks and Buses','1:12','Exoto Designs','1:12 scale die-cast about 20 inch long Hood opens, Rubber wheels',6125,'55.70','118.50'),
('S12_4675','1969 Dodge Charger','Classic Cars','1:12','Welly Diecast Productions','Detailed model of the 1969 Dodge Charger.',7323,'58.73','115.16'),
('S18_1097','1940 Ford Pickup Truck','Trucks and Buses','1:18','Studio M Art Models','Soft rubber tires, working steering, rubber mud guards.',2613,'58.33','116.67'),
('S18_1129','1993 Mazda RX-7','Classic Cars','1:18','Highway 66 Mini Classics','Opening hood, doors, engine, rear spoiler.',3975,'83.51','141.54'),
('S18_1342','1937 Lincoln Berline','Vintage Cars','1:18','Motor City Art Classics','Features opening engine cover, doors, trunk.',8693,'60.62','102.74'),
('S18_1367','1936 Mercedes-Benz 500K Special Roadster','Vintage Cars','1:18','Studio M Art Models','Heavy die-cast metal, independent spring suspension.',8635,'24.26','53.91'),
('S18_1589','1965 Aston Martin DB5','Classic Cars','1:18','Classic Metal Creations','Full wire wheels and doors that open.',9042,'65.96','124.44'),
('S18_1662','1980s Black Hawk Helicopter','Planes','1:18','Red Start Diecast','1:18 scale replica, hand-assembled.',5330,'77.27','157.69'),
('S18_1749','1917 Grand Touring Sedan','Vintage Cars','1:18','Welly Diecast Productions','Detailed engine and instrument panel, tufted upholstery.',2724,'86.70','170.00'),
('S18_1889','1948 Porsche 356-A Roadster','Classic Cars','1:18','Gearbox Collectibles','Superb detail, opening doors, 4 wheel suspension.',8826,'53.90','77.00');

-- 5. ORDERS (Next 10 Rows)
INSERT INTO [orders] ([orderNumber],[orderDate],[requiredDate],[shippedDate],[status],[comments],[customerNumber]) VALUES 
(10114,'2003-04-01','2003-04-07','2003-04-02','Shipped',NULL,172),
(10115,'2003-04-04','2003-04-12','2003-04-07','Shipped',NULL,424),
(10116,'2003-04-11','2003-04-19','2003-04-13','Shipped',NULL,381),
(10117,'2003-04-16','2003-04-24','2003-04-17','Shipped',NULL,148),
(10118,'2003-04-21','2003-04-29','2003-04-26','Shipped','Aware of MSRP.',216),
(10119,'2003-04-28','2003-05-05','2003-05-02','Shipped',NULL,382),
(10120,'2003-04-29','2003-05-08','2003-05-01','Shipped',NULL,114),
(10121,'2003-05-07','2003-05-13','2003-05-13','Shipped',NULL,353),
(10122,'2003-05-08','2003-05-16','2003-05-13','Shipped',NULL,350),
(10123,'2003-05-20','2003-05-29','2003-05-22','Shipped',NULL,103);

-- 6. ORDER DETAILS (Next 10 Rows)
INSERT INTO [orderdetails] ([orderNumber],[productCode],[quantityOrdered],[priceEach],[orderLineNumber]) VALUES 
(10103,'S18_2432',22,'58.34',2),
(10103,'S18_2949',27,'92.19',12),
(10103,'S18_2957',35,'61.84',14),
(10103,'S18_3136',25,'86.92',13),
(10103,'S18_3320',46,'86.31',16),
(10103,'S18_4600',36,'98.07',5),
(10103,'S18_4668',41,'40.75',9),
(10103,'S24_2300',36,'107.34',1),
(10103,'S24_4258',25,'88.62',15),
(10103,'S32_1268',31,'92.46',3);

-- 7. PAYMENTS (Next 10 Rows)
INSERT INTO [payments] ([customerNumber],[checkNumber],[paymentDate],[amount]) VALUES 
(121,'FD317790','2003-10-28','1491.38'),
(121,'KI831359','2004-11-04','17876.32'),
(121,'MA302151','2004-11-28','34638.14'),
(124,'AE215433','2005-03-05','101244.59'),
(124,'BG255406','2004-08-28','85410.87'),
(124,'CQ287967','2003-04-11','11044.30'),
(124,'ET64396','2005-04-16','83598.04'),
(124,'HI366474','2004-12-27','47142.70'),
(124,'HR86578','2004-11-02','55639.66'),
(124,'KI131716','2003-08-15','111654.40');
GO