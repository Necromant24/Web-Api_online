ALTER PROCEDURE [dbo].[SendCoins]
@senderUserId nvarchar(450),
@receiverUserId nvarchar(450),
@typeSend int,
@typeRecieve int,

@Comment nvarchar(450),
@currencyAcronim nvarchar(10),
@value decimal(38,20),

@senderWalletId int,
@receiverWalletId int,
@hash varchar(66)
AS
BEGIN

UPDATE [Exchange].[dbo].[Wallets]
SET Value -= @value, LastUpdate = GETDATE()
WHERE ID = @senderWalletId

UPDATE [Exchange].[dbo].[Wallets]
SET Value += @value, LastUpdate = GETDATE()
WHERE Id = @receiverWalletId

insert into [Exchange].[dbo].[Transfers] (WalletFromId, WalletToId, Value, Date, CurrencyAcronim, Hash, Comment)
values (@senderWalletId, @receiverWalletId, @value, GETDATE(), @currencyAcronim, @hash, @Comment)

insert into [Exchange].[dbo].[Events] (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
values (@senderUserId, @typeSend, @value, @Comment, GETDATE(), @currencyAcronim)

insert into [Exchange].[dbo].[Events] (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
values (@receiverUserId, @typeRecieve, @value, @Comment, GETDATE(), @currencyAcronim)

END

