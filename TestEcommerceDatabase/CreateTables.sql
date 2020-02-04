USE TestEcommerceDatabase
CREATE TABLE Customer(
   CustomerId UNIQUEIDENTIFIER PRIMARY KEY,
   FirstName VARCHAR (50),
   LastName VARCHAR (50),
   AddressId UNIQUEIDENTIFIER,
   PhoneNumber VARCHAR (50)
)

CREATE TABLE Address(
   AddressId UNIQUEIDENTIFIER PRIMARY KEY,
   City VARCHAR (50),
   State VARCHAR (50),
   Country INT,
   Pincode VARCHAR (50),
   District VARCHAR (50)
)

CREATE TABLE Orders(
   OrderId UNIQUEIDENTIFIER PRIMARY KEY,
   CustomerId UNIQUEIDENTIFIER,
   PaymentId UNIQUEIDENTIFIER,
   ShipmentId UNIQUEIDENTIFIER,
   CreatedDate DateTime,
   DeliveredDate DateTime,
   CancelledDate DateTime,
   IsCancelled bit default 0,
   IsDelivered bit default 0,
   TotalPrice DECIMAL(2,2),
   TaxPrice DECIMAL(2,2)
)

ALTER TABLE Customer 
  ADD CONSTRAINT FK_Address_AddressId FOREIGN KEY(AddressId)
  REFERENCES Address(AddressId);

ALTER TABLE Orders 
  ADD CONSTRAINT FK_Customer_CustomerId FOREIGN KEY(CustomerId)
  REFERENCES Customer(CustomerId);