create database QuanLyBanHang;
use QuanLyBanHang;
create table Customers(
Customers_ID int auto_increment primary key,
Customers_Name varchar(255),
Customers_Age int
);
create table Orders(
Orders_ID int auto_increment primary key,
Customers_ID int, foreign key(Customers_ID) references Customers(Customers_ID),
Orders_Date date,
Orders_TotalPrice integer
);
create table OrderDetail(
Orders_ID int,
Product_ID int auto_increment,
primary key(Orders_ID,Product_ID),
foreign key(Orders_ID) references Orders(Orders_ID),
foreign key(Product_ID) references Product(Product_ID),
OrderDetail_QTY char
);
create table Product(
Product_ID int auto_increment primary key,
Product_Name varchar(255),
Product_Price integer
);
