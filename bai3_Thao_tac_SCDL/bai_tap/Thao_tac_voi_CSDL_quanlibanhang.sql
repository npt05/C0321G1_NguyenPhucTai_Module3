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
Product_ID int,
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

insert into Custormers
values
(1,'Minh Quan',18),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

insert into Product
values
(1,'máy giặc',3),
(2,'tủ lạnh',5),
(3,'điều hòa',7),
(4,'quạt',1),
(5,'bếp điện',2);
 
insert into Orders(Product_ID,Orders_Date)
values
(1,'2006-21-03 '),
(2,'2006-21-03'),
(1,2006-16-03);

insert into OrderDetail
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select Orders_ID, Product_ID, Orders_Date
from Orders;

select Custormers.Customers_Name, Product_Name.pName
from OrderDetail
inner join Orders on OrderDetail.Orders_ID=Orders.Orders_ID join Custormers on Custormers.Customers_ID=Orders.Customers_ID
inner join product on orderdetail.pID=product.pID ;

select Customers_Name
from Custormers
left join Orders on Custormers.Customers_ID=Orders.Customers_ID
where Orders_ID is null;

select Orders.Orders_ID, Orders.Orders_Date, (OrderDetail_QTY) as giá
from OrderDetail
inner join Orders on OrderDetail.Orders_ID=Orders.Orders_ID
inner join Product on OrderDetail.Product_ID=Product.Product_ID;