/****** Object:  Table [dbo].[CD_Geral]    Script Date: 17/05/2021 09:26:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CD_Geral](
	[Company] [text] NULL,
	[Business] [text] NULL,
	[ID_transacao] [text] NULL,
	[Id] [text] NULL,
	[Nome] [text] NULL,
	[Email] [text] NULL,
	[Data_Transacao] [datetime] NULL,
	[Data_Ultimo_Status] [datetime] NULL,
	[Tipo] [text] NULL,
	[Valor] [float] NULL,
	[Operação] [text] NULL,
	[Metodo] [text] NULL,
	[Pedido] [text] NULL,
	[Status] [text] NULL,
	[Tid] [text] NULL,
	[Uuid] [text] NULL,
	[Saldo] [float] NULL,
	[Empresa] [text] NULL,
	[Liga] [text] NULL,
	[Valor_Liga] [float] NULL,
	[Times] [float] NULL,
	[Valor_Times] [float] NULL,
	[Transacao_Relacionada] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


