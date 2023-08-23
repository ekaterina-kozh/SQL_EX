CREATE FUNCTION dbo.udf_GetSKUPrice 
(
	@ID_SKU int
)
RETURNS decimal(18,2)
AS
BEGIN
	DECLARE @price decimal(18,2)
	set @price = (select Value/Quantity from dbo.Basket where ID_SKU=@ID_SKU)
	RETURN @price
END
GO

