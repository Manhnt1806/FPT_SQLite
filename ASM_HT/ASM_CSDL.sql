﻿IF OBJECT_ID('SINHVIEN') IS NOT NULL
	DROP TABLE SINHVIEN 
GO
CREATE TABLE SINHVIEN (
	HOSV nvarchar(20) not null, 
	TENSV nvarchar(15) not null,
	MASV nchar(10) PRIMARY KEY not null,
	EMAIL nvarchar(30) not null,
	SDT nchar(12) not null,
	CHUYENNGANH nvarchar(30) not null,
)
IF OBJECT_ID('SACH') IS NOT NULL
	DROP TABLE SACH 
GO
CREATE TABLE SACH (
	MASACH nchar(10) PRIMARY KEY not null,
	TIEUDE nvarchar(30) not null,
	NHAXUATBAN nvarchar(30) not null,
	TACGIA nvarchar(30) not null,
	SOLUONG int,
	BANSAO nchar(10) not null,
	GIATIEN float not null,
	NGAYNHAP date,
	LOAISACH nvarchar(30) not null,
	VITRI nvarchar(30) not null,
	SOTRANG int,
)
IF OBJECT_ID('PHIEUMUON') IS NOT NULL
	DROP TABLE PHIEUMUON
GO
CREATE TABLE PHIEUMUON (
	SOPHIEU int PRIMARY KEY,
	HOSV nvarchar(20) not null,
	TENSV nvarchar(15) not null,
	NGAYMUON date,
	NGAYTRA date,
	MASV nchar(10),
	MALOP nchar(10) not null,
	GHICHU nvarchar(200),
	NHAXUATBAN nvarchar(30) not null,
	MASACH nchar(10),
	SOLUONG int,
)
ALTER TABLE PHIEUMUON ADD FOREIGN KEY (MASV) 
REFERENCES SINHVIEN;
ALTER TABLE PHIEUMUON ADD FOREIGN KEY (MASACH) 
REFERENCES SACH;
ALTER TABLE SACH ADD CONSTRAINT CHK_SACH_SOLUONG check(SOLUONG>1);
ALTER TABLE SACH ADD CONSTRAINT CHK_SACH_GIATIEN check(GIATIEN>0);
ALTER TABLE SACH ADD CONSTRAINT CHK_SACH_SOTRANG check(SOTRANG>5);


INSERT INTO SINHVIEN(MASV, HOSV, TENSV, EMAIL, SDT, CHUYENNGANH) VALUES(N'PD12301', N'Vũ', N'Thúy', N'vuthuy@gmail.com', '0123456789', N'Lập trình')
INSERT INTO SINHVIEN(MASV, HOSV, TENSV, EMAIL, SDT, CHUYENNGANH) VALUES(N'PD12302', N'Nguyễn', N'Mạnh', N'nguyenmanh@gmail.com', '0123456788', N'Lập trình')
INSERT INTO SINHVIEN(MASV, HOSV, TENSV, EMAIL, SDT, CHUYENNGANH) VALUES(N'PD12303', N'Trần', N'Thủy', N'trthuy@gmail.com', '0123456787', N'Marketting')
INSERT INTO SINHVIEN(MASV, HOSV, TENSV, EMAIL, SDT, CHUYENNGANH) VALUES(N'PD12304', N'Nguyễn', N'Gấm', N'nguyengam@gmail.com', '0123456786', N'Thiết kế')
INSERT INTO SINHVIEN(MASV, HOSV, TENSV, EMAIL, SDT, CHUYENNGANH) VALUES(N'PD12305', N'Phạm', N'Thịnh', N'phamthinh@gmail.com', '0123456785', N'Lập trình')

INSERT INTO SACH(MASACH, TIEUDE ,NHAXUATBAN , TACGIA, SOLUONG, BANSAO, GIATIEN, NGAYNHAP, LOAISACH, VITRI, SOTRANG) 
VALUES(N'IT', N'Truyện', N'Kim Đồng', N'Mạnh', 15, '6', 100000, '2016/12/30', N'SQL', N'KE01', 250)
INSERT INTO SACH(MASACH, TIEUDE ,NHAXUATBAN , TACGIA, SOLUONG, BANSAO, GIATIEN, NGAYNHAP, LOAISACH, VITRI, SOTRANG) 
VALUES(N'SQL', N'Truyện', N'Kim Đồng', N'Mạnh', 20, '6', 100000, '2011/03/21', N'SQL', N'KE01', 250)
INSERT INTO SACH(MASACH, TIEUDE ,NHAXUATBAN , TACGIA, SOLUONG, BANSAO, GIATIEN, NGAYNHAP, LOAISACH, VITRI, SOTRANG) 
VALUES(N'WEB', N'Thơ', N'Kim Đồng', N'Mạnh', 25, '6', 100000, '2009/10/20', N'WEB', N'KE01', 250)
INSERT INTO SACH(MASACH, TIEUDE ,NHAXUATBAN , TACGIA, SOLUONG, BANSAO, GIATIEN, NGAYNHAP, LOAISACH, VITRI, SOTRANG) 
VALUES(N'MOBILE', N'cơ sở dữ liệu', N'Kim Đồng', N'Mạnh', 5, '6', 100000, '2010/01/02', N'MOBILE', N'KE01', 250)
INSERT INTO SACH(MASACH, TIEUDE ,NHAXUATBAN , TACGIA, SOLUONG, BANSAO, GIATIEN, NGAYNHAP, LOAISACH, VITRI, SOTRANG) 
VALUES(N'Sale', N'Truyện', N'Kim Đồng', N'Mạnh', 10, '6', 100000, '2020/11/11', N'WEB', N'KE01', 250)

INSERT INTO PHIEUMUON(SOPHIEU, MASV, HOSV, TENSV, MALOP, NGAYMUON, NGAYTRA, MASACH, SOLUONG, NHAXUATBAN, GHICHU) 
VALUES(1, N'PD12301',N'Vũ', N'Thúy', N'CP18103', '2018/01/30', '2018/02/05', N'IT', 21, N'Kim Đồng', N'abcxyz')
INSERT INTO PHIEUMUON(SOPHIEU, MASV, HOSV, TENSV, MALOP, NGAYMUON, NGAYTRA, MASACH, SOLUONG, NHAXUATBAN, GHICHU) 
VALUES(2, N'PD12302', N'Nguyễn', N'Mạnh', N'CP18103', '2017/01/03', '2017/01/08', N'IT', 3, N'Kim Đồng', N'abcxyz')
INSERT INTO PHIEUMUON(SOPHIEU, MASV, HOSV, TENSV, MALOP, NGAYMUON, NGAYTRA, MASACH, SOLUONG, NHAXUATBAN, GHICHU) 
VALUES(3, N'PD12303',N'Trần', N'Thủy', N'CP18104', '2009/01/30', '2009/02/05', N'SQL', 3, N'Kim Đồng', N'abcxyz')
INSERT INTO PHIEUMUON(SOPHIEU, MASV, HOSV, TENSV, MALOP, NGAYMUON, NGAYTRA, MASACH, SOLUONG, NHAXUATBAN, GHICHU) 
VALUES(4, N'PD12304',N'Nguyễn', N'Gấm', N'CP18103', '2017/01/13', '2023-10-20', N'WEB', 3, N'Kim Đồng', N'abcxyz')
INSERT INTO PHIEUMUON(SOPHIEU, MASV, HOSV, TENSV, MALOP, NGAYMUON, NGAYTRA, MASACH, SOLUONG, NHAXUATBAN, GHICHU) 
VALUES(5, N'PD12305',N'Phạm', N'Thịnh', N'CP18105', '2018/01/30', '2022/09/10', N'SQL', 3, N'Kim Đồng', N'abcxyz')

SELECT  TIEUDE, MASACH, GIATIEN, TACGIA FROM SACH WHERE MASACH = N'IT'
SELECT SOPHIEU, MASACH, NGAYMUON, MASV FROM PHIEUMUON WHERE NGAYMUON BETWEEN '2017-01-01' AND '2017-01-31'
SELECT * FROM PHIEUMUON WHERE NGAYTRA > GETDATE() ORDER BY NGAYMUON ASC
SELECT MASACH, TIEUDE, SUM(SOLUONG) AS TONGSOLUONG FROM SACH GROUP BY MASACH, TIEUDE
SELECT SUM(SOLUONG) FROM PHIEUMUON
SELECT * FROM SACH WHERE TIEUDE = N'Truyện'
SELECT MASV, TENSV, SOPHIEU, NGAYMUON, NGAYTRA FROM PHIEUMUON ORDER BY NGAYMUON ASC
SELECT MASACH FROM PHIEUMUON WHERE SOLUONG > 20
SELECT MASACH, TIEUDE ,NHAXUATBAN , TACGIA, SOLUONG, BANSAO,(GIATIEN * 70/100 ) AS GIASALE, NGAYNHAP, LOAISACH, VITRI, SOTRANG FROM SACH WHERE NGAYNHAP < '2014'
DELETE FROM PHIEUMUON WHERE NGAYTRA < '2010-01-01' AND NGAYMUON < '2010-01-01'