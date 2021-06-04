SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CD_Geral](
	[Company] [varchar](20) NULL,
	[Business] [varchar](20) NULL,
	[ID_transacao] [varchar](23) NULL,
	[Id] [varchar](6) NULL,
	[Nome] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Data_Transacao] [datetime] NULL,
	[Data_Ultimo_Status] [datetime] NULL,
	[Tipo] [varchar](20) NULL,
	[Valor] [numeric](18, 2) NULL,
	[Operação] [varchar](25) NULL,
	[Metodo] [varchar](20) NULL,
	[Pedido] [varchar](40) NULL,
	[Status] [varchar](12) NULL,
	[Tid] [varchar](40) NULL,
	[Uuid] [varchar](40) NULL,
	[Saldo] [numeric](18, 2) NULL,
	[Empresa] [varchar](20) NULL,
	[Liga] [varchar](15) NULL,
	[Valor_Liga] [numeric](18, 2) NULL,
	[Times] [numeric](18, 2) NULL,
	[Valor_Times] [numeric](18, 2) NULL,
	[Transacao_Relacionada] [varchar](30) NULL
) ON [PRIMARY]
GO