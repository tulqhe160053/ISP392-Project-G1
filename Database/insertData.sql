
use OnlineShop

------ Insert into UserStatus ------------------------
INSERT INTO UserStatus VALUES (N'Active');
INSERT INTO UserStatus VALUES (N'Locked');
INSERT INTO UserStatus VALUES (N'Gmail Login');
INSERT INTO UserStatus VALUES (N'Unverified');

------ Insert into role ------------

INSERT INTO [Role] VALUES (N'Admin');
INSERT INTO Role VALUES (N'Seller');
INSERT INTO Role VALUES (N'Customer');
INSERT INTO Role VALUES (N'Marketing');


------ Insert into Users ------------


INSERT INTO Users VALUES(N'admin','123456','male','admin@fpt.edu.vn','0123012345',1,1);
INSERT INTO Users VALUES(N'tu','1234567','male','tulqhe160053@fpt.edu.vn','0962229812',3,1);
INSERT INTO Users VALUES(N'thanh','654321','male','thanh01@gmail.com','3232112243',2,1);
INSERT INTO Users VALUES(N'mkt','mkt123','male','mkt@gmail.com','0122121175',4,1);

INSERT INTO Users VALUES(N'minh','1234567','male','minhmq1@gmail.com','0123122435',3,1);
INSERT INTO Users VALUES(N'quynh','1234567','female','quynhngoc16@gmail.com','0877889811',3,1);
INSERT INTO Users VALUES(N'quan','1234567','male','quanminh12@gmail.com','0540930921',3,1);
INSERT INTO Users VALUES(N'hanh','1234567','female','hanhnguyen1@gmail.com','0978773891',3,1);

INSERT INTO Users VALUES(N'ngoc','123456','female','ngoc01@gmail.com','3252112243',2,1);
INSERT INTO Users VALUES(N'nhat','123456','male','nhat12@gmail.com','3252123643',2,1);


------ Insert into City ------------

INSERT INTO City VALUES (N'An Giang');
INSERT INTO City VALUES (N'Bà Rịa-Vũng Tàu');
INSERT INTO City VALUES (N'Bạc Liêu');
INSERT INTO City VALUES (N'Bắc Kạn');
INSERT INTO City VALUES (N'Bắc Giang');
INSERT INTO City VALUES (N'Bắc Ninh');
INSERT INTO City VALUES (N'Bến Tre');
INSERT INTO City VALUES (N'Bình Dương');
INSERT INTO City VALUES (N'Bình Định');
INSERT INTO City VALUES (N'Bình Phước');
INSERT INTO City VALUES (N'Bình Thuận');
INSERT INTO City VALUES (N'Cà Mau');
INSERT INTO City VALUES (N'Cao Bằng');
INSERT INTO City VALUES (N'Cần Thơ');
INSERT INTO City VALUES (N'Đà Nẵng');
INSERT INTO City VALUES (N'Đắk Lắk');
INSERT INTO City VALUES (N'Đắk Nông');
INSERT INTO City VALUES (N'Điện Biên');
INSERT INTO City VALUES (N'Đồng Nai');
INSERT INTO City VALUES (N'Đồng Tháp');
INSERT INTO City VALUES (N'Gia Lai');
INSERT INTO City VALUES (N'Hà Giang');
INSERT INTO City VALUES (N'Hà Nam');
INSERT INTO City VALUES (N'Hà Nội');
INSERT INTO City VALUES (N'Hà Tĩnh');
INSERT INTO City VALUES (N'Hải Dương');
INSERT INTO City VALUES (N'Hải Phòng');
INSERT INTO City VALUES (N'Hòa Bình');
INSERT INTO City VALUES (N'Hồ Chí Minh');
INSERT INTO City VALUES (N'Hậu Giang');
INSERT INTO City VALUES (N'Hưng Yên');
INSERT INTO City VALUES (N'Khánh Hòa');
INSERT INTO City VALUES (N'Kiên Giang');
INSERT INTO City VALUES (N'Kon Tum');
INSERT INTO City VALUES (N'Lai Châu');
INSERT INTO City VALUES (N'Lào Cai');
INSERT INTO City VALUES (N'Lạng Sơn');
INSERT INTO City VALUES (N'Lâm Đồng');
INSERT INTO City VALUES (N'Long An');
INSERT INTO City VALUES (N'Nam Định');
INSERT INTO City VALUES (N'Nghệ An');
INSERT INTO City VALUES (N'Ninh Bình');
INSERT INTO City VALUES (N'Ninh Thuận');
INSERT INTO City VALUES (N'Phú Thọ');
INSERT INTO City VALUES (N'Phú Yên');
INSERT INTO City VALUES (N'Quảng Bình');
INSERT INTO City VALUES (N'Quảng Nam');
INSERT INTO City VALUES (N'Quảng Ngãi');
INSERT INTO City VALUES (N'Quảng Ninh');
INSERT INTO City VALUES (N'Quảng Trị');
INSERT INTO City VALUES (N'Sóc Trăng');
INSERT INTO City VALUES (N'Sơn La');
INSERT INTO City VALUES (N'Tây Ninh');
INSERT INTO City VALUES (N'Thái Bình');
INSERT INTO City VALUES (N'Thái Nguyên');
INSERT INTO City VALUES (N'Thanh Hóa');
INSERT INTO City VALUES (N'Thừa Thiên - Huế');
INSERT INTO City VALUES (N'Tiền Giang');
INSERT INTO City VALUES (N'Trà Vinh');
INSERT INTO City VALUES (N'Tuyên Quang');
INSERT INTO City VALUES (N'Vĩnh Long');
INSERT INTO City VALUES (N'Vĩnh Phúc');
INSERT INTO City VALUES (N'Yên Bái');

------ Insert into District ----------------

INSERT INTO District VALUES (N'Ba Đình');
INSERT INTO District VALUES (N'Bắc Từ Liêm');
INSERT INTO District VALUES (N'Cầu Giấy');
INSERT INTO District VALUES (N'Đống Đa');
INSERT INTO District VALUES (N'Hà Đông');
INSERT INTO District VALUES (N'Hai Bà Trưng');
INSERT INTO District VALUES (N'Hoàn Kiếm');
INSERT INTO District VALUES (N'Hoàng Mai');
INSERT INTO District VALUES (N'Long Biên');
INSERT INTO District VALUES (N'Nam Từ Liêm');
INSERT INTO District VALUES (N'Tây Hồ');
INSERT INTO District VALUES (N'Thanh Xuân');

------ Insert into ShipAddress ------------

insert into dbo.[ShipAddress] (UserID, Fullname, PhoneNum,ShipCityID,DistrictId, AddressDetail) values (2, N'Linh Quang Tú', '0962239966', 24, 1, N'Số nhà 182, Giảng Võ');
insert into dbo.[ShipAddress] (UserID, Fullname, PhoneNum,ShipCityID,DistrictId, AddressDetail) values (5, N'Bình Minh', '0123122435',24,2, N'Số 92, Xuân Đỉnh');
insert into dbo.[ShipAddress] (UserID, Fullname, PhoneNum,ShipCityID,DistrictId, AddressDetail) values (6, N'Xuân Quỳnh', '0977889811',24,3, N'Sô 123, Trung Hòa');
insert into dbo.[ShipAddress] (UserID, Fullname, PhoneNum,ShipCityID,DistrictId, AddressDetail) values (7, N'Minh Quân', '0540930921',24,4, N'Số 92, Ô Chợ Dừa');


------ Insert into Category ------------

INSERT INTO dbo.Category(CategoryName)VALUES(N'Laptop')
INSERT INTO dbo.Category(CategoryName)VALUES(N'Điện thoại')
INSERT INTO dbo.Category(CategoryName)VALUES(N'Máy tính bảng')
INSERT INTO dbo.Category(CategoryName)VALUES(N'Phụ kiện')


------ Insert into ProductStatus ------------

INSERT INTO ProductStatus VALUES ( N'Available');
INSERT INTO ProductStatus VALUES ( N'StopBusiness');

------ Insert into Brand ------------

INSERT INTO dbo.Brand(BrandName)VALUES(N'Apple')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Asus')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Dell')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Lenovo')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Acer')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Samsung')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Oppo')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Xiaomi')
INSERT INTO dbo.Brand(BrandName)VALUES(N'JBL')


--------- Insert into Product -----------
INSERT INTO Product VALUES (
	N'MacBook Pro 14 M1',
	N'MacBook Pro sở hữu bộ vi xử lý M1 Pro được sản xuất bằng quy trình 5 nm hiện đại, có 6 lõi hiệu năng cao và 2 lõi tiết kiệm điện, cho hiệu năng nhanh hơn tới 70% và hiệu suất tăng 1.7 lần so với thế hệ trước, mang lại hiệu năng vượt trội nhưng vẫn đảm bảo tiết kiệm điện năng tiêu thụ, cho phép mình làm việc văn phòng mượt mà, chỉnh sửa ảnh hay dựng video độ phân giải cao đều không thành vấn đề.',
	'Silver',
	400,
	417,
	10,
	1,
	3,
	100,
	1,
	1
);

INSERT INTO Product VALUES (
	N'MacBook Pro 14 M1',
	N'MacBook Pro sở hữu bộ vi xử lý M1 Pro được sản xuất bằng quy trình 5 nm hiện đại, có 6 lõi hiệu năng cao và 2 lõi tiết kiệm điện, cho hiệu năng nhanh hơn tới 70% và hiệu suất tăng 1.7 lần so với thế hệ trước, mang lại hiệu năng vượt trội nhưng vẫn đảm bảo tiết kiệm điện năng tiêu thụ, cho phép mình làm việc văn phòng mượt mà, chỉnh sửa ảnh hay dựng video độ phân giải cao đều không thành vấn đề.',
	'Grey',
	400,
	430,
	10,
	1,
	9,
	50,
	1,
	1
);

INSERT INTO Product VALUES (
	N'iPhone 11 64GB',
	N'Sau chiếc điện thoại iPhone Xr, Apple tiếp tục ra mắt siêu phẩm 2019 mang tên iPhone 11 64GB - một smartphone được nâng cấp toàn diện từ thiết kế cao cấp, vi xử lý hiệu năng mạnh mẽ đến hệ thống camera chất lượng cùng thời lượng pin vượt trội.',
	'Black',
	300,
	334,
	10,
	2,
	9,
	50,
	1,
	1
);

INSERT INTO Product VALUES (
	N'iPhone 11 64GB',
	N'Sau chiếc điện thoại iPhone Xr, Apple tiếp tục ra mắt siêu phẩm 2019 mang tên iPhone 11 64GB - một smartphone được nâng cấp toàn diện từ thiết kế cao cấp, vi xử lý hiệu năng mạnh mẽ đến hệ thống camera chất lượng cùng thời lượng pin vượt trội.',
	'White',
	300,
	334,
	10,
	2,
	10,
	50,
	1,
	1
);

INSERT INTO Product VALUES (
	N'iPad Pro M1 12.9 inch',
	N'iPad Pro M1 12.9 inch Wifi 128GB (2021) mang trong mình hiệu năng cực khủng kèm theo màn hình Liquid Retina XDR vô cùng ấn tượng. Giờ đây chỉ với chiếc máy tính bảng trên tay, bạn đã có những trải nghiệm giải trí đỉnh cao, thỏa sức sáng tạo và hoàn thành mọi tác phẩm nhanh chóng hơn.',
	'Grey',
	300,
	334,
	10,
	3,
	10,
	50,
	1,
	1
);

INSERT INTO Product VALUES (
	N'iPad Air 5 M1',
	N'Được phủ lên mình một lớp áo làm từ hợp kim nhôm cao cấp cùng kiểu thiết kế vuông vức, giúp máy toát lên vẻ sang trọng và cao cấp hơn, bên cạnh đó iPad Air 5 M1 còn được hoàn thiện mặt lưng nhám giúp hạn chế bám dấu vân tay và mồ hôi trong quá trình sử dụng.',
	'Grey',
	330,
	352,
	10,
	3,
	10,
	50,
	1,
	1
);

INSERT INTO Product VALUES (
	N'AirPods 3',
	N'Chiếc tai nghe Bluetooth AirPods 3 Lightning Charge Apple MPNY3 Trắng mang đến một thiết kế tối giản, kiểu dáng hiện đại, màu sắc tinh tế và nhiều công nghệ âm thanh vượt trội như: Adaptive EQ, Chip Apple H1, Spatial Audio.',
	'White',
	350,
	361,
	10,
	4,
	10,
	50,
	1,
	1
);

INSERT INTO Product VALUES (
	N'AirPods Pro',
	N'AirPods Pro 2 là một trong những sản phẩm được Apple ra mắt trong năm 2022, với nhiều nâng cấp ấn tượng, chip H2 mạnh mẽ, âm thanh phong phú hơn, khả năng khử tiếng ồn chủ động,... hứa hẹn sẽ mang lại trải nghiệm tuyệt vời cho người dùng.',
	'White',
	350,
	362,
	10,
	4,
	10,
	50,
	1,
	1
);


--------- Insert into ProductImg ----------
Insert into ProductImg values (1,'MB1.jpg')
Insert into ProductImg values (2,'MB2.jpg')
Insert into ProductImg values (3,'IP1.jpg')
Insert into ProductImg values (4,'IP2.jpg')
Insert into ProductImg values (5,'IPA1.jpg')
Insert into ProductImg values (6,'IPA2.jpg')
Insert into ProductImg values (7,'AP1.jpg')
Insert into ProductImg values (8,'AP2.jpg')

--------- Insert into Cart ----------


--------- Insert into [OrderStatus] ----------

INSERT [dbo].[OrderStatus] ([Name]) VALUES (N'Waiting for Confirmation')
INSERT [dbo].[OrderStatus] ([Name]) VALUES (N'Packaging')
INSERT [dbo].[OrderStatus] ([Name]) VALUES (N'Delivering')
INSERT [dbo].[OrderStatus] ([Name]) VALUES (N'Canceled')
INSERT [dbo].[OrderStatus] ([Name]) VALUES (N'Completed')

--------- Insert into Orders ----------


--------- Insert into [OrderDetail] ------------



--------- Insert into ShipInfo -------------------


--------- Insert into Notifications -------------------


--------- Insert into Feedback -------------------


--------- Insert into Blog -------------------


--------- Insert into Slider -----------------
Insert into Slider values ('laptop.jpg',1,null);
Insert into Slider values ('phone.jpg',2,null);
Insert into Slider values ('tablet.jpg',3,null);



