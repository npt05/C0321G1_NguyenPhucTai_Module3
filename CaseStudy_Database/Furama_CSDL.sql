create database Furama;
use Furama;

create table vi_tri(
ID_vi_tri int AUTO_INCREMENT primary key,
ten_vi_tri varchar(45) not null
);

create table trinh_do(
ID_trinh_do int AUTO_INCREMENT primary key,
trinh_do varchar(45) not null
);

create table bo_phan(
ID_bo_phan int AUTO_INCREMENT primary key,
ten_bo_phan varchar(45) not null
);

create table nhan_vien(
ID_nhan_vien int AUTO_INCREMENT primary key,
Ho_Ten varchar(45) not null,
ID_vi_tri int, 
foreign key(ID_vi_tri) references vi_tri(ID_vi_tri),
ID_trinh_do int,
foreign key(ID_trinh_do) references trinh_do(ID_trinh_do),
ID_bo_phan int,
foreign key(ID_bo_phan) references bo_phan(ID_bo_phan),
ngay_sinh date not null,
so_CMDN varchar(45) not null,
luong varchar(45) not null,
SDT varchar(45),
email varchar(45),
dia_chi varchar(45)
);

create table loai_khach(
ID_loai_khach int AUTO_INCREMENT primary key,
ten_loai_khach varchar(45) not null
);

create table khach_hang(
ID_khach_hang int AUTO_INCREMENT primary key,
ID_loai_khach int ,
foreign key(ID_loai_khach) references loai_khach(ID_loai_khach),
ho_ten varchar(45) not null,
ngay_sinh varchar(45),
so_CMND varchar(45) not null,
SDT varchar(45),
email varchar(45),
dia_chi varchar(45)
);

create table kieu_thue(
ID_kieu_thue int AUTO_INCREMENT primary key,
ten_kieu_thue varchar(45) not null,
gia int not null check(gia>=0)
);

create table loai_dich_vu(
ID_loai_dich_vu int AUTO_INCREMENT primary key,
ten_loai_dich_vu varchar(45) not null
);

create table dich_vu(
ID_dich_vu int AUTO_INCREMENT primary key,
Ten_dich_vu varchar(45) not null,
dien_tich int  not null check(dien_tich>0),
so_tang int not null check(so_tang>0),
so_nguoi_toi_da varchar(45),
chi_phi_thue varchar(45) not null check(chi_phi_thue>0),
ID_kieu_thue int not null,
foreign key(ID_kieu_thue) references kieu_thue(ID_kieu_thue),
ID_loai_dich_vu int not null,
foreign key(ID_loai_dich_vu) references loai_dich_vu(ID_loai_dich_vu),
trang_thai varchar(45)
);

create table hop_dong(
ID_hop_dong int AUTO_INCREMENT primary key,
ID_nhan_vien int not null,
foreign key(ID_nhan_vien) references nhan_vien(ID_nhan_vien),
ID_khach_hang int not null,
foreign key(ID_khach_hang) references khach_hang(ID_khach_hang),
ID_dich_vu int not null,
foreign key(ID_dich_vu) references dich_vu(ID_dich_vu),
ngay_lam_hop_dong date not null,
ngay_ket_thuc date not null,
tien_dat_coc int check(tien_dat_coc>=0),
tong_tien int check(tong_tien>0)
);

create table dich_vu_di_kem(
ID_dich_vu_di_kem int AUTO_INCREMENT primary key,
ten_dich_vu_di_kem varchar(45) not null,
gia int check(gia>0),
don_vi int check(don_vi>0),
trang_thai_kha_dung varchar(45)
);

create table hop_dong_chi_tiet(
ID_hop_dong_chi_tiet int AUTO_INCREMENT primary key,
ID_hop_dong int not null,
foreign key(ID_hop_dong) references hop_dong(ID_hop_dong),
ID_dich_vu_di_kem int not null,
foreign key(ID_dich_vu_di_kem) references dich_vu_di_kem(ID_dich_vu_di_kem),
So_luong int
);
