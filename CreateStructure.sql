CREATE TABLE dbo.SKU
	(ID int PRIMARY KEY IDENTITY, 
	Code as ('s'+ID) UNIQUE ,
	Name nvarchar(100))

CREATE TABLE dbo.Family 
	(ID int PRIMARY KEY IDENTITY,
	SurName nvarchar(100), 
	BurgerValue decimal)

CREATE TABLE dbo.Basket
	(ID int PRIMARY KEY IDENTITY, 
	ID_SKU int,
	ID_Famaly int,
	Quantity decimal(18,2) check (Quantity>0),
	Value decimal(18,2) CHECK (Value>0), 
	PurchaseDate date DEFAULT CURRENT_TIMESTAMP, 
	DiscountValue decimal,
	FOREIGN KEY (ID_SKU)  REFERENCES dbo.SKU (ID),
	FOREIGN KEY (ID_Famaly)  REFERENCES dbo.Family (ID))

