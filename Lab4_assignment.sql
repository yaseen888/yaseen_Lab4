Create Database if not exists `order-directory`;
use `order-directory`;

/* create table supplier*/

CREATE TABLE IF NOT EXISTS supplier (
    SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50),
    SUPP_PHONE VARCHAR(10) NOT NULL
);

/* create table customer*/

CREATE TABLE IF NOT EXISTS customer(
CUS_ID int NOT NUll,
CUS_NAME varchar(20) NOT NULl,
CUS_PHONE varchar(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER char,
PRIMARY KEY (CUS_ID)
);

/* create table category*/

CREATE TABLE IF NOT EXISTS category(
CAT_ID int NOT NULl,
CAT_NAME varchar(20) NOT NULL,
PRIMARY KEY (CAT_ID)
);

/* create table product*/

CREATE TABLE IF NOT EXISTS product(
PRO_ID int NOT NULL,
PRO_NAME varchar(20) NOT NULL DEFAULT "Dummy",
PRO_DESC varchar(60),
CAT_ID int not null,
PRIMARY KEY (PRO_ID),
FOREIGN KEY (CAT_ID) REFERENCES CATEGORY (CAT_ID)
);

/* create table supplier_pricing*/

CREATE TABLE IF NOT EXISTS supplier_pricing (
    PRICING_ID INT NOT NULL,
    PRO_ID INT NOT NULL,
    SUPP_ID INT NOT NULL,
    SUPP_PRICE INT DEFAULT 0,
    PRIMARY KEY (PRICING_ID),
    FOREIGN KEY (PRO_ID)
        REFERENCES PRODUCT (PRO_ID),
    FOREIGN KEY (SUPP_ID)
        REFERENCES SUPPLIER (SUPP_ID)
);

/*create table order*/

CREATE TABLE IF NOT EXISTS `order` (
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE,
CUS_ID INT NOT NULL,
PRICING_ID INT NOT NULL,
PRIMARY KEY (ORD_ID),
FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID)
);

/* create table rating*/

CREATE TABLE IF NOT EXISTS rating (
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY (RAT_ID),
FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID)
);

/* insert records in supplier*/

INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

/* insert records in customer*/

INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

/* insert records in category*/

INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

/* insert records in product*/

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

/* insert records supplier_pricing*/

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

/* insert records in order*/

INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);

/* insert records in rating*/

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

use `order-directory`;

/* 
3)	Display the total number of customers based on gender
 who have placed orders of worth at least Rs.3000.
 */
 select count(t2.cus_gender) as No_of_Customers, t2.cus_gender from
 (select t1.cus_id, t1.cus_gender, t1.ord_amount, t1.cus_name from
  (select `order`.ord_amount, `order`.cus_id, customer.cus_gender, customer.cus_name
 from `order`
 inner join
 customer 
 on `order`.cus_id=customer.cus_id
 having `order`.ord_amount>=3000) 
 as t1
 group by t1.cus_id) as t2
 group by t2.cus_gender;
 
 /*
 4)	Display all the orders along with product name ordered 
 by a customer having Customer_Id=2
 */
select `order`.*, A1.pro_name from `order`
inner join
(select product.pro_name, supplier_pricing.pricing_id from
product
inner join
supplier_pricing
on
supplier_pricing.pro_id = product.pro_id ) as A1
on
`order`.pricing_id = A1.pricing_id where `order`.cus_id=2;

/*
5)	Display the Supplier details who can supply more than one product. 
*/

select supplier.* from supplier where supplier.supp_id in
(select supp_id from supplier_pricing group by supp_id having
count(supp_id)>1);

/*
6)	Find the least expensive product from each category 
and print the table with category id, name, product name and
 price of the product
 */
 
 select category.cat_id,category.cat_name, min(t3.min_price) as Min_price,
 t3.pro_name from category
 inner join
 (select product.cat_id, product.pro_name, t2.* from product 
 inner join
 (select pro_id, min(supp_price) as Min_price from supplier_pricing 
 group by pro_id)
 as t2 where t2.pro_id = product.pro_id)
 as t3 where t3.cat_id = category.cat_id group by t3.cat_id;
 
 /*
 7)	Display the Id and Name of the Product ordered after “2021-10-05”.
 */
 
 select product.pro_id,product.pro_name from 
 `order`
 inner join
 supplier_pricing
 on supplier_pricing.pricing_id = `order`.pricing_id
 inner join
 product
 on product.pro_id = supplier_pricing.pro_id
 where `order`.ord_date>"2021-10-05";
 
 /*
 8)	Display customer name and gender
 whose names start or end with character 'A'.
 */
 
 select cus_name,cus_gender from customer
 where cus_name like 'A%' or cus_name like '%A';
 
 /*
 9)	Create a stored procedure to display supplier id, name, rating 
 and Type_of_Service. For Type_of_Service, If rating =5, 
 print “Excellent Service”,If rating >4 print “Good Service”, 
 If rating >2 print “Average Service” else print “Poor Service”.
 */
 
 select report.supp_id,report.supp_name,report.Average,
 CASE
 WHEN report.Average =5 THEN 'Excellent Service'
 WHEN report.Average >4 THEN 'Good Service'
 WHEN report.Average >2 THEN 'Average Service'
 ELSE 'Poor Service'
 END AS Type_of_Service from 
 (select final.supp_id, supplier.supp_name, final.Average from
 (select test2.supp_id, avg(test2.rat_ratstars) as Average from
 (select supplier_pricing.supp_id, test.ord_id, test.rat_ratstars from
 supplier_pricing inner join
 (select `order`.pricing_id, rating.ord_id, rating.rat_ratstars from
 `order`
 inner join
 rating
 on rating.ord_id = `order`.ord_id)
 as test
 on test.pricing_id = supplier_pricing.pricing_id)
 as test2 group by supplier_pricing.supp_id)
 as final
 inner join
 supplier
 where final.supp_id = supplier.supp_id) as report;
 
 call proc();