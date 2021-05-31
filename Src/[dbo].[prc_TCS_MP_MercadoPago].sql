/****** Object:  StoredProcedure [dbo].[prc_TCS_MP_MercadoPago]    Script Date: 31/05/2021 12:06:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



------------------------------------------------------------------------------------------------
-- Procedure para importar TCS_MP_MercadoPago para base MP_Geral
------------------------------------------------------------------------------------------------
ALTER Procedure [dbo].[prc_TCS_MP_MercadoPago]

as




INSERT INTO dbo.MP_Geral
           (company,payment_gateway,ID_transaction,ID_company,ID_gateway,date_transaction,date_completed,[status],[type],
          federal_tax_number,customer,email,rate)

		  Select 
		  'Catimba' as Company,
		  'MercadoPago' as  Payment_Gateway,

		Cast([Identificador_de_producto_item_id] as varchar(45)) as ID_transaction ,  
		 Cast(Código_de_referencia_external_reference as varchar(37)) as ID_company ,
		
		Cast([Número_de_operación_de_Mercado_Pago_operation_id] as varchar(45)) as ID_gateway,
 Convert( varchar,([Fecha_de_compra_date_created]),120 )as [Fecha de compra (date_created)],
  
   --[Fecha de acreditaciÃ³n (date_approved)],
     Convert(varchar,([Fecha_de_liberación_del_dinero_date_released]),120) as [Fecha de liberaciÃ³n del dinero (date_released)], 
    Cast([Estado_de_la_operación_status] as varchar(12)) as [Estado de la operaciÃ³n (status)],
	'não se aplica'	as [type],

	
	'não se aplica' as federal_tax_number,
     'não se aplica' as customer,

	 Cast( [E_mail_de_la_contraparte_counterpart_email] as varchar(60)) as [E-mail de la contraparte (counterpart_email)],
	 	 case when cast([Valor_del_producto_transaction_amount] as varchar(50)) = '-' then 0 else cast(cast([Valor_del_producto_transaction_amount] as varchar(50)) as numeric(18,2)) end as Valor

	 
	 FROM [dbo].[TCS_MP_Mercado_Pago]


-- drop tabela para ser usada em outro processo de importação 
------------------------------------------------------------------------------------------------
drop table TSC_MP_Mercado_Pago

GO




