/****** Object:  Table [dbo].[TB_Forma_Pgto]    Script Date: 17/05/2021 09:21:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TB_Forma_Pgto](
	[Company] [varchar](20) NOT NULL,
	[Forma_Pgto] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Company] ASC,
	[Forma_Pgto] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


