

use OnlineShop

---------------------------------------------- Table user status -------------------------------

CREATE TABLE UserStatus (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	StatusName nvarchar(1000)
)
GO

-- select * from UserStatus

-------------------------------------------------- Table role -------------------------------

Create table [Role](
	RoleID int IDENTITY(1, 1) primary key,
	RoleName nvarchar (20),
	-- Admin,marketing, seller, customer
);

GO

--select * from Role

---------------------------- table Users ---------------------------------
create table Users
(
	UserID int PRIMARY KEY identity(1,1),
	Username nvarchar(50),
	[Password] varchar(50),
	gender varchar(20),
	Email nvarchar(100),
	PhoneNum varchar(20),
	[RoleID] int default 3,
	statusId int,
	FOREIGN KEY(RoleID) REFERENCES [Role](RoleID),
	FOREIGN KEY (statusId)
	REFERENCES UserStatus (id)
)

--select * from Users
------------------------------------------------ Table Ship --------------------------------
CREATE TABLE City (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	CityName nvarchar(1000)
)

--select * from City

------------------ Table District -------------------
CREATE TABLE District (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	DistrictName nvarchar(1000)
)

--select * from District

----------------------------- Table ShipAddress -------------------

CREATE TABLE ShipAddress (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	UserID int,
	Fullname nvarchar(100),
	PhoneNum varchar(20),
	ShipCityID int,
	DistrictId int,
	AddressDetail nvarchar(1000),
	constraint userID_in_user_address FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint ship_city_in_ship_address FOREIGN KEY(ShipCityID) REFERENCES City(id),
	constraint district_in_ship_address FOREIGN KEY(DistrictId) REFERENCES District(id)
)

--select * from ShipAddress

----------------------------- Table Category -------------------

CREATE TABLE Category (
	CategoryID int PRIMARY KEY identity(1,1),
	CategoryName nvarchar(1000),
)

--select * from Category

------------------------------- Table ProductStatus -------------------------

CREATE TABLE ProductStatus (
	StatusID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	StatusName nvarchar(1000)
)

--select * from ProductStatus

------------------------------- Table Brand -------------------------

CREATE TABLE Brand (
	BrandID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	BrandName nvarchar(1000)
) 

--select * from Brand

------------------------------- Table Product -------------------------

CREATE TABLE Product (
	ProductID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	ProductName nvarchar(1000),
	[Description] text,
	color varchar(20),
	OriginalPrice int, 
	SellPrice int,	
	SalePercent int CHECK (SalePercent>=0 AND SalePercent<=100),
	CatID int,
	SellerID int,
	Amount int,
	StatusID int,
	BrandID int,
	constraint product_in_Category FOREIGN KEY(CatID) REFERENCES Category(CategoryID),
	constraint SellerID_in_Users FOREIGN KEY(SellerID) REFERENCES Users(UserID),
	constraint StatusID_in_Status FOREIGN KEY(StatusID) REFERENCES ProductStatus(StatusID),
	constraint BrandID_in_Brand FOREIGN KEY(BrandID) REFERENCES Brand(BrandID)
)
--select * from Product


--------------------- Table ProductImg -------------------

CREATE TABLE [dbo].[ProductImg](
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	[ProductID] [int]  ,
	[ProductImgURL] [varchar](255) ,
	constraint ProductImg_ID FOREIGN KEY([ProductID])
	REFERENCES [dbo].[Product] ([ProductID])
)


--------------------- Table cart ---------------------

CREATE TABLE Cart (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	UserID int,
	ProductID int,
	Amount int
	constraint userID_in_cart FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint productID_in_cart FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
)


--select * from Cart

--------------------- Table OrderStatus -----------------

CREATE TABLE [dbo].[OrderStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](50) NOT NULL,
 )

 --select * from [OrderStatus]

 -------------------- Table Orders ----------------------

 CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[UserID] [int] NULL,
	[TotalPrice] float NULL,
	[Note] [nvarchar](2000) NULL,
	StatusID [int] NULL,
	[OrderDate] [DATETIME] NULL ,
	DeliveryDate [DATETIME] NULL,
	constraint userID_in_order_status FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint statusID_in_order_status FOREIGN KEY(StatusID) REFERENCES OrderStatus(ID)
)


--select * from Orders

--------------------- Table OrderDetail ---------------------

CREATE TABLE [dbo].[OrderDetail](
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	[OrderID] [int] NOT NULL ,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](1000) NOT NULL,
	[ProductPrice] [int] NOT NULL,	
	[Quantity] [int] NOT NULL,
	constraint orderID_in_order_detail FOREIGN KEY(OrderID) REFERENCES Orders(ID),
	constraint productID_in_order_detail FOREIGN KEY(ProductID) REFERENCES Product(ProductID)	
)
--select * from [OrderDetail]


------------------------ Table ShipInfo --------------------

CREATE TABLE ShipInfo (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	OrderID int,
	ShipAddressID int,
	Note nvarchar(2000),
	constraint order_id_in_ship_info FOREIGN KEY(OrderID) REFERENCES Orders(ID),
	constraint shipaddress_id_in_ship_info FOREIGN KEY(ShipAddressID) REFERENCES ShipAddress(id)
)

---------------------- Table Notifications -------------------
CREATE TABLE Notifications(
	ID int PRIMARY KEY identity (1,1),
	UserID int,
	OrderID int,
	Content nvarchar(1000),
	status int,
	time datetime,
	constraint UserID_in_Users FOREIGN KEY(UserID) REFERENCES Users(userId),
	constraint OrderID_in_Orders FOREIGN KEY(OrderID) REFERENCES Orders(ID)

);

---------------- Table Feedback ---------------------
CREATE TABLE Feedback (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	UserID int,
	ProductID int,
	Star int, --min 1- max 5
	FeedbackDetail nvarchar(2000),
	constraint userID_in_user_3 FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint productID_in_feedback FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
	constraint valid_star CHECK (Star < 6 AND Star > 0)
)


--------------- Table Blog ---------------

Create TABLE Blog(
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	UserID int,
	CatId int,
	Title nvarchar(2500),
	[description] text,
	Content text,
	imageLink nvarchar(1000),
	constraint blog_in_Category FOREIGN KEY(CatID) REFERENCES Category(CategoryID),
	constraint userID_in_users_3 FOREIGN KEY(UserID) REFERENCES Users(UserID)
)

--------------- Table Slider -------------------

Create TABLE Slider(
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	[urlImage] varchar(255),
	CatID int,
	BackLink nvarchar(2500),
	constraint catID_in_Slider FOREIGN KEY(CatID) REFERENCES Category(CategoryID)
)

--select * from Slider
