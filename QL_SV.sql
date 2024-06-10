CREATE DATABASE QL_SV
USE QL_SV
CREATE TABLE KHOA
( MAKH CHAR(15) NOT NULL,
TENKH NVARCHAR(30),
CONSTRAINT PK_KHOA PRIMARY KEY(MAKH)
)
CREATE TABLE LOP
(
 MALOP CHAR(15) NOT NULL,
TENLOP NVARCHAR(30),
SISO int,
LOPTRUONG NVARCHAR(40),
MAKH CHAR(15) NOT NULL,
CONSTRAINT PK_LOP PRIMARY KEY(MALOP),
CONSTRAINT FK_KHOA_LOP FOREIGN KEY(MAKH) REFERENCES KHOA(MAKH)
)
CREATE TABLE SINHVIEN
(MASV CHAR(15) NOT NULL,
HOTEN NVARCHAR(40),
NGAYSINH DATE,
GTINH NCHAR(3),
DIACHI NVARCHAR(40),
MALOP CHAR(15),
CONSTRAINT PK_SINHVIEN PRIMARY KEY(MASV),
CONSTRAINT FK_SINHVIEN_LOP FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)                                                                                                                                                                                                                       
)
CREATE TABLE GIANGVIEN
( MAGV CHAR(15) NOT NULL,
TENGV NVARCHAR(30),
MAKH CHAR(15),
CONSTRAINT PK_GIANGVIEN PRIMARY KEY(MAGV),
CONSTRAINT FK_KHOA_GIANGVIEN FOREIGN KEY(MAKH) REFERENCES KHOA(MAKH)
)
CREATE TABLE MONHOC
( MAMH CHAR(15) NOT NULL,
TENMH NVARCHAR(30),
SOTC int,
CONSTRAINT PK_MONHOC PRIMARY KEY(MAMH)
)
CREATE TABLE DIEM
( MASV CHAR(15) ,
 MAMH CHAR(15),
LANTHI int,
DIEMTHI int,
CONSTRAINT PK_DIEM PRIMARY KEY(MASV,MAMH,LANTHI),
CONSTRAINT FK_DIEM_SINHVIEN FOREIGN KEY(MASV) REFERENCES SINHVIEN(MASV),
CONSTRAINT FK_DIEM_MONHOC FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
)
CREATE TABLE GIANGDAY
(
MAGV CHAR(15),
MAMH CHAR(15),
NAMHOC nvarchar(20),
HOCKY int,
CONSTRAINT PK_GIANGDAY PRIMARY KEY(MAGV,MAMH),
CONSTRAINT FK_GIANGDAY_MONHOC FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH),
CONSTRAINT FK_GIANGDAY_GIANGVIEN FOREIGN KEY(MAGV) REFERENCES GIANGVIEN(MAGV)
)
CREATE TABLE THANHNHAN
( MATN CHAR(15) NOT NULL,
HOTEN NVARCHAR(30),
GIOITINH NCHAR(3),
CONSTRAINT PK_THANHNHAN PRIMARY KEY(MATN)
)
CREATE TABLE QUANHE
( MATN CHAR(15) ,
MASV CHAR(15) ,
QUANHE nvarchar(15),
CONSTRAINT PK_QUANHE PRIMARY KEY(MATN,MASV),
CONSTRAINT FK_QUANHE_THANHNHAN FOREIGN KEY(MATN) REFERENCES THANHNHAN(MATN),
CONSTRAINT FK_QUANHE_SINHVIEN FOREIGN KEY(MASV) REFERENCES SINHVIEN(MASV)
)
INSERT INTO KHOA VALUES
('SH', N'Công nghệ sinh học'),
('TH', N'Công nghệ thông tin'),
('TP', N'Công nghệ thực phẩm'),
('QT', N'Quản trị kinh doanh'),
('TC', N'Tài chính kế toán')
INSERT INTO LOP VALUES
('10SHSH1', N'10 Đại học Sinh học 1',55,'SV008','SH'),
('10DHTH1', N'10 Đại học Tin học 1',50,'SV001','TH'),
('11DHTH2', N'11 Đại học Tin học 2',40,'SV005','TH'),
('12DHTC1', N'12 Đại học Tài chính 1',75,'SV009','TC'),
('12DHTP1', N'10 Đại học Thực phẩm 1',60,'SV001','TP')
SET DATEFORMAT dmy;
INSERT INTO SINHVIEN VALUES
('SV001', N'Trần Lệ Quyên', '21-01-1995', N'Nữ', N'TP.HCM', '10DHTH1'),
('SV002', N'Nguyễn Thế Bình', '4-06-1996', N'Nam', N'Tây Ninh','11DHTH2'),
('SV003', N'Tô Ánh Nguyệt', '02-05-1976', N'Nữ', N'Vũng Tàu','12DHTP1'),
('SV004', N'Nguyễn Thế Anh', '15-12-1996', N'Nam', N'Đồng Nai','12DHTP1'),
('SV005', N'Lê Thanh Bình', '09-12-1994', N'Nam', N'Long An','10DHTH1'),
('SV006', N'Phạm Quang Hậu', '12-10-1995', N'Nam', N'Tây Ninh', '10DHTH1'),
('SV007', N'Lê Cẩm Tú', '13-02-1989', N'Nữ', N'Bình Thuận', '12DHTP1'),
('SV008', N'Trương Thế Sang', '04-04-1993', N'Nam', N'Bình Dương', '10SHSH1'),
('SV009', N'Đậu Quang Ánh', '03-12-1994', N'Nam', N'Long An', '12DHTC1'),
('SV010', N'Huỳnh Kim Chi', '18-10-1997', N'Nữ', N'TP.HCM', '11DHTH2'),
('SV011', N'Trịnh Đình Ánh', '15-11-1995', N'Nam', N'Bình Thuận', '10DHTH1')
INSERT INTO GIANGVIEN VALUES
('GV001', N'Phạm Thế Bảo','TH'),
('GV002', N'Lê Thế Quyền','TH'),
('GV003', N'Trương Anh Dũng','SH'),
('GV004', N'Bùi Chí Anh','TC'),
('GV005', N'Lê Công Hậu','QT'),
('GV006', N'Lê Trung Thành','TP')

INSERT INTO MONHOC VALUES
('CSDL', N'Cơ sở dũ liệu',3),
('KTLT', N'Kỹ thuật lâp trình',3),
('THVP', N'Tin học văn phòng',3),
('TRR', N'Toán rời rạc',3),
('TTNT', N'Trí tuệ nhân tạo',2),
('TTQT', N'Thanh toán quốc tế',2)
INSERT INTO DIEM VALUES
('SV001','CSDL', 1,9),
('SV002','THVP', 1,3),
('SV002','THVP', 2,7),
('SV004','THVP', 1,6),
('SV004','TTQT', 1,5),
('SV005','CSDL', 1,3),
('SV005','CSDL', 2,6),
('SV006','KTLT', 1,4),
('SV009','TTQT', 1,4),
('SV010','THVP', 1,8),
('SV010','TRR', 1,7)
INSERT INTO GIANGDAY VALUES
('GV001','CSDL','2021-2022',1),
('GV001','KTLT','2020-2021',2),
('GV001','TTNT','2020-2021',1),
('GV002','CSDL','2021-2022',2),
('GV002','KTLT','2021-2022',2)
INSERT INTO THANHNHAN VALUES
('TN001',N'Nguyễn Thế Thành',N'Nam'),
('TN002',N'Tô Ánh Hồng',N'Nữ'),
('TN003',N'Lê Thanh Anh',N'Nam'),
('TN004',N'Phạm Thanh Tiền',N'Nữ'),
('TN006',N'Đậu Văn Thanh',N'Nam'),
('TN007',N'Nguyễn Thị Ánh',N'Nữ'),
('TN008',N'Lê Quang Định',N'Nam'),
('TN009',N'Huỳnh Văn Tư',N'Nam')
INSERT INTO QUANHE VALUES
('TN001','SV002',N'Bố'),
('TN003','SV005',N'Bố'),
('TN004','SV007',N'Mẹ'),
('TN006','SV009',N'Bố'),
('TN007','SV002',N'Mẹ'),
('TN008','SV005',N'Bố'),
('TN008','SV007',N'Bố')

--Cau2
UPDATE SINHVIEN
SET DIACHI=N'Cần Thơ'
WHERE MASV='SV002'
--CAU 3
--CAU4
SELECT MASV,HOTEN
FROM SINHVIEN 
WHERE SINHVIEN.DIACHI=N'Vũng Tàu'
--Cau5 
SELECT SOTC
FROM MONHOC 
WHERE MONHOC.TENMH=N'Toán rời rạc'
--Cau 6
SELECT TENLOP
FROM LOP,KHOA
WHERE LOP.MAKH=KHOA.MAKH
AND KHOA.TENKH=N'Công nghệ thông tin'
--Cau7
SELECT MASV,HOTEN
FROM SINHVIEN
WHERE HOTEN LIKE N'Nguyễn%' AND GTINH=N'Nam'
--CAU 8
SELECT HOTEN,NGAYSINH,DIACHI
FROM SINHVIEN,LOP
WHERE SINHVIEN.MALOP=LOP.MALOP AND LOP.MALOP='10DHTH1' AND SINHVIEN.GTINH=N'Nam'
--CAU 9 
SELECT TENMH
FROM MONHOC
WHERE MONHOC.SOTC=1 OR MONHOC.SOTC=2 
--cAU 10
SELECT HOTEN,NGAYSINH,DIACHI
FROM SINHVIEN,KHOA,LOP
WHERE LOP.MAKH=KHOA.MAKH AND LOP.MALOP=SINHVIEN.MALOP 
AND KHOA.TENKH=N'Công nghệ thông tin'AND SINHVIEN.GTINH=N'Nữ'
--CAU 11
SELECT HOTEN
FROM SINHVIEN
WHERE SINHVIEN.DIACHI=N'TP.HCM' OR SINHVIEN.DIACHI=N'Vũng Tàu' AND SINHVIEN.GTINH= N'Nữ'
--Cau 12 
SELECT SINHVIEN.*
FROM SINHVIEN,DIEM
WHERE DIEMTHI BETWEEN 6 AND 8
AND MALOP='10DHTH1' AND SINHVIEN.MASV=DIEM.MASV 
--CAU13
SELECT SINHVIEN.*
FROM SINHVIEN,LOP,KHOA,DIEM
WHERE LOP.MAKH=KHOA.MAKH AND LOP.MALOP=SINHVIEN.MALOP AND SINHVIEN.MASV = DIEM.MASV 
AND KHOA.TENKH=N'Công nghệ thông tin' AND  DIEM.MAMH='CSDL' AND DIEM.DIEMTHI>5 
--14
SELECT TENKH,COUNT(*) AS SL
FROM LOP,KHOA
WHERE KHOA.MAKH=LOP.MAKH
GROUP BY TENKH
ORDER BY TENKH DESC
--15
SELECT TENLOP,COUNT(*) AS SL
FROM LOP,SINHVIEN
WHERE LOP.MALOP=SINHVIEN.MALOP
GROUP BY TENLOP
ORDER BY TENLOP DESC
--16
SELECT TENKH,COUNT(*) AS SL
FROM LOP,SINHVIEN,KHOA
WHERE SINHVIEN.MALOP=LOP.MALOP AND LOP.MAKH=KHOA.MAKH 
GROUP BY TENKH
ORDER BY SL ASC
--17 
SELECT SINHVIEN.MASV,HOTEN ,AVG(CAST(DIEMTHI AS FLOAT)) AS DTB
FROM SINHVIEN,DIEM
WHERE SINHVIEN.MASV=DIEM.MASV
GROUP BY SINHVIEN.MASV,HOTEN
--18
SELECT SINHVIEN.MASV,HOTEN,COUNT(*) AS SMH
FROM SINHVIEN,MONHOC,DIEM
WHERE SINHVIEN.MASV=DIEM.MASV AND MONHOC.MAMH=DIEM.MAMH AND SINHVIEN.GTINH=N'Nam'
GROUP BY SINHVIEN.MASV,HOTEN
--19
SELECT TENKH 
FROM LOP,KHOA
WHERE KHOA.MAKH=LOP.MAKH
GROUP BY TENKH
HAVING COUNT(*)>=2
--20
SELECT TENLOP 
FROM LOP,SINHVIEN
WHERE SINHVIEN.MALOP=LOP.MALOP
GROUP BY TENLOP
HAVING COUNT(*)>=2
--21
SELECT TENKH,COUNT(*) AS SL
FROM LOP,SINHVIEN,KHOA
WHERE SINHVIEN.MALOP=LOP.MALOP AND LOP.MAKH=KHOA.MAKH 
GROUP BY TENKH
HAVING COUNT(*)<500
--22
SELECT TENMH
FROM MONHOC,SINHVIEN,DIEM
WHERE MONHOC.SOTC>=2 AND MONHOC.MAMH=DIEM.MAMH AND SINHVIEN.MASV=DIEM.MASV
GROUP BY TENMH
HAVING COUNT(*)>=2
--23 
SELECT TENMH,SOTC
FROM MONHOC
WHERE SOTC=(SELECT MAX(SOTC) FROM MONHOC)
GROUP BY TENMH,SOTC
--24
SELECT MASV,HOTEN,GTINH
FROM SINHVIEN
UNION
SELECT MATN,HOTEN,GIOITINH
FROM THANHNHAN
--25
SELECT SINHVIEN.*
FROM SINHVIEN
INNER JOIN LOP ON SINHVIEN.MALOP=LOP.MALOP AND LOP.MALOP='12DHTP1'
--26
SELECT SINHVIEN.*
FROM SINHVIEN
WHERE MASV NOT IN (SELECT DIEM.MASV FROM MONHOC,DIEM WHERE DIEM.MAMH=MONHOC.MAMH GROUP BY DIEM.MASV )
--27
SELECT SINHVIEN.MASV,HOTEN,MONHOC.MAMH,DIEMTHI
FROM SINHVIEN,MONHOC,DIEM
WHERE SINHVIEN.MASV=DIEM.MASV AND MONHOC.MAMH=DIEM.MAMH
-- 1.1/ p.112 - CHECK CONSTRAINT
ALTER TABLE LOP
ADD CONSTRAINT CHECK_SISO CHECK (SISO >= 20);

ALTER TABLE MONHOC
ADD CONSTRAINT CHECK_SOTC CHECK (SOTC >= 0);

ALTER TABLE DIEM
ADD CONSTRAINT CHECK_DIEMTHI CHECK (DIEMTHI >= 0);

ALTER TABLE DIEM
ADD CONSTRAINT CHECK_LANTHI CHECK (LANTHI <= 5);

ALTER TABLE GIANGDAY
ADD CONSTRAINT CHECK_HOCKY CHECK (HOCKY <= 2);

-- 1.2/ p.112 - UNIQUE CONSTRAINT
ALTER TABLE KHOA
ADD CONSTRAINT UNI_TENKH
  UNIQUE (TENKH);

ALTER TABLE LOP
ADD CONSTRAINT UNI_TENLOP
  UNIQUE (TENLOP);

ALTER TABLE MONHOC
ADD CONSTRAINT UNI_TENMH
  UNIQUE (TENMH);

-- 1.3/ p.112 - DEFAULT CONSTRAINT
ALTER TABLE LOP
ADD CONSTRAINT DF_LOPTRUONG
    DEFAULT 'Chua xac dinh' FOR LOPTRUONG;

ALTER TABLE MONHOC
ADD CONSTRAINT DF_SOTC
    DEFAULT 3 FOR SOTC;
