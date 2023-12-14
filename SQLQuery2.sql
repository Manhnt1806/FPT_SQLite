﻿-- TẠO BẢNG KHÁCH HÀNG
IF OBJECT_ID('KHACHHANG') IS NOT NULL
	DROP TABLE KHACHHANG
GO
CREATE TABLE KHACHHANG (
	MAKH varchar(10) PRIMARY KEY NOT NULL,
	HOKH nvarchar (10) NOT NULL,
	TENLOTKH nvarchar(10),
	TENKH nvarchar(10) NOT NULL,
	TENCTYKH nvarchar(40),
	SONHAKH nvarchar(10),
	TENQUANKH nvarchar(20),
	TENTPKH nvarchar(20),
	SOTKKH varchar(20),
	MASOTHUE varchar(20)
)
-- TẠO BẢNG SẢN PHẨM
IF OBJECT_ID('SANPHAM') IS NOT NULL
	DROP TABLE SANPHAM
GO
CREATE TABLE SANPHAM (
	MASP varchar(10) PRIMARY KEY NOT NULL,
	TENSANPHAM nvarchar(40) NOT NULL,
	DONVITINH nvarchar(10) NOT NULL,
	GIA int NOT NULL
)
-- TẠO BẢNG HÓA ĐƠN
IF OBJECT_ID('HOADON') IS NOT NULL
	DROP TABLE HOADON
GO
CREATE TABLE HOADON (
	SOHOADON varchar(10) PRIMARY KEY NOT NULL,
	NGAYTAO datetime NOT NULL,
	HTHUCTHANHTOAN nvarchar(10),
	VAT FLOAT,
	MAKH varchar(10)
)
-- TẠO BẢNG CHI TIẾT HÓA ĐƠN
IF OBJECT_ID('CTHOADON') IS NOT NULL
	DROP TABLE CTHOADON
GO
CREATE TABLE CTHOADON(
	STTMUAHANG int,
	SOLUONG int,
	SOHOADON varchar(10),
	--FOREIGN KEY REFERENCES HOADON,
	MASP varchar(10) 
)

	--C1: Tạo khóa phụ không có tên		
ALTER TABLE HOADON ADD FOREIGN KEY(MAKH) REFERENCES KHACHHANG
	--C2; TẠO KHÓA PHỤ CÓ TÊN GỌI
ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY(MAKH)
REFERENCES KHACHHANG

-- SỬ DỤNG CÂU LỆNH TRUY VẤN TÌM LẠI TÊN KHÓA PHỤ CỦA BẢNG
SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'HOADON'

--XÓA KHÓA PHỤ
ALTER TABLE HOADON DROP CONSTRAINT FK_HOADON_MAKH_34C8D9D1
ALTER TABLE HOADON DROP CONSTRAINT FK_HOADON_KHACHHANG

-- Tạo khóa chính thông qua alter table
ALTER TABLE HOADON ADD CONSTRAINT PK_HOADON PRIMARY KEY(MAHD)

--tẠO RÀNG BUỘC FUY NHẤT - UNIQUE CHO MÃ KHÁCH HÀNG 
ALTER TABLE KHACHHANG ADD CONSTRAINT UNQ_KHACHHANG_MAKH UNIQUE(MAKH)
--tẠO RÀNG BUỘC FUY NHẤT - UNIQUE CHO MÃ SỐ THUẾ
ALTER TABLE KHACHHANG ADD CONSTRAINT UNQ_KHACHHANG_MASOTHUE UNIQUE(MASOTHUE)

--TẠO RÀNG BUỘC KIỂM TRA GIÁ SẢN PHẨM > 0
ALTER TABLE SANPHAM ADD CONSTRAINT CHK_SANPHAM_GIA_MIN CHECK(GIA > 0)


--tHÊM DỮ LIỆU VÀO BẢNG
--C1: INSERT INTO + TÊN BẢNG + VALUES(+ CÁC GIÁ TRỊ TƯƠNG ĐƯƠNG VỚI CÁC CỘT TRONG BẢNG)
--THÊM DỮ LIỆU VÀO BẢNG SẢN PHẨM
INSERT INTO SANPHAM VALUES('SP01', 'IPHONE 15', N'chiếc', 20000000)
--C2: insert into + tên bảng(cot1, cot2,...) + values(vcot1, vcot2,...)
insert into KHACHHANG(MAKH, HOKH, TENKH, MASOTHUE) VALUES('KH01', N'Vũ', N'Thúy', '01')



