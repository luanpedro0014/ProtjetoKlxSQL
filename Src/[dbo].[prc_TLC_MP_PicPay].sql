/****** Object:  StoredProcedure [dbo].[prc__TLC_MP_PicPay]    Script Date: 31/05/2021 11:10:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



------------------------------------------------------------------------------------------------
-- Procedure para importar  TLC_MP_PicPay para base MP_Geral
------------------------------------------------------------------------------------------------
Create Procedure [dbo].[prc_TLC_MP_PicPay]

as

INSERT INTO dbo.MP_Geral
           (
		   company,payment_gateway,ID_transaction,ID_company,ID_gateway,date_transaction,
		   [status],[type],federal_tax_number,customer,email)
		   -- ,amount,rate,net_value,rate_percentage,net_value_calulate ,date_due,date_completed
          -- ,net_value_validation)
     
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
	
	'Não se Aplica' as  email

	
   --   ,[Total]
     -- ,[Taxa]
      --,[A receber]
      --,[Operador]
	 
     
	from	[dbo].[TLC_MP_PicPay]
        
      
      
      





-- drop tabela para ser usada em outro processo de importação 
------------------------------------------------------------------------------------------------
drop table TLC_MP_PicPay




GO


