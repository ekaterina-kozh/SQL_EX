CREATE VIEW dbo.vw_SKUPrice 
AS
SELECT SKU.*, price=dbo.udf_GetSKUPrice(SKU.ID) FROM SKU
