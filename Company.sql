USE [Pagamento]
GO

/****** Object:  Table [dbo].[Company]    Script Date: 09/05/2021 11:45:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Company](
	[Company] [varchar](20) NOT NULL,
	[Negocios] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Company] ASC,
	[Negocios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


