USE [Pagamento]
GO

/****** Object:  Table [dbo].[db_CarteiraDigital]    Script Date: 08/05/2021 12:48:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[db_CarteiraDigital](
	[ID] [varchar](1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Data_Transacao] [datetime] NOT NULL,
	[Data_Ultimo_Status] [datetime] NOT NULL,
	[Tipo] [varchar](10) NULL,
	[Valor] [money] NULL,
	[Operacao] [varchar](12) NULL,
	[Metodo] [varchar](10) NULL,
	[Pedido] [varchar](10) NULL,
	[Status_CarteiraDigittal] [varchar](15) NULL,
	[Tid] [varchar](10) NULL,
	[Uuid] [varchar](10) NULL,
	[Saldo] [money] NULL,
	[Empresa] [varchar](20) NULL,
	[Liga] [varchar](20) NULL,
	[ValordaLiga] [varchar](10) NULL,
	[Times] [varchar](10) NULL,
	[ValorTimes] [varchar](10) NULL,
	[TransacaoRelacionada] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


