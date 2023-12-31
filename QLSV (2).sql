﻿IF OBJECT_ID('SINHVIEN') IS NOT NULL
	DROP TABLE SINHVIEN
GO
CREATE TABLE SINHVIEN(
	TENSV nvarchar(15) NOT NULL,
	MASV varchar(10) PRIMARY KEY,
	EMAIL varchar(20) NOT NULL,
	NGAYSINH date NOT NULL,
	SODIENTHOAI varchar(15) NOT NULL,
	MANGANH varchar(10) NOT NULL,
)

IF OBJECT_ID('MONHOC') IS NOT NULL
	DROP TABLE MONHOC
GO
CREATE TABLE MONHOC(
	TENMON nvarchar(15) NOT NULL,
	MAMON varchar(10) PRIMARY KEY,
	THOIGIANHOC nvarchar(20) NOT NULL,
	MANGANH varchar(10) NOT NULL,
)

IF OBJECT_ID('NGANHHOC') IS NOT NULL
	DROP TABLE NGANHHOC
GO
CREATE TABLE NGANHHOC(
	TENNGANH nvarchar(15) NOT NULL,
	MANGANH varchar(10) PRIMARY KEY,
)

IF OBJECT_ID('SV_MON') IS NOT NULL
	DROP TABLE SV_MON
GO
CREATE TABLE SV_MON(
	MASV varchar(10) NOT NULL,
	MAMON varchar(10) NOT NULL,
)

--- SỬ DỤNG CÂU LỆNH ALTER TABLE ĐỂ TẠO KHÁO PHỤ
ALTER TABLE MONHOC ADD FOREIGN KEY (MANGANH) 
REFERENCES NGANHHOC;
ALTER TABLE SINHVIEN ADD FOREIGN KEY (MANGANH)
REFERENCES NGANHHOC;
ALTER TABLE SV_MON ADD FOREIGN KEY (MASV)
REFERENCES SINHVIEN;
ALTER TABLE SV_MON ADD FOREIGN KEY (MAMON)
REFERENCES MONHOC;
