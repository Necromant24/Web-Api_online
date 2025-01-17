ALTER PROCEDURE [dbo].[CreateTransfer]
@walletFromId int,
@walletToId int,
@value decimal(38,20),
@currencyAcronim nvarchar(10),
@hash varchar(66),
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Transfers](WalletFromId, WalletToId, Value,
Date, CurrencyAcronim, Hash)
VALUES (@walletFromId, @walletToId, @value, GETDATE(),
@currencyAcronim, @hash)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity AS id

RETURN

END
