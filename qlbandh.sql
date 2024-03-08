create database QLBanDongHo
go
Use QLBanDongHo
go

create table CHUCVU
(
	MaCV Char(5) Primary key,
	TenCV Nvarchar(50)

)

insert CHUCVU values 
('QL', N'Quản lý'),
('BH', N'Bán hàng'),
('GH', N'Giao hàng')

create table NHANVIEN
(
	MaNV Char(5) Primary key,
	TenNV Nvarchar(50),
	SoDT Char(10),
	Gioitinh nvarchar(10),
	Diachi	Nvarchar(100),
	LoaiTK	Char(3),
	ChucVu	Char(5) foreign key references CHUCVU(MaCV)  
)
alter table nhanvien drop column loaitk
--sai 'nv'
insert NHANVIEN values 
('NV01',N'Đào Bá Thành','0889999571',N'Nam',N'538/111 Thành Thái Phường 3 Quận 10', 'NV', 'QL'),
('NV02',N'Đinh Thị Thảo Li', N'Nữ','0903378910', N'35/29 Bế Văn Cấm Phường 7 Quận 7', 'NV', 'BH'),
('NV03',N'Đỗ Khánh Toàn','0903756001', N'Nam', N'Chung Cư Mone Block C', 'NV', 'GH'),
('NV04',N'Đoàn Minh Phú',N'Nam', '0908817517',N'87 Tôn Đản Phường 7 Quận 4', 'NV', 'BH'),
('NV05',N'Đoàn Thị Anh Thư','0903101168', N'Nữ', N'Cao Ốc Thục Lan Quận 7', 'NV', 'BH'),
('NV06',N'Đoàn Thị Tú Anh','0654894251', N'Nữ', N'235 Nguyễn văn quá, Quân 12', 'NV', 'GH')

create table LOAIKH
(
	MaLoai	Char(5) Primary key,
	TenLoai	Nvarchar(50)
)
insert LOAIKH values
('TT', N'Thông thường'),
('VIP', N'Thượng hạng')
create table KhuyenMai
(
MaKM int primary key,
maloaikh char(5) foreign key references loaikh(MaLoai),
giam int
)
insert KhuyenMai values
(1,'TT',5),
(2,'VIP',15)
create table KHACHHANG
(
	MaKH Char(5) Primary key,
	TenKH Nvarchar(50),
	SoDT Char(10),
	Gioitinh nvarchar(10),
	Diachi	Nvarchar(100),
	maLoaiKH	Char(5) foreign key references LOAIKH(MaLoai)  
)

insert KHACHHANG values
('KH01',N'Đào Bá Lộc','0901234561',N'Nam',N'123/12 Đoàn Văn Bơ Quận 4','TT'),
('KH02',N'Lê Quang Liêm','0901234533',N'Nam',N'55/223 Tôn Đản Quận 4','VIP'),
('KH03',N'Hoàng Bảo Châu','0901234533',N'Nữ',N'553/10 Đề Thám Quận 1','VIP'),
('KH04',N'Lê Tấn Đạt','0901234533',	N'Nam','77 Thảo Đièn Quận 2','VIP'),
('KH05',N'Lê Ngọc Vinh','0901234533',N'Nam',N'199 Lê Quang Đạt Quận 9','VIP'),
('KH06', N'Đoàn Thị Anh Trúc','0901234533',N'Nữ',	N'15 Quang Trung quận Gò Vấp','TT')

create table SanPham
(
	Masp Char(5) primary key,
	Tensp Nvarchar(50),
	Dongia int,
	Mota Nvarchar(100),
	Kichthuoc int
)

insert SanPham values
('B01', N'Đồng hồ Casio A1',250000,N'đẹp, phù hợp chị em phụ nữ', '20'),
('B02', N'Đồng hồ Casio A2',200000,N'đẹp, phù hợp chị em phụ nữ', '15'),
('B03', N'Đồng hồ Casio A3',200000,N'đẹp, phù hợp chị em phụ nữ', '15'),
('B04', N'Đồng hồ Casio A4',350000,N'đẹp, phù hợp chị em phụ nữ', '30'),
('B05', N'Đồng hồ Casio A5',270000,N'đẹp, phù hợp chị em phụ nữ', '25')


create table HOADONBAN
(
	MaHDB Char(5) primary key,
	MaNV Char(5) foreign key references NHANVIEN(MaNV),
	MaKH Char(5) foreign key references KHACHHANG(MaKH),
	Masp Char(5) foreign key references SanPham(Masp),
	Soluong	int,
	TongTien Int,
)

insert into HOADONBAN values
('HDB1','NV02','KH01','B01',3,null),
('HDB2', 'NV04','KH02','B02',1,null),
('HDB3', 'NV01','KH03','B03',2,null),
('HDB4','NV02','KH01','B01',5,null),
('HDB5', 'NV03','KH01','B02',4,null),
('HDB6', 'NV02','KH02','B01',6,null)

create table CTBAN
(	id int primary key,
	mahdb Char(5) foreign key references HOADONBAN(MaHDB),
	ngay Date,
	thue int
)
set dateformat dmy
insert CTBAN values
(1,'HDB1','15/10/2022',10),
(2,'HDB2','15/10/2022',10),
(3,'HDB3','15/10/2022',10),
(4,'HDB4','15/10/2022',10),
(5,'HDB5','15/10/2022',10),
(6,'HDB6','15/10/2022',10)

create table NHACUNGCAP
(
	MaNCC Char(5) primary key,
	TenNCC Nvarchar(50),
	Diachi Nvarchar(100),
	SoDT Int
)

insert NHACUNGCAP values
('CC01', N'Công ty Yến Nhi',N'155 Nguyễn Văn Cừ,Q1','0846827349'),
('CC02',N'Công ty TH Truemilk',N'178 Bế Văn Cấm,Q7','0945683584'),
('CC03',N'Công ty Thành Long',N'789 Tô Hiến Thành,Q10','0678335845')

set dateformat dmy

create table HOADONNHAP
(
	MaHDN Char(5) primary key,
	Masp char(5) foreign key references SanPham(masp),
	MaNCC Char(5) foreign key references NHACUNGCAP(MaNCC),
	Ngaynhap Date ,
	TongTien Int,
	MaNV Char(5) foreign key references NHANVIEN(MaNV),
)

insert HOADONNHAP values
('HDN01','B01','CC01','15/10/2022',Null,'NV01'),
('HDN02','B02','CC02','15/10/2022',Null,'NV03'),
('HDN03','B03','CC01','15/10/2022',Null,'NV01'),
('HDN05','B04','CC02','15/10/2022',Null,'NV02')
--TenNhan là tên đồng hồ
create table CTNHAP
(
	MaHDN Char(5) foreign key references HOADONNHAP(MaHDN),
	TenNhan	Nvarchar(50),
	SoLuong	Int,
	DonGia	Int,
)
insert CTNHAP values
('HDN01',N'Đồng hồ Casio A1',50,230000),
('HDN02',N'Đồng hồ Casio A2',50,230000),
('HDN03',N'Đồng hồ Casio A3',50,230000),
('HDN05',N'Đồng hồ Casio A4',50,230000)


create table LOAITK
(
	MaLoai	Char(5) primary key,
	TenLoai	Nvarchar(50)
)

insert LOAITK values
('NV', N'Nhân viên'),
('KH', N'Khách hàng')

create table TAIKHOAN
(
	MaTK	Char(5) primary key,
	TenTK	Nvarchar(50),
	MatKhau	Nvarchar(50),
	LoaiTK	Char(5) foreign key references LOAITK(MaLoai)
)

insert TAIKHOAN values
('TK01', N'Bá Lộc', 'baloc123', 'KH'),
('TK02', N'Bá Thành', 'Thanh123', 'NV'),
('TK03', N'Khánh Toàn', 'Toan321', 'NV')

create table GIAOHANG
(
	MaGH Char(5) primary key,
	NgayGiao Date ,
	MaNV Char(5) foreign key references NHANVIEN(MaNV), 
)
set dateformat dmy
insert GIAOHANG values
('GH01','27/12/2022','NV03'),
('GH02','28/12/2022','NV03'),
('GH03'	,'24/12/2022','NV03')
create table CTGD
(
id_ctgd int primary key,
thoigiannhan date,
makh char(5) foreign key references KhachHang(makh)
)
insert CTGD values
(1,'22/12/2022','KH01')
------------------------------------------
--------- PRC + TRG --------------
------------------------------------------
--1. Khi thêm hoặc sửa dữ liệu trong bản Sản Phẩm, Đơn giá phải lớn hơn 100000.
create TRIGGER trg_01
on SanPham
after update, insert
as 
begin
	declare @count int=0
	select @count = COUNT(*) from inserted where DonGia<100000
	if(@count>0)
	begin 
	print N'Đơn giá phải >100000'
	rollback tran
	end
end

insert into SanPham values ('B07','Đồng hồ Casio A6',90000,N'đẹp, phù hợp chị em phụ nữ',20) -- Vi Pham
insert into SanPham values ('B07','Đồng hồ Casio A6',900000,N'đẹp, phù hợp chị em phụ nữ',20) -- Đúng
select * from SanPham
--2.Cho biết Tên sản phẩm và số lượng bán ra của từng sản phẩm.
create proc sp_SoLuongSP 
as
	select TenSP,Sum(SoLuong) [So luong ban ra]
	from HOADONBAN,SanPham
	where HOADONBAN.Masp = SanPham.Masp
	group by TenSP
go
exec sp_SoLuongSP
--3. Cho biết tên những khách hàng nào đã mua sản phẩm “Nhẫn Vàng A1”.
create proc sp_DanhSachKH_TenSp @tensp nvarchar(50)
as
	if exists (select * from HOADONBAN h, SanPham s where h.Masp = s.Masp and TenSP = @tensp )
		select DISTINCT h.MaKH, TenKH 
		from KHACHHANG k, HOADONBAN h, SANPHAM s 
		where k.MaKH = h.MaKH and h.Masp = s.Masp  and Tensp = @tensp
	else print 'Khong ton tai san pham ten '+ @tensp
go
exec sp_DanhSachKH_TenSp N'Đồng hồ Casio A7' -- báo lỗi
exec sp_DanhSachKH_TenSp N'Đồng hồ Casio A1' -- chạy được
------------------------------------------
--------- PRC + TRG --------------
------------------------------------------
--1.Khi thêm hoặc sửa dữ liệu trong bảng Khách hàng , Họ tên khách hàng phải khác nhau.
--ràng buộc liên bộ
create trigger trg_quan1
on KhachHang 
for insert,update
as
begin
	declare @c int =0
	select @c = count(*) from inserted i, KhachHang K where i.TenKH = K.TenKH
	if @c >1
	begin
		print N'Họ tên khách hàng phải khác nhau'
		rollback tran
	end
end
insert into KHACHHANG values('KH22',N'Trần Nguyễn Hồng Chi','0123456789','Nữ',N'Nguyễn Xiển, Q9','TT')
SELECT * FROM KHACHHANG
--2. Cho biết Tên khách hàng và số tiền mua của từng khách hàng.
create proc sp_SoLuongSPKH
as
	select TenKH ,Sum(h.TongTien) [Tổng Tiền Mua]
	from KHACHHANG k,HOADONBAN h
	where h.MaKH = k.MaKH
	group by TenKH
go
exec sp_SoLuongSPKH
--3.Khi thêm hoặc sửa dữ liệu trong bảng Khách hàng , Số lượng khách hàng loại VIP phải nhỏ hơn hoặc bằng số lượng khách hàng loại TT
create trigger trg_quan2
on KhachHang
after update,insert
as
begin
	declare @countTT int , @countVIP int 
	select @countTT = COUNT(*) from KhachHang where maLoaiKH='TT'
	select @countVIP = COUNT(*) from KhachHang where maLoaiKH='VIP'
	if(@countVIP>@countTT)
	begin 
	print N'Số lượng khách hàng loại VIP phải nhỏ hơn hoặc bằng số lượng khách hàng loại TT'
	rollback tran
	end
end
select * from KHACHHANG
insert into KHACHHANG values('KH11',N'Trần Nguyễn Hồng Chi','0123456789',N'Nữ',N'Nguyễn Xiển, Q9','VIP')