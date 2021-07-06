use jsp_servlet;

DELIMITER $$
CREATE PROCEDURE SELECT_ALL_CUSTOMERS()
BEGIN
select * from customer join 
customer_type on customer.customer_type_id=customer_type.customer_type_id;
END $$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE ADD_NEW_CUSTOMER(type_id int,`name` varchar(45),birthday datetime,gender bit(1),id_card varchar(45),
phone varchar(45), email varchar(45),address varchar(45))
BEGIN
insert into customer(customer_type_id,customer_name,customer_birthday,
            customer_gender,customer_id_card,customer_phone,customer_email,customer_address)
            value (type_id,`name`,birthday,gender,id_card,phone,email,address);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE SELECT_CUSTOMER_BY_ID(id int)
BEGIN
select * from customer join 
customer_type on customer.customer_type_id=customer_type.customer_type_id where customer.customer_id = id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DELETE_CUSTOMER_BY_ID(id int)
BEGIN
delete from customer where customer.customer_id = id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE UPDATE_CUSTOMER_BY_ID(id int,type_id int,`name` varchar(45),birthday datetime,gender bit(1),id_card varchar(45),
phone varchar(45), email varchar(45),address varchar(45))
BEGIN
update customer set customer_type_id = type_id,customer_name = `name` ,customer_birthday = birthday,
            customer_gender =gender,customer_id_card =id_card ,customer_phone = phone,customer_email =email ,
            customer_address = address where customer.customer_id = id;
END $$
DELIMITER ;