use Furama;

/* 21.	Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và
 đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “12/12/2019” */
 
 create or replace view V_NHANVIEN as 
select nhan_vien.* from hop_dong 
join nhan_vien on hop_dong.iD_nhan_vien = nhan_vien.iD_nhan_vien
where dia_chi= 'hai chau' and ngay_lam_hop_dong = '2019-12-12'
group by nhan_vien.id_nhan_vien;

select * from V_nhanvien;

/* 22.	Thông qua khung nhìn V_NHANVIEN thực hiện 
cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các Nhân viên được nhìn thấy bởi khung nhìn này. */

update nhan_vien set dia_chi = 'lien chieu' where id_nhan_vien in (
select id_nhan_vien from v_nhanvien);

/* 23.	Tạo Clustered Index có tên là IX_KHACHHANG trên bảng Khách hàng.
Giải thích lý do và thực hiện kiểm tra tính hiệu quả của việc sử dụng INDEX */

alter table khach_hang add index IX_KHACHHANG (id_khach_hang);
explain select * from khach_hang where id_khach_hang = 1;
alter table khach_hang drop index IX_KHACHHANG;

/* 24.	Tạo Non-Clustered Index có tên là IX_SoDT_DiaChi trên các cột SODIENTHOAI và
 DIACHI trên bảng KHACH HANG và kiểm tra tính hiệu quả tìm kiếm sau khi tạo Index. */
 
alter table khach_hang add index IX_SoDT_DiaChi(sdt,dia_chi);
alter table khach_hang drop index IX_SoDT_DiaChi;
explain select * from khach_hang where sdt = '123456789' and dia_chi ='da nang';

/* 25.	Tạo Store procedure Sp_1 Dùng để xóa thông tin của
 một Khách hàng nào đó với Id Khách hàng được truyền vào như là 1 tham số của Sp_1 */
 
 DELIMITER //

CREATE PROCEDURE Sp_1(param int)

BEGIN

  delete from khach_hang where id_khach_hang = param;

END //

DELIMITER ;
call sp_1(5);
select * from khach_hang;

/* 26.	Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu Sp_2 
phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan. */

delimiter //
create procedure Sp_2(param1 int,param2 int,param3 int,param4 int,param5 date,param6 date,param7 int,param8 int)
begin 
	if(param1 not in (select id_hop_dong from hop_dong))
    then insert into hop_dong values(param1,param2,param3,param4,param5,param6,param7,param8);
    end if;
end//
DELIMITER ;

call sp_2(11,2,3,4,'2019-04-22','2019-07-25',12000,null);

/* 27.	Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì hiển thị
 tổng số lượng bản ghi còn lại có trong bảng HopDong ra giao diện console của database */
 
delimiter //
CREATE trigger Tr_1 after delete on hop_dong
for each row 
begin
select concat('so luong con lai', count(id_hop_dong)) from hop_dong into @a;

end//
DELIMITER ;
drop trigger Tr_1;
delete from hop_dong where id_hop_dong = 11;
select @a;


/* 28.	Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng,
 cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau:
 Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. 
 Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo 
Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày trên console của database */

delimiter //
create trigger Tr_2 before update on hop_dong for each row
begin
    set @b = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày ';
    if timestampdiff(day,old.ngay_lam_hop_dong,new.ngay_ket_thuc) <2 then 
    SIGNAL SQLSTATE '45000' set message_text= @b;
    end if;
end//
DELIMITER ;
drop trigger Tr_2;
update hop_dong set ngay_ket_thuc = '2019-05-23' where id_hop_dong =9;

/* 29.	Tạo user function thực hiện yêu cầu sau:
a.	Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.0000 VNĐ.
b.	Tạo user function Func_2: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến 
lúc kết thúc hợp đồng mà Khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời 
gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). 
Mã của Khách hàng được truyền vào như là 1 tham số của function này. */
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
left join dich_vu_di_kem on dich_vu_di_kem.id_dich_vu_di_kem = hop_dong_chi_tiet.id_dich_vu_di_kem
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

/* 30.	Tạo Stored procedure Sp_3 để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ 
là “Room” từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó 
(tức là xóa các bảng ghi trong bảng DichVu) và xóa những HopDong sử dụng dịch vụ liên quan 
(tức là phải xóa những bản gi trong bảng HopDong) và những bản liên quan khác. */

delimiter //
create procedure Sp_3()
begin
delete from dich_vu where id_dich_vu in(
select * from (
 select dich_vu.id_dich_vu from hop_dong
 join dich_vu on dich_vu.id_dich_vu= hop_dong.id_dich_vu
 join loai_dich_vu on loai_dich_vu.id_loai_dich_vu = dich_vu.id_loai_dich_vu
 where ten_loai_dich_vu = 'Room' and year(ngay_lam_hop_dong) between 2015 and 2019) as table1) ;
 
 delete from hop_dong where id_hop_dong in(
 select * from (
 select hop_dong.id_hop_dong from hop_dong
 join dich_vu on dich_vu.id_dich_vu= hop_dong.id_dich_vu
 join loai_dich_vu on loai_dich_vu.id_loai_dich_vu = dich_vu.id_loai_dich_vu
 where ten_loai_dich_vu = 'Room' and year(ngay_lam_hop_dong) between 2015 and 2019) as table2);
end //
delimiter ;
call SP_3();
drop procedure sp_3;
