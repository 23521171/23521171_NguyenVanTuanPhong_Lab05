-- Tạo bảng KHOA
CREATE TABLE KHOA 
(
	MAKHOA VARCHAR(4),
	TENKHOA VARCHAR(40),
	NGTLAP SMALLDATETIME,
	TRGKHOA CHAR(4)
	CONSTRAINT PK_KHOA PRIMARY KEY (MAKHOA)
)
GO
-- Tạo bảng MONHOC
CREATE TABLE MONHOC
(
	MAMH VARCHAR(10),
	TENMH VARCHAR(40),
	TCLT TINYINT,
	TCTH TINYINT,
	MAKHOA VARCHAR(4),
	CONSTRAINT PK_MONHOC PRIMARY KEY (MAMH),
)
GO
-- Tạo bảng DIEUKIEN
CREATE TABLE DIEUKIEN
(
	MAMH VARCHAR(10),
	MAMH_TRUOC VARCHAR(10),
	CONSTRAINT PK_DIEUKIEN PRIMARY KEY (MAMH, MAMH_TRUOC)
)
GO
-- Tạo bảng GIAOVIEN
CREATE TABLE GIAOVIEN
(
	MAGV CHAR(4),
	HOTEN VARCHAR(40),
	HOCVI VARCHAR(10),
	HOCHAM VARCHAR(10),
	GIOITINH VARCHAR(3),
	NGSINH SMALLDATETIME,
	NGVL SMALLDATETIME,
	HESO NUMERIC(4,2),
	MUCLUONG MONEY,
	MAKHOA VARCHAR(4)
	CONSTRAINT PK_GIAOVIEN PRIMARY KEY (MAGV)
)
GO
-- Tạo bảng HOCVIEN
CREATE TABLE HOCVIEN
(
	MAHV CHAR(5),
	HO VARCHAR(40),
	TEN VARCHAR(10),
	NGSINH SMALLDATETIME,
	GIOITINH VARCHAR(3),
	NOISINH VARCHAR(40),
	MALOP CHAR(3),
	CONSTRAINT PK_HOCVIEN PRIMARY KEY (MAHV)
)
GO
-- Tạo bảng LOP
CREATE TABLE LOP
(
	MALOP CHAR(3),
	TENLOP VARCHAR(40),
	TRGLOP CHAR(5),
	SISO TINYINT,
	MAGVCN CHAR(4)
	CONSTRAINT PK_LOP PRIMARY KEY (MALOP)
)
GO
-- Tạo bảng GIANGDAY
CREATE TABLE GIANGDAY
(
	MALOP CHAR(3),
	MAMH VARCHAR(10),
	MAGV CHAR(4),
	HOCKY TINYINT,
	NAM SMALLINT,
	TUNGAY SMALLDATETIME,
	DENNGAY SMALLDATETIME
	CONSTRAINT PK_GIANGDAY PRIMARY KEY (MALOP, MAMH),
)
GO
-- Tạo bảng KETQUATHI
CREATE TABLE KETQUATHI
(
	MAHV CHAR(5),
	MAMH VARCHAR(10),
	LANTHI TINYINT,
	NGTHI SMALLDATETIME,
	DIEM NUMERIC(4,2),
	KQUA VARCHAR(10)
	CONSTRAINT PK_KETQUATHI PRIMARY KEY (MAHV, MAMH, LANTHI)
)
INSERT INTO KHOA (MAKHOA, TENKHOA, NGTLAP, TRGKHOA)
VALUES 
    ('KHMT', 'Khoa hoc may tinh', '2005-06-07', 'GV01'),
    ('HTTT', 'He thong thong tin', '2005-06-07', 'GV02'),
    ('CNPM', 'Cong nghe phan mem', '2005-06-07', 'GV04'),
    ('MTT', 'Mang va truyen thong', '2005-10-20', 'GV03'),
    ('KTMT', 'Ky thuat may tinh', '2005-12-20', NULL);
INSERT INTO LOP (MALOP, TENLOP, TRGLOP, SISO, MAGVCN)
VALUES 
    ('K11', 'Lop 1 khoa 1', 'K1108', 11, 'GV07'),
    ('K12', 'Lop 2 khoa 1', 'K1205', 12, 'GV09'),
    ('K13', 'Lop 3 khoa 1', 'K1305', 12, 'GV14');
INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA)
VALUES 
    ('THDC', 'Tin hoc dai cuong', 4, 1, 'KHMT'),
    ('CTRR', 'Cau truc roi rac', 5, 2, 'KHMT'),
    ('CSDL', 'Co so du lieu', 3, 1, 'HTTT'),
    ('CTDLGT', 'Cau truc du lieu va giai thuat', 3, 1, 'KHMT'),
    ('PTTKTT', 'Phan tich thiet ke thuat toan', 3, 0, 'KHMT'),
    ('DHMT', 'Do hoa may tinh', 3, 1, 'KHMT'),
    ('KTMT', 'Kien truc may tinh', 3, 0, 'KTMT'),
    ('TKCSDL', 'Thiet ke co so du lieu', 3, 1, 'HTTT'),
    ('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', 3, 1, 'HTTT'),
    ('HDH', 'He dieu hanh', 4, 1, 'KTMT'),
    ('NMCCNPM', 'Nhap mon cong nghe phan mem', 3, 1, 'CNPM'),
    ('LTCFW', 'Lap trinh C for win', 3, 1, 'CNPM'),
    ('LTHDT', 'Lap trinh huong doi tuong', 3, 1, 'CNPM');
INSERT INTO GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY)
VALUES 
    ('K11', 'THDC', 'GV07', 1, 2006, '2006-02-01', '2006-12-05'),
    ('K12', 'THDC', 'GV06', 1, 2006, '2006-02-01', '2006-12-05'),
    ('K13', 'THDC', 'GV15', 1, 2006, '2006-02-01', '2006-12-05'),
    ('K11', 'CTRR', 'GV02', 1, 2006, '2006-09-01', '2006-05-17'),
    ('K12', 'CTRR', 'GV02', 1, 2006, '2006-09-01', '2006-05-17'),
    ('K13', 'CTRR', 'GV08', 1, 2006, '2006-09-01', '2006-05-17'),
    ('K11', 'CSDL', 'GV05', 2, 2006, '2006-06-01', '2006-07-15'),
    ('K12', 'CSDL', 'GV09', 2, 2006, '2006-06-01', '2006-07-15'),
    ('K13', 'CTDLGT', 'GV15', 2, 2006, '2006-06-01', '2006-07-15'),
    ('K13', 'DHMT', 'GV07', 3, 2006, '2006-08-01', '2006-12-15'),
    ('K11', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
    ('K12', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
    ('K13', 'HDH', 'GV04', 3, 2007, '2007-02-01', '2007-02-18'),
    ('K12', 'HDH', 'GV04', 3, 2007, '2007-02-01', '2007-02-18'),
    ('K11', 'DHMT', 'GV07', 1, 2007, '2007-02-18', '2007-03-20');
INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA)
VALUES
    ('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '1950-05-02', '2004-11-01', 5.00, 2250000, 'KHMT'),
    ('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '1965-12-17', '2004-11-15', 4.50, 2025000, 'HTTT'),
    ('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '1950-08-01', '2004-09-23', 4.00, 1800000, 'CNPM'),
    ('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam', '1960-01-22', '2004-11-15', 4.50, 2025000, 'KTMT'),
('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam', '1958-12-03', '2005-01-12', 3.00, 1350000, 'HTTT'),
    ('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '1953-03-11', '2005-01-12', 4.50, 2025000, 'KHMT'),
    ('GV07', 'Nguyen Minh Tien', 'ThS', 'GV', 'Nam', '1971-11-23', '2005-01-12', 4.00, 1800000, 'CNPM'),
    ('GV08', 'Le Thi Tran', 'KS', 'Null', 'Nu', '1974-03-26', '2005-05-15', 1.69, 760500, 'KHMT'),
    ('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu', '1966-12-31', '2005-03-01', 4.00, 1800000, 'HTTT'),
    ('GV10', 'Le Tran Anh Loan', 'KS', 'Null', 'Nu', '1972-07-17', '2005-05-15', 1.86, 837000, 'CNPM'),
    ('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '1980-12-12', '2005-05-15', 2.67, 1201500, 'MTT'),
    ('GV12', 'Tran Van Anh', 'CN', 'Null', 'Nam', '1981-03-29', '2005-05-15', 1.69, 760500, 'CNPM'),
    ('GV13', 'Nguyen Linh Dan', 'CN', 'Null', 'Nu', '1983-05-23', '2005-05-15', 1.69, 760500, 'MTT'),
    ('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '1976-11-30', '2005-03-10', 3.00, 1350000, 'MTT'),
    ('GV15', 'Le Ha Thanh', 'ThS', 'GV', 'Nam', '1978-04-05', '2005-05-15', 3.00, 1350000, 'KHMT');
INSERT INTO DIEUKIEN (MAMH, MAMH_TRUOC)
VALUES
    ('CSDL', 'CTRR'),
    ('CSDL', 'CTDLGT'),
    ('CTDLGT', 'THDC'),
    ('PTTKTT', 'THDC'),
    ('PTTKTT', 'CTDLGT'),
    ('DHMT', 'THDC'),
    ('LTHDT', 'THDC'),
    ('PTTKHTTT', 'CSDL');
-- Nhập dữ liệu cho HOCVIEN 
INSERT INTO HOCVIEN (MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP)
VALUES
('K1101','Nguyen Van','A','1986-01-27','Nam','TpHCM','K11'),
('K1102','Tran Ngoc','Han','1986-03-01','Nu','Kien Giang','K11'),
('K1103','Ha Duy','Lap','1986-04-18','Nam','Nghe An','K11'),
('K1104','Tran Ngoc','Linh','1986-03-30','Nu','Tay Ninh','K11'),
('K1105','Tran Minh','Long','1986-02-27','Nam','TpHCM','K11'),
('K1106','Le Nhat','Minh','1986-01-24','Nam','TpHCM','K11'),
('K1107','Nguyen Nhu','Nhut','1986-01-27','Nam','Ha Noi','K11'),
('K1108','Nguyen Manh','Tam','1986-02-27','Nam','Kien Giang','K11'),
('K1109','Phan Thi Thanh','Tam','1986-01-27','Nu','Vinh Long','K11'),
('K1110','Le Hoai','Thuong','1986-02-05','Nu','Can Tho','K11'),
('K1111','Le Ha','Vinh','1986-12-25','Nam','Vinh Long','K11'),
('K1201','Nguyen Van','B','1986-02-11','Nam','TpHCM','K12'),
('K1202','Nguyen Thi Kim','Duyen','1986-01-18','Nu','TpHCM','K12'),
('K1203','Tran Thi Kim','Duyen','1986-09-17','Nu','TpHCM','K12'),
('K1204','Truong My','Hanh','1986-05-19','Nu','Dong Nai','K12'),
('K1205','Nguyen Thanh','Nam','1986-04-17','Nam','TpHCM','K12'),
('K1206','Nguyen Thi Truc','Thanh','1986-03-04','Nu','Kien Giang','K12'),
('K1207','Tran Thi Bich','Thuy','1986-02-08','Nu','Nghe An','K12'),
('K1208','Huynh Thi Kim','Trieu','1986-04-08','Nu','Tay Ninh','K12'),
('K1209','Pham Thanh','Trieu','1986-02-23','Nam','TpHCM','K12'),
('K1210','Ngo Thanh','Tuan','1986-02-14','Nam','TpHCM','K12'),
('K1211','Do Thi','Xuan','1986-03-09','Nu','Ha Noi','K12'),
('K1212','Le Thi Phi','Yen','1986-03-12','Nu','TpHCM','K12'),
('K1301','Nguyen Thi Kim','Cuc','1986-06-09','Nu','Kien Giang','K13'),
('K1302','Truong Thi My','Hien','1986-03-18','Nu','Nghe An','K13'),
('K1303','Le Duc','Hien','1986-03-12','Nam','Tay Ninh','K13'),
('K1304','Le Quang','Hien','1986-04-18','Nam','TpHCM','K13'),
('K1305','Le Thi','Huong','1986-03-27','Nu','TpHCM','K13'),
('K1306','Nguyen Thai','Huu','1986-03-30','Nam','Ha Noi','K13'),
('K1307','Tran Minh','Man','1986-05-28','Nam','TpHCM','K13'),
('K1308','Nguyen Hieu','Nghia','1986-04-08','Nam','Kien Giang','K13'),
('K1309','Nguyen Trung','Nghia','1987-01-18','Nam','Nghe An','K13'),
('K1310','Tran Thi Hong','Tham','1986-04-22','Nu','Tay Ninh','K13'),
('K1311','Tran Minh','Thuc','1986-04-04','Nam','TpHCM','K13'),
('K1312','Nguyen Thi Kim','Yen','1986-09-07','Nu','TpHCM','K13');

INSERT INTO KETQUATHI (MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA)
VALUES 
('K1101','CSDL',1,'2006-07-20',10.00,'Dat'),
('K1101','CTDLGT',1,'2006-12-28',9.00,'Dat'),
('K1101','THDC',1,'2006-05-20',9.00,'Dat'),
('K1101','CTRR',1,'2006-05-13',9.50,'Dat'),
('K1102','CSDL',1,'2006-07-20',4.00,'Khong Dat'),
('K1102','CSDL',2,'2006-07-27',4.25,'Khong Dat'),
('K1102','CSDL',3,'2006-08-10',4.50,'Khong Dat'),
('K1102','CTDLGT',1,'2006-12-28',4.50,'Khong Dat'),
('K1102','CTDLGT',2,'2007-01-05',4.00,'Khong Dat'),
('K1102','CTDLGT',3,'2007-01-15',6.00,'Dat'),
('K1102','THDC',1,'2006-05-20',5.00,'Dat'),
('K1102','CTRR',1,'2006-05-13',7.00,'Dat'),
('K1103','CSDL',1,'2006-07-20',3.50,'Khong Dat'),
('K1103','CSDL',2,'2006-07-27',8.25,'Dat'),
('K1103','CTDLGT',1,'2006-12-28',7.00,'Dat'),
('K1103','THDC',1,'2006-05-20',8.00,'Dat'),
('K1103','CTRR',1,'2006-05-13',6.50,'Dat'),
('K1104','CSDL',1,'2006-07-20',3.75,'Khong Dat'),
('K1104','CTDLGT',1,'2006-12-28',4.00,'Khong Dat'),
('K1104','THDC',1,'2006-05-20',4.00,'Khong Dat'),
('K1104','CTRR',1,'2006-05-13',4.00,'Khong Dat'),
('K1104','CTRR',2,'2006-05-20',3.50,'Khong Dat'),
('K1104','CTRR',3,'2006-06-30',4.00,'Khong Dat'),
('K1201','CSDL',1,'2006-07-20',6.00,'Dat'),
('K1201','CTDLGT',1,'2006-12-28',5.00,'Dat'),
('K1201','THDC',1,'2006-05-20',8.50,'Dat'),
('K1201','CTRR',1,'2006-05-13',9.00,'Dat'),
('K1202','CSDL',1,'2006-07-20',8.00,'Dat'),
('K1202','CTDLGT',1,'2006-12-28',4.00,'Khong Dat'),
('K1202','CTDLGT',2,'2007-01-05',5.00,'Dat'),
('K1202','THDC',1,'2006-05-20',4.00,'Khong Dat'),
('K1202','THDC',2,'2006-05-27',4.00,'Khong Dat'),
('K1202','CTRR',1,'2006-05-13',3.00,'Khong Dat'),
('K1202','CTRR',2,'2006-05-20',4.00,'Khong Dat'),
('K1202','CTRR',3,'2006-06-30',6.25,'Dat'),
('K1203','CSDL',1,'2006-07-20',9.25,'Dat'),
('K1203','CTDLGT',1,'2006-12-28',9.50,'Dat'),
('K1203','THDC',1,'2006-05-20',10.00,'Dat'),
('K1203','CTRR',1,'2006-05-13',10.00,'Dat'),
('K1204','CSDL',1,'2006-07-20',8.50,'Dat'),
('K1204','CTDLGT',1,'2006-12-28',6.75,'Dat'),
('K1204','THDC',1,'2006-05-20',4.00,'Khong Dat'),
('K1204','CTRR',1,'2006-05-13',6.00,'Dat'),
('K1301','CSDL',1,'2006-12-20',4.25,'Khong Dat'),
('K1301','CTDLGT',1,'2006-07-25',8.00,'Dat'),
('K1301','THDC',1,'2006-05-20',7.75,'Dat'),
('K1301','CTRR',1,'2006-05-13',8.00,'Dat'),
('K1302','CSDL',1,'2006-12-20',6.75,'Dat'),
('K1302','CTDLGT',1,'2006-07-25',5.00,'Dat'),
('K1302','THDC',1,'2006-05-20',8.00,'Dat'),
('K1302','CTRR',1,'2006-05-13',8.50,'Dat'),
('K1303','CSDL',1,'2006-12-20',4.00,'Khong Dat'),
('K1303','CTDLGT',1,'2006-07-25',4.50,'Khong Dat'),
('K1303','CTDLGT',2,'2006-08-07',4.00,'Khong Dat'),
('K1303','CTDLGT',3,'2006-08-15',4.25,'Khong Dat'),
('K1303','THDC',1,'2006-05-20',4.50,'Khong Dat'),
('K1303','CTRR',1,'2006-05-13',3.25,'Khong Dat'),
('K1303','CTRR',2,'2006-05-20',5.00,'Dat'),
('K1304','CSDL',1,'2006-12-20',7.75,'Dat'),
('K1304','CTDLGT',1,'2006-07-25',9.75,'Dat'),
('K1304','THDC',1,'2006-05-20',5.50,'Dat'),
('K1304','CTRR',1,'2006-05-13',5.00,'Dat'),
('K1305','CSDL',1,'2006-12-20',9.25,'Dat'),
('K1305','CTDLGT',1,'2006-07-25',10.00,'Dat'),
('K1305','THDC',1,'2006-05-20',8.00,'Dat'),
('K1305','CTRR',1,'2006-05-13',10.00,'Dat');
--Thêm khóa ngoại
ALTER TABLE LOP ADD CONSTRAINT FK_TL_HV FOREIGN KEY (TRGLOP) REFERENCES HOCVIEN(MAHV)
ALTER TABLE LOP ADD	CONSTRAINT FK_GVCN_GV FOREIGN KEY (MAGVCN) REFERENCES GIAOVIEN(MAGV) 
ALTER TABLE HOCVIEN ADD CONSTRAINT FK_MALOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_MAKHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_MAMH FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_MALOP_2 FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_MAGV FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE KHOA ADD CONSTRAINT FK_TRGKHOA_GV FOREIGN KEY (TRGKHOA) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE MONHOC ADD CONSTRAINT FK_MAKHOA_2 FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_MAMH_TRUOC FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC(MAMH)
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_MAMH_2 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_MAHV FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV)
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_MAMH_3 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
GO


ALTER TABLE HOCVIEN 
ADD CONSTRAINT CK_AGE CHECK (DATEDIFF(YEAR, NGSINH, GETDATE()) >= 18);
GO

ALTER TABLE GIANGDAY 
ADD CONSTRAINT CK_DATE CHECK (TUNGAY < DENNGAY);
GO

ALTER TABLE GIAOVIEN 
ADD CONSTRAINT CK_AGE_GIAOVIEN CHECK (DATEDIFF(YEAR, NGSINH, GETDATE()) >= 22);
GO

ALTER TABLE MONHOC 
ADD CONSTRAINT CK_TINCHI CHECK (ABS(TCLT - TCTH) <= 3);
GO

SELECT H.MAHV, H.HO + ' ' + H.TEN AS HỌ_TÊN, H.NGSINH, L.MALOP
FROM HOCVIEN H
JOIN LOP L ON H.MALOP = L.MALOP
WHERE H.MAHV = L.TRGLOP;  

SELECT H.MAHV, H.HO + ' ' + H.TEN AS HỌ_TÊN, K.LANTHI, K.DIEM
FROM KETQUATHI K
JOIN HOCVIEN H ON K.MAHV = H.MAHV
WHERE K.MAMH = 'CTRR' AND H.MALOP = 'K12'
ORDER BY H.HO, H.TEN;


SELECT DISTINCT H.MAHV, H.HO + ' ' + H.TEN AS HỌ_TÊN, K.MAMH
FROM KETQUATHI K
JOIN HOCVIEN H ON K.MAHV = H.MAHV
WHERE K.LANTHI = 1 AND K.KQUA = 'Dat';

SELECT H.MAHV, H.HO + ' ' + H.TEN AS HỌ_TÊN
FROM KETQUATHI K
JOIN HOCVIEN H ON K.MAHV = H.MAHV
WHERE K.MAMH = 'CTRR' AND K.KQUA = 'Khong dat' AND H.MALOP = 'K11' AND K.LANTHI = 1;

SELECT H.MAHV, H.HO + ' ' + H.TEN AS HỌ_TÊN
FROM HOCVIEN H
WHERE H.MALOP LIKE 'K%' AND NOT EXISTS (
    SELECT 1
    FROM KETQUATHI K
    WHERE K.MAHV = H.MAHV AND K.MAMH = 'CTRR' AND K.KQUA = 'Dat'
);

-- 1. Tăng hệ số lương thêm 0.2 cho những giáo viên là trưởng khoa.
UPDATE GIAOVIEN
SET HESO = HESO + 0.2
FROM GIAOVIEN, KHOA
WHERE GIAOVIEN.MAGV = TRGKHOA 

-- 2. Cập nhật giá trị điểm trung bình tất cả các môn học (DIEMTB) của mỗi học viên 
--(tất cả các môn học đều có hệ số 1 và nếu học viên thi một môn nhiều lần, chỉ lấy điểm của lần thi sau cùng).
ALTER TABLE HOCVIEN 
ADD DIEMTB NUMERIC (4,2)

UPDATE HOCVIEN
SET DIEMTB = (
    SELECT AVG(DIEM)
    FROM KETQUATHI
    WHERE KETQUATHI.MAHV = HOCVIEN.MAHV AND
    LANTHI = (SELECT MAX(LANTHI)
              FROM KETQUATHI
              WHERE KETQUATHI.MAHV = HOCVIEN.MAHV
    )
)

-- 3. Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất kỳ thi lần thứ 3 dưới 5 điểm.
ALTER TABLE HOCVIEN
ADD GHICHU VARCHAR (255)

UPDATE HOCVIEN
SET GHICHU = 'CAMTHI'
WHERE MAHV IN ( SELECT MAHV
                FROM KETQUATHI
                WHERE LANTHI = 3 AND DIEM < 5
)


-- 4. Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau:

   --o Nếu DIEMTB  9 thì XEPLOAI =”XS”
   --o Nếu 8  DIEMTB < 9 thì XEPLOAI = “G”
   --o Nếu 6.5  DIEMTB < 8 thì XEPLOAI = “K”
   --o Nếu 5  DIEMTB < 6.5 thì XEPLOAI = “TB” 
   --o Nếu DIEMTB < 5 thì XEPLOAI = ”Y”

ALTER TABLE HOCVIEN
ADD XEPLOAI VARCHAR (255)

UPDATE HOCVIEN
SET XEPLOAI = CASE
WHEN DIEMTB >= 9 THEN 'XS'
WHEN DIEMTB >= 8 AND DIEMTB < 9 THEN 'G'
WHEN DIEMTB < 8 AND DIEMTB >= 6.5 THEN 'K'
WHEN DIEMTB >= 5 AND DIEMTB < 6.5 THEN 'TB'
else'Y'
 END

-- 6. Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.
SELECT TENMH
FROM MONHOC, GIANGDAY, GIAOVIEN
WHERE MONHOC.MAMH = GIANGDAY.MAMH AND GIAOVIEN.MAGV = GIANGDAY.MAGV 
AND GIAOVIEN.HOTEN = 'Tran Thanh Tam' AND HOCKY = 1 AND NAM = 2006

-- 7. Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học kỳ 1 năm 2006.
SELECT MONHOC.MAMH, TENMH
FROM MONHOC, LOP, GIANGDAY
WHERE MONHOC.MAMH = GIANGDAY.MAMH 
AND LOP.MALOP = GIANGDAY.MALOP 
AND HOCKY = 1 
AND NAM = 2006 
AND GIANGDAY.MAGV = (SELECT MAGVCN
                    FROM LOP 
                    WHERE MALOP = 'K11')

-- 8. Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”.
SELECT HOCVIEN.HO, HOCVIEN.TEN
FROM HOCVIEN
WHERE HOCVIEN.MAHV = (SELECT LOP.TRGLOP
FROM LOP, GIAOVIEN, GIANGDAY, MONHOC
WHERE LOP.MALOP = GIANGDAY.MALOP AND GIAOVIEN.MAGV = GIANGDAY.MAGV AND MONHOC.MAMH = GIANGDAY.MAMH 
AND GIAOVIEN.HOTEN = 'Nguyen To Lan' AND TENMH = 'Co So Du Lieu')

-- 9. In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du Lieu”.
SELECT 
    mh.MAMH, 
    mh.TENMH
FROM 
    MONHOC mh
JOIN 
    DIEUKIEN dk ON mh.MAMH = dk.MAMH_TRUOC
WHERE 
    dk.MAMH = (SELECT MAMH FROM MONHOC WHERE TENMH = 'Co so du lieu');

-- 9. (Another way)
SELECT MAMH, TENMH
FROM MONHOC
WHERE MAMH IN (SELECT MAMH_TRUOC 
               FROM DIEUKIEN
               WHERE MAMH IN ( SELECT MAMH 
                               FROM MONHOC
                               WHERE TENMH = 'Co so du lieu'        
                             )
               )



-- 10. Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên môn học) nào.
SELECT 
    mh.MAMH, 
    mh.TENMH
FROM 
    MONHOC mh
JOIN 
    DIEUKIEN dk ON mh.MAMH = dk.MAMH
WHERE 
    dk.MAMH_TRUOC = (SELECT MAMH FROM MONHOC WHERE TENMH = 'Cau truc roi rac');

-- 11. Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
SELECT GV.HOTEN
FROM GIANGDAY GD
JOIN GIAOVIEN GV ON GD.MAGV = GV.MAGV
WHERE GD.MAMH = 'CTRR'
  AND GD.HOCKY = 1
  AND GD.NAM = 2006
  AND GD.MALOP IN ('K11', 'K12');

SELECT HOTEN
FROM GIAOVIEN
WHERE MAGV IN (
    SELECT MAGV
    FROM GIANGDAY
    WHERE MAMH = 'CTRR'
      AND MALOP = 'K11'
      AND HOCKY = 1
      AND NAM = 2006
)
AND MAGV IN (
    SELECT MAGV
    FROM GIANGDAY
    WHERE MAMH = 'CTRR'
      AND MALOP = 'K12'
      AND HOCKY = 1
      AND NAM = 2006
);

-- 12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi lại môn này.
SELECT HV.MAHV, HV.HO, HV.TEN
FROM HOCVIEN HV
JOIN KETQUATHI TT ON HV.MAHV = TT.MAHV
WHERE TT.MAMH = 'CSDL'
  AND TT.LANTHI = 1
  AND TT.KQUA = 'Không đạt'
  AND NOT EXISTS (
      SELECT 1
      FROM KETQUATHI TT2
      WHERE TT2.MAHV = HV.MAHV
        AND TT2.MAMH = 'CSDL'
        AND TT2.LANTHI > 1
  );

-- 13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV
LEFT JOIN GIANGDAY PC ON GV.MAGV = PC.MAGV
WHERE PC.MAMH IS NULL;

-- 14. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.
SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV
LEFT JOIN GIANGDAY GD ON GV.MAGV = GD.MAGV
WHERE GD.MAMH IS NULL
AND GV.MAKHOA IN (SELECT MAKHOA FROM GIAOVIEN WHERE MAGV = GV.MAGV);

-- 15. Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm.
SELECT HV.HO, HV.TEN
FROM HOCVIEN HV
JOIN KETQUATHI T ON HV.MAHV = T.MAHV
WHERE HV.MALOP = 'K11'
AND (T.MAMH IS NOT NULL AND T.KQUA = 'Không đạt' AND
     (SELECT COUNT(*) FROM KETQUATHI T2 WHERE T2.MAHV = HV.MAHV) > 3
     OR (T.MAMH = 'CTRR' AND T.LANTHI = 2 AND T.DIEM = 5));

-- 16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.
SELECT GV.HOTEN
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GV.MAGV = GD.MAGV
WHERE GD.MAMH = 'CTRR'
GROUP BY GV.MAGV, GV.HOTEN, GD.HOCKY, GD.NAM
HAVING COUNT(DISTINCT GD.MALOP) >= 2;

-- 17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
SELECT HV.HO, HV.TEN, MAX(T.DIEM) AS DIEM_CSDL
FROM HOCVIEN HV
JOIN KETQUATHI T ON HV.MAHV = T.MAHV
WHERE T.MAMH = 'CSDL'
GROUP BY HV.MAHV, HV.HO, HV.TEN;

-- 18. Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).
SELECT HV.HO, HV.TEN, MAX(T.DIEM) AS DIEM_CSDL
FROM HOCVIEN HV
JOIN KETQUATHI T ON HV.MAHV = T.MAHV
WHERE T.MAMH = 'Co So Du Lieu'
GROUP BY HV.MAHV, HV.HO, HV.TEN;

-- III. 19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
SELECT MAKHOA, TENKHOA
FROM KHOA
WHERE NGTLAP = (
    SELECT MIN (NGTLAP)
    FROM KHOA
)
-- III. 20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
SELECT COUNT(MAGV) AS SOLUONG
FROM GIAOVIEN
WHERE HOCHAM = 'GS' OR HOCHAM = 'PGS'

-- III. 21. Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
SELECT TENKHOA, COUNT(MAGV) AS SOLUONG
FROM KHOA, GIAOVIEN
WHERE GIAOVIEN.MAKHOA = KHOA.MAKHOA AND( HOCVI = 'CN' OR HOCVI = 'KS' OR HOCVI = 'Ths' OR HOCVI = 'TS' OR HOCVI = 'PTS')
GROUP BY TENKHOA

-- III. 22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
SELECT 
    MAMH, 
    KQUA, 
    COUNT(*) AS SoLuongHocVien
FROM 
    KETQUATHI
GROUP BY 
    MAMH, KQUA
ORDER BY 
    MAMH, KQUA;


-- III. 23. Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học.
SELECT GIAOVIEN.MAGV, HOTEN
FROM GIAOVIEN, LOP, GIANGDAY
WHERE GIAOVIEN.MAGV = LOP.MAGVCN AND GIANGDAY.MALOP = LOP.MALOP
GROUP BY GIAOVIEN.MAGV, HOTEN

-- III. 24. Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
SELECT TOP 1 HO, TEN, SISO
FROM HOCVIEN, LOP
WHERE HOCVIEN.MAHV = LOP.TRGLOP
ORDER BY SISO DESC 

--LAB05

-- 9
ALTER TABLE LOP
ADD CONSTRAINT CK_TRGLOP_HOCVIEN
CHECK (TRGLOP IN (SELECT MAHV FROM HOCVIEN WHERE MALOP = LOP.MALOP));
GO

-- 10
CREATE TRIGGER trg_KiemTraTruongKhoa
ON KHOA
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted i INNER JOIN GIAOVIEN gv ON i.TRGKHOA = gv.MAGV 
				WHERE i.MAKHOA <> gv.MAKHOA OR gv.HOCVI NOT IN ('TS', 'PTS'))
        BEGIN
		  RAISERROR('Trưởng khoa phải là giáo viên thuộc khoa và có học vị "TS" hoặc "PTS"', 16, 1)
		  ROLLBACK TRANSACTION
          RETURN;
        END;
END;
GO

-- 19
CREATE TRIGGER trg_KiemTraMucLuongGV
ON GIAOVIEN
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS (SELECT * FROM inserted i 
					INNER JOIN GIAOVIEN gv ON  i.HOCVI = gv.HOCVI AND i.HOCHAM = gv.HOCHAM AND i.HESO = gv.HESO
					WHERE i.MUCLUONG <> gv.MUCLUONG AND i.MAGV <> gv.MAGV)
	BEGIN
		RAISERROR('Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN;
	END;
END;
GO

-- 20
CREATE TRIGGER trg_KiemTraLanThiLai
ON KETQUATHI
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.LANTHI > 1
          AND NOT EXISTS (
              SELECT 1
              FROM KETQUATHI k
              WHERE k.MAHV = i.MAHV
                AND k.MAMH = i.MAMH
                AND k.LANTHI = i.LANTHI - 1
                AND k.DIEM < 5
          )
    )
    BEGIN
        RAISERROR('Học viên chỉ được thi lại khi điểm của lần thi trước đó dưới 5.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END
END;
GO

-- 21
CREATE TRIGGER trg_KiemTraNgayThi
ON KETQUATHI
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.LANTHI > 1
        AND EXISTS (
          SELECT 1
          FROM KETQUATHI k
          WHERE k.MAHV = i.MAHV
            AND k.MAMH = i.MAMH
            AND k.LANTHI = i.LANTHI - 1
            AND k.NGTHI >= i.NGTHI
        )
    )
    BEGIN
        RAISERROR('Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END
END;
GO

-- 22
CREATE TRIGGER trg_KiemTraMonHocTruocSau
ON GIANGDAY
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
		INNER JOIN HOCVIEN hv ON hv.MALOP = i.MALOP
        WHERE EXISTS (
            SELECT 1
            FROM DIEUKIEN dk
            WHERE dk.MAMH = i.MAMH
              AND NOT EXISTS (
				SELECT 1
				FROM KETQUATHI k
				WHERE k.MAHV = hv.MAHV
				AND k.MAMH = dk.MAMH_TRUOC
			  )
        )
    )
    BEGIN
        RAISERROR('Phải học xong các môn tiên quyết trước khi đăng kí môn học này.', 16, 1)
        ROLLBACK TRANSACTION
        RETURN
    END;
END;
GO

-- 23
CREATE TRIGGER trg_KiemTraGiaoVienKhoa
ON GIANGDAY
AFTER INSERT, UPDATE
AS
BEGIN
  IF EXISTS (
    SELECT 1
    FROM inserted i
    INNER JOIN GIAOVIEN gv ON gv.MAGV = i.MAGV
    INNER JOIN MONHOC mh ON mh.MAMH = i.MAMH
    WHERE gv.MAKHOA <> mh.MAKHOA
  )
  BEGIN
    RAISERROR('Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.', 16, 1)
    ROLLBACK TRANSACTION
	RETURN;
  END
END;
GO

