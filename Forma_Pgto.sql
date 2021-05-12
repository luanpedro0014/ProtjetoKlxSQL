USE [Pagamento]
GO

/****** Object:  Table [dbo].[Forma_Pgto]    Script Date: 08/05/2021 12:55:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Forma_Pgto](
	[Company] [varchar](20) NOT NULL,
	[Forma_Pgto] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Company] ASC,
	[Forma_Pgto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


