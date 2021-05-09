USE [Pagamento]
GO

/****** Object:  Table [dbo].[PicPay]    Script Date: 08/05/2021 12:45:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PicPay](
	[Consumidor] [nvarchar](255) NULL,
	[ID] [float] NULL,
	[Reference ID] [nvarchar](255) NULL,
	[Tipo] [nvarchar](255) NULL,
	[Data] [datetime] NULL,
	[Status] [nvarchar](255) NULL,
	[Total] [nvarchar](255) NULL,
	[Taxa] [nvarchar](255) NULL,
	[A receber] [nvarchar](255) NULL,
	[Operador] [nvarchar](255) NULL
) ON [PRIMARY]
GO


