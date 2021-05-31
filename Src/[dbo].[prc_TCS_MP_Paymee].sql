/****** Object:  StoredProcedure [dbo].[prc_TCS_MP_Paymee]    Script Date: 31/05/2021 10:40:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




------------------------------------------------------------------------------------------------
-- Procedure para importar  TCS_MP_Paymee para base MP_Geral
------------------------------------------------------------------------------------------------
Create Procedure [dbo].[prc_TCS_MP_Paymee]

as

--limpa tabela temporaria 
 delete from [dbo].[TCS_MP_Paymee]



INSERT INTO dbo.MP_Geral
           (company,payment_gateway,ID_transaction,ID_company,ID_gateway,date_transaction,date_due,date_completed,[status],[type],
          federal_tax_number,customer,email,rate)

SELECT 

       'Catimba' as Company,
	    'Paymee' as  Payment_Gateway ,
      Cast( uuid as varchar(45)) as uuid,
	 Cast([C_digo_de_identifica_o] as varchar(37)) as [Código de Identificacao],
	 Cast (Id as  varchar(40)) as Id,
	 convert( varchar,([Data_da_transa_o]),120) as [Data Transacao],
       convert( varchar,([Data_do_vencimento]),120) as [Data do vencimento],
   --   convert( varchar,([Data do Pagamento]),120) as [Data do Pagamento],
      convert(varchar,([Data_do_Processamento]),120) as [ Data do Processamento],
      Cast([Status] as varchar(12)) as Status ,
	  
	  
	  Cast([Tipo] as varchar(8)) as Tipo,
     
      --[Discriminador]
      
      --[Moeda]
      Cast([CPF_CNPJ_Comprador] as varchar(19)) as [CPF/CNPJ Comprado],
      Cast([Nome_Comprador] as varchar(50)) as [Nome Comprador],
      Cast([E_mail_destinat_rio] as varchar(60)) as [E-mail destinatário],
	  case when cast([Valor] as varchar(50)) = '-' then 0 else cast(cast([Valor] as varchar(50)) as numeric(18,2)) end as Valor
  
  FROM [dbo].[TCS_MP_Paymee]




-----------------------------------------------------------------------------------------------
-- drop tabela para ser usada em outro processo de importação 
------------------------------------------------------------------------------------------------
drop table TCS_MP_Paymee

GO


