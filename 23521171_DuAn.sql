CREATE DATABASE BTTH_HOMEWORK

-- Tạo bảng Chuyên gia
CREATE TABLE ChuyenGia (
    MaChuyenGia INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    Email NVARCHAR(100),
    SoDienThoai NVARCHAR(20),
    ChuyenNganh NVARCHAR(50),
    NamKinhNghiem INT
);

-- Tạo bảng Công ty
CREATE TABLE CongTy (
    MaCongTy INT PRIMARY KEY,
    TenCongTy NVARCHAR(100),
    DiaChi NVARCHAR(200),
    LinhVuc NVARCHAR(50),
    SoNhanVien INT
);

-- Tạo bảng Dự án
CREATE TABLE DuAn (
    MaDuAn INT PRIMARY KEY,
    TenDuAn NVARCHAR(200),
    MaCongTy INT,
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaCongTy) REFERENCES CongTy(MaCongTy)
);

-- Tạo bảng Kỹ năng
CREATE TABLE KyNang (
    MaKyNang INT PRIMARY KEY,
    TenKyNang NVARCHAR(100),
    LoaiKyNang NVARCHAR(50)
);

-- Tạo bảng Chuyên gia - Kỹ năng
CREATE TABLE ChuyenGia_KyNang (
    MaChuyenGia INT,
    MaKyNang INT,
    CapDo INT,
    PRIMARY KEY (MaChuyenGia, MaKyNang),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaKyNang) REFERENCES KyNang(MaKyNang)
);

-- Tạo bảng Chuyên gia - Dự án
CREATE TABLE ChuyenGia_DuAn (
    MaChuyenGia INT,
    MaDuAn INT,
    VaiTro NVARCHAR(50),
    NgayThamGia DATE,
    PRIMARY KEY (MaChuyenGia, MaDuAn),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaDuAn) REFERENCES DuAn(MaDuAn)
);

-- Chèn dữ liệu mẫu vào bảng Chuyên gia
INSERT INTO ChuyenGia (MaChuyenGia, HoTen, NgaySinh, GioiTinh, Email, SoDienThoai, ChuyenNganh, NamKinhNghiem)
VALUES 
(1, N'Nguyễn Văn An', '1985-05-10', N'Nam', 'nguyenvanan@email.com', '0901234567', N'Phát triển phần mềm', 10),
(2, N'Trần Thị Bình', '1990-08-15', N'Nữ', 'tranthiminh@email.com', '0912345678', N'An ninh mạng', 7),
(3, N'Lê Hoàng Cường', '1988-03-20', N'Nam', 'lehoangcuong@email.com', '0923456789', N'Trí tuệ nhân tạo', 9),
(4, N'Phạm Thị Dung', '1992-11-25', N'Nữ', 'phamthidung@email.com', '0934567890', N'Khoa học dữ liệu', 6),
(5, N'Hoàng Văn Em', '1987-07-30', N'Nam', 'hoangvanem@email.com', '0945678901', N'Điện toán đám mây', 8),
(6, N'Ngô Thị Phượng', '1993-02-14', N'Nữ', 'ngothiphuong@email.com', '0956789012', N'Phân tích dữ liệu', 5),
(7, N'Đặng Văn Giang', '1986-09-05', N'Nam', 'dangvangiang@email.com', '0967890123', N'IoT', 11),
(8, N'Vũ Thị Hương', '1991-12-20', N'Nữ', 'vuthihuong@email.com', '0978901234', N'UX/UI Design', 7),
(9, N'Bùi Văn Inh', '1989-04-15', N'Nam', 'buivaninch@email.com', '0989012345', N'DevOps', 8),
(10, N'Lý Thị Khánh', '1994-06-30', N'Nữ', 'lythikhanh@email.com', '0990123456', N'Blockchain', 4);

-- Chèn dữ liệu mẫu vào bảng Công ty
INSERT INTO CongTy (MaCongTy, TenCongTy, DiaChi, LinhVuc, SoNhanVien)
VALUES 
(1, N'TechViet Solutions', N'123 Đường Lê Lợi, TP.HCM', N'Phát triển phần mềm', 200),
(2, N'DataSmart Analytics', N'456 Đường Nguyễn Huệ, Hà Nội', N'Phân tích dữ liệu', 150),
(3, N'CloudNine Systems', N'789 Đường Trần Hưng Đạo, Đà Nẵng', N'Điện toán đám mây', 100),
(4, N'SecureNet Vietnam', N'101 Đường Võ Văn Tần, TP.HCM', N'An ninh mạng', 80),
(5, N'AI Innovate', N'202 Đường Lý Tự Trọng, Hà Nội', N'Trí tuệ nhân tạo', 120);

-- Chèn dữ liệu mẫu vào bảng Dự án
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES 
(1, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Hoàn thành'),
(2, N'Xây dựng hệ thống phân tích dữ liệu khách hàng', 2, '2023-03-15', '2023-09-15', N'Đang thực hiện'),
(3, N'Triển khai giải pháp đám mây cho doanh nghiệp', 3, '2023-02-01', '2023-08-31', N'Đang thực hiện'),
(4, N'Nâng cấp hệ thống bảo mật cho tập đoàn viễn thông', 4, '2023-04-01', '2023-10-31', N'Đang thực hiện'),
(5, N'Phát triển chatbot AI cho dịch vụ khách hàng', 5, '2023-05-01', '2023-11-30', N'Đang thực hiện');

-- Chèn dữ liệu mẫu vào bảng Kỹ năng
INSERT INTO KyNang (MaKyNang, TenKyNang, LoaiKyNang)
VALUES 
(1, 'Java', N'Ngôn ngữ lập trình'),
(2, 'Python', N'Ngôn ngữ lập trình'),
(3, 'Machine Learning', N'Công nghệ'),
(4, 'AWS', N'Nền tảng đám mây'),
(5, 'Docker', N'Công cụ'),
(6, 'Kubernetes', N'Công cụ'),
(7, 'SQL', N'Cơ sở dữ liệu'),
(8, 'NoSQL', N'Cơ sở dữ liệu'),
(9, 'React', N'Framework'),
(10, 'Angular', N'Framework');

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Kỹ năng
INSERT INTO ChuyenGia_KyNang (MaChuyenGia, MaKyNang, CapDo)
VALUES 
(1, 1, 5), (1, 7, 4), (1, 9, 3),
(2, 2, 4), (2, 3, 3), (2, 8, 4),
(3, 2, 5), (3, 3, 5), (3, 4, 3),
(4, 2, 4), (4, 7, 5), (4, 8, 4),
(5, 4, 5), (5, 5, 4), (5, 6, 4),
(6, 2, 4), (6, 3, 3), (6, 7, 5),
(7, 1, 3), (7, 2, 4), (7, 5, 3),
(8, 9, 5), (8, 10, 4),
(9, 5, 5), (9, 6, 5), (9, 4, 4),
(10, 2, 3), (10, 3, 3), (10, 8, 4);

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Dự án
INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
VALUES 
(1, 1, N'Trưởng nhóm phát triển', '2023-01-01'),
(2, 4, N'Chuyên gia bảo mật', '2023-04-01'),
(3, 5, N'Kỹ sư AI', '2023-05-01'),
(4, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(5, 3, N'Kiến trúc sư đám mây', '2023-02-01'),
(6, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(7, 3, N'Kỹ sư IoT', '2023-02-01'),
(8, 1, N'Nhà thiết kế UX/UI', '2023-01-01'),
(9, 3, N'Kỹ sư DevOps', '2023-02-01'),
(10, 5, N'Kỹ sư Blockchain', '2023-05-01');

-- 51. Hiển thị tất cả thông tin của bảng ChuyenGia.

SELECT * FROM dbo.ChuyenGia 

-- 52. Liệt kê họ tên và email của tất cả chuyên gia.

SELECT HoTen, Email FROM dbo.ChuyenGia
 
-- 53. Hiển thị tên công ty và số nhân viên của tất cả các công ty.

SELECT TenCongTy, SoNhanVien FROM dbo.CongTy

-- 54. Liệt kê tên các dự án đang trong trạng thái 'Đang thực hiện'.

SELECT TenDuAn FROM dbo.DuAn 
WHERE TrangThai = N'Đang thực hiện'

-- 55. Hiển thị tên và loại của tất cả các kỹ năng.

SELECT TenKyNang, LoaiKyNang FROM dbo.KyNang

-- 56. Liệt kê họ tên và chuyên ngành của các chuyên gia nam.

SELECT HoTen, ChuyenNganh FROM dbo.ChuyenGia
WHERE GioiTinh = N'Nam'

-- 57. Hiển thị tên công ty và lĩnh vực của các công ty có trên 150 nhân viên.

SELECT TenCongTy, LinhVuc FROM dbo.CongTy
WHERE SoNhanVien > 150

-- 58. Liệt kê tên các dự án bắt đầu trong năm 2023.

SELECT TenDuAn FROM dbo.DuAn
WHERE YEAR(NgayBatDau) >= 2023

-- 59. Hiển thị tên kỹ năng thuộc loại 'Công cụ'.

SELECT TenKyNang FROM dbo.KyNang 
WHERE LoaiKyNang = N'Công cụ'

-- 60. Liệt kê họ tên và số năm kinh nghiệm của các chuyên gia có trên 5 năm kinh nghiệm.

SELECT HoTen, NamKinhNghiem FROM dbo.ChuyenGia
WHERE NamKinhNghiem > 5

-- 61. Hiển thị tên công ty và địa chỉ của các công ty trong lĩnh vực 'Phát triển phần mềm'.

SELECT TenCongTy, DiaChi FROM CongTy 
WHERE LinhVuc = N'Phát triển phần mềm'

-- 62. Liệt kê tên các dự án có ngày kết thúc trong năm 2023.
-- GETDATE() lấy ngày của hiện tại

SELECT TenDuAn FROM DuAn
WHERE YEAR(NgayKetThuc) = 2023

-- 63. Hiển thị tên và cấp độ của các kỹ năng trong bảng ChuyenGia_KyNang.

 SELECT K.TenKyNang, C.CapDo 
FROM ChuyenGia_KyNang AS C, KyNang AS K
WHERE C.MaKyNang = K.MaKyNang

-- 64. Liệt kê mã chuyên gia và vai trò trong các dự án từ bảng ChuyenGia_DuAn.

SELECT MaChuyenGia, VaiTro FROM ChuyenGia_DuAn 

-- 65. Hiển thị họ tên và ngày sinh của các chuyên gia sinh năm 1990 trở về sau.

SELECT HoTen, NgaySinh From ChuyenGia
WHERE YEAR(NgaySinh) >= 1990

-- 66. Liệt kê tên công ty và số nhân viên, sắp xếp theo số nhân viên giảm dần.

SELECT TenCongTy, SoNhanVien from CongTy
ORDER BY SoNhanVien DESC

-- 67. Hiển thị tên dự án và ngày bắt đầu, sắp xếp theo ngày bắt đầu tăng dần. 

SELECT TenDuAn, NgayBatDau from DuAn 
ORDER BY NgayBatDau ASC
 
-- 68. Liệt kê tên kỹ năng, chỉ hiển thị mỗi tên một lần (loại bỏ trùng lặp).

SELECT DISTINCT TenKyNang from KyNang

-- 69. Hiển thị họ tên và email của 5 chuyên gia đầu tiên trong danh sách.

SELECT TOP 5 HoTen, Email from ChuyenGia

-- 70. Liệt kê tên công ty có chứa từ 'Tech' trong tên.

SELECT TenCongTy from CongTy 
WHERE TenCongTy LIKE '%Tech%'

-- 71. Hiển thị tên dự án và trạng thái, không bao gồm các dự án đã hoàn thành.

SELECT TenDuAn, TrangThai from DuAn 
WHERE TrangThai != N'Hoàn thành'

-- 72. Liệt kê họ tên và chuyên ngành của các chuyên gia, sắp xếp theo chuyên ngành và họ tên.

SELECT HoTen, ChuyenNganh from ChuyenGia
ORDER BY ChuyenNganh ASC, HoTen ASC

-- 73. Hiển thị tên công ty và lĩnh vực, chỉ bao gồm các công ty có từ 100 đến 200 nhân viên.

SELECT TenCongTy, LinhVuc from CongTy
WHERE SoNhanVien >= 100 AND SoNhanVien <= 200

-- 74. Liệt kê tên kỹ năng và loại kỹ năng, sắp xếp theo loại kỹ năng giảm dần và tên kỹ năng tăng dần.

SELECT TenKyNang, LoaiKyNang from KyNang
ORDER BY LoaiKyNang DESC, TenKyNang ASC 

-- 75. Hiển thị họ tên và số điện thoại của các chuyên gia có email sử dụng tên miền 'email.com'.

SELECT HoTen, SoDienThoai FROM ChuyenGia
WHERE Email LIKE '%email.com%'




--1. Liệt kê tất cả các chuyên gia và sắp xếp theo họ tên.
SELECT MaChuyenGia, HoTen FROM ChuyenGia 
ORDER BY HoTen

--2. Hiển thị tên và số điện thoại của các chuyên gia có chuyên ngành 'Phát triển phần mềm'.
SELECT HoTen, SoDienThoai FROM ChuyenGia
WHERE ChuyenNganh = N'Phát triển phần mềm'

--3. Liệt kê tất cả các công ty có trên 100 nhân viên.
select MaCongTy, TenCongTy FROM CongTy
WHERE SoNhanVien > 100

--4. Hiển thị tên và ngày bắt đầu của các dự án bắt đầu trong năm 2023.
SELECT TenDuAn, NgayBatDau from DuAn
WHERE YEAR(NgayBatDau) = 2023

--5. Liệt kê tất cả các kỹ năng và sắp xếp theo tên kỹ năng.
SELECT MaKyNang, TenKyNang from KyNang
order by TenKyNang

--6. Hiển thị tên và email của các chuyên gia có tuổi dưới 35 (tính đến năm 2024).
select HoTen, Email from ChuyenGia
WHERE YEAR(GETDATE()) - YEAR(NgaySinh) < 35


--7. Hiển thị tên và chuyên ngành của các chuyên gia nữ.
Select HoTen, ChuyenNganh from ChuyenGia
WHERE GioiTinh = N'Nữ'

--8. Liệt kê tên các kỹ năng thuộc loại 'Công nghệ'.
SELECT TenKyNang FROM KyNang
WHERE TenKyNang = N'Công nghệ'

--9. Hiển thị tên và địa chỉ của các công ty trong lĩnh vực 'Phân tích dữ liệu'.
SELECT TenCongTy, DiaChi FROM CongTy
WHERE LinhVuc = N'Phân tích dữ liệu'

--10. Liệt kê tên các dự án có trạng thái 'Hoàn thành'.
SELECT TenDuAn FROM DuAn
WHERE TrangThai ='Hoàn thành'

--11. Hiển thị tên và số năm kinh nghiệm của các chuyên gia, sắp xếp theo số năm kinh nghiệm giảm dần.
SELECT HoTen, NamKinhNghiem FROM ChuyenGia
ORDER BY NamKinhNghiem DESC

--12. Liệt kê tên các công ty và số lượng nhân viên, chỉ hiển thị các công ty có từ 100 đến 200 nhân viên.
SELECT TenCongTy, SoNhanVien FROM CongTy
WHERE SoNhanVien >= 100 AND SoNhanVien <= 200

--13. Hiển thị tên dự án và ngày kết thúc của các dự án kết thúc trong năm 2023.
SELECT TenDuAn, NgayKetThuc FROM DuAn
WHERE YEAR(NgayKetThuc) = 2023

--14. Liệt kê tên và email của các chuyên gia có tên bắt đầu bằng chữ 'N'.
SELECT HoTen, Email FROM ChuyenGia
WHERE HoTen LIKE N'N%';

--15. Hiển thị tên kỹ năng và loại kỹ năng, không bao gồm các kỹ năng thuộc loại 'Ngôn ngữ lập trình'.
SELECT TenKyNang, LoaiKyNang FROM KyNang 
WHERE LoaiKyNang != N'Ngôn ngữ lập trình';

--16. Hiển thị tên công ty và lĩnh vực hoạt động, sắp xếp theo lĩnh vực.
SELECT TenCongTy, LinhVuc from CongTy
ORDER BY LinhVuc

--17. Hiển thị tên và chuyên ngành của các chuyên gia nam có trên 5 năm kinh nghiệm.
SELECT HoTen, ChuyenNganh from ChuyenGia
where GioiTinh = N'Nam' AND NamKinhNghiem > 5

--18. Liệt kê tất cả các chuyên gia trong cơ sở dữ liệu.
SELECT MaChuyenGia, HoTen FROM ChuyenGia

--19. Hiển thị tên và email của tất cả các chuyên gia nữ.
SELECT HoTen, Email from ChuyenGia
WHERE GioiTinh = N'Nữ'

--20.  Liệt kê tất cả các công ty và số nhân viên của họ, sắp xếp theo số nhân viên giảm dần.
SELECT MaCongTy, TenCongTy, SoNhanVien FROM CongTy
ORDER BY SoNhanVien DESC

--21. Hiển thị tất cả các dự án đang trong trạng thái "Đang thực hiện".
SELECT MaDuAn, TenDuAn FROM DuAn
WHERE TrangThai = N'Đang thực hiện'

--22. Liệt kê tất cả các kỹ năng thuộc loại "Ngôn ngữ lập trình".
Select MaKyNang, TenKyNang from KyNang
where LoaiKyNang = N'Ngôn ngữ lập trình'

--23. Hiển thị tên và chuyên ngành của các chuyên gia có trên 8 năm kinh nghiệm.
select HoTen, ChuyenNganh from ChuyenGia
WHERE NamKinhNghiem > 8

--24. Liệt kê tất cả các dự án của công ty có MaCongTy là 1.
SELECT MaCongTy, TenCongTy from CongTy
WHERE MaCongTy = '1'

--25. Đếm số lượng chuyên gia trong mỗi chuyên ngành.
SELECT ChuyenNganh, COUNT(MaChuyenGia) AS SOLUONGCHUYENGIA
from ChuyenGia
Group by ChuyenNganh

--26. Tìm chuyên gia có số năm kinh nghiệm cao nhất.
SELECT MaChuyenGia, HoTen FROM ChuyenGia
WHERE NamKinhNghiem = (SELECT MAX(NamKinhNghiem) FROM ChuyenGia)

--27. Liệt kê tổng số nhân viên cho mỗi công ty mà có số nhân viên lớn hơn 100. Sắp xếp kết quả theo số nhân viên tăng dần.
SELECT MaCongTy, TenCongTy, SoNhanVien from CongTy
WHERE SoNhanVien > 100
ORDER BY SoNhanVien DESC

--28. Xác định số lượng dự án mà mỗi công ty tham gia có trạng thái 'Đang thực hiện'. Chỉ bao gồm các công ty có hơn một dự án đang thực hiện. Sắp xếp kết quả theo số lượng dự án giảm dần.
SELECT CongTy.TenCongTy, COUNT(DuAn.MaDuAn) AS SoLuongDuAn
FROM CongTy
JOIN DuAn ON CongTy.MaCongTy = DuAn.MaCongTy
WHERE DuAn.TrangThai = N'Đang thực hiện' 
GROUP BY CongTy.TenCongTy
HAVING COUNT(DuAn.MaDuAn) > 1
ORDER BY SoLuongDuAn DESC;

--29. Tìm kiếm các kỹ năng mà chuyên gia có cấp độ từ 4 trở lên và tính tổng số chuyên gia cho mỗi kỹ năng đó. Chỉ bao gồm những kỹ năng có tổng số chuyên gia lớn hơn 2. Sắp xếp kết quả theo tên kỹ năng tăng dần.
select ChuyenGia_KyNang.MaKyNang, KyNang.TenKyNang, COUNT(MaChuyenGia) AS SOLUONGCG
from KyNang, ChuyenGia_KyNang
where KyNang.MaKyNang = ChuyenGia_KyNang.MaKyNang AND CapDo >= 4
Group By ChuyenGia_KyNang.MaKyNang, KyNang.TenKyNang
HAVING COUNT(MaChuyenGia) > 2
ORDER BY TenKyNang ASC

--30. Liệt kê tên các công ty có lĩnh vực 'Điện toán đám mây' và tính tổng số nhân viên của họ. Sắp xếp kết quả theo tổng số nhân viên tăng dần.
SELECT TenCongTy, SoNhanVien FROM CongTy 
WHERE LinhVuc = N'Điện toán đám mây'
ORDER BY SoNhanVien ASC 

--31. Liệt kê tên các công ty có số nhân viên từ 50 đến 150 và tính trung bình số nhân viên của họ. Sắp xếp kết quả theo tên công ty tăng dần.
SELECT TenCongTy, SoNhanVien
FROM CongTy
WHERE SoNhanVien BETWEEN 50 AND 150
ORDER BY TenCongTy ASC;

--32. Xác định số lượng kỹ năng cho mỗi chuyên gia có cấp độ tối đa là 5 và chỉ bao gồm những chuyên gia có ít nhất một kỹ năng đạt cấp độ tối đa này. Sắp xếp kết quả theo tên chuyên gia tăng dần.
SELECT MaChuyenGia, COUNT(MaKyNang) AS SOLUONGKYNANG
FROM ChuyenGia_KyNang
WHERE CapDo = 5
GROUP BY MaChuyenGia
HAVING COUNT(MaKyNang) > 0

--33. Liệt kê tên các kỹ năng mà chuyên gia có cấp độ từ 4 trở lên và tính tổng số chuyên gia cho mỗi kỹ năng đó. Chỉ bao gồm những kỹ năng có tổng số chuyên gia lớn hơn 2. Sắp xếp kết quả theo tên kỹ năng tăng dần.
SELECT KyNang.MaKyNang, KyNang.TenKyNang, COUNT(MaChuyenGia) AS SOLUONGCHUYENGIA_MOIKYNANG
FROM ChuyenGia_KyNang, KyNang
WHERE ChuyenGia_KyNang.CapDo >=4 AND ChuyenGia_KyNang.MaKyNang = KyNang.MaKyNang
GROUP BY KyNang.MaKyNang, KyNang.TenKyNang
HAVING COUNT(MaChuyenGia) > 2
ORDER BY KyNang.TenKyNang ASC 
 
--34. Tìm kiếm tên của các chuyên gia trong lĩnh vực 'Phát triển phần mềm' và tính trung bình cấp độ kỹ năng của họ. Chỉ bao gồm những chuyên gia có cấp độ trung bình lớn hơn 3. Sắp xếp kết quả theo cấp độ trung bình giảm dần.
SELECT HoTen, AVG(CapDo) AS TBCAPDO
FROM ChuyenGia, ChuyenGia_KyNang
WHERE ChuyenGia_KyNang.MaChuyenGia = ChuyenGia.MaChuyenGia AND ChuyenNganh = N'Phát triển phần mềm'
group by HoTen
HAVING AVG(CapDo) > 3
order by TBCAPDO desc



-- LAB 3

-- 8. Hiển thị tên và cấp độ của tất cả các kỹ năng của chuyên gia có MaChuyenGia là 1.
SELECT ChuyenGia_KyNang.MaChuyenGia, HoTen, ChuyenGia_KyNang.CapDo  FROM ChuyenGia, ChuyenGia_KyNang
WHERE ChuyenGia_KyNang.MaChuyenGia = '1' AND ChuyenGia_KyNang.MaChuyenGia = ChuyenGia.MaChuyenGia

-- 9. Liệt kê tên các chuyên gia tham gia dự án có MaDuAn là 2.
SELECT CG.HoTen FROM ChuyenGia_DuAn CGDA, ChuyenGia CG
WHERE CGDA.MaDuAn = 2 AND CGDA.MaChuyenGia = CG.MaChuyenGia

-- 10. Hiển thị tên công ty và tên dự án của tất cả các dự án.
SELECT TenCongTy, TenDuAn FROM CongTy, DuAn
WHERE CongTy.MaCongTy = DuAn.MaCongTy

-- 11. Đếm số lượng chuyên gia trong mỗi chuyên ngành.
SELECT ChuyenNganh, COUNT(MaChuyenGia) AS SoLuongChuyenGiaMoiChuyenNganh 
FROM ChuyenGia
Group By ChuyenNganh

-- 12. Tìm chuyên gia có số năm kinh nghiệm cao nhất.
SELECT HoTen, NamKinhNghiem 
from ChuyenGia
WHERE NamKinhNghiem = (SELECT MAX(NamKinhNghiem) FROM ChuyenGia)

-- 13. Liệt kê tên các chuyên gia và số lượng dự án họ tham gia.
SELECT ChuyenGia.HoTen, COUNT(MaDuAn) AS SOLUONGDUANTHAMGIA
FROM ChuyenGia_DuAn, ChuyenGia
WHERE ChuyenGia.MaChuyenGia = ChuyenGia_DuAn.MaChuyenGia
GROUP BY ChuyenGia.MaChuyenGia, ChuyenGia.HoTen

-- 14. Hiển thị tên công ty và số lượng dự án của mỗi công ty.
SELECT TenCongTy, COUNT(DuAn.MaDuAn) AS SOLUONGDA
FROM CongTy, DuAn
WHERE CongTy.MaCongTy = DuAn.MaCongTy
GROUP BY DuAn.MaCongTy, TenCongTy

-- 15. Tìm kỹ năng được sở hữu bởi nhiều chuyên gia nhất.
SELECT TOP 1 TenKyNang, COUNT(MaChuyenGia) AS SLCG
FROM ChuyenGia_KyNang, KyNang 
WHERE KyNang.MaKyNang = ChuyenGia_KyNang.MaKyNang
GROUP BY TenKyNang
ORDER BY SLCG DESC

-- 16. Liệt kê tên các chuyên gia có kỹ năng 'Python' với cấp độ từ 4 trở lên.
SELECT HoTen, TenKyNang FROM ChuyenGia, ChuyenGia_KyNang, KyNang
WHERE TenKyNang = 'Python' AND CapDo >= 4 AND ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia AND KyNang.MaKyNang = ChuyenGia_KyNang.MaKyNang

-- 17. Tìm dự án có nhiều chuyên gia tham gia nhất.
SELECT TOP 1 DuAn.MaDuAn, TenDuAn, COUNT(ChuyenGia_DuAn.MaChuyenGia) AS SOLUONG
FROM DuAn, ChuyenGia_DuAn
WHERE DuAn.MaDuAn = ChuyenGia_DuAn.MaDuAn
GROUP BY DuAn.MaDuAn, TenDuAn
ORDER BY SOLUONG desc

-- 18. Hiển thị tên và số lượng kỹ năng của mỗi chuyên gia.
SELECT HoTen, COUNT(MaKyNang) AS SLKYNANG
FROM ChuyenGia, ChuyenGia_KyNang
WHERE ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY HoTen

-- 19. Tìm các cặp chuyên gia làm việc cùng dự án.
SELECT A.MaChuyenGia AS ChuyenGia1, B.MaChuyenGia AS ChuyenGia2, A.MaDuAn
FROM ChuyenGia_DuAn A, ChuyenGia_DuAn B 
WHERE A.MaDuAn = B.MaDuAn AND A.MaChuyenGia < B.MaChuyenGia
ORDER BY A.MaDuAn, A.MaChuyenGia, B.MaChuyenGia;

-- 20. Liệt kê tên các chuyên gia và số lượng kỹ năng cấp độ 5 của họ.
SELECT HoTen, COUNT(MaKyNang) AS SLKNCAP5
FROM ChuyenGia, ChuyenGia_KyNang
WHERE CapDo = 5 AND ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY HoTen

-- 21. Tìm các công ty không có dự án nào.
SELECT  CongTy.MaCongTy, CongTy.TenCongTy, COUNT(DuAn.MaDuAn) AS SOLUONGDA
FROM CongTy, DuAn
WHERE CongTy.MaCongTy = DuAn.MaCongTy
GROUP BY  CongTy.TenCongTy, CongTy.MaCongTy
HAVING COUNT(DuAn.MaDuAn) = 0 

-- 22. Hiển thị tên chuyên gia và tên dự án họ tham gia, bao gồm cả chuyên gia không tham gia dự án nào.
SELECT HoTen, TenDuAn, count(ChuyenGia_DuAn.MaDuAn)
FROM ChuyenGia
LEFT JOIN ChuyenGia_DuAn ON ChuyenGia.MaChuyenGia = ChuyenGia_DuAn.MaChuyenGia
LEFT JOIN DuAn ON ChuyenGia_DuAn.MaDuAn = DuAn.MaDuAn
GROUP BY HoTen, TenDuAn

-- 23. Tìm các chuyên gia có ít nhất 3 kỹ năng.
SELECT HoTen, COUNT(ChuyenGia_KyNang.MaKyNang)
FROM ChuyenGia,ChuyenGia_KyNang
WHERE ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY HoTen
HAVING COUNT (ChuyenGia_KyNang.MaKyNang) >= 3

-- 24. Hiển thị tên công ty và tổng số năm kinh nghiệm của tất cả chuyên gia trong các dự án của công ty đó.
select TenCongTy, SUM(NamKinhNghiem)
FROM CongTy, ChuyenGia, DuAn, ChuyenGia_DuAn
WHERE CongTy.MaCongTy = DuAn.MaCongTy and ChuyenGia.MaChuyenGia = ChuyenGia_DuAn.MaChuyenGia and DuAn.MaDuAn = ChuyenGia_DuAn.MaDuAn
Group By TenCongTy

-- 25. Tìm các chuyên gia có kỹ năng 'Java' nhưng không có kỹ năng 'Python'.
SELECT ChuyenGia.MaChuyenGia, ChuyenGia.HoTen
FROM ChuyenGia, ChuyenGia_KyNang, KyNang
where ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia AND KyNang.MaKyNang = ChuyenGia_KyNang.MaKyNang AND TenKyNang = 'Java'
AND ChuyenGia.MaChuyenGia NOT IN (Select ChuyenGia.MaChuyenGia
FROM ChuyenGia, ChuyenGia_KyNang, KyNang
where ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia AND KyNang.MaKyNang = ChuyenGia_KyNang.MaKyNang AND TenKyNang = 'Python')

-- 76. Tìm chuyên gia có số lượng kỹ năng nhiều nhất.
SELECT TOP 1 ChuyenGia.MaChuyenGia, ChuyenGia.HoTen, COUNT(ChuyenGia_KyNang.MaKyNang) AS SLKN
FROM ChuyenGia, ChuyenGia_KyNang
WHERE ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY ChuyenGia.MaChuyenGia, ChuyenGia.HoTen

-- 77. Liệt kê các cặp chuyên gia có cùng chuyên ngành.
SELECT A.HoTen, B.HoTen, A.ChuyenNganh
FROM ChuyenGia AS A, ChuyenGia AS B
WHERE A.ChuyenNganh = B.ChuyenNganh AND A.MaChuyenGia < B.MaChuyenGia

-- 78. Tìm công ty có tổng số năm kinh nghiệm của các chuyên gia trong dự án cao nhất.
SELECT TOP 1 TenCongTy, SUM(NamKinhNghiem)
FROM CongTy, ChuyenGia, ChuyenGia_DuAn, DuAn
WHERE CongTy.MaCongTy = DuAn.MaCongTy AND ChuyenGia.MaChuyenGia = ChuyenGia_DuAn.MaChuyenGia AND DuAn.MaDuAn = ChuyenGia_DuAn.MaDuAn
GROUP BY TenCongTy
ORDER BY SUM(NamKinhNghiem) DESC

-- 79. Tìm kỹ năng được sở hữu bởi tất cả các chuyên gia.
SELECT TenKyNang
FROM KyNang
WHERE MaKyNang IN (
    SELECT MaKyNang
    FROM ChuyenGia_KyNang
    GROUP BY MaKyNang
    HAVING COUNT(DISTINCT MaChuyenGia) = (SELECT COUNT(*) FROM ChuyenGia)
)

-- LAB 4

-- 76. Liệt kê top 3 chuyên gia có nhiều kỹ năng nhất và số lượng kỹ năng của họ.
SELECT TOP 3 ChuyenGia.MaChuyenGia, HoTen, COUNT(MaKyNang) AS SLKN
FROM ChuyenGia
JOIN ChuyenGia_KyNang ON ChuyenGia.MaChuyenGia = ChuyenGia_KyNang.MaChuyenGia
GROUP BY ChuyenGia.MaChuyenGia, HoTen
ORDER BY SLKN ASC

-- 77. Tìm các cặp chuyên gia có cùng chuyên ngành và số năm kinh nghiệm chênh lệch không quá 2 năm.


-- 78. Hiển thị tên công ty, số lượng dự án và tổng số năm kinh nghiệm của các chuyên gia tham gia dự án của công ty đó.
SELECT TenCongTy, COUNT(DuAn.MaDuAn) AS SLDA, SUM(NamKinhNghiem) AS TONGNKN
FROM CongTy
JOIN DuAn ON DuAn.MaCongTy = CongTy.MaCongTy
JOIN ChuyenGia_DuAn ON ChuyenGia_DuAn.MaDuAN = DuAn.MaDuAn
JOIN ChuyenGia ON ChuyenGia.MaChuyenGia = ChuyenGia_DuAn.MaChuyenGia
GROUP BY TenCongTy

-- 79. Tìm các chuyên gia có ít nhất một kỹ năng cấp độ 5 nhưng không có kỹ năng nào dưới cấp độ 3.
SELECT ChuyenGia.MaChuyenGia, HoTen
FROM ChuyenGia
JOIN ChuyenGia_KyNang AS CGKN ON CGKN.MaChuyenGia = ChuyenGia.MaChuyenGia
GROUP BY ChuyenGia.MaChuyenGia, HoTen
HAVING MAX(CapDo) = 5 AND MIN (CapDo) >= 3

-- 80. Liệt kê các chuyên gia và số lượng dự án họ tham gia, bao gồm cả những chuyên gia không tham gia dự án nào.
SELECT CG.MaChuyenGia, HoTen, COUNT(MaDuAn) AS SLDA
FROM ChuyenGia AS CG
LEFT JOIN ChuyenGia_DuAn AS CGDA ON CG.MaChuyenGia = CGDA.MaChuyenGia
GROUP BY CG.MaChuyenGia, HoTen

-- Câu hỏi và ví dụ về Triggers (101-110)


-- 101. Tạo một trigger để tự động cập nhật trường NgayCapNhat trong bảng ChuyenGia mỗi khi có sự thay đổi thông tin.

ALTER TABLE ChuyenGia
ADD NgayCapNhat SMALLDATETIME NULL
GO

CREATE TRIGGER trg_Update_NgayCapNhat
ON ChuyenGia
AFTER UPDATE
AS
BEGIN
    UPDATE ChuyenGia
    SET NgayCapNhat = GETDATE()
    FROM ChuyenGia
    INNER JOIN Inserted ON ChuyenGia.MaChuyenGia = Inserted.MaChuyenGia;
END;
GO
-- 102. Tạo một trigger để ghi log mỗi khi có sự thay đổi trong bảng DuAn.

CREATE TRIGGER trg_DuAn_Log
ON DuAn
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Log cho thao tác INSERT
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO DuAn_Log (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai, ThaoTac)
        SELECT MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai, 'INSERT'
        FROM inserted;
    END

    -- Log cho thao tác DELETE
    IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO DuAn_Log (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai, ThaoTac)
        SELECT MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai, 'DELETE'
        FROM deleted;
    END

    -- Log cho thao tác UPDATE
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO DuAn_Log (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai, ThaoTac)
        SELECT MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai, 'UPDATE'
        FROM inserted;
    END
END;
go
-- 103. Tạo một trigger để đảm bảo rằng một chuyên gia không thể tham gia vào quá 5 dự án cùng một lúc.
CREATE TRIGGER trg_LimitProjectsPerExpert
ON ChuyenGia_DuAn
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra số lượng dự án của mỗi chuyên gia trong bảng inserted
    IF EXISTS (
        SELECT i.MaChuyenGia
        FROM inserted i
        GROUP BY i.MaChuyenGia
        HAVING (SELECT COUNT(*) 
                FROM ChuyenGia_DuAn 
                WHERE MaChuyenGia = i.MaChuyenGia) > 5
    )
    BEGIN
        -- Nếu chuyên gia vượt quá 5 dự án, rollback và báo lỗi
        RAISERROR (N'Một chuyên gia không thể tham gia vào hơn 5 dự án cùng một lúc.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
   
-- 104. Tạo một trigger để tự động cập nhật số lượng nhân viên trong bảng CongTy mỗi khi có sự thay đổi trong bảng ChuyenGia.
go
CREATE TRIGGER trg_UpdateEmployeeCount
ON ChuyenGia
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Cập nhật số lượng nhân viên cho các công ty liên quan khi có dữ liệu được thêm mới
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        UPDATE CongTy
        SET SoNhanVien = (
            SELECT COUNT(*)
            FROM ChuyenGia
            WHERE MaCongTy = inserted.MaCongTy
        )
        WHERE MaCongTy IN (SELECT DISTINCT MaCongTy FROM inserted);
    END

    -- Cập nhật số lượng nhân viên cho các công ty liên quan khi có dữ liệu bị xóa
    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        UPDATE CongTy
        SET SoNhanVien = (
            SELECT COUNT(*)
            FROM ChuyenGia
            WHERE MaCongTy = deleted.MaCongTy
        )
        WHERE MaCongTy IN (SELECT DISTINCT MaCongTy FROM deleted);
    END
END;
go
-- 105. Tạo một trigger để ngăn chặn việc xóa các dự án đã hoàn thành.
CREATE TRIGGER trg_prevent_delete_completed_projects
ON DuAn
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted WHERE TrangThai = N'Hoàn thành')
    BEGIN
        RAISERROR('Không thể xóa dự án đã hoàn thành.', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
	BEGIN
		DELETE FROM DuAn
		WHERE MaDuAn IN (SELECT MaDuAn FROM deleted);
	END
END;
GO

-- 106. Tạo một trigger để tự động cập nhật cấp độ kỹ năng của chuyên gia khi họ tham gia vào một dự án mới.
-- trigger này cần xem lại, không có logic, dự án không có thông tin về cấp độ kỹ năng
--CREATE TRIGGER trg_update_expert_skill_level
--ON ChuyenGia_DuAn
--AFTER INSERT
--AS
--BEGIN
--    UPDATE ChuyenGia_KyNang
--    SET CapDo = (SELECT MAX(CapDo) FROM DuAn WHERE MaDuAn = NEW.MaDuAn)
--    WHERE MaChuyenGia = (SELECT MaChuyenGia FROM inserted);
--END;
--GO

-- 107. Tạo một trigger để ghi log mỗi khi có sự thay đổi cấp độ kỹ năng của chuyên gia.
CREATE TABLE LogChanges (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    TableName NVARCHAR(100),
    ActionType NVARCHAR(50),
    DateTime DATETIME,
    Description NVARCHAR(MAX)
);
go
CREATE TRIGGER trg_log_skill_level_changes
ON ChuyenGia_KyNang
AFTER UPDATE
AS
BEGIN
    INSERT INTO LogChanges (TableName, ActionType, DateTime, Description)
    SELECT 'ChuyenGia_KyNang', 'UPDATE', GETDATE(), 
            'Cấp độ kỹ năng của chuyên gia ' + CAST(i.MaChuyenGia AS NVARCHAR(10)) + 
			' đã thay đổi từ ' + CAST(d.CapDo AS NVARCHAR(10)) + ' thành ' + CAST(i.CapDo AS NVARCHAR(10))
    FROM inserted i
	JOIN deleted d ON d.MaChuyenGia = i.MaChuyenGia AND d.MaKyNang = i.MaKyNang;
END;
GO

-- 108. Tạo một trigger để đảm bảo rằng ngày kết thúc của dự án luôn lớn hơn ngày bắt đầu.
CREATE TRIGGER trg_validate_project_dates
ON DuAn
BEFORE INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE NgayKetThuc <= NgayBatDau) OR EXISTS (SELECT 1 FROM deleted WHERE NgayKetThuc <= NgayBatDau)
    BEGIN
        RAISERROR('Ngày kết thúc phải lớn hơn ngày bắt đầu.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- 109. Tạo một trigger để tự động xóa các bản ghi liên quan trong bảng ChuyenGia_KyNang khi một kỹ năng bị xóa.
CREATE TRIGGER trg_delete_related_skill_entries
ON KyNang
AFTER DELETE
AS
BEGIN
    DELETE FROM ChuyenGia_KyNang
    WHERE MaKyNang IN (SELECT MaKyNang FROM deleted);
END;
GO

-- 110. Tạo một trigger để đảm bảo rằng một công ty không thể có quá 10 dự án đang thực hiện cùng một lúc.
CREATE TRIGGER trg_limit_company_projects
ON DuAn
BEFORE INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE MaCongTy IN (SELECT MaCongTy FROM DuAn WHERE TrangThai = N'Đang thực hiện' GROUP BY MaCongTy HAVING COUNT(*) >= 10))
    BEGIN
        RAISERROR('Công ty không thể có quá 10 dự án đang thực hiện cùng lúc.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- 123. Tạo một trigger để tự động cập nhật lương của chuyên gia dựa trên cấp độ kỹ năng và số năm kinh nghiệm.
-- Cần thêm bảng LuongChuyenGia
--CREATE TABLE LuongChuyenGia (
--    CapDo INT,
--    NamKinhNghiem INT,
--    Luong DECIMAL(10, 2),
--    PRIMARY KEY (CapDo, NamKinhNghiem)
--);
CREATE TRIGGER trg_update_expert_salary
ON ChuyenGia_KyNang
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @MaChuyenGia INT, @CapDo INT;

    SELECT @MaChuyenGia = MaChuyenGia, @CapDo = CapDo FROM inserted;

    UPDATE ChuyenGia
    SET Luong = (SELECT TOP 1 Luong FROM LuongChuyenGia WHERE CapDo = @CapDo AND NamKinhNghiem = (SELECT NamKinhNghiem FROM ChuyenGia WHERE MaChuyenGia = @MaChuyenGia) ORDER BY NamKinhNghiem DESC)
    WHERE MaChuyenGia = @MaChuyenGia;
END;
GO

-- 124. Tạo một trigger để tự động gửi thông báo khi một dự án sắp đến hạn (còn 7 ngày).
CREATE TABLE ThongBao (
    MaThongBao INT IDENTITY(1,1) PRIMARY KEY,
    NoiDung NVARCHAR(MAX),
    NgayThongBao DATETIME
);
GO

CREATE TRIGGER trg_notify_project_deadline
ON DuAn
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE DATEDIFF(day, GETDATE(), NgayKetThuc) = 7)
    BEGIN
        INSERT INTO ThongBao (NoiDung, NgayThongBao)
        SELECT 'Dự án ' + TenDuAn + ' sắp đến hạn vào ' + CONVERT(VARCHAR, NgayKetThuc, 120), GETDATE()
        FROM inserted;
    END
END;
GO

-- 125. Tạo một trigger để ngăn chặn việc xóa hoặc cập nhật thông tin của chuyên gia đang tham gia dự án.
CREATE TRIGGER trg_prevent_expert_modification
ON ChuyenGia
INSTEAD OF UPDATE, DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM deleted WHERE MaChuyenGia IN (SELECT MaChuyenGia FROM ChuyenGia_DuAn))
    BEGIN
        RAISERROR('Không thể xóa hoặc cập nhật thông tin của chuyên gia đang tham gia dự án.', 16, 1);
        ROLLBACK TRANSACTION;
    END
	ELSE
	BEGIN
		UPDATE ChuyenGia
		SET HoTen = ISNULL((SELECT HoTen FROM inserted), HoTen),
			NgaySinh = ISNULL((SELECT NgaySinh FROM inserted), NgaySinh),
			GioiTinh = ISNULL((SELECT GioiTinh FROM inserted), GioiTinh),
			Email = ISNULL((SELECT Email FROM inserted), Email),
			SoDienThoai = ISNULL((SELECT SoDienThoai FROM inserted), SoDienThoai),
			ChuyenNganh = ISNULL((SELECT ChuyenNganh FROM inserted), ChuyenNganh),
			NamKinhNghiem = ISNULL((SELECT NamKinhNghiem FROM inserted), NamKinhNghiem)
		WHERE MaChuyenGia IN (SELECT MaChuyenGia FROM inserted UNION ALL SELECT MaChuyenGia FROM deleted)
		
		DELETE FROM ChuyenGia
		WHERE MaChuyenGia IN (SELECT MaChuyenGia FROM deleted);
	END
END;
GO

-- 126. Tạo một trigger để tự động cập nhật số lượng chuyên gia trong mỗi chuyên ngành.
-- Cần tạo bảng ThongKeChuyenNganh
--CREATE TABLE ThongKeChuyenNganh (
--    MaChuyenNganh INT PRIMARY KEY,
--    SoLuongChuyenGia INT
--);
CREATE TRIGGER trg_update_expert_count
ON ChuyenGia
AFTER INSERT, DELETE
AS
BEGIN
    UPDATE ThongKeChuyenNganh
    SET SoLuongChuyenGia = (SELECT COUNT(*) FROM ChuyenGia WHERE ChuyenNganh = i.ChuyenNganh)
    FROM inserted i
	WHERE MaChuyenNganh = i.ChuyenNganh;
	
	UPDATE ThongKeChuyenNganh
    SET SoLuongChuyenGia = (SELECT COUNT(*) FROM ChuyenGia WHERE ChuyenNganh = d.ChuyenNganh)
	FROM deleted d
	WHERE MaChuyenNganh = d.ChuyenNganh;
END;
GO

-- 127. Tạo một trigger để tự động tạo bản sao lưu của dự án khi nó được đánh dấu là hoàn thành.
CREATE TABLE DuAnHoanThanh (
    MaDuAn INT,
    TenDuAn NVARCHAR(255),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    PRIMARY KEY (MaDuAn)
);
GO

CREATE TRIGGER trg_backup_completed_projects
ON DuAn
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE TrangThai = N'Hoàn thành')
    BEGIN
        INSERT INTO DuAnHoanThanh (MaDuAn, TenDuAn, NgayBatDau, NgayKetThuc)
        SELECT MaDuAn, TenDuAn, NgayBatDau, NgayKetThuc
        FROM inserted;
    END
END;
GO

-- 128. Tạo một trigger để tự động cập nhật điểm đánh giá trung bình của công ty dựa trên điểm đánh giá của các dự án.
CREATE TRIGGER trg_update_company_rating
ON DuAn
AFTER UPDATE
AS
BEGIN
    UPDATE CongTy
    SET SoNhanVien = (SELECT AVG(ISNULL(DiemDanhGia, 0)) FROM DuAn WHERE MaCongTy = i.MaCongTy)
	FROM inserted i
    WHERE MaCongTy = i.MaCongTy;
END;
GO

-- 129. Tạo một trigger để tự động phân công chuyên gia vào dự án dựa trên kỹ năng và kinh nghiệm.
-- Cần thêm cột YeuCauKinhNghiem vào bảng DuAn
CREATE TRIGGER trg_assign_expert_to_project
ON DuAn
AFTER INSERT
AS
BEGIN
	DECLARE @MaDuAn INT;
	SELECT @MaDuAn = MaDuAn FROM inserted;

    INSERT INTO ChuyenGia_DuAn (MaDuAn, MaChuyenGia)
    SELECT @MaDuAn, MaChuyenGia FROM ChuyenGia_KyNang
    WHERE MaKyNang IN (SELECT MaKyNang FROM KyNang WHERE MaKyNang IN (SELECT MaKyNang FROM ChuyenGia_KyNang WHERE MaChuyenGia IN (SELECT MaChuyenGia FROM ChuyenGia WHERE NamKinhNghiem >= (SELECT ISNULL(YeuCauKinhNghiem,0) FROM DuAn WHERE MaDuAn = @MaDuAn))));
END;
GO

-- 130. Tạo một trigger để tự động cập nhật trạng thái "bận" của chuyên gia khi họ được phân công vào dự án mới.
-- Cần thêm cột trạng thái vào bảng ChuyenGia
CREATE TRIGGER trg_update_expert_status
ON ChuyenGia_DuAn
AFTER INSERT
AS
BEGIN
    UPDATE ChuyenGia
    SET TrangThai = N'Bận'
    WHERE MaChuyenGia IN (SELECT MaChuyenGia FROM inserted);
END;
GO

-- 131. Tạo một trigger để ngăn chặn việc thêm kỹ năng trùng lặp cho một chuyên gia.
CREATE TRIGGER trg_prevent_duplicate_skill
ON ChuyenGia_KyNang
BEFORE INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE MaChuyenGia IN (SELECT MaChuyenGia FROM ChuyenGia_KyNang WHERE MaKyNang = i.MaKyNang) FROM inserted i)
    BEGIN
        RAISERROR('Kỹ năng này đã được thêm cho chuyên gia này.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

-- 132. Tạo một trigger để tự động tạo báo cáo tổng kết khi một dự án kết thúc.
-- Cần tạo bảng BaoCaoDuAn
--CREATE TABLE BaoCaoDuAn (
--    MaBaoCao INT IDENTITY(1,1) PRIMARY KEY,
--    MaDuAn INT,
--    NoiDungBaoCao NVARCHAR(MAX)
--);
CREATE TRIGGER trg_generate_project_report
ON DuAn
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE TrangThai = N'Hoàn thành')
    BEGIN
        INSERT INTO BaoCaoDuAn (MaDuAn, NoiDungBaoCao)
        SELECT MaDuAn, 'Dự án ' + TenDuAn + ' đã hoàn thành vào ' + CONVERT(VARCHAR, NgayKetThuc, 120)
        FROM inserted;
    END
END;
GO

-- 133. Tạo một trigger để tự động cập nhật thứ hạng của công ty dựa trên số lượng dự án hoàn thành và điểm đánh giá.
CREATE TRIGGER trg_update_company_ranking
ON DuAn
AFTER UPDATE
AS
BEGIN
    UPDATE CongTy
    SET SoNhanVien = (SELECT COUNT(*) FROM DuAn WHERE MaCongTy = i.MaCongTy AND TrangThai = N'Hoàn thành') + ISNULL((SELECT AVG(DiemDanhGia) FROM DuAn WHERE MaCongTy = i.MaCongTy), 0)
	FROM inserted i
    WHERE MaCongTy = i.MaCongTy;
END;
GO

-- 134. Tạo một trigger để tự động gửi thông báo khi một chuyên gia được thăng cấp (dựa trên số năm kinh nghiệm).
CREATE TRIGGER trg_notify_expert_promotion
ON ChuyenGia
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE NamKinhNghiem > (SELECT NamKinhNghiem FROM deleted WHERE MaChuyenGia = i.MaChuyenGia) FROM inserted i)
    BEGIN
        INSERT INTO ThongBao (NoiDung, NgayThongBao)
        SELECT 'Chuyên gia ' + HoTen + ' đã được thăng cấp với ' + CAST(NamKinhNghiem AS VARCHAR(10)) + ' năm kinh nghiệm', GETDATE()
        FROM inserted;
    END
END;
GO

-- 135. Tạo một trigger để tự động cập nhật trạng thái "khẩn cấp" cho dự án khi thời gian còn lại ít hơn 10% tổng thời gian dự án.
CREATE TRIGGER trg_update_project_urgent
ON DuAn
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE DATEDIFF(day, GETDATE(), NgayKetThuc) < (0.1 * DATEDIFF(day, NgayBatDau, NgayKetThuc)))
    BEGIN
		UPDATE DuAn SET TrangThai = N'Khẩn cấp' WHERE MaDuAn IN (SELECT MaDuAn FROM inserted);
    END
END;
GO

-- 136. Tạo một trigger để tự động cập nhật số lượng dự án đang thực hiện của mỗi chuyên gia.
-- Cần thêm cột SoDuAnDangThucHien vào bảng ChuyenGia
CREATE TRIGGER trg_update_expert_project_count
ON ChuyenGia_DuAn
AFTER INSERT, DELETE
AS
BEGIN
	
    UPDATE ChuyenGia
    SET SoDuAnDangThucHien = (SELECT COUNT(*) FROM ChuyenGia_DuAn WHERE MaChuyenGia = i.MaChuyenGia AND MaDuAn IN (SELECT MaDuAn FROM DuAn WHERE TrangThai = N'Đang thực hiện'))
	FROM inserted i
	WHERE MaChuyenGia = i.MaChuyenGia;
	
	UPDATE ChuyenGia
    SET SoDuAnDangThucHien = (SELECT COUNT(*) FROM ChuyenGia_DuAn WHERE MaChuyenGia = d.MaChuyenGia AND MaDuAn IN (SELECT MaDuAn FROM DuAn WHERE TrangThai = N'Đang thực hiện'))
	FROM deleted d
	WHERE MaChuyenGia = d.MaChuyenGia;
END;
GO

-- 137. Tạo một trigger để tự động tính toán và cập nhật tỷ lệ thành công của công ty dựa trên số dự án hoàn thành và tổng số dự án.
-- Cần thêm cột TyLeThanhCong vào bảng CongTy
CREATE TRIGGER trg_update_company_success_rate
ON DuAn
AFTER UPDATE
AS
BEGIN
	UPDATE CongTy
	SET TyLeThanhCong = (CAST((SELECT COUNT(*) FROM DuAn WHERE MaCongTy = i.MaCongTy AND TrangThai = N'Hoàn thành') AS DECIMAL (10,2)) / (SELECT COUNT(*) FROM DuAn WHERE MaCongTy = i.MaCongTy) * 100)
	FROM inserted i
	WHERE MaCongTy = i.MaCongTy;
END;
GO

-- 138. Tạo một trigger để tự động ghi log mỗi khi có thay đổi trong bảng lương của chuyên gia.
CREATE TRIGGER trg_log_salary_changes
ON ChuyenGia
AFTER UPDATE
AS
BEGIN
    INSERT INTO LogChanges (TableName, ActionType, DateTime, Description)
    SELECT 'ChuyenGia', 'UPDATE', GETDATE(), 
            'Lương của chuyên gia ' + CAST(i.MaChuyenGia AS NVARCHAR(10)) + 
			' đã thay đổi từ ' + CAST(d.Luong AS NVARCHAR(20)) + ' thành ' + CAST(i.Luong AS NVARCHAR(20))
    FROM inserted i
	JOIN deleted d ON d.MaChuyenGia = i.MaChuyenGia;
END;
GO

-- 139. Tạo một trigger để tự động cập nhật số lượng chuyên gia cấp cao trong mỗi công ty.
-- Cần thêm cột SoChuyenGiaCapCao vào bảng CongTy
CREATE TRIGGER trg_update_high_level_experts
ON ChuyenGia
AFTER INSERT, DELETE
AS
BEGIN
	UPDATE CongTy
    SET SoChuyenGiaCapCao = (SELECT COUNT(*) FROM ChuyenGia WHERE ChuyenNganh IN (SELECT ChuyenNganh FROM inserted) AND (NamKinhNghiem >= 5 OR (SELECT CapDo FROM LuongChuyenGia WHERE NamKinhNghiem = (SELECT NamKinhNghiem FROM ChuyenGia WHERE MaChuyenGia = i.MaChuyenGia)) = 3))
    FROM inserted i
    WHERE i.MaChuyenGia = i.MaChuyenGia;

	UPDATE CongTy
    SET SoChuyenGiaCapCao = (SELECT COUNT(*) FROM ChuyenGia WHERE ChuyenNganh IN (SELECT ChuyenNganh FROM deleted) AND (NamKinhNghiem >= 5 OR (SELECT CapDo FROM LuongChuyenGia WHERE NamKinhNghiem = (SELECT NamKinhNghiem FROM ChuyenGia WHERE MaChuyenGia = d.MaChuyenGia)) = 3))
    FROM deleted d
	WHERE d.MaChuyenGia = d.MaChuyenGia;
END;
GO

-- 140. Tạo một trigger để tự động phân công chuyên gia vào dự án khi có dự án mới được tạo.
CREATE TRIGGER trg_auto_assign_expert_to_new_project
ON DuAn
AFTER INSERT
AS
BEGIN
    DECLARE @MaDuAn INT;

    -- Lấy giá trị MaDuAn từ bảng inserted
    SELECT @MaDuAn = MaDuAn FROM inserted;

    -- Thực hiện phân công chuyên gia vào dự án
    INSERT INTO ChuyenGia_DuAn (MaDuAn, MaChuyenGia)
    SELECT @MaDuAn, MaChuyenGia
    FROM ChuyenGia
	WHERE NamKinhNghiem >= ISNULL((SELECT YeuCauKinhNghiem FROM DuAn WHERE MaDuAn = @MaDuAn),0);
END;
GO

GO
-- Cơ bản:
-- 1. Liệt kê tất cả chuyên gia trong cơ sở dữ liệu.
SELECT * FROM ChuyenGia;

-- 2. Hiển thị tên và email của các chuyên gia nữ.
SELECT HoTen, Email
FROM ChuyenGia
WHERE GioiTinh = N'Nữ';

-- 3. Liệt kê các công ty có trên 100 nhân viên.
SELECT *
FROM CongTy
WHERE SoNhanVien > 100;

-- 4. Hiển thị tên và ngày bắt đầu của các dự án trong năm 2023.
SELECT TenDuAn, NgayBatDau
FROM DuAn
WHERE YEAR(NgayBatDau) = 2023;

-- Trung cấp:
-- 6. Liệt kê tên chuyên gia và số lượng dự án họ tham gia.
SELECT cg.HoTen, COUNT(cgda.MaDuAn) AS SoLuongDuAn
FROM ChuyenGia cg
LEFT JOIN ChuyenGia_DuAn cgda ON cg.MaChuyenGia = cgda.MaChuyenGia
GROUP BY cg.HoTen;

-- 7. Tìm các dự án có sự tham gia của chuyên gia có kỹ năng 'Python' cấp độ 4 trở lên.
SELECT DISTINCT da.TenDuAn
FROM DuAn da
JOIN ChuyenGia_DuAn cgda ON da.MaDuAn = cgda.MaDuAn
JOIN ChuyenGia cg ON cgda.MaChuyenGia = cg.MaChuyenGia
JOIN ChuyenGia_KyNang cgkn ON cg.MaChuyenGia = cgkn.MaChuyenGia
JOIN KyNang kn ON cgkn.MaKyNang = kn.MaKyNang
WHERE kn.TenKyNang = 'Python' AND cgkn.CapDo >= 4;

-- 8. Hiển thị tên công ty và số lượng dự án đang thực hiện.
SELECT ct.TenCongTy, COUNT(da.MaDuAn) AS SoLuongDuAnDangThucHien
FROM CongTy ct
LEFT JOIN DuAn da ON ct.MaCongTy = da.MaCongTy
WHERE da.TrangThai = N'Đang thực hiện'
GROUP BY ct.TenCongTy;

-- 9. Tìm chuyên gia có số năm kinh nghiệm cao nhất trong mỗi chuyên ngành.
WITH RankedExperts AS (
    SELECT
        HoTen,
        ChuyenNganh,
        NamKinhNghiem,
        ROW_NUMBER() OVER(PARTITION BY ChuyenNganh ORDER BY NamKinhNghiem DESC) as Rank
    FROM
        ChuyenGia
)
SELECT
    HoTen,
    ChuyenNganh,
    NamKinhNghiem
FROM
    RankedExperts
WHERE
    Rank = 1;

-- 10. Liệt kê các cặp chuyên gia đã từng làm việc cùng nhau trong ít nhất một dự án.
SELECT DISTINCT cg1.HoTen AS ChuyenGia1, cg2.HoTen AS ChuyenGia2
FROM ChuyenGia cg1
JOIN ChuyenGia_DuAn cgda1 ON cg1.MaChuyenGia = cgda1.MaChuyenGia
JOIN ChuyenGia_DuAn cgda2 ON cgda1.MaDuAn = cgda2.MaDuAn
JOIN ChuyenGia cg2 ON cgda2.MaChuyenGia = cg2.MaChuyenGia
WHERE cg1.MaChuyenGia < cg2.MaChuyenGia;

-- Nâng cao:
-- 11. Tính tổng thời gian (theo ngày) mà mỗi chuyên gia đã tham gia vào các dự án.
SELECT cg.HoTen, SUM(DATEDIFF(day, cgda.NgayThamGia, da.NgayKetThuc)) AS TongThoiGianThamGia
FROM ChuyenGia cg
JOIN ChuyenGia_DuAn cgda ON cg.MaChuyenGia = cgda.MaChuyenGia
JOIN DuAn da ON cgda.MaDuAn = da.MaDuAn
GROUP BY cg.HoTen;

-- 12. Tìm các công ty có tỷ lệ dự án hoàn thành cao nhất (trên 90%).
WITH ProjectCounts AS (
    SELECT
        ct.MaCongTy,
        ct.TenCongTy,
        COUNT(da.MaDuAn) AS TotalProjects,
        SUM(CASE WHEN da.TrangThai = N'Hoàn thành' THEN 1 ELSE 0 END) AS CompletedProjects
    FROM
        CongTy ct
    LEFT JOIN
        DuAn da ON ct.MaCongTy = da.MaCongTy
    GROUP BY
        ct.MaCongTy, ct.TenCongTy
)
SELECT
    TenCongTy,
    (CAST(CompletedProjects AS FLOAT) / TotalProjects) * 100 AS CompletionRate
FROM
    ProjectCounts
WHERE
    TotalProjects > 0
    AND (CAST(CompletedProjects AS FLOAT) / TotalProjects) * 100 > 90
ORDER BY
    CompletionRate DESC;

-- 13. Liệt kê top 3 kỹ năng được yêu cầu nhiều nhất trong các dự án.
SELECT TOP 3 kn.TenKyNang, COUNT(cgkn.MaKyNang) AS SoLanYeuCau
FROM KyNang kn
JOIN ChuyenGia_KyNang cgkn ON kn.MaKyNang = cgkn.MaKyNang
JOIN ChuyenGia_DuAn cgda ON cgkn.MaChuyenGia = cgda.MaChuyenGia
GROUP BY kn.TenKyNang
ORDER BY SoLanYeuCau DESC;

-- 14. Tính lương trung bình của chuyên gia theo từng cấp độ kinh nghiệm (Junior: 0-2 năm, Middle: 3-5 năm, Senior: >5 năm).
ALTER TABLE ChuyenGia ADD Luong DECIMAL (10,2);
UPDATE ChuyenGia
SET Luong =
  CASE
    WHEN NamKinhNghiem BETWEEN 0 AND 2 THEN 5000000
    WHEN NamKinhNghiem BETWEEN 3 AND 5 THEN 10000000
    WHEN NamKinhNghiem > 5 THEN 15000000
    ELSE 0
  END;
WITH ExpertLevels AS (
    SELECT
        Luong,
        NamKinhNghiem,
        CASE
            WHEN NamKinhNghiem BETWEEN 0 AND 2 THEN 'Junior'
            WHEN NamKinhNghiem BETWEEN 3 AND 5 THEN 'Middle'
            WHEN NamKinhNghiem > 5 THEN 'Senior'
            ELSE 'Undefined'
        END AS KinhNghiem
    FROM
        ChuyenGia
)
SELECT
    KinhNghiem,
    AVG(Luong) AS LuongTrungBinh
FROM
    ExpertLevels
GROUP BY
    KinhNghiem;

-- 15. Tìm các dự án có sự tham gia của chuyên gia từ tất cả các chuyên ngành.
WITH DistinctSpecializations AS (
    SELECT DISTINCT ChuyenNganh FROM ChuyenGia
),
ProjectSpecializations AS (
    SELECT da.MaDuAn, COUNT(DISTINCT cg.ChuyenNganh) AS NumSpecializations
    FROM DuAn da
    JOIN ChuyenGia_DuAn cgda ON da.MaDuAn = cgda.MaDuAn
    JOIN ChuyenGia cg ON cgda.MaChuyenGia = cg.MaChuyenGia
    GROUP BY da.MaDuAn
)
SELECT ps.MaDuAn
FROM ProjectSpecializations ps
JOIN (SELECT COUNT(*) AS TotalSpecializations FROM DistinctSpecializations) ds
ON ps.NumSpecializations = ds.TotalSpecializations;
GO
-- Trigger:
-- 16. Tạo một trigger để tự động cập nhật số lượng dự án của công ty khi thêm hoặc xóa dự án.
CREATE TRIGGER UpdateProjectCount
ON DuAn
AFTER INSERT, DELETE
AS
BEGIN
    UPDATE CongTy
    SET SoNhanVien = (SELECT COUNT(*) FROM DuAn WHERE DuAn.MaCongTy = CongTy.MaCongTy)
    WHERE MaCongTy IN (SELECT MaCongTy FROM inserted UNION ALL SELECT MaCongTy FROM deleted);
END;

-- 17. Tạo một trigger để ghi log mỗi khi có sự thay đổi trong bảng ChuyenGia.
 -- Tạo bảng lưu log
    CREATE TABLE ChuyenGia_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    MaChuyenGia INT,
    ThoiGianThayDoi DATETIME,
    LoaiThayDoi NVARCHAR(50),
    NguoiThucHien NVARCHAR(100),
    DuLieuThayDoiXML XML
    );

    go
    -- Tạo trigger
    CREATE TRIGGER LogChuyenGiaChanges
    ON ChuyenGia
    AFTER INSERT, UPDATE, DELETE
    AS
    BEGIN
        DECLARE @LogType NVARCHAR(50);
        IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
           SET @LogType = 'Update';
        ELSE IF EXISTS (SELECT * FROM inserted)
           SET @LogType = 'Insert';
        ELSE IF EXISTS (SELECT * FROM deleted)
           SET @LogType = 'Delete';
      INSERT INTO ChuyenGia_Log (MaChuyenGia, ThoiGianThayDoi, LoaiThayDoi, NguoiThucHien, DuLieuThayDoiXML)
      SELECT
          ISNULL(i.MaChuyenGia, d.MaChuyenGia),
          GETDATE(),
          @LogType,
          SYSTEM_USER,
          (SELECT i.* FOR XML AUTO)
        FROM inserted i FULL OUTER JOIN deleted d ON i.MaChuyenGia = d.MaChuyenGia;
    END;
GO
-- 18. Tạo một trigger để đảm bảo rằng một chuyên gia không thể tham gia vào quá 5 dự án cùng một lúc.
CREATE TRIGGER CheckMaxProjects
ON ChuyenGia_DuAn
AFTER INSERT
AS
BEGIN
    IF (SELECT COUNT(*) FROM ChuyenGia_DuAn WHERE MaChuyenGia = (SELECT MaChuyenGia FROM inserted)) > 5
    BEGIN
        RAISERROR('Chuyên gia đã tham gia quá 5 dự án', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

go
-- 19. Tạo một trigger để tự động cập nhật trạng thái của dự án thành 'Hoàn thành' khi tất cả chuyên gia đã kết thúc công việc.
ALTER TABLE ChuyenGia_DuAn ADD NgayKetThucCongViec DATE;
go
CREATE TRIGGER UpdateProjectStatus
ON ChuyenGia_DuAn
AFTER UPDATE
AS
BEGIN
    DECLARE @ProjectID INT;

    SELECT @ProjectID = MaDuAn FROM inserted;

    IF (UPDATE(NgayKetThucCongViec))
	BEGIN
    IF NOT EXISTS (SELECT 1
                    FROM ChuyenGia_DuAn
                    WHERE MaDuAn = @ProjectID
                       AND NgayKetThucCongViec IS NULL)
	BEGIN
        UPDATE DuAn
        SET TrangThai = N'Hoàn thành'
        WHERE MaDuAn = @ProjectID;
	END
	END
END;

-- 20. Tạo một trigger để tự động tính toán và cập nhật điểm đánh giá trung bình của công ty dựa trên điểm đánh giá của các dự án.
ALTER TABLE DuAn ADD DiemDanhGia DECIMAL (2,1);
go
CREATE TRIGGER UpdateAverageRating
ON DuAn
AFTER INSERT, UPDATE
AS
BEGIN
    IF (UPDATE(DiemDanhGia))
	BEGIN
        UPDATE CongTy
        SET SoNhanVien = (SELECT AVG(ISNULL(DiemDanhGia, 0)) FROM DuAn WHERE DuAn.MaCongTy = CongTy.MaCongTy)
        WHERE MaCongTy IN (SELECT MaCongTy FROM inserted UNION ALL SELECT MaCongTy FROM deleted);
	END
END;
