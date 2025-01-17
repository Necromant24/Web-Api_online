ALTER PROCEDURE [dbo].[CreateEvent]
@userid nvarchar(450),
@type int,
@value decimal(38,20),
@comment nvarchar(450),
@whenDate datetime,
@currencyAcronim nvarchar(450)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Events] (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
VALUES (@userid, @type, @value, @comment, @whenDate, @currencyAcronim)

END

