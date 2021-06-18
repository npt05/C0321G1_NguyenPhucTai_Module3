use Furama;

-- task11

select khach_hang.id_khach_hang,ten_loai_khach, dich_vu_di_kem.ten_dich_vu_di_kem,
dich_vu_di_kem.gia,dich_vu_di_kem.don_vi, hop_dong_chi_tiet.so_luong
from khach_hang
join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach
join hop_dong on hop_dong.id_khach_hang = khach_hang.id_khach_hang
join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
where ten_loai_khach = 'Diamond' and ( dia_chi = 'vinh' or dia_chi = 'quang ngai');

-- task12

select table1.*, table2.ngay_lam_hop_dong as hop_dong_dau_nam
from (
select hop_dong.ID_hop_dong,hop_dong.id_dich_vu, nhan_vien.ho_ten as ten_nhan_vien, 
khach_hang.ho_ten,khach_hang.SDT,ten_loai_dich_vu,ngay_lam_hop_dong
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

-- task13

select dich_vu_di_kem.*,so_luong
from  hop_dong_chi_tiet
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
where so_luong = (select max(so_luong) from hop_dong_chi_tiet);

-- task14

select hop_dong.id_hop_dong IDHopDong, ten_loai_dich_vu TenLoaiDichVu, ten_dich_vu_di_kem TenDichVuDiKem, so_luong SoLanSuDung
from hop_dong
join dich_vu on dich_vu.id_dich_vu = hop_dong.id_dich_vu
join loai_dich_vu on loai_dich_vu.id_loai_dich_vu= dich_vu.id_loai_dich_vu
join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
where so_luong =1;

-- task15

select nhan_vien.ID_nhan_vien IDNhanVien,ho_ten HoTen, ten_bo_phan TenBoPhan, 
SDT SoDienThoai, dia_chi DiaChi,
count(id_hop_dong) so_luong_hop_dong,ngay_lam_hop_dong
from nhan_vien
left join trinh_do on nhan_vien.ID_trinh_do = trinh_do.ID_trinh_do
left join bo_phan on bo_phan.ID_bo_phan = nhan_vien.ID_bo_phan
left join hop_dong on nhan_vien.ID_nhan_vien = hop_dong.ID_nhan_vien
group by nhan_vien.ID_nhan_vien
having count(id_hop_dong) <=3 and (ngay_lam_hop_dong between '2018-01-01' and 
'2019-12-31' or ngay_lam_hop_dong is null);

-- task16

delete from nhan_vien where ID_nhan_vien in (
select ID_nhan_vien from(
select nhan_vien.ID_nhan_vien
from nhan_vien
left join hop_dong on nhan_vien.ID_nhan_vien =hop_dong.ID_nhan_vien
where (not ngay_lam_hop_dong between '2017-01-01' and '2019-12-31') or ngay_lam_hop_dong is null
group by nhan_vien.ID_nhan_vien
order by nhan_vien.ID_nhan_vien) as table1) ;

-- task17

update khach_hang
set id_loai_khach=1
where id_loai_khach=2 and id_khach_hang in (select id_khach_hang from hop_dong where
 hop_dong.tong_tien >=10000000 );
 
 -- task18
 
 delete from khach_hang where id_khach_hang in (
select table1.id_khach_hang from (
select khach_hang.id_khach_hang from khach_hang 
join hop_dong on khach_hang.id_khach_hang = hop_dong.id_hop_dong
where year(ngay_lam_hop_dong) <2016) as table1);

-- tas19

update dich_vu_di_kem
set gia=gia*2
where id_dich_vu_di_kem 
in (select id_dich_vu_di_kem 
from hop_dong_chi_tiet  
group by id_dich_vu_di_kem 
having count(id_dich_vu_di_kem)>=10);

-- task20

select id_nhan_vien, ho_ten, email, sdt, ngay_sinh, dia_chi
from nhan_vien
union all
select id_khach_hang, ho_ten, email, sdt, ngay_sinh, dia_chi
from khach_hang

