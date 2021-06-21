use Furama;

-- task21

create view v_nhan_vien as
select *
from nhan_vien
where nhan_vien.dia_chi='Hải Châu' 
and (nhan_vien.id_nhan_vien 
in (select id_nhan_vien 
from hop_dong
 where ngay_lam_hop_dong='2019-12-12' 
 group by id_nhan_vien ));
 
 -- task22
 
 SET SQL_SAFE_UPDATES = 0;
update v_nhan_vien
set  dia_chi='Liên Chiểu';

-- task23

alter table khach_hang add index IX_KHACHHANG (id_khach_hang);
explain select * from khach_hang where id_khach_hang = 1;
alter table khach_hang drop index IX_KHACHHANG;

-- task24 

CREATE UNIQUE INDEX IX_SoDT_DiaChi 
ON khach_hang(sdt, dia_chi);
explain select * from khach_hang where sdt = '123456789' and dia_chi ='da nang';

-- task25 

delimiter //
create procedure Sp_1 (in id_khach_hang int) 
begin
delete from khach_hang
where khach_hang.id_khach_hang=id_khach_hang;
end //
delimiter ;
call Sp_1(2);

-- task26

delimiter //
create procedure insert_product(in product_code varchar(45), in product_name varchar(45),
 in product_price float, in product_amount int,in product_description varchar(45),
 in product_status bit) 
begin
insert into products(product_code,product_name,product_price , product_amount,
product_description, product_status)
value(product_code,product_name,product_price , product_amount,product_description,
 product_status);
end//
delimiter ;

-- task27

CREATE trigger Tr_1 after delete on hop_dong
for each row 
select count(id_hop_dong) as tong_so_ban_ghi from hop_dong into @a;
drop trigger Tr_1;
delete from hop_dong where id_hop_dong = 11;
select @a;

-- task28 



-- task29

delimiter //
create function func_1() returns int
reads sql data
deterministic
begin 
declare result int;
	select count(id_dich_vu) from (
		select hop_dong.id_dich_vu, case  when so_luong is null then sum(chi_phi_thue)
		else  sum(chi_phi_thue + so_luong*gia) end as tong_tien
from hop_dong 
left join dich_vu on hop_dong.id_dich_vu =dich_vu.id_dich_vu
left join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.id_dich_vu_di_kem = 
hop_dong_chi_tiet.id_dich_vu_di_kem
group by id_dich_vu
having tong_tien >20000)as table1 into result;
return result;
end //
delimiter ;
select func_1();

delimiter //
create function func_2(param int) returns int
reads sql data
deterministic
begin 
declare result int;
select max(thoi_gian_dat_phong) from (
select timestampdiff(day,ngay_lam_hop_dong,ngay_ket_thuc) as thoi_gian_dat_phong
from hop_dong
where id_khach_hang = param) as table1 into result;
return result;
end//
delimiter ;
select func_2(1);

-- task30 

delimiter //
create procedure Sp_3()
begin
 select * from hop_dong
 join dich_vu on dich_vu.id_dich_vu = hop_dong.id_dich_vu;
end  //
delimiter ;

