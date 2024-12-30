
create table KHACHHANG 
(
    MAKH CHAR (4) PRIMARY KEY,
    HOTEN VARCHAR (40),
    DCHI VARCHAR (50),
    SODT VARCHAR (20),
    NGSINH DATETIME,
    NGDKY DATETIME,
    DOANHSO MONEY
)
GO
ALTER TABLE KHACHHANG ADD CONSTRAINT CON_KTRA CHECK (NGDKY > NGSINH)

ALTER TABLE KHACHHANG ADD LOAIKH TINYINT
GO
ALTER TABLE KHACHHANG ADD ID_LOAIKH VARCHAR(20)
GO
alter table KHACHHANG alter COLUMN ID_LOAIKH TINYINT 
GO
ALTER TABLE KHACHHANG 
ADD CONSTRAINT FK_LOAIKH FOREIGN KEY (ID_LOAIKH) REFERENCES dbo.LOAIKH(ID_LOAIKH);
GO



CREATE TABLE NHANVIEN
(
    MANV CHAR(4) PRIMARY KEY,
    HOTEN VARCHAR (40),
    SODT VARCHAR(20),
    NGVL DATETIME
)
GO

CREATE TABLE SANPHAM  
(
    MASP CHAR (4) PRIMARY KEY,
    TENSP VARCHAR (40),
    DVT VARCHAR (20),
    NUOCSX VARCHAR (40),
    GIA MONEY

)
ALTER TABLE SANPHAM ADD GHICHU VARCHAR (20)
GO
ALTER TABLE SANPHAM ALTER COLUMN GHICHU VARCHAR (100)
GO
ALTER TABLE SANPHAM DROP COLUMN GHICHU
GO

ALTER TABLE SANPHAM ADD CONSTRAINT CON_DVT CHECK (DVT IN ('cay', 'hop', 'cai', 'quyen', 'chuc'))
GO

ALTER TABLE SANPHAM ADD CONSTRAINT CON_GIA CHECK (GIA >= 500)
CREATE TABLE HOADON 
(
    SOHD INT PRIMARY KEY,
    NGHD DATETIME,
    MAKH CHAR(4),
    MANV CHAR(4),
    TRIGIA MONEY,
    FOREIGN KEY (MAKH) REFERENCES dbo.KHACHHANG (MAKH)
)
GO

CREATE TABLE CTHD 
(
    SOHD INT NOT NULL,
    MASP CHAR(4) NOT NULL,
    SL INT,
    PRIMARY KEY (SOHD, MASP),
    FOREIGN KEY (SOHD) REFERENCES dbo.HOADON (SOHD),
    FOREIGN KEY (MASP) REFERENCES dbo.SANPHAM (MASP)

)
ALTER TABLE CTHD ADD CONSTRAINT CON_SL CHECK (SL >= 1)

CREATE TABLE LOAIKH
(
    ID_LOAIKH TINYINT PRIMARY KEY,
    LOAIKH VARCHAR (20)
)
INSERT INTO LOAIKH ( ID_LOAIKH, LOAIKH ) 
VALUES (1, N'Vang lai'), 
       (2, N'Thuong xuyen'), 
       (3, N'VIP')

INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) 
VALUES ('NV03', 'Nguyen Nhu Nhut', '0927345678', '2006-04-13'),
       ('NV02', 'Le Thi Phi Yen', '0987567390', '2006-04-21'),
       ('NV04', 'Nguyen Van B', '0997047382', '2006-04-27'),
       ('NV06', 'Ngo Thanh Tuan', '0913758498', '2006-06-24'),
       ('NV05', 'Nguyen Thi Truc Thanh', '0918590387', '2006-07-20');

INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDKY) 
VALUES 
       ('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','1960-10-22', 13060000 ,'2006-07-22'),
('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','1974-04-03',280000,'2006-07-30'),
('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','1980-06-12',3860000,'2006-05-08'),
('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','1965-03-09',250000,'2006-02-10'),
('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','1950-03-10',21000,'2006-10-28'),
('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','1981-12-31',915000,'2006-11-24'),
('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','1971-04-06',12500,'2006-01-12'),
('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','1971-01-10',365000,'2006-12-13'),
('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','1979-09-03',70000,'2007-01-14'),
('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','1983-05-02',67500,'2007-01-16');


INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) 
VALUES 
(1001, '2006-07-23', 'KH01', 'NV01', 320000),
(1002, '2006-08-12', 'KH01', 'NV02', 840000),
(1003, '2006-08-23', 'KH02', 'NV01', 100000),
(1004, '2006-09-01', 'KH02', 'NV01', 180000),
(1005, '2006-10-20', 'KH01', 'NV02', 3800000),
(1006, '2006-10-16', 'KH01', 'NV03', 2430000),
(1007, '2006-10-28', 'KH03', 'NV03', 510000),
(1008, '2006-10-28', 'KH01', 'NV03', 440000),
(1009, '2006-10-28', 'KH03', 'NV04', 200000),
(1010, '2006-11-01', 'KH01', 'NV01', 5200000),
(1011, '2006-11-04', 'KH04', 'NV03', 250000),
(1012, '2006-11-30', 'KH05', 'NV03', 21000),
(1013, '2006-12-12', 'KH06', 'NV01', 5000),
(1014, '2006-12-31', 'KH03', 'NV02', 3150000),
(1015, '2007-01-01', 'KH06', 'NV01', 910000),
(1016, '2007-01-01', 'KH07', 'NV02', 12500),
(1017, '2007-01-02', 'KH08', 'NV03', 35000),
(1018, '2007-01-13', 'KH08', 'NV03', 330000),
(1019, '2007-01-13', 'KH01', 'NV03', 30000),
(1020, '2007-01-14', 'KH09', 'NV04', 70000),
(1021, '2007-01-16', 'KH10', 'NV03', 67500),
(1022, '2007-01-16', NULL, 'NV03', 7000),
(1023, '2007-01-17', NULL, 'NV01', 330000);

INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES 
('BC01','But chi','cay','Singapore',3000),
('BC02','But chi','cay','Singapore',5000),
('BC03','But chi','cay','Viet Nam',3500),
('BC04','But chi','hop','Viet Nam',30000),
('BB01','But bi','cay','Viet Nam',5000),
('BB02','But bi','cay','Trung Quoc',7000),
('BB03','But bi','hop','Thai Lan',100000),
('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500),
('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500),
('TV03','Tap 100 giay tot','quyen','Viet Nam',3000),
('TV04','Tap 200 giay tot','quyen','Viet Nam',5500),
('TV05','Tap 100 trang','chuc','Viet Nam',23000),
('TV06','Tap 200 trang','chuc','Viet Nam',53000),
('TV07','Tap 100 trang','chuc','Trung Quoc',34000),
('ST01','So tay 500 trang','quyen','Trung Quoc',40000),
('ST02','So tay loai 1','quyen','Viet Nam',55000),
('ST03','So tay loai 2','quyen','Viet Nam',51000),
('ST04','So tay','quyen','Thai Lan',55000),
('ST05','So tay mong','quyen','Thai Lan',20000),
('ST06','Phan viet bang','hop','Viet Nam',5000),
('ST07','Phan khong bui','hop','Viet Nam',7000),
('ST08','Bong bang','cai','Viet Nam',1000),
('ST09','But long','cay','Viet Nam',5000),
('ST10','But long','cay','Trung Quoc',7000);


INSERT INTO CTHD (SOHD, MASP, SL) 
VALUES 
(1001, 'TV02', 10),
(1001, 'ST01', 5),
(1001, 'BC01', 5),
(1001, 'BC02', 10),
(1001, 'ST08', 10),
(1002, 'BC04', 20),
(1002, 'BB01', 20),
(1002, 'BB02', 20),
(1003, 'BB03', 10),
(1004, 'TV01', 20),
(1004, 'TV02', 10),
(1004, 'TV03', 10),
(1004, 'TV04', 10),
(1005, 'TV05', 50),
(1005, 'TV06', 50),
(1006, 'ST01', 30),
(1006, 'ST02', 10),
(1006, 'TV07', 20),
(1007, 'ST03', 10),
(1008, 'ST04', 8),
(1009, 'ST05', 10),
(1010, 'TV07', 50),
(1010, 'ST07', 50),
(1010, 'ST08', 100),
(1010, 'ST04', 50),
(1010, 'TV03', 100),
(1011, 'ST06', 50),
(1012, 'ST07', 3),
(1013, 'ST08', 5),
(1014, 'BC02', 80),
(1014, 'BB01', 50),
(1014, 'BB02', 100),
(1014, 'BC04', 60),
(1015, 'BB02', 30),
(1015, 'BB03', 7),
(1016, 'TV01', 5),
(1017, 'TV02', 1),
(1017, 'TV03', 1),
(1017, 'TV04', 5),
(1018, 'ST04', 6),
(1019, 'ST05', 1),
(1019, 'ST06', 2),
(1020, 'ST07', 10),
(1021, 'ST08', 5),
(1021, 'TV01', 7),
(1021, 'TV02', 10),
(1022, 'ST07', 1),
(1023, 'ST04', 6);

SELECT DISTINCT MASP 
FROM CTHD 
WHERE MASP NOT IN (SELECT MASP FROM SANPHAM);

DELETE FROM CTHD 
WHERE MASP NOT IN (SELECT MASP FROM SANPHAM);

SELECT * INTO SANPHAM1 FROM SANPHAM

SELECT * INTO KHACHHANG1 FROM KHACHHANG

-- Cập nhật giá tăng 5% cho những sản phẩm do "Thai Lan" sản xuất
UPDATE SANPHAM1
SET GIA = GIA * 1.05
WHERE NUOCSX = 'Thai Lan';

-- Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).
UPDATE SANPHAM1
SET GIA = GIA * 0.95
WHERE NUOCSX = 'Trung Quoc' AND GIA <= 10000

-- Cập nhật giá trị LOAIKH là "Vip" cho những khách hàng đáp ứng điều kiện
ALTER TABLE KHACHHANG1 
ALTER COLUMN LOAIKH VARCHAR(10);

UPDATE KHACHHANG1
SET LOAIKH = 'Vip'
WHERE 
    (NGDKY < '2007-01-01' AND DOANHSO >= 10000000) 
    OR 
    (NGDKY >= '2007-01-01' AND DOANHSO >= 2000000);

-- 1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
select MASP, TENSP from SANPHAM
WHERE NUOCSX = 'Trung Quoc'

-- 2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP, TENSP
FROM SANPHAM 
WHERE DVT = 'cay' or DVT = 'quyen'

-- 3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP LIKE 'B%01';

-- 4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' AND GIA BETWEEN 30000 AND 40000;

-- 5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX IN ('Trung Quoc', 'Thai Lan') AND GIA BETWEEN 30000 AND 40000;

-- 6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD IN ('2007-01-01', '2007-01-02');

-- 7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA
FROM HOADON
WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
ORDER BY NGHD ASC, TRIGIA DESC;

-- 8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT distinct KH.MAKH, KH.HOTEN from KHACHHANG as KH, HOADON as HD
WHERE HD.NGHD = '2007-01-01' and KH.MAKH = HD.MAKH

-- 9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SELECT DISTINCT HD.SOHD, HD.TRIGIA
FROM HOADON AS HD, NHANVIEN AS NV
WHERE HD.MANV = NV.MANV
AND NV.HOTEN = 'Nguyen Van B'
AND HD.NGHD = '2006-10-28';

-- 10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT DISTINCT SP.MASP, SP.TENSP
FROM HOADON AS HD, KHACHHANG AS KH, CTHD AS CT, SANPHAM AS SP
WHERE HD.SOHD = CT.SOHD
AND CT.MASP = SP.MASP
AND HD.MAKH = KH.MAKH
AND KH.HOTEN = 'Nguyen Van A'
AND MONTH(HD.NGHD) = 10
AND YEAR(HD.NGHD) = 2006;

-- 11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02');

-- III. Câu 12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT DISTINCT SOHD
FROM CTHD
WHERE (MASP = 'BB01' AND SL >= 10 AND SL <= 20 ) OR (MASP = 'BB02' AND SL >= 10 AND SL <= 20)

-- III. Câu 13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT a.SOHD
FROM CTHD a, CTHD b
WHERE a.SOHD = b.SOHD AND (a.MASP = 'BB01' AND a.SL BETWEEN 10 AND 20) AND (b.MASP = 'BB02' AND b.SL BETWEEN 10 and 20)

-- III. Câu 14 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
SELECT distinct SANPHAM.MASP, TENSP
FROM SANPHAM, HOADON, CTHD
WHERE (NUOCSX = 'Trung Quoc' OR NGHD = '1/1/2007') AND SANPHAM.MASP = CTHD.MASP AND CTHD.SOHD = HOADON.SOHD

-- III. Câu 15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
SELECT SANPHAM.MASP, TENSP
FROM SANPHAM
LEFT JOIN CTHD ON CTHD.MASP = SANPHAM.MASP 
WHERE CTHD.MASP IS NULL

-- III. Câu 16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP
LEFT JOIN CTHD C ON SP.MASP = C.MASP
LEFT JOIN HOADON H ON C.SOHD = H.SOHD AND YEAR(H.NGHD) = 2006
WHERE H.SOHD IS NULL;

-- III. Câu 17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
SELECT distinct SANPHAM.MASP, TENSP
FROM SANPHAM
LEFT JOIN CTHD ON CTHD.MASP = SANPHAM.MASP AND NUOCSX = 'TRUNG QUOC'
LEFT JOIN HOADON ON HOADON.SOHD = CTHD.SOHD AND NGHD = 2006
WHERE HOADON.SOHD IS NULL

-- III. Câu 18. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
SELECT HOADON.SOHD
FROM HOADON
JOIN CTHD ON CTHD.SOHD = HOADON.SOHD 
JOIN SANPHAM ON SANPHAM.MASP = CTHD.MASP
WHERE YEAR(NGHD) = 2006 AND NUOCSX = 'Singapore'
GROUP BY HOADON.SOHD
HAVING COUNT(distinct CTHD.MASP) = (select count (*) 
                                          from SANPHAM
                                          where NUOCSX = 'Singapore')

-- III. 19. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT * FROM KHACHHANG
WHERE NGDKY IS NULL

-- III. 20. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT MASP) AS SLSPKHACNHAU
FROM HOADON, CTHD
WHERE HOADON.SOHD = CTHD.SOHD AND YEAR(NGHD) = 2006

-- III. 21. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu?
SELECT MAX(TRIGIA) AS GIACAONHAT, MIN (TRIGIA) AS GIATHAPNHAT
FROM HOADON

-- III. 22. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(TRIGIA) AS TBINH
FROM HOADON
WHERE YEAR(NGHD) = 2006

-- III. 23. Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2006

-- III. 24. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT MAX(TRIGIA) AS HOADONCAONHAT
FROM HOADON

-- III. 25. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT TOP 1 HOTEN
FROM KHACHHANG, HOADON
WHERE KHACHHANG.MAKH = HOADON.MAKH AND YEAR(NGHD) = 2006 
ORDER BY TRIGIA DESC

-- III. 26. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
SELECT TOP 3 HOTEN, KHACHHANG.MAKH, DOANHSO
FROM KHACHHANG
ORDER BY DOANHSO DESC

-- III. 27. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA IN (
    SELECT DISTINCT TOP 3 GIA
    FROM SANPHAM
    ORDER BY GIA desc
)

-- III. 28. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Thai Lan' AND GIA IN (
                                  SELECT DISTINCT TOP 3 GIA
                                  FROM SANPHAM
                                  ORDER BY GIA desc
)
-- III. 29. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' AND GIA IN (
                                  SELECT DISTINCT TOP 3 GIA
                                  FROM SANPHAM
                                  WHERE NUOCSX = 'Trung Quoc'
                                  ORDER BY GIA desc
)

-- III. 30. * In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
SELECT TOP 3 HOTEN, MAKH, DOANHSO
FROM KHACHHANG
ORDER BY DOANHSO DESC

-- III. 31. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT COUNT(MASP) as SLSPTrungQuoc
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'

-- III. 32. Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(MASP) as SLSP
FROM SANPHAM
GROUP BY NUOCSX

-- III. 33. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT NUOCSX, MAX(GIA) AS GIACAONHAT, MIN(GIA) AS GIATHAPNHAT, AVG(GIA) AS GIATB
FROM SANPHAM
GROUP BY NUOCSX

-- III. 34. Tính doanh thu bán hàng mỗi ngày.
SELECT NGHD, SUM(TRIGIA) AS TONGDOANHTHU
FROM HOADON
GROUP BY NGHD

-- III. 35. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT MASP, SUM(CTHD.SL) AS TONGSL
FROM HOADON, CTHD
WHERE HOADON.SOHD = CTHD.SOHD AND MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006
GROUP BY MASP

-- III. 36. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DOANHTHU
FROM HOADON 
WHERE YEAR(NGHD) = 2006 
GROUP BY MONTH(NGHD)

-- III. 37. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT SOHD
FROM CTHD
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP) >= 4

-- III. 38. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT HOADON.SOHD
FROM HOADON, SANPHAM
WHERE NUOCSX = 'Viet Nam' 
GROUP BY SOHD
HAVING COUNT (DISTINCT MASP) = 3

-- III. 39. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT MAKH, HOTEN
FROM KHACHHANG 
WHERE MAKH = (
SELECT TOP 1 MAKH
FROM HOADON
GROUP BY MAKH
ORDER BY COUNT(MAKH) DESC
)

-- III. 40. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT TOP 1 MONTH(NGHD) AS THANG, SUM(TRIGIA) AS DOANHSO
FROM HOADON 
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
ORDER BY DOANHSO DESC

-- III. 41. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP = (
    SELECT TOP 1 MASP
    FROM CTHD 
    GROUP BY MASP
    ORDER BY SUM (SL) ASC 
)

-- III. 42. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT NUOCSX, MASP, TENSP, GIA
FROM SANPHAM AS SP1
WHERE GIA = (
    SELECT MAX(GIA)
    FROM SANPHAM SP2
    WHERE SP1.NUOCSX = SP2.NUOCSX
)

-- III. 43. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT NUOCSX
FROM SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3

-- III. 44. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
SELECT TOP 1 MAKH, COUNT(SOHD) AS PurchaseCount
FROM HOADON
WHERE MAKH IN (
    SELECT TOP 10 MAKH
    FROM HOADON
    GROUP BY MAKH
    ORDER BY SUM(TRIGIA) DESC
)
GROUP BY MAKH
ORDER BY PurchaseCount DESC;

-- LAB05
-- 11. Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày khách hàng đó đăng ký thành viên (NGDK).
ALTER TABLE KHACHHANG DROP CONSTRAINT CON_KTRA;
GO
ALTER TABLE KHACHHANG ADD CONSTRAINT CON_KTRA CHECK (NGDKY >= NGSINH);
GO

-- 12. Ngày bán hàng (NGHD) của một nhân viên phải lớn hơn hoặc bằng ngày nhân viên đó vào làm.
CREATE TRIGGER trg_KiemTraNgayBanHang
ON HOADON
AFTER INSERT, UPDATE
AS
BEGIN
    -- Kiểm tra từng dòng vừa được insert hoặc update
    IF EXISTS(SELECT * FROM inserted i INNER JOIN NHANVIEN nv ON nv.MANV = i.MANV WHERE i.NGHD < nv.NGVL)
		BEGIN
        -- Nếu có dòng nào vi phạm, hủy bỏ thao tác
		  RAISERROR ('Ngày bán hàng phải lớn hơn hoặc bằng ngày nhân viên vào làm', 16, 1)
		  ROLLBACK TRANSACTION
          RETURN;
		END
END;
GO


--13. Trị giá của một hóa đơn là tổng thành tiền (số lượng*đơn giá) của các chi tiết thuộc hóa đơn đó.
--14. Doanh số của một khách hàng là tổng trị giá các hóa đơn mà khách hàng thành viên đó đã mua.
--Cái này mình sẽ sử dụng trigger để update

--Trigger update lại doanh số cho khách hàng và trigia cho hóa đơn
CREATE TRIGGER trg_UpdateDoanhSo_Trigia
ON CTHD
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	--update lại trigia hóa đơn
	UPDATE HOADON
	SET TRIGIA = (
		SELECT SUM(CTHD.SL * SANPHAM.GIA)
		FROM CTHD
		INNER JOIN SANPHAM ON SANPHAM.MASP = CTHD.MASP
		WHERE CTHD.SOHD = HOADON.SOHD
	)
	FROM HOADON
	INNER JOIN inserted i ON HOADON.SOHD = i.SOHD
	

    -- Update doanh số cho khách hàng
    UPDATE KHACHHANG
    SET DOANHSO = (SELECT SUM(TRIGIA) FROM HOADON WHERE MAKH = KHACHHANG.MAKH)
    FROM KHACHHANG
    INNER JOIN HOADON ON HOADON.MAKH = KHACHHANG.MAKH
    INNER JOIN inserted i ON i.SOHD = HOADON.SOHD
END;
GO
-- Trigger sau khi xóa hóa đơn
CREATE TRIGGER trg_DeleteHoaDon
ON HOADON
AFTER DELETE
AS
BEGIN
    UPDATE KHACHHANG
    SET DOANHSO = (SELECT SUM(TRIGIA) FROM HOADON WHERE MAKH = KHACHHANG.MAKH)
    FROM KHACHHANG
    INNER JOIN deleted d ON d.MAKH = KHACHHANG.MAKH;
END;
GO
-- Trigger sau khi cập nhật hóa đơn
CREATE TRIGGER trg_UpdateHoaDon
ON HOADON
AFTER UPDATE
AS
BEGIN
    UPDATE KHACHHANG
    SET DOANHSO = (SELECT SUM(TRIGIA) FROM HOADON WHERE MAKH = KHACHHANG.MAKH)
    FROM KHACHHANG
    INNER JOIN inserted i ON i.MAKH = KHACHHANG.MAKH;
END;
GO