use Furama;

-- task1

insert into vi_tri
values
(1,'lễ tân'),
(2,'phục vụ'),
(3,'chuyên viên'),
(4,'giám sát'),
(5,'quản lí'),
(6,'giám đốc');

insert into trinh_do
values
(1,'trung cấp'),
(2,'cao đẳng'),
(3,'đại học'),
(4,'sau đại học');

insert into bo_phan
values
(1,'Sale – Marketing'),
(2,'Hành Chính'),
(3,'Phục vụ'),
(4,'Quản lý');

insert into nhan_vien
values
(1,'Hoàng Văn Long',3,3,1,2000-08-15,562978139,55000000,0771269728,'vanlong@gmail.com','Đà Nẵng'),
(2,'Nguyễn Văn Tuấn',2,3,2,1999-10-22,162497862,3000000,0882664958,'tuannguyen@gmail.com','Quảng Bình'),
(3,'Bùi Thi Phương Linh',1,1,1,2001-04-27,319862498,7000000,0773195269,'phuonglinh@gmail.com','Huế'),
(4,'Trương Thị Liên Giang',2,3,4,2001-01-18,890136498,30000000,09812657890,'gianglien@gmail.com','Đà Nẵng'),
(5,'Trương Diệu Chi',1,3,1,2001-03-05,231562978,10000000,0891236589,'chidieu@gmail.com','Hồ Chí Minh'),
(6,'Dương Thị Hải Yến',3,2,2,2000-11-27,361297268,22000000,0986213495,'haiyen@gmail.com','Hà Nội'),
(7,'Nguyễn Ngọc Tiến',5,3,3,1999-04-07,560123987,40000000,0889312654,'nguyenngoc@gmail.com','Quãng Ngãi'),
(8,'Trần Thị Kim Anh',5,4,1,2001-04-16,803129456,45000000,0772986125,'anhkim@gmail.com','Quảng Bình'),
(9,'Võ Văn Chiến',6,4,4,1998-12-08,546987235,35000000,0893645128,'vanchien@gmail.com','Đà Nẵng'),
(10,'Nguyễn Văn Cường',5,1,4,1997-08-10,245698709,45000000,0773126549,'vancuong@gmail.com','Quảng Nam');

insert into loai_khach
values
(1,'Diamond'),
(2,'Platinium'),
(3,'Gold'),
(4,'Silver'),
(5,'Member');	

insert into khach_hang
values
(1,2,'Nguyễn Tuấn',1989-02-09,'234345345','090543454','tuannguyen@gmail.com','Quang Nam'),
(2,3,'Hoàng Anh',1991-12-17,'223445398','095643457','hoanganh@gmail.com','Quảng Bình'),
(3,1,'Lê Hùng',1990-02-12,'342345456','0906456756','hung@gmail.com','Bình Dương'),
(4,4,'Đoàn Dự',1978-02-12,'234345665','0935678767','dudoangmail.com','Đà Nẵng'),
(5,5,'Tô Lịch',1995-02-12,'323454345','090542546','tolichgmail.com','Vinh');

insert into loai_dich_vu
values
(1,'Villa'),
(2,'House'),
(3,'Room');

insert into kieu_thue
values
(1,'năm',90000000),
(2,'tháng',1200000),
(3,'ngày',2000000),
(4,'giờ',200000);

insert into dich_vu
values
(1,'thuê view biển villa',200,2,'12',5000000,3,1,'tốt nhất'),
(2,'thuê view biển house',100,2,'9',4000000,3,2,'tốt nhất'),
(3,'thuê view biển room',30,2,'3',3000000,3,3,'tốt nhất'),
(4,'thuê view trung tâm villa',200,2,'12',4000000,3,1,'tốt nhất'),
(5,'thuê view trung tâm house',100,2,'9',3000000,3,2,'tốt nhất'),
(6,'thuê view trung tâm room',30,2,'3',2000000,3,3,'tốt nhất');

insert into hop_dong
values
(1,2,1,1,12/12/2020,2/01/2021,3000000,5000000),
(2,3,4,2,12/01/2021,20/01/2021,400000,7000000),
(3,6,3,4,12/03/2020,22/03/2021,5000000,10000000);

insert into dich_vu_di_kem
values
(1,'massage',500000,1,'hoàn thành'),
(2,'karaoke',400000,1,'một giờ'),
(3,'thức ăn',100000,1,'một khẩu phần'),
(4,'nước uống',20000,1,'chai'),
(5,'thuê xe di chuyển tham quan resort',1000000,1,'tour');

insert into hop_dong_chi_tiet
values
(1,1,2,3),
(2,2,1,2),
(3,3,4,2);

-- task2

select *
from nhan_vien
where (ho_ten like ('H%')
or ho_ten like ('T%')
or ho_ten like ('K%')) and CHARACTER_LENGTH(ho_ten)<15;

-- task3

select *
from khach_hang
where ( TIMESTAMPDIFF (YEAR, ngay_sinh, CURDATE())
between 18 and 50) 
and (dia_chi='Đà Nẵng' or dia_chi='Quảng Trị');

-- task 4
select khach_hang.*, count(hop_dong.id_hop_dong) as lan_dat
from khach_hang
inner join hop_dong on khach_hang.id_khach_hang=hop_dong.id_khach_hang
where id_loai_khach=1
group by id_khach_hang
order by lan_dat;

-- task 5

select khach_hang.id_khach_hang, khach_hang.ho_ten,loai_khach.ten_loai_khach,
hop_dong.id_hop_dong,dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc,
 sum(dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia) as tong_tien
from khach_hang
left join loai_khach on khach_hang.id_loai_khach=loai_khach.id_loai_khach
left join hop_dong on khach_hang.id_khach_hang=hop_dong.id_khach_hang
left join dich_vu on hop_dong.id_dich_vu=dich_vu.id_dich_vu
left join hop_dong_chi_tiet on hop_dong.id_hop_dong=hop_dong_chi_tiet.id_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem=dich_vu_di_kem.id_dich_vu_di_kem
group by khach_hang.id_khach_hang, hop_dong.id_hop_dong, tong_tien;


-- task 6


select dich_vu.id_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue,
loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.id_loai_dich_vu=loai_dich_vu.id_loai_dich_vu
join hop_dong on dich_vu.id_dich_vu=hop_dong.id_dich_vu
where dich_vu.id_dich_vu not in (select hop_dong.id_dich_vu from hop_dong where
 (year(ngay_lam_hop_dong)=2019) and (month(ngay_lam_hop_dong) in (01,02,03)));

-- task 7

select dich_vu.id_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da,
dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.id_loai_dich_vu=loai_dich_vu.id_loai_dich_vu
join hop_dong on dich_vu.id_dich_vu=hop_dong.id_dich_vu
where year(ngay_lam_hop_dong)=2018 and year(ngay_lam_hop_dong) not in
 (select year(ngay_lam_hop_dong)	from hop_dong where (year(ngay_lam_hop_dong)=2019));



-- task 8
-- Cách 1:
select khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten;
-- Cách 2:
select distinct khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten;
-- Cách 3:
select khach_hang.ho_ten
from khach_hang
union
select khach_hang.ho_ten
from khach_hang;

-- task 9

select month(ngay_lam_hop_dong) as "Thang", 
sum(dich_vu.chi_phi_thue +hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia) as "Tong tien",
count(hop_dong.id_khach_hang) as "So khach thue dich vu"
from hop_dong
join dich_vu on hop_dong.id_dich_vu=dich_vu.id_dich_vu
join hop_dong_chi_tiet on hop_dong.id_hop_dong=hop_dong_chi_tiet.id_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem=dich_vu_di_kem.id_dich_vu_di_kem
where year(ngay_lam_hop_dong)=2019
group by month(ngay_lam_hop_dong);

-- task 10

select hop_dong.id_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,
count(ID_hop_dong_chi_tiet) as so_luong_dich_vu_di_kem
from hop_dong
left join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
group by id_hop_dong;