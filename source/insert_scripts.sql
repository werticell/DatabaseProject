/* Insert Into Customer table */
INSERT INTO clothes_shops.customer (
                                     customer_nm,
                                     customer_surname,
                                     customer_patronymic,
                                     birth_dt,
                                     email,
                                     overall_transactions_amt,
                                     advertising_subscribe_flg)
VALUES ('Vitya', 'Smirnov', 'Vasilievich', '2001.12.12', 'vasya@ya.ru', 15000, TRUE);

SELECT * from clothes_shops.customer;

COPY clothes_shops.customer(
                            customer_nm,
                            customer_surname,
                            customer_patronymic,
                            birth_dt,
                            email,
                            overall_transactions_amt,
                            advertising_subscribe_flg)
FROM '/private/tmp/customer.csv'
DELIMITER ','
CSV HEADER;

/* Check
 SELECT * FROM clothes_shops.customer;
 */


/* Insert Into Employee table */

INSERT INTO clothes_shops.employee (birth_dt)
VALUES ('1990.10.22');

SELECT * FROM clothes_shops.employee;

INSERT INTO clothes_shops.employee_version (
                                     employee_id,
                                     valid_from_dttm,
                                     delivery_point_id,
                                     salary_amt,
                                     valid_to_dttm,
                                     employee_nm,
                                     employee_surname,
                                     employee_patronymic,
                                     email,
                                     position_nm)
VALUES (1, '2017.7.13', 'Vasilievich', '2018.3.15', 'vasya@ya.ru', 15000, TRUE);


/* Insert Into Brand table */

INSERT INTO clothes_shops.brand (
                                 brand_nm,
                                 head_designer_nm,
                                 head_designer_surname,
                                 head_designer_patronymic,
                                 foundation_dt
)
VALUES ('Valentino', 'Pierpaolo', 'Piccioli', NULL, '01.01.1960');

SELECT * FROM clothes_shops.brand;

INSERT INTO clothes_shops.brand (
                                 brand_nm,
                                 head_designer_nm,
                                 head_designer_surname,
                                 head_designer_patronymic,
                                 foundation_dt
)
VALUES  ('Versace', 'Versace', 'Donatella', NULL, '1978.01.01'),
        ('Fendi','Jones', 'Kim', NULL, '1925.11.7'),
        ('Gucci','Michele','Alessandro',NULL,'1921.3.24'),
        ('Jacquemus','Jacquemus','Simon', NULL,'2009.2.15'),
        ('Burberry','Bailey','Christopher',NULL,'1856.9.12'),
        ('Weekday','Lasson','Louise',NULL,'2000.10.15'),
        ('Adidas','Gaudio','Paul',NULL,'1949.08.18'),
        ('Pull&Bear','Moraes','Joao',NULL,'1991.10.11'),
        ('Nike','Walker','Andy',NULL,'1964.01.25'),
        ('Converse','Russo','Philip',NULL,'1908.01.02'),
        ('Bershka','Visca','Ilaria',NULL,'1998.04.19');


SELECT * FROM clothes_shops.brand;

/* Insert Into Clothes table */

INSERT INTO clothes_shops.clothes (
                                   brand_id,
                                   clothes_nm,
                                   category_nm,
                                   color_nm,
                                   price_amt,
                                   sex_nm
)
VALUES (6, 'Kiley belted logo print dress','Dresses','Beige',60000,'female');

SELECT * FROM clothes_shops.clothes;

INSERT INTO clothes_shops.clothes (
                                   brand_id,
                                   clothes_nm,
                                   category_nm,
                                   color_nm,
                                   price_amt,
                                   sex_nm
)
VALUES  (6,'Belted mid-length car coat','Coats','Black',169000,'female'),
        (4,'Single-breasted overcoat','Coars','Dark green',206000,'male'),
        (7,'Dark T-shirt in Beige','Shirts','Beige',1300,'unisex'),
        (5,'La Robe Bahia mini dress','Dresses','Black',50280,'female'),
        (9,'Super skinny jeans in black','Jeans','Black',2100,'male'),
        (5,'Le Pantalon Santon trousers','Trousers','Black',42126,'female'),
        (12,'Organic cotton mom jean in vintage wash blue','Jeans','Blue',2300,'female'),
        (3,'Belted linen jumpsuit','Jumpsuits','Beige',285000,'female'),
        (11,'Converse Star Chevron logo t-shirt in white','Shirts','White',1700,'male'),
        (1,'Valentino x Undercover Lovers print single-breasted coat','Coats','Black',258960,'female'),
        (10,'Nike Air Running small logo short sleeve t-shirt in black','Shorts','Black',3600,'female'),
        (2,'Starfish print pleated skirt','Skirts','Multicolor',79400,'female'),
        (8,'Overdyed Premium Sweats co-ord in black','Shirts','Black',3100,'male'),
        (1,'Double-breasted blazer jacket','Jackets','Brown',202755,'female');

SELECT * FROM clothes_shops.clothes;


/* Insert Into Store table */

INSERT INTO clothes_shops.store (
                                 store_nm,
                                 create_dt,
                                 head_office_town_nm,
                                 head_office_country_nm)
VALUES  ('ASOS','2000.06.03','London','England'),
        ('SHEIN','2008.10.01','Beijing','China'),
        ('WildBerries','2004.03.14','Moscow','Russia'),
        ('Lamoda','2011.5.15','Moscow','Russia'),
        ('FARFETCH','2007.06.01','London','England');

SELECT * FROM clothes_shops.store;


/* Insert Into clothes_x_store table */

COPY clothes_shops.clothes_x_store(
                                    store_id,
                                   clothes_id,
                                   item_count
    )
FROM '/private/tmp/store_x_clothes.txt'
DELIMITER ','
CSV HEADER;

SELECT * FROM clothes_shops.clothes_x_store;

/* Insert Into clothes_x_store table */