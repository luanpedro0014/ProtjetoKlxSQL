SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedure para importar  TCS_MP_PicPay para base MP_Geral
------------------------------------------------------------------------------------------------
CREATE Procedure [dbo].[prc_TCS_MP_PicPay]

as



INSERT INTO dbo.MP_Geral
           (
		   company,payment_gateway,ID_transaction,ID_company,ID_gateway,date_transaction,
		   [status],[type],federal_tax_number,customer,email,amount,net_value)
     
	 SELECT 
	 
	 'Ligas Club' as company,
	 'PicPay' as payment_gateway,
	 Cast([Reference_ID]  as varchar(40)) as [Reference ID], 
	 'ID' as Id_Company,
	  Cast([ID] as varchar(42)) as ID,
	 Convert( varchar,([Data]),120) as [Data],
	 Cast( [Status] as varchar(12)) as [Status],
	 Cast([Tipo] as varchar(8)) as [Tipo],	
	 'Não se Aplica'  as federal_tax_number,
	Cast([Consumidor] as varchar(50)) as Consumidor,
	
	'Não se Aplica' as  email,
	 --valor
	 case when cast([total] as varchar(50)) = '-' then 0 else cast(cast([total] as varchar(50)) as numeric(18,2)) end as Valor, 
	 --rate
	-- cast(cast([Taxa] as varchar(50)) as numeric(18,2)) * -1 as rate,
	
	 --net_value
	 cast(cast([A_receber] as varchar(50)) as numeric(18,2)) as A_receber
	 
     
  FROM [dbo].[TCS_MP_PicPay]



  

 -----------------------------------------------------------------------------------------------
-- drop tabela para ser usada em outro processo de importação 
------------------------------------------------------------------------------------------------
drop table TCS_MP_PicPay

GO
/****** Object:  StoredProcedure [dbo].[prc_TLC_CD_Ligasclub]    Script Date: 04/06/2021 00:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




