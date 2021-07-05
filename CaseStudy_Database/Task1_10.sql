
use furama;
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có
-- tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
SELECT right(SUBSTRING_INDEX(REVERSE('tran van ab'), " ", 1),1);
select * from nhan_vien 
where (
right(SUBSTRING_INDEX(REVERSE(ho_ten), " ", 1),1) = 'H' or
right(SUBSTRING_INDEX(REVERSE(ho_ten), " ", 1),1) = 'T' or
right(SUBSTRING_INDEX(REVERSE(ho_ten), " ", 1),1) = 'K')
and length(ho_ten) <15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
-- có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang where ( timestampdiff(year,ngay_sinh,current_date()) between 18 and 50)
and (dia_chi= 'da nang' or dia_chi = 'quang tri');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select khach_hang.*,count(ID_hop_dong) as dat_phong from hop_dong join khach_hang on hop_dong.ID_khach_hang = khach_hang.ID_khach_hang
where id_loai_khach =1 group by ID_khach_hang order by dat_phong asc;

-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien
-- (Với TongTien được tính theo công thức như sau:
-- ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem)
-- cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select khach_hang.ID_khach_hang,ho_ten, ten_loai_khach, hop_dong.ID_hop_dong, ten_dich_vu, ngay_lam_hop_dong,
 ngay_ket_thuc, sum(chi_phi_thue + so_luong*gia) as tong_tien
 from ((((((khach_hang
left join loai_khach on khach_hang.ID_loai_khach = loai_khach. ID_loai_khach)
left join hop_dong on khach_hang.ID_khach_hang= hop_dong.id_khach_hang)
left join dich_vu on hop_dong.ID_dich_vu = dich_vu.ID_dich_vu)
left join loai_dich_vu on loai_dich_vu.ID_loai_dich_vu = dich_vu.ID_loai_dich_vu)
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ID_hop_dong= hop_dong.ID_hop_dong)
left join dich_vu_di_kem on dich_vu_di_kem.ID_dich_vu_di_kem = hop_dong_chi_tiet.ID_dich_vu_di_kem)
group by id_khach_hang;

-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa 
-- từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
select dich_vu.id_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,ten_loai_dich_vu,ngay_lam_hop_dong
from( dich_vu left join loai_dich_vu on dich_vu.id_loai_dich_vu=loai_dich_vu.ID_loai_dich_vu)
right join hop_dong on hop_dong.id_dich_vu= dich_vu.id_dich_vu
where not (month(ngay_lam_hop_dong) between 1 and 3 and year(ngay_lam_hop_dong) = 2019)
group by id_dich_vu;

-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu
-- của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018
-- nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
select table1.*,table2.hop_dong_2019 from
(select dv.id_dich_vu,ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,dv.so_nguoi_toi_da,
ten_loai_dich_vu,ngay_lam_hop_dong as hop_dong_2018
from((dich_vu as dv left join loai_dich_vu on dv.id_loai_dich_vu=loai_dich_vu.ID_loai_dich_vu)
join  hop_dong on hop_dong.id_dich_vu= dv.id_dich_vu)
having year(ngay_lam_hop_dong) =2018) as table1
left join
(select ngay_lam_hop_dong as hop_dong_2019,id_dich_vu  from hop_dong where year(ngay_lam_hop_dong) = 2019) as table2
 on table1.id_dich_vu= table2.id_dich_vu
 where year(table1.hop_dong_2018) =2018 and year (table2.hop_dong_2019) is null;
 
 -- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
 -- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
 select * from khach_hang group by ho_ten;
 select distinct ho_ten from khach_hang;
select ho_ten from khach_hang
union
select ho_ten from khach_hang;

/* 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng
 trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng. */
 
 select month(ngay_lam_hop_dong) as thang ,
case  when so_luong is null then sum(chi_phi_thue)
		else  sum(chi_phi_thue + so_luong*gia) end as tong_tien
 from ((( hop_dong
left join dich_vu on hop_dong.ID_dich_vu = dich_vu.ID_dich_vu)
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ID_hop_dong= hop_dong.ID_hop_dong)
left join dich_vu_di_kem on dich_vu_di_kem.ID_dich_vu_di_kem = hop_dong_chi_tiet.ID_dich_vu_di_kem)
 where month(ngay_lam_hop_dong)  between 1 and 12 and year(ngay_lam_hop_dong) = 2019
 group by thang 
 order by thang asc;
 
 /* 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm.
 Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem
 (được tính dựa trên việc count các IDHopDongChiTiet). */

select hop_dong.id_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,
count(ID_hop_dong_chi_tiet) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
group by id_hop_dong;