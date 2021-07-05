create database Furama;
use furama;
create table loai_khach(
ID_loai_khach int primary key,
ten_loai_khach varchar(45));
create table kieu_thue(
ID_kieu_thue int primary key,
ten_kieu_thue varchar(45),
gia int);
create table loai_dich_vu(
ID_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(45));
create table vi_tri(
ID_vi_tri int primary key,
ten_vi_tri varchar(45));
create table trinh_do(
ID_trinh_do int primary key,
trinh_do varchar(45));
create table bo_phan(
ID_bo_phan int primary key,
ten_bo_phan varchar(45));
create table dich_vu_di_kem(
ID_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(45),
gia int,
don_vi int,
trang_thai_kha_dung varchar(45));
create table khach_hang(
ID_khach_hang int primary key,
ID_loai_khach int,
ho_ten varchar(45),
ngay_sinh date,
so_CMTND varchar(45),
SDT varchar(45),
Email varchar(45),
dia_chi varchar(45),
foreign key (ID_loai_khach) references loai_khach(ID_loai_khach)on update cascade on delete cascade) ;
create table dich_vu(
ID_dich_vu int primary key,
ten_dich_vu varchar(45),
dien_tich int,
so_tang int,
so_nguoi_toi_da varchar(45),
chi_phi_thue varchar(45),
ID_kieu_thue int,
ID_loai_dich_vu int,
trang_thai varchar(45),
foreign key(ID_kieu_thue) references kieu_thue(ID_kieu_thue) on update cascade on delete cascade,
foreign key(ID_loai_dich_vu) references loai_dich_vu(ID_loai_dich_vu)on update cascade on delete cascade
);
create table nhan_vien(
ID_nhan_vien int primary key,
ho_ten varchar(45),
ID_vi_tri int,
ID_trinh_do int,
ID_bo_phan int,
ngay_sinh date,
so_CMTND varchar(45),
luong varchar(45),
sdt varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key(ID_vi_tri) references vi_tri(ID_vi_tri) on update cascade on delete cascade,
foreign key(ID_trinh_do) references trinh_do(ID_trinh_do) on update cascade on delete cascade,
foreign key(ID_bo_phan) references bo_phan(ID_bo_phan) on update cascade on delete cascade);
create table hop_dong(
ID_hop_dong int primary key,
ID_nhan_vien int,
ID_khach_hang int,
ID_dich_vu int,
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc int,
tong_tien int null,
foreign key (ID_nhan_vien) references nhan_vien(ID_nhan_vien) on update cascade on delete cascade,
foreign key(ID_khach_hang) references khach_hang(ID_khach_hang) on update cascade on delete cascade,
foreign key(ID_dich_vu) references dich_vu(ID_dich_vu)on update cascade on delete cascade);
create table hop_dong_chi_tiet(
ID_hop_dong_chi_tiet int primary key,
ID_hop_dong int,
ID_dich_vu_di_kem int,
so_luong int,
foreign key(ID_hop_dong) references hop_dong(ID_hop_dong) on update cascade on delete cascade,
foreign key(ID_dich_vu_di_kem) references dich_vu_di_kem(ID_dich_vu_di_kem)on update cascade on delete cascade
);

-- insert data 
insert into loai_khach 
values (1,'Diamond'),(2,'Platinium'),(3,'Gold'),(4,'Silver'),(5,'Member');
insert into kieu_thue
values(1,'day',10000),(2,'week',20000),(3,'month',30000);
insert into loai_dich_vu
values (1,'Villa'),(2,'House'),(3,'Room');
insert into vi_tri
values(1,'le tan'),(2,'phuc vu'),(3,'chuyen vien'),
(4,'giam sat'),(5,'quan ly'),(6,'giam doc');
insert into trinh_do
values (1,'trung cap'),(2,'cao dang'),(3,'dai hoc'), (4,'sau dai hoc');
insert into bo_phan
values (1,'sale – marketing'),(2,'hanh chinh'),(3,'phuc vu'),(4,'quan ly');
insert into dich_vu_di_kem
values (1,'massage',1000,1,'co'),(2,'karaoke',2000,2,'khong'),
(3,'thuc an',3000,3,'co'),(4,'nuoc uong',4000,4,'khong'),(5,'thue xe',5000,5,'co');
insert into khach_hang
values(1,2,'Nguyen Van A','2000-01-01','123456789','123456789','nguyen@van.a','da nang'),
(2,5,'Nguyen Van B','2005-10-10','12345678','12345678','nguyen@van.b','quang tri'),
(3,2,'Nguyen Van C', '1991-01-20','1234567','1234567','nguyen@van.c','vinh'),
(4,1,'Nguyen Van B','1995-05-07','123456','654321','nguyen@van.d','quang ngai'),
(5,2,'Nguyen Van A', '1999-08-26','12345','54321','nguyen@van.e','quang tri');
insert into dich_vu
values (1,'Villa1',100,2,10,10000,2,1,'co'),(2,'Villa2',120,3,8,9000,3,1,'co'),(3,'Villa3',150,3,15,8000,3,1,'khong'),
(4,'House1',90,2,10,7000,2,2,'khong'),(5,'House2',80,2,8,6000,1,2,'co'),(6,'House3',120,3,2,5000,2,2,'co'),
(7,'Room1',70,1,6,4000,2,3,'co'),(8,'Room2',60,1,5,3000,1,3,'khong'),(9,'Room3',50,1,5,2000,1,3,'khong');
insert into nhan_vien
values(1,'Tran Van Hoa',1,1,1,'1991-10-10','9876554321','987654321','1111111','tran@van.a','123 tran van a'),
(2,'Tran Van Trung',2,2,2,'1995-10-10','876554321','87654321','222222','tran@van.b','hai chau'),
(3,'Tran Van tran van tran van Khanh',3,3,3,'1999-10-10','76554321','7654321','333333','tran@van.c','hai chau'),
(4,'Tran Khang abc',4,2,2,'2000-10-10','554321','54321','44444','tran@van.d','123 tran van d'),
(5,'Tran Khanh',5,4,4,'1981-10-10','54321','321','55555','tran@van.e','123 tran van e'),
(6,'Tran Van F',6,4,4,'1971-10-10','123456789','123456789','666666','tran@van.f','123 tran van f'),
(7,'Hoa',1,2,3,'1995-10-10','123456789','123456789','666666','tran@van.f','123 tran van f'),
(8,'Trung',2,3,4,'1997-11-11','123456789','123456789','666666','tran@van.f','123 tran van f');

insert into hop_dong
values(1,1,1,1,'2019-1-06','2019-10-25',5000,null),(2,2,2,2,'2019-12-12','2018-11-25',7000,null),
(3,3,3,3,'2015-04-06','2019-12-12',10000,null),(4,3,3,3,'2019-05-06','2019-04-25',10000,null),
(5,2,4,1,'2019-05-12','2019-05-25',10000,null),(6,3,3,2,'2019-11-12','2019-12-25',10000,null),
(7,5,1,3,'2019-02-12','2019-05-25',10000,null),(8,4,2,1,'2019-10-22','2019-12-25',10000,null),
(9,3,3,4,'2019-05-22','2019-07-25',10000,null),(10,3,3,7,'2016-05-22','2016-07-25',10000,null);
insert into hop_dong_chi_tiet
values(1,1,2,2),(2,2,1,1),(3,3,5,2),(4,2,1,3),(5,5,3,11),(6,3,5,5),(7,6,2,3);
