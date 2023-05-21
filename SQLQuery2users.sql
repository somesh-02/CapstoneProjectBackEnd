USE CapstoneDB;
SELECT * FROM Userss;

--CRUD OPERATION ON USERS

CREATE PROCEDURE [dbo].[GetUsersList]
AS
BEGIN
SELECT * FROM Userss;
END 
GO

CREATE PROCEDURE [dbo].[GetUserById]
@UserId INT
AS 
BEGIN
SELECT * FROM dbo.Userss
WHERE Id=@UserId
END
GO

CREATE PROCEDURE [dbo].[AddUser]
@UserFname varchar(200),
@UserLname varchar(200),
@UserPass varchar(200),
@UserEmail varchar(200),
@UserType varchar(200),
@UserDate datetime
AS
BEGIN
INSERT INTO [dbo].[Userss](FirstName,LastName,Password,Email,Type,CreatedOn)
VALUES(@UserFname,@UserLname,@UserPass,@UserEmail,@UserType,@UserDate)
END
GO

CREATE PROCEDURE [dbo].[DeleteUser]
@UserId INT
AS
BEGIN
DELETE FROM dbo.Userss
WHERE Id=@UserId
END
GO

CREATE PROCEDURE [dbo].[Login]
@UserEmail VARCHAR(100),
@UserPassword VARCHAR(100)
AS
BEGIN
SELECT * FROM dbo.Userss
WHERE Email=@UserEmail AND Password=@UserPassword;
END
GO

--CRUD OPERATION ON MEDICINES

CREATE PROCEDURE [dbo].[GetMedicineList]
AS
BEGIN
SELECT * FROM Medicines;
END 
GO

CREATE PROCEDURE [dbo].[GetMedicineById]
@MedicineId INT
AS 
BEGIN
SELECT * FROM dbo.Medicines
WHERE Id=@MedicineId
END
GO

CREATE PROCEDURE [dbo].[DeleteMedicine]
@MedicineId INT
AS
BEGIN
DELETE FROM dbo.Medicines
WHERE Id=@MedicineId
END
GO

CREATE PROCEDURE [dbo].[AddMedicine]
@MedicineName varchar(200),
@Price float,
@Image varchar(200),
@Seller varchar(200),
@MedicineDescription varchar(200),
@CategoryId int
AS
BEGIN
INSERT INTO [dbo].[Medicines](MedicineName,Price,Image,Seller,Description,CategoryId)
VALUES(@MedicineName,@Price,@Image,@Seller,@MedicineDescription,@CategoryId)
END
GO

CREATE PROCEDURE [dbo].[EditMedicine]
@MedicineId INT,
@MedicineName varchar(200),
@Price float,
@Image varchar(200),
@Seller varchar(200),
@MedicineDescription varchar(200),
@CategoryId int
AS
BEGIN
UPDATE dbo.Medicines
SET MedicineName=@MedicineName,
Price=@Price,
Image=@Image,
Seller=@Seller,
Description=@MedicineDescription,
CategoryId=@CategoryId
WHERE Id=@MedicineId
END 
GO

--CRUD OPERATION ON CATEGORIES

CREATE PROCEDURE [dbo].[GetCategoryList]
AS
BEGIN
SELECT * FROM Categories;
END 
GO

CREATE PROCEDURE [dbo].[GetCategoryById]
@CategoryId INT
AS 
BEGIN
SELECT * FROM dbo.Categories
WHERE CategoryId=@CategoryId
END
GO

CREATE PROCEDURE [dbo].[DeleteCategory]
@CategoryId INT
AS
BEGIN
DELETE FROM dbo.Categories
WHERE CategoryId=@CategoryId
END
GO

CREATE PROCEDURE [dbo].[AddCategory]
@CategoryName varchar(200),
@CategoryDescription varchar(200)
AS
BEGIN
INSERT INTO [dbo].[Categories](CategoryName,Description)
VALUES(@CategoryName,@CategoryDescription)
END
GO

CREATE PROCEDURE [dbo].[EditCategory]
@CategoryId INT,
@CategoryName varchar(200),
@CategoryDescription varchar(200)
AS
BEGIN
UPDATE dbo.Categories
SET CategoryName=@CategoryName,
Description=@CategoryDescription
WHERE CategoryId=@CategoryId
END 
GO

--CRUD OPERATION ON CART

CREATE PROCEDURE [dbo].[GetCartsList]
AS
BEGIN
SELECT * FROM Carts;
END 
GO

CREATE PROCEDURE [dbo].[GetCartById]
@CartId INT
AS 
BEGIN
SELECT * FROM dbo.Carts
WHERE CartId=@CartId
END
GO

CREATE PROCEDURE [dbo].[DeleteCarts]
@CartId INT
AS
BEGIN
DELETE FROM dbo.Carts
WHERE CartId=@CartId
END
GO

CREATE PROCEDURE [dbo].[GetCartByUserId]
@UserId INT
AS 
BEGIN
SELECT * FROM dbo.Carts
WHERE UserId=@UserId
END
GO

CREATE PROCEDURE [dbo].[AddCartss]
@Name varchar(200),
@Price varchar(200),
@Seller varchar(200),
@Status varchar(200),
@UserId int
AS
BEGIN
INSERT INTO [dbo].[Carts](Name,Price,Seller,Status,UserId)
VALUES(@Name,@Price,@Seller,@Status,@UserId)
END
GO

CREATE PROCEDURE [dbo].[EmptyCart]
AS
BEGIN
DELETE FROM dbo.Carts;
END
GO

--CRUD OPERATION ON ADDRESS

SELECT * FROM Addresses;

CREATE PROCEDURE [dbo].[GetAddressByUserId]
@UserId INT
AS 
BEGIN
SELECT * FROM dbo.Addresses
WHERE UserId=@UserId
END
GO

CREATE PROCEDURE [dbo].[AddAddress]
@UserName varchar(200),
@Email varchar(200),
@Phone varchar(200),
@Location varchar(200),
@Country varchar(200),
@State varchar(200),
@Zip varchar(200),
@UserId int
AS
BEGIN
INSERT INTO [dbo].[Addresses](UserName,Email,Phone,Location,Country,State,Zip,UserId)
VALUES(@UserName,@Email,@Phone,@Location,@Country,@State,@Zip,@UserId)
END
GO

DELETE FROM Addresses
WHERE Id=7;

CREATE PROCEDURE [dbo].[Search]
@Query varchar(200)
AS
BEGIN
SELECT * FROM Medicines
WHERE MedicineName LIKE '%' + @Query + '%';
END 
GO