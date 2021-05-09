USE [Pagamento]
GO

/****** Object:  Table [dbo].['Paymee]    Script Date: 09/05/2021 11:50:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].['Paymee](
	[Id] [nvarchar](255) NULL,
	[uuid] [nvarchar](255) NULL,
	[Tipo] [nvarchar](255) NULL,
	[Código de identificação] [nvarchar](255) NULL,
	[Discriminador] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Moeda] [nvarchar](255) NULL,
	[Data da transação] [nvarchar](255) NULL,
	[Data do vencimento] [nvarchar](255) NULL,
	[Data do Pagamento] [nvarchar](255) NULL,
	[Data do Processamento] [nvarchar](255) NULL,
	[CPF/CNPJ Comprador] [nvarchar](255) NULL,
	[Nome Comprador] [nvarchar](255) NULL,
	[E-mail destinatário] [nvarchar](255) NULL,
	[Banco] [nvarchar](255) NULL,
	[Forma de Pagamento] [nvarchar](255) NULL,
	[Valor] [float] NULL,
	[Taxa de Serviço] [float] NULL,
	[Valor Liquido] [float] NULL,
	[Company] [varchar](max) NULL,
	[Forma_Pgto] [varchar](50) NULL,
	[Negocio] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


