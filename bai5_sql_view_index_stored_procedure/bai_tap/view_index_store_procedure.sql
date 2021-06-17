create database demo;
use demo;

create table products(
Id int auto_increment primary key,
product_code varchar(45),
product_name varchar(45),
product_price float,
product_amount int,
product_description varchar(45),
product_status bit
);

insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
value
('p13','iphone 7',1000,1000,'tran vien',1),
('p11','xiaomi 6',800,1000,'man hinh phang',1),
('p10','samsung ',600,2000,'',0);

CREATE UNIQUE INDEX index_product_code
ON products (product_code);

CREATE UNIQUE INDEX composite_index
ON products (product_name,product_price);

explain select *
from products;

select *
from products;

CREATE VIEW products_views AS
SELECT product_code, product_name, product_price, product_status
FROM  products;

select * from products_views;

CREATE OR REPLACE VIEW products_views AS
SELECT Id, product_code, product_name, product_price, product_status
FROM  products
WHERE product_status=1;

drop view products_views;

delimiter //
create procedure insert_product(in product_code varchar(45), in product_name varchar(45), in product_price float, in product_amount int,in product_description varchar(45),in product_status bit) 
begin
insert into products(product_code,product_name,product_price , product_amount,product_description, product_status)
value(product_code,product_name,product_price , product_amount,product_description, product_status);
end//
delimiter ;
call insert_product('p2','xiaomi remid 4',700,2000,'man hinh cong',1);

SET SQL_SAFE_UPDATES = 0;
delimiter //
create procedure update_product(in product_code varchar(45), in product_name varchar(45)) 
begin
update products
set products.product_name=product_name
where products.product_code=product_code;
end //
delimiter ;

call update_product('p2','xiaomi remid 5');

delimiter //
create procedure delete_product(in product_code varchar(45)) 
begin
delete from products
where products.product_code=product_code;
end //
delimiter ;

call delete_product('p2');
