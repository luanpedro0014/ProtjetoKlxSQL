SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MP_Geral](
	[company] [varchar](20) NULL,
	[payment_gateway] [varchar](40) NULL,
	[ID_transaction] [varchar](45) NULL,
	[ID_company] [varchar](42) NULL,
	[ID_gateway] [varchar](20) NULL,
	[date_transaction] [datetime] NULL,
	[date_due] [datetime] NULL,
	[date_completed] [datetime] NULL,
	[status] [varchar](17) NULL,
	[type] [varchar](16) NULL,
	[federal_tax_number] [varchar](19) NULL,
	[customer] [varchar](50) NULL,
	[email] [varchar](60) NULL,
	[amount] [numeric](18, 2) NULL,
	[rate] [numeric](18, 2) NULL,
	[net_value] [numeric](18, 2) NULL,
	[rate_percentage] [numeric](18, 2) NULL,
	[net_value_calulate] [numeric](18, 2) NULL,
	[net_value_validation] [numeric](18, 2) NULL
) ON [PRIMARY]
GO