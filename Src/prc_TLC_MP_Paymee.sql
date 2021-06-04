SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








------------------------------------------------------------------------------------------------
-- Procedure para importar  TCL_Paymee para base MP_Geral
------------------------------------------------------------------------------------------------
CREATE Procedure [dbo].[prc_TLC_MP_Paymee]

as
INSERT INTO dbo.MP_Geral
           (company,payment_gateway,ID_transaction,ID_company,ID_gateway,date_transaction,date_due,date_completed,[status],[type],
          federal_tax_number,customer,email,amount,rate,net_value,rate_percentage, net_value_calulate,net_value_validation)
SELECT 
     'Catimba' as Company,
	 'Paymee' as  Payment_Gateway ,
     Cast( uuid as varchar(45)) as uuid,
	 Cast([Codigo_de_identificacao] as varchar(37)) as [Código de Identificacao],
	 Cast (Id as  varchar(40)) as Id,
	 convert( varchar,([Data_da_transacao]),120) as [Data Transacao],
     convert( varchar,([Data_do_vencimento]),120) as [Data do vencimento],
   --   convert( varchar,([Data do Pagamento]),120) as [Data do Pagamento],
     convert(varchar,([Data_do_Pagamento]),120) as [ Data do Processamento],
     Cast([Status] as varchar(12)) as Status ,
	 Cast([Tipo] as varchar(8)) as Tipo,
     --[Discriminador]
     --[Moeda]
     Cast([CPF_CNPJ_Comprador] as varchar(19)) as [CPF/CNPJ Comprado],
     Cast([Nome_Comprador] as varchar(50)) as [Nome Comprador],
     Cast([E_mail_destinat_rio] as varchar(60)) as [E-mail destinatário],
	 --valor
	 case when cast([Valor] as varchar(50)) = '-' then 0 else cast(cast([Valor] as varchar(50)) as numeric(18,2)) end as Valor, 
	 
	 --rate
	 cast(cast([Taxa_de_Servico] as varchar(50)) as numeric(18,2)) * -1 as rate,
	 
	 --net_value
	 cast(cast([Valor_Liquido] as varchar(50)) as numeric(18,2)) as Valor_Liquido, 
	
	--rate_percentage
	CASE
         WHEN  cast(cast([Taxa_de_Servico] as varchar(50)) as numeric(18,2)) * -1  = '0'                                           THEN 0
         WHEN  cast(cast([Valor] as varchar(50)) as numeric(18,2)) = 0 or cast(cast([Valor] as varchar(50)) as numeric(18,2)) > 0  THEN cast(cast([Taxa_de_Servico] as varchar(50)) as numeric(18,2)) * -1 / cast(cast([Valor] as varchar(50)) as numeric(18,2)) * 100
         ELSE  cast(cast([Taxa_de_Servico] as varchar(50)) as numeric(18,2)) * -1 / cast(cast([Valor] as varchar(50)) as numeric(18,2)) * 100
     END,

	 --net_value_calulate
	 cast(cast([Valor] as varchar(50)) as numeric(18,2)) - cast(cast([Taxa_de_Servico] as varchar(50)) as numeric(18,2)) * -1,
	 
	 --net_value_validation
	 cast(cast([Valor_Liquido] as varchar(50)) as numeric(18,2)) - cast(cast([Taxa_de_Servico] as varchar(50)) as numeric(18,2)) * -1 -  cast(cast([Valor] as varchar(50)) as numeric(18,2)) - cast(cast([Taxa_de_Servico] as varchar(50)) as numeric(18,2)) * -1
	
	

  FROM [dbo].[TLC_MP_Paymee]




  
-----------------------------------------------------------------------------------------------
-- drop tabela para ser usada em outro processo de importação 
------------------------------------------------------------------------------------------------
drop table TLC_MP_Paymee

GO
/****** Object:  StoredProcedure [dbo].[prc_TLC_MP_PicPay]    Script Date: 04/06/2021 00:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





