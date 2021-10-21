USE [Exchange]
GO
/****** Object:  StoredProcedure [dbo].[Get_BTC_USDT_CandleStick]    Script Date: 10/18/2021 7:50:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOutcomeTransaction]
@state int,
@currencyAcronim nvarchar(10)
AS
BEGIN

SELECT TOP(1) *
FROM [GetOutcomeTransaction]
WHERE [State] = @state 
AND [CurrencyAcronim] = @currencyAcronim
END


