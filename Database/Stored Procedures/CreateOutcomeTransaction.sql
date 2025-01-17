USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[CreateEvent]    Script Date: 20.10.2021 18:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CreateOutcomeTransaction]
@fromWalletId int,
@value decimal(38,20),
@outcomingWallet nvarchar(max),
@currencyAcronim nvarchar(10),
@state int,
@lastUpdateDate datetime,
@errorText nvarchar(max)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[OutcomeTransactions] (FromAddress, Value, ToAddress, CurrencyAcronim,
State, LastUpdateDate, ErrorText)
VALUES (@fromWalletId, @value, @outcomingWallet, @currencyAcronim, @state, @lastUpdateDate, @errorText)

END

