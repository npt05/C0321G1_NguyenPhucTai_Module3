create database QuanLyBanHang;
use QuanLyBanHang;

create table customers(
customers_Id int auto_increment primary key,
customers_name varchar(255),
customers_age int
);
create table orders(
orders_Id int auto_increment primary key,
customers_Id int, foreign key(customers_Id) references customers(customers_Id),
orders_date date,
orders_total_price integer
);
create table order_detail(
orders_Id int,
product_Id int,
primary key(orders_Id,product_Id),
foreign key(orders_Id) references orders(orders_Id),
foreign key(product_Id) references oroduct(product_Id),
order_detail_QTY char
);
create table product(
product_Id int auto_increment primary key,
product_name varchar(255),
product_price integer
);



