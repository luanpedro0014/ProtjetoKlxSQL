/****** Object:  Table [dbo].[TB_Company]    Script Date: 17/05/2021 09:22:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_Company](
	[Company] [varchar](20) NOT NULL,
	[Negocio] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Company] ASC,
	[Negocio] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


