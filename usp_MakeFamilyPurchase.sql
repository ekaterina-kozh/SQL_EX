CREATE PROCEDURE dbo.usp_MakeFamilyPurchase 
(@FamilySurName varchar(255)) 
AS
BEGIN
	if EXISTS (SELECT * FROM Family WHERE SurName=@FamilySurName) BEGIN

		DECLARE @sum decimal(18,2) = (SELECT SUM(Value) FROM dbo.Basket, dbo.Family
		where SurName=@FamilySurName AND ID_Family=Family.ID)

		UPDATE dbo.Family set BurgerValue=BurgerValue-@sum
		FROM dbo.Basket where ID_Family=Family.ID and SurName=@FamilySurName
END ELSE BEGIN
	PRINT 'Такой семьи нет'
END
END