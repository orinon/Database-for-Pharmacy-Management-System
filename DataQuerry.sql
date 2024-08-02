

INSERT INTO Loại_Thuốc
values ('ML001',N'Thuốc bổ và vitamin'),
		('ML002',N'Giảm đau, hạ sốt, kháng viêm'),
		('ML003',N'Mắt, tai, mũi , họng'),
		('ML004',N'Dầu, Cao Xoa, Miếng Dán'),
		('ML005',N'Kháng sinh, kháng nấm'),
		('ML006',N'Da liễu, dị ứng');

INSERT INTO Công_dụng
VALUES ('MC001',N'Bổ sung vitamin'),
		('MC002',N'Điều trị hỗ trợ rối loạn về hệ thần kinh'),
		('MC003',N'Hạ sốt, giảm đau'),
		('MC004',N'Rửa mắt, giảm mỏi mắt, ngứa mắt, khô rát mắt'),
		('MC005',N'Giảm triệu chứng ngạt mũi và giảm sung huyết'),
		('MC006',N'Thúc đẩy tuần hoàn lợi (nướu), ngăn ngừa nguy cơ cao răng'),
		('MC007',N'Giảm đau, kháng viêm'),
		('MC008',N'Chóng mặt, đau bụng, trúng gió, xoa bóp, chống viêm, đau nhức, sưng trật chân'),
		('MC009',N'Trị cảm cúm, nghẹt mũi'),
		('MC010',N'Tẩy giun'),
		('MC011',N'Trị viêm mũi dị ứng, mày đay');

INSERT INTO Đối_tượng_sử_dụng
VALUES ('MD001',N'Người lớn và thanh thiếu nên'),
		('MD002',N'Mọi người'),
		('MD003',N'Người lớn, trẻ em từ 2 tuổi trở lên'),
		('MD004',N'Người lớn, trẻ em trên 12 tuổi trở lên '),
		('MD005',N'Người lớn, trẻ em từ 6 tuổi trở lên'),
		('MD006',N'Người lớn, trẻ em từ 30 tháng trở lên');

INSERT INTO Thương_hiệu
VALUES ('MTH001',N'United International Pharma'),
		('MTH002',N'Stella'),
		('MTH003',N'S Pharm'),
		('MTH004',N'GlaxoSmithKline'),
		('MTH005',N'Abbott'),
		('MTH006',N'Bristol - Myers Squibb'),
		('MTH007',N'Dược Hậu Giang'),
		('MTH008',N'Lion Corporation'),
		('MTH009',N'Merap Group'),
		('MTH010',N' Dược phẩm Trung ương 1 - Pharbaco'),
		('MTH011',N'Sao Thái Dương'),
		('MTH012',N'Hisamitsu'),
		('MTH013',N'Trường Sơn '),
		('MTH014',N'Pharmedic'),
		('MTH015',N'Janssen'),
		('MTH016',N'Dược Phẩm Hà Tây'),
		('MTH017',N'Mega We care'),
		('MTH018',N'An Thiên Pharma'),
		('MTH019',N'TV.Pharm');

INSERT INTO Nhà_Cung_Cấp
VALUES ('NCC001',N'United International Pharma'),
		('NCC002',N'Stellapharm'),
		('NCC003',N'Dược S.Pharm'),
		('NCC004',N'Sanofi'),
		('NCC005',N'Dược phẩm Glomed'),
		('NCC006',N' Upsa SAS'),
		('NCC007',N'Dược Hậu Giang'),
		('NCC008',N'Nitto Medic'),
		('NCC009',N'Merap Group'),
		('NCC010',N' Dược phẩm Trung ương 1 - Pharbaco'),
		('NCC011',N'Sao Thái Dương'),
		('NCC012',N'Dược Phẩm Hisamitsu Việt Nam'),
		('NCC013',N'Đông Nam Dược Trường Sơn'),
		('NCC014',N'Dược Phẩm Dược Liệu Pharmedic'),
		('NCC015',N'OLIC '),
		('NCC016',N'Dược Phẩm Hà Tây'),
		('NCC017',N'Mega Lifesciences'),
		('NCC018',N'Dược phẩm An Thiên'),
		('NCC019',N'TV.Pharm');

INSERT INTO Dạng_Bào_Chế
VALUES ('MBC001',N'Viên nén bao phim'),
		('MBC002',N'Viên sủi'),
		('MBC003',N'Bột sủi'),
		('MBC004',N'Dung dịch'),
		('MBC005',N'Thuốc xịt mũi'),
		('MBC006',N'Cao dán'),
		('MBC007',N'Dầu xoa'),
		('MBC008',N'Gel dùng ngoài da'),
		('MBC009',N'Ống hít'),
		('MBC010',N'Viên nén nhai'),
		('MBC011',N'Viên nén'),
		('MBC012',N'Viên nén mềm'),
		('MBC013',N'Dung dịch uống');

INSERT INTO Cách_Đóng_Gói
VALUES ('MDG001',N'Hộp'),
		('MDG002',N'Chai'),
		('MDG003',N'Gói'),
		('MDG004',N'Tuýp'),
		('MDG005',N'Vỉ');

INSERT INTO Khách_Hàng
VALUES  ('MKH001',N'Nguyễn Huỳnh K',34567891),
		('MKH002',N'Đỗ Minh H',34567893),
		('MKH003',N'Nguyễn Hoàng Quốc A',34567895),
		('MKH004',N'Nguyễn Quang A',34567896),
		('MKH005',N'Trần Thị B',34567897);

INSERT INTO Hóa_Đơn
VALUES  ('HD001','MKH001',1070000,'2023-01-21'),
		('HD002','MKH001',430000,'2023-01-23'),
		('HD003','MKH001',602000,'2023-02-24'),
		('HD004','MKH002',90000,'2023-02-11'),
		('HD005','MKH002',242000,'2023-05-07'),
		('HD006','MKH002',492000,'2023-05-11'),
		('HD007','MKH003',496000,'2023-07-13'),
		('HD008','MKH003',600000,'2023-04-18'),
		('HD009','MKH004',592000,'2023-07-22'),
		('HD010','MKH005',405000,'2023-06-15');

INSERT INTO Nhân_Viên
VALUES  ('NV001','Nguyễn Văn A',444444444,'2003-10-01',N'Nam',N'Quản lý'),
		('NV002','Nguyễn Thị Thanh B',33333333,'2003-02-12',N'Nữ',N'Nhân viên bán hàng'),
		('NV003','Trần Minh C',22222222,'2003-07-15',N'Nam',N'Nhân viên kho'),
		('NV004','Hồ Thanh D',1111111,'2003-02-22',N'Nữ',N'Nhân viên bán hàng');

INSERT INTO Thuốc
VALUES 
('MT001',N'Enervon','ML001','MC001','MD001','MTH001',N'Việt Nam','MBC001','MDG001','NCC001','48 tháng',100),
('MT002',N'Scanneuron - Forte','ML001','MC002','MD001','MTH002',N'Việt Nam','MBC001','MDG001','NCC002','24 tháng',90),
('MT003',N'Vitamin C Spharm','ML001','MC001','MD002','MTH003', N'Việt Nam','MBC001','MDG001','NCC003','24 tháng',70),
('MT004',N'Panadol Extra','ML002','MC003','MD002','MTH004',N'Việt Nam','MBC001','MDG001','NCC004','36 tháng',80),
('MT005',N'Glotadol','ML002','MC003','MD002','MTH005',N'Việt Nam','MBC001','MDG002','NCC005','36 tháng',75),
('MT006',N'Viên sủi Efferalgan','ML002','MC003','MD002','MTH006',N'Pháp','MBC002','MDG001','NCC006','36 tháng',50),
('MT007',N'Bột sủi Hapacol','ML002','MC003','MD003','MTH007',N'Việt Nam','MBC003','MDG001','NCC007','36 tháng',45),
('MT008',N'Dung dịch nhỏ mắt Eyemiru ','ML003','MC004','MD002','MTH008',N'Nhật Bản','MBC004','MDG002','NCC008','24 tháng',90),
('MT009',N'Dung dịch nhỏ mắt Osla','ML003','MC004','MD003','MTH009',N'Việt Nam','MBC004','MDG002','NCC009','24 tháng',75),
('MT010',N'Thuốc xịt mũi Otilin','ML003','MC005','MD004','MTH010',N'Việt Nam','MBC005','MDG002','NCC010','24 tháng',60),
('MT011',N'Thuốc xịt mũi Benita ','ML003','MC005','MD005','MTH009',N'Việt Nam','MBC005','MDG002','NCC009','24 tháng',45),
('MT012',N'Nước súc miệng Thái Dương','ML003','MC006','MD002','MTH011',N'Việt Nam','MBC004','MDG002','NCC011','36 tháng',120),
('MT013',N'Cao dán Salonpas','ML004','MC007','MD002','MTH012',N'Việt Nam','MBC006','MDG003','NCC012','36 tháng',95),
('MT014',N'Dầu nóng Trường Sơn ','ML004','MC008','MD002','MTH013',N'Việt Nam','MBC007','MDG002','NCC013','72 tháng',220),
('MT015',N'Gel bôi Salonpas Gel ','ML004','MC008','MD003','MTH012',N'Việt Nam','MBC008','MDG004','NCC012','48 tháng',115),
('MT016',N'Ống hít Inhaler','ML004','MC009','MD006','MTH014',N'Việt Nam','MBC009','MDG005','NCC014','24 tháng',230),
('MT017',N'Viên nhai Fugacar vị trái cây','ML005','MC010','MD003','MTH015',N'Thái Lan','MBC010','MDG005','NCC015','120 tháng',140),
('MT018',N'Viên nhai Albendazol Hataphar','ML005','MC010','MD002','MTH016',N'Việt Nam','MBC010','MDG005','NCC016','24 tháng',100),
('MT019',N'Viên nhai Fumecar','ML005','MC010','MD003','MTH005',N'Việt Nam','MBC011','MDG005','NCC005','48 tháng',100),
('MT020',N'Loreze Clearcap','ML006','MC011','MD003','MTH017',N'Thái Lan','MBC012','MDG001','NCC017','24 tháng',210),
('MT021',N'Dung dịch uống A.T Desloratadin','ML006','MC011','MD003','MTH018',N'Việt Nam','MBC013','MDG001','NCC018','24 tháng',150),
('MT022',N'Fexophar','ML006','MC011','MD005','MTH019',N'Việt Nam','MBC001','MDG001','NCC019','36 tháng',180);

INSERT INTO Phiếu_Nhập	
VALUES  ('PN001','NCC001',300000000,'2022-11-1'),
		('PN002','NCC002',23800000,'2022-01-13'),
		('PN003','NCC003',4400000,'2022-06-14'),
		('PN004','NCC004',150000,'2022-07-14'),
		('PN005','NCC005',9000000,'2022-02-16'),
		('PN006','NCC006',4000000,'2022-02-22'),
		('PN007','NCC007',300000000,'2022-05-14'),
		('PN008','NCC008',6500000,'2022-08-11'),
		('PN009','NCC009',1725000,'2022-11-11'),
		('PN010','NCC010',1530000,'2022-04-11'),
		('PN011','NCC010',8550000,'2022-12-22');

INSERT INTO Chi_tiết_phiếu_nhập	
VALUES  ('PN001','MT001',150,200000),
		('PN002','MT002',170,140000),
		('PN003','MT003',110,40000),
		('PN004','MT004',150,1000),
		('PN005','MT005',120,75000),
		('PN006','MT006',100,40000),
		('PN007','MT019',130,10000),
		('PN007','MT007',120,25000),
		('PN008','MT008',100,65000),
		('PN009','MT009',115,15000),
		('PN009','MT011',95,90000),
		('PN010','MT010',90,17000),
		('PN011','MT013',120,25000),
		('PN011','MT015',150,37000);

INSERT INTO Biến_Động_Giá	
VALUES  ('BD001','MT001',230000,'2023-01-01'),
		('BD002','MT002',160000,'2023-02-01'),
		('BD003','MT003',45000,'2023-02-23'),
		('BD004','MT004',3000,'2023-04-11'),
		('BD005','MT005',50000,'2023-01-07'),
		('BD006','MT006',30000,'2023-02-12'),
		('BD007','MT007',70000,'2023-03-09'),
		('BD008','MT008',20000,'2023-02-05'),
		('BD009','MT009',20000,'2023-04-17'),
		('BD010','MT010',250000,'2023-01-12'),
		('BD011','MT011',95000,'2023-02-12'),
		('BD012','MT012',30000,'2023-05-14'),
		('BD013','MT013',30000,'2023-07-16'),
		('BD014','MT014',25000,'2023-07-09'),
		('BD015','MT015',40000,'2023-07-12'),
		('BD016','MT016',7000,'2023-01-11'),
		('BD017','MT017',30000,'2023-07-01'),
		('BD018','MT018',5000,'2023-07-29'),
		('BD019','MT019',15000,'2023-05-24'),
		('BD020','MT020',250000,'2023-03-31'),
		('BD021','MT021',120000,'2023-06-17'),
		('BD022','MT022',145000,'2023-03-03'),
		('BD023','MT003',50000,'2023-04-16'),
		('BD024','MT004',5000,'2023-06-28'),
		('BD025','MT005',80000,'2023-07-09'),
		('BD026','MT006',42000,'2023-04-24'),
		('BD027','MT007',35000,'2023-07-15'),
		('BD028','MT008',70000,'2023-06-29'),
		('BD029','MT009',25000,'2023-05-07'),
		('BD030','MT003',55000,'2023-06-20'),
		('BD031','MT007',29000,'2023-07-20'),
		('BD032','MT005',85000,'2023-07-24');


INSERT INTO Thanh_Toán_PN
VALUES	('PN001','NV001','2022-01-11'), 
		('PN002','NV002','2022-01-13'),
		('PN003','NV003','2022-06-14'),
		('PN004','NV004','2022-07-14'),
		('PN005','NV001','2022-02-16'),
		('PN006','NV002','2022-02-22'),
		('PN007','NV003','2022-05-14'),
		('PN008','NV004','2022-08-11'),
		('PN009','NV001','2022-11-11'),
		('PN010','NV002','2022-04-11'),
		('PN011','NV003','2022-12-22');

INSERT INTO Thanh_Toán_HD 
VALUES
  ('HD001', 'NV001', 1100000, N'Tiền mặt', 30000, '2023-01-21'),
  ('HD002', 'NV002', 450000, N'Tiền mặt', 20000, '2023-01-23'),
  ('HD003', 'NV003', 602000, N'Thẻ tín dụng', 0, '2023-02-24'),
  ('HD004', 'NV004', 90000, N'Thẻ tín dụng', 0, '2023-02-11'),
  ('HD005', 'NV001', 250000, N'Tiền mặt', 8000, '2023-05-07'),
  ('HD006', 'NV002', 492000, N'Thẻ tín dụng', 0, '2023-05-11'),
  ('HD007', 'NV003', 500000, N'Tiền mặt', 4000, '2023-07-13'),
  ('HD008', 'NV004', 600000, N'Thẻ tín dụng', 0, '2023-04-18'),
  ('HD009', 'NV001', 592000, N'Thẻ tín dụng', 0, '2023-07-22'),
  ('HD010', 'NV002', 500000, N'Tiền mặt', 95000, '2023-06-15');


INSERT INTO Chi_Tiết_Hóa_Đơn
VALUES  ('HD001','MT001',3),
		('HD001','MT002',2),
		('HD001','MT007',2),
		('HD002','MT005',5),
		('HD003','MT005',7),
		('HD004','MT006',2),
		('HD005','MT007',5),
		('HD005','MT010',1),
		('HD005','MT009',4),
		('HD006','MT004',8),
		('HD006','MT002',3),
		('HD007','MT010',7),
		('HD007','MT006',6),
		('HD007','MT003',2),
		('HD008','MT008',4),
		('HD008','MT002',2),
		('HD009','MT008',6),
		('HD009','MT005',2),
		('HD010','MT006',9);