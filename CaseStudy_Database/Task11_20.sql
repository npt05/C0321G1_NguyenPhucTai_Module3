use Furama;

/* 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng
 có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”. */
select khach_hang.id_khach_hang,ten_loai_khach, dich_vu_di_kem.ten_dich_vu_di_kem,
dich_vu_di_kem.gia,dich_vu_di_kem.don_vi, hop_dong_chi_tiet.so_luong
from khach_hang
join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach
join hop_dong on hop_dong.id_khach_hang = khach_hang.id_khach_hang
join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
where ten_loai_khach = 'Diamond' and ( dia_chi = 'vinh' or dia_chi = 'quang ngai');

/* 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
(được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng
 cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019. */
select table1.*, table2.ngay_lam_hop_dong as hop_dong_dau_nam_2019
from (
select hop_dong.ID_Hop_Dong,hop_dong.id_dich_vu, nhan_vien.ho_ten as ten_nhan_vien, khach_hang.ho_ten, khach_hang.SDT,
Ten_loai_Dich_Vu, sum(so_luong) as so_luong_dich_vu_di_kem,ngay_lam_hop_dong as hop_dong_cuoi_nam_2019
from hop_dong
left join khach_hang on hop_dong.id_khach_hang = khach_hang.id_khach_hang
left join dich_vu on dich_vu.id_dich_vu = hop_dong.id_dich_vu
left join loai_dich_vu on loai_dich_vu.id_loai_dich_vu= dich_vu.id_loai_dich_vu
left join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
left join nhan_vien on nhan_vien.id_nhan_vien = hop_dong.ID_nhan_vien 
where year(ngay_lam_hop_dong) = 2019 and month(ngay_lam_hop_dong) between 10 and 12) table1
 left join
(select ngay_lam_hop_dong,id_dich_vu from hop_dong
where month(ngay_lam_hop_dong) between 1 and 6 and year(ngay_lam_hop_dong)= 2019) table2
on table1.id_dich_vu= table2.id_dich_vu
where table2.ngay_lam_hop_dong is null;

/* 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
 (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau). */
 
select dich_vu_di_kem.*,so_luong
from  hop_dong_chi_tiet
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
where so_luong = (select max(so_luong) from hop_dong_chi_tiet);

/* 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
 Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung. */
 
select hop_dong.id_hop_dong IDHopDong, ten_loai_dich_vu TenLoaiDichVu, ten_dich_vu_di_kem TenDichVuDiKem, so_luong SoLanSuDung
from hop_dong
join dich_vu on dich_vu.id_dich_vu = hop_dong.id_dich_vu
join loai_dich_vu on loai_dich_vu.id_loai_dich_vu= dich_vu.id_loai_dich_vu
join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
where so_luong =1;
 
 /* 
15.	Hiển thi thông tin của tất cả nhân viên bao gồm 
IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019. */

select nhan_vien.ID_nhan_vien IDNhanVien,ho_ten HoTen, ten_bo_phan TenBoPhan, SDT SoDienThoai, dia_chi DiaChi,
count(id_hop_dong) so_luong_hop_dong,ngay_lam_hop_dong
from nhan_vien
left join trinh_do on nhan_vien.ID_trinh_do = trinh_do.ID_trinh_do
left join bo_phan on bo_phan.ID_bo_phan = nhan_vien.ID_bo_phan
left join hop_dong on nhan_vien.ID_nhan_vien = hop_dong.ID_nhan_vien
group by nhan_vien.ID_nhan_vien
having count(id_hop_dong) <=3 and (ngay_lam_hop_dong between '2018-01-01' and '2019-12-31' or ngay_lam_hop_dong is null);

/* 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019. */

delete from nhan_vien where ID_nhan_vien in (
select ID_nhan_vien from(
select nhan_vien.ID_nhan_vien
from nhan_vien
left join hop_dong on nhan_vien.ID_nhan_vien =hop_dong.ID_nhan_vien
where (not ngay_lam_hop_dong between '2017-01-01' and '2019-12-31') or ngay_lam_hop_dong is null
group by nhan_vien.ID_nhan_vien
order by nhan_vien.ID_nhan_vien) as table1) ;

/* 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond,
 chỉ cập nhật những khách hàng đã từng đặt phòng với 
tổng Tiền thanh toán trong năm 2019 là lớn hơn 20000 VNĐ.  */

update khach_hang set id_loai_khach = 1 where id_khach_hang in (
select table1.id_khach_hang
from(
select khach_hang.id_khach_hang,hop_dong_chi_tiet.so_luong,dich_vu_di_kem.gia,dich_vu.chi_phi_thue,
case  when so_luong is null then sum(chi_phi_thue)
		else  sum(chi_phi_thue + so_luong*gia) end as tong_tien
from hop_dong
left join khach_hang on khach_hang.id_khach_hang = hop_dong.ID_khach_hang
left join loai_khach on khach_hang.id_loai_khach = loai_khach.ID_loai_khach
left join dich_vu on hop_dong.ID_dich_vu = dich_vu.ID_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ID_hop_dong= hop_dong.ID_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ID_dich_vu_di_kem = hop_dong_chi_tiet.ID_dich_vu_di_kem
where ten_loai_khach = 'Platinium' and year(ngay_lam_hop_dong) = 2019
group by khach_hang.id_khach_hang
having tong_tien >20000) as table1);

/* 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng). */

delete from khach_hang where id_khach_hang in (
select table1.id_khach_hang from (
select khach_hang.id_khach_hang from khach_hang 
join hop_dong on khach_hang.id_khach_hang = hop_dong.id_hop_dong
where year(ngay_lam_hop_dong) <2016) as table1);

/* 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi. */

update dich_vu_di_kem set gia = gia * 2 where id_dich_vu_di_kem in (
select table1.id_dich_vu_di_kem from (
select hop_dong_chi_tiet.id_dich_vu_di_kem,sum(so_luong) as tong_so_luong from
 hop_dong_chi_tiet
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem =dich_vu_di_kem.id_dich_vu_di_kem
group by id_dich_vu_di_kem
having tong_so_luong > 10) as table1);

/* 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống,
 thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi. */
 
select nv.ID_nhan_vien as ID,'nhan vien',nv.ho_ten,nv.email,nv.sdt,nv.ngay_sinh,nv.dia_chi
 from nhan_vien nv
 union all
 select kh.id_khach_hang as ID,'khach hang',kh.ho_ten,kh.email,kh.sdt,kh.ngay_sinh,kh.dia_chi
 from khach_hang kh;
