ALTER PROCEDURE [dbo].[GetUserWalletByAcronim]
@userId nvarchar(450),
@acronim nvarchar(450)
AS
BEGIN

SELECT w.[Id]
      ,w.[UserId]
      ,w.[Value]
      ,w.CurrencyAcronim
	  ,w.[Created]
	  ,w.[LastUpdate]
	  ,w.[Address]
  FROM [Exchange].[dbo].[Wallets] w
  where w.[UserId] = @userid AND w.CurrencyAcronim = @acronim

END
