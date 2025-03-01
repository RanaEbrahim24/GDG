/*Create the Social Media Platform database using SQL scripts (schema from your 
previous assignment). */
create database Social_Media_Platform;
go
use Social_Media_Platform;
go
CREATE TABLE Social_Media_User
(
    ID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(30) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Gender NVARCHAR(10) CHECK (Gender IN ('female', 'male', 'انثي', 'ذكر')) DEFAULT 'male',
    DOB DATE,
    JoinDate DATE,
)
go
CREATE TABLE Social_Media_Posts
(
    P_ID INT IDENTITY PRIMARY KEY,
    Content NVARCHAR(50),
    PostDate DATE,
    PublicPost NVARCHAR(20),
    PrivatePost NVARCHAR(20),
    U_ID INT,
 FOREIGN KEY (U_ID) REFERENCES Social_Media_User(ID)
)
go
CREATE TABLE Social_Media_Comment
(
C_ID INT IDENTITY PRIMARY KEY,
Date date,
Content nvarchar(50),
P_ID int,
U_ID int ,
 FOREIGN KEY (U_ID) REFERENCES Social_Media_User(ID),
  FOREIGN KEY (P_ID) REFERENCES Social_Media_Posts(P_ID)
)
go
CREATE TABLE Social_Media_Interaction
(
I_ID INT IDENTITY PRIMARY KEY,
Date date,
Type nvarchar(50),
P_ID int,
U_ID int ,
FOREIGN KEY (U_ID) REFERENCES Social_Media_User(ID),
FOREIGN KEY (P_ID) REFERENCES Social_Media_Posts(P_ID)
)
go
CREATE TABLE Social_Media_Interact
(
    P_ID INT,
    U_ID INT,
FOREIGN KEY (U_ID) REFERENCES Social_Media_User(ID),
FOREIGN KEY (P_ID) REFERENCES Social_Media_Posts(P_ID),
PRIMARY KEY (U_ID, P_ID)
)
/* Insert at least 2 rows into each table. */
INSERT INTO Social_Media_User (Name, Email, Gender, DOB, JoinDate)
VALUES 
('ahmed ali', 'ahmedali@example.com', 'male', '1990-05-15', '2020-06-01'),
('rana ebrahim', 'ranaebrahim@example.com', 'female', '2002-09-30', '2021-07-12');
GO

INSERT INTO Social_Media_Posts (Content, PostDate, PublicPost, PrivatePost, U_ID)
VALUES 
('Hi', '2025-03-01', 'Yes', 'No', 1),
('Hello', '2025-03-02', 'No', 'Yes', 2);
GO


INSERT INTO Social_Media_Comment (Date, Content, P_ID, U_ID)
VALUES 
('2025-03-01', 'Hi', 1, 2),
('2025-03-02', 'Hello', 2, 1);
GO


INSERT INTO Social_Media_Interaction (Date, Type, P_ID, U_ID)
VALUES 
('2025-03-01', 'Like', 1, 2),
('2025-03-02', 'Share', 2, 1);
GO

INSERT INTO Social_Media_Interact (P_ID, U_ID)
VALUES 
(1, 2),
(2, 1);
-- Online Shopping System 
CREATE DATABASE OnlineShoppingDB;
USE OnlineShoppingDB;
go
CREATE TABLE OnlineShoppingDB_Customer (
    C_ID INT IDENTITY PRIMARY KEY ,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhNumber VARCHAR(15) NOT NULL,
    Address TEXT
)
go 

CREATE TABLE OnlineShoppingDB_Orders (
    O_ID INT IDENTITY PRIMARY KEY ,
    Status VARCHAR(50) NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    O_Date DATE NOT NULL,
    C_ID INT,
    FOREIGN KEY (C_ID) REFERENCES OnlineShoppingDB_Customer(C_ID)
)

go

CREATE TABLE OnlineShoppingDB_Product (
    P_ID INT IDENTITY PRIMARY KEY ,
    Category VARCHAR(100) NOT NULL,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Description TEXT
)
go

CREATE TABLE OnlineShoppingDB_OrderDetails (
    OD_ID INT IDENTITY PRIMARY KEY ,
    O_ID INT,
    P_ID INT,
    Price DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (O_ID) REFERENCES OnlineShoppingDB_Orders(O_ID),
    FOREIGN KEY (P_ID) REFERENCES OnlineShoppingDB_Product(P_ID)
)
go
CREATE TABLE OnlineShoppingDB_Supplier (
    S_ID INT IDENTITY PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(255) NOT NULL
);

go

CREATE TABLE OnlineShoppingDB_Supply (
    S_ID INT,
    P_ID INT,
    PRIMARY KEY (S_ID, P_ID),
    FOREIGN KEY (S_ID) REFERENCES OnlineShoppingDB_Supplier(S_ID),
    FOREIGN KEY (P_ID) REFERENCES OnlineShoppingDB_Product(P_ID)
)
go
CREATE TABLE OnlineShoppingDB_Include (
    O_ID INT,
    OD_ID INT,
    PRIMARY KEY (O_ID, OD_ID),
    FOREIGN KEY (O_ID) REFERENCES OnlineShoppingDB_Orders(O_ID),
    FOREIGN KEY (OD_ID) REFERENCES OnlineShoppingDB_OrderDetails(OD_ID)
)
--• Insert at least 2 rows into each table. 
INSERT INTO OnlineShoppingDB_Customer (Name, Email, PhNumber, Address) VALUES
('reem', 'reem@example.com', '1234567890', '123 Street'),
('habiba', 'habiba@example.com', '0987654321', '456 Street');
go
INSERT INTO OnlineShoppingDB_Orders (Status, TotalAmount, O_Date, C_ID) VALUES
('Pending', 150.75, '2025-02-01', 1),
('Shipped', 89.50, '2025-02-02', 2);
go
INSERT INTO OnlineShoppingDB_Product (Category, Name, Price, Description) VALUES
('Electronics', 'Smartphone', 499.99, 'Latest model smartphone'),
('Home Appliance', 'Microwave', 120.00, 'High-power microwave oven');
go
INSERT INTO OnlineShoppingDB_OrderDetails (O_ID, P_ID, Price, Quantity) VALUES
(1, 1, 499.99, 1),
(2, 2, 120.00, 1);
go
INSERT INTO OnlineShoppingDB_Supplier (Name, ContactInfo) VALUES
('Tech Supplies Inc.', 'techsupplies@example.com'),
('Home Goods Ltd.', 'homegoods@example.com');
go
INSERT INTO OnlineShoppingDB_Supply (S_ID, P_ID) VALUES
(1, 1),
(2, 2);
go
INSERT INTO OnlineShoppingDB_Include (O_ID, OD_ID) VALUES
(1, 1),
(2, 2);
--Add a new column named rating to the Products table with an appropriate 
--data type and a default value of 0. 
ALTER TABLE OnlineShoppingDB_Product
ADD Rating DECIMAL(8,2) DEFAULT 0
 --Modify the Category column (or the relevant table/column as applicable) to have a default value of 'new'. 
ALTER TABLE OnlineShoppingDB_Product
ADD Category VARCHAR(100) DEFAULT 'new' 

--o Drop the rating column from the Products table. 
ALTER TABLE OnlineShoppingDB_Product
DROP COLUMN Rating
--o Delete the Users table from the Social Media Platform database. 
DELETE FROM Social_Media_User
--o Drop the entire Social Media Platform database.
DROP DATABASE Social_Media_Platform
 --For the table that contains order information (e.g., an Orders table),
 --update the order date by setting it to the current date for all records where the order id is greater than 0. 
 UPDATE OnlineShoppingDB_Orders
SET O_Date = GETDATE()
WHERE O_ID > 0
--o Delete all rows from the Products table where the product name is not null and not equal to "Null". 
DELETE FROM OnlineShoppingDB_Product
WHERE Name IS NOT NULL 




