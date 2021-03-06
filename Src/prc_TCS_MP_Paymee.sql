/****** Object:  Table [dbo].[CD_Geral]    Script Date: 04/06/2021 00:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CD_Geral](
	[Company] [varchar](20) NULL,
	[Business] [varchar](20) NULL,
	[ID_transacao] [varchar](23) NULL,
	[Id] [varchar](6) NULL,
	[Nome] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Data_Transacao] [datetime] NULL,
	[Data_Ultimo_Status] [datetime] NULL,
	[Tipo] [varchar](20) NULL,
	[Valor] [numeric](18, 2) NULL,
	[Operação] [varchar](25) NULL,
	[Metodo] [varchar](20) NULL,
	[Pedido] [varchar](40) NULL,
	[Status] [varchar](12) NULL,
	[Tid] [varchar](40) NULL,
	[Uuid] [varchar](40) NULL,
	[Saldo] [numeric](18, 2) NULL,
	[Empresa] [varchar](20) NULL,
	[Liga] [varchar](15) NULL,
	[Valor_Liga] [numeric](18, 2) NULL,
	[Times] [numeric](18, 2) NULL,
	[Valor_Times] [numeric](18, 2) NULL,
	[Transacao_Relacionada] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MP_Geral]    Script Date: 04/06/2021 00:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MP_Geral](
	[company] [varchar](20) NULL,
	[payment_gateway] [varchar](40) NULL,
	[ID_transaction] [varchar](45) NULL,
	[ID_company] [varchar](42) NULL,
	[ID_gateway] [varchar](20) NULL,
	[date_transaction] [datetime] NULL,
	[date_due] [datetime] NULL,
	[date_completed] [datetime] NULL,
	[status] [varchar](17) NULL,
	[type] [varchar](16) NULL,
	[federal_tax_number] [varchar](19) NULL,
	[customer] [varchar](50) NULL,
	[email] [varchar](60) NULL,
	[amount] [numeric](18, 2) NULL,
	[rate] [numeric](18, 2) NULL,
	[net_value] [numeric](18, 2) NULL,
	[rate_percentage] [numeric](18, 2) NULL,
	[net_value_calulate] [numeric](18, 2) NULL,
	[net_value_validation] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_Company]    Script Date: 04/06/2021 00:21:30 ******/
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
/****** Object:  Table [dbo].[TB_Forma_Pgto]    Script Date: 04/06/2021 00:21:30 ******/
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
/****** Object:  StoredProcedure [dbo].[prc_limpa_Duplicados_cd]    Script Date: 04/06/2021 00:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






------------------------------------------------------------------------------------------------
-- Procedure para limpar registro duplicados
------------------------------------------------------------------------------------------------

create procedure [dbo].[prc_limpa_Duplicados_cd]


as

------------------------------------------------------------------------------------------------
-- verfica duplicidade - Mendes 26/05/2021
------------------------------------------------------------------------------------------------
--prepara copia da tabela cd_geral de registro que não são duplicado na tabela  duplicate_table
SELECT DISTINCT *
INTO duplicate_table
FROM [dbo].[CD_Geral]
GROUP BY Company,Business,ID_transacao,Id,Nome,Email,Data_Transacao,Data_Ultimo_Status,Tipo,
Valor,Operação,Metodo,Pedido,[Status],Tid,Uuid,Saldo,Empresa,Liga,Valor_liga,Times,Valor_Times,Transacao_Relacionada
HAVING COUNT(ID_transacao) > 1

--deleta registro duplicado na tabela CD_Geral
DELETE [dbo].[CD_Geral]
WHERE ID_transacao
IN (SELECT ID_transacao
FROM duplicate_table)
-- gera insert dos registro originais da tabela duplicate_table para CD_Geral
INSERT [dbo].[CD_Geral]
SELECT *
FROM duplicate_table

--apaga tabela temporaria
DROP TABLE duplicate_table




GO
/****** Object:  StoredProcedure [dbo].[prc_limpa_Duplicados_mp]    Script Date: 04/06/2021 00:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







------------------------------------------------------------------------------------------------
-- Procedure para limpar registro duplicados
------------------------------------------------------------------------------------------------

create procedure [dbo].[prc_limpa_Duplicados_mp]


as

SELECT DISTINCT *
INTO duplicate_table
FROM [dbo].[MP_Geral]
GROUP BY company,payment_gateway,ID_transaction,ID_company,ID_gateway,date_transaction,date_due,date_completed,[status],[type],
          federal_tax_number,customer,email,amount,rate,net_value,rate_percentage, net_value_calulate,net_value_validation
HAVING COUNT(ID_transaction) > 1

--deleta registro duplicado na tabela CD_Geral
DELETE [dbo].[MP_Geral]
WHERE ID_transaction
IN (SELECT ID_transaction
FROM duplicate_table)
-- gera insert dos registro originais da tabela duplicate_table para mp_Geral
INSERT [dbo].[MP_Geral]
SELECT *
FROM duplicate_table

--apaga tabela temporaria
DROP TABLE duplicate_table




GO
/****** Object:  StoredProcedure [dbo].[prc_next_cd]    Script Date: 04/06/2021 00:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



----------------------------------------------------------------------------------------------
-- Procedure para importar  TABELAS CD para base CD_Geral
------------------------------------------------------------------------------------------------

CREATE procedure [dbo].[prc_next_cd]

as

----------------------------------------------------------------------------------------------
-- Processa TCS_CD_Bolada5 para banco cd_geral
------------------------------------------------------------------------------------------------
exec prc_TCS_CD_Bolada5

----------------------------------------------------------------------------------------------
-- Processa TCS_CD_Catimba_Score para banco cd_geral
------------------------------------------------------------------------------------------------
exec prc_TCS_CD_Catimba_Score


----------------------------------------------------------------------------------------------
-- Processa TLC_CD_Ligasclub para banco cd_geral
------------------------------------------------------------------------------------------------
exec prc_TLC_CD_Ligasclub


-----------------------------------------------------------------------------------------------
-- verfica duplicidade - Mendes 25/05/2021
------------------------------------------------------------------------------------------------
--prepara copia da tabela cd_geral de registro que não são duplicado na tabela  duplicate_table
SELECT DISTINCT *
INTO duplicate_table
FROM [dbo].[CD_Geral]
GROUP BY Company,Business,ID_transacao,Id,Nome,Email,Data_Transacao,Data_Ultimo_Status,Tipo,
Valor,Operação,Metodo,Pedido,[Status],Tid,Uuid,Saldo,Empresa,Liga,Valor_liga,Times,Valor_Times,Transacao_Relacionada
HAVING COUNT(ID_transacao) > 1

--deleta registro duplicado na tabela CD_Geral
DELETE [dbo].[CD_Geral]
WHERE ID_transacao
IN (SELECT ID_transacao
FROM duplicate_table)
-- gera insert dos registro originais da tabela duplicate_table para CD_Geral
INSERT [dbo].[CD_Geral]
SELECT *
FROM duplicate_table

--apaga tabela temporaria
DROP TABLE duplicate_table


GO
/****** Object:  StoredProcedure [dbo].[prc_next_mp]    Script Date: 04/06/2021 00:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












----------------------------------------------------------------------------------------------
-- Procedure para importar  TABELAS mp para base mp_Geral
------------------------------------------------------------------------------------------------
CREATE procedure [dbo].[prc_next_mp]

as

----------------------------------------------------------------------------------------------
-- Processa xxxx para banco mp_geral
------------------------------------------------------------------------------------------------
exec prc_TCS_MP_Paymee

----------------------------------------------------------------------------------------------
-- Processa xxxx para banco mp_geral
------------------------------------------------------------------------------------------------
exec prc_TLC_MP_Paymee


----------------------------------------------------------------------------------------------
-- Processa xxxx para banco mp_geral
------------------------------------------------------------------------------------------------
exec prc_TLC_MP_PicPay


----------------------------------------------------------------------------------------------
-- Processa xxxx para banco mp_geral
------------------------------------------------------------------------------------------------
exec prc_TCS_MP_PicPay


----------------------------------------------------------------------------------------------
-- Processa xxxx para banco mp_geral
------------------------------------------------------------------------------------------------
exec prc_TCS_MP_Mercado_Pago


----------------------------------------------------------------------------------------------
-- Processa xxxx para banco mp_geral
------------------------------------------------------------------------------------------------
exec prc_TLC_MP_Mercado_Pago



-----------------------------------------------------------------------------------------------
-- verfica duplicidade - Mendes 25/05/2021
------------------------------------------------------------------------------------------------
--prepara copia da tabela cd_geral de registro que não são duplicado na tabela  duplicate_table

SELECT DISTINCT *
INTO duplicate_table
FROM [dbo].[MP_Geral]
GROUP BY company,payment_gateway,ID_transaction,ID_company,ID_gateway,date_transaction,date_due,date_completed,[status],[type],
          federal_tax_number,customer,email,amount,rate,net_value,rate_percentage, net_value_calulate,net_value_validation
HAVING COUNT(ID_transaction) > 1

--deleta registro duplicado na tabela CD_Geral
DELETE [dbo].[MP_Geral]
WHERE ID_transaction
IN (SELECT ID_transaction
FROM duplicate_table)
-- gera insert dos registro originais da tabela duplicate_table para mp_Geral
INSERT [dbo].[MP_Geral]
SELECT *
FROM duplicate_table

--apaga tabela temporaria
DROP TABLE duplicate_table



GO
/****** Object:  StoredProcedure [dbo].[prc_TCS_CD_Bolada5]    Script Date: 04/06/2021 00:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





------------------------------------------------------------------------------------------------
-- Procedure para importar  TCS_CD_Bolada5 para base CD_Geral
------------------------------------------------------------------------------------------------

CREATE procedure [dbo].[prc_TCS_CD_Bolada5]


as
 insert into dbo.CD_Geral(Company,Business,ID_transacao,Id,Nome,Email,Data_Transacao,Data_Ultimo_Status,
      Tipo,valor,[Operação],Metodo,Pedido,[Status],Tid,Uuid ,saldo,Empresa
      ,Liga,Valor_Times,Valor_Liga, times,Transacao_Relacionada)
select 'Catimba' as Company,
	'Bolada5' as Business, 
   substring(left(replace(replace(replace( replace(cast([Data_Transação] as varchar(23)),'-',''),'T',''),':',''),'.',''), 16), 3, 16)+
   SUBSTRING(CAST(Id as varchar(5)) ,1,6) as ID_transacao, --[ID_transacao] [varchar](23) NULL, --vamos montar aqui o id_transação
	CAST(Id as varchar(5)) , 	
	CAST(Nome AS varchar(50)) as Nome,
	Cast (Email as varchar(50)) as Email,
	convert(varchar,([Data_Transação]),120)as [Data Transaçãoo] ,
	convert(varchar,([Data_Último_Status]),120) as [Data Ultimo Status],
    Cast (Tipo as varchar(20)) as Tipo, 
	case when cast([Valor] as varchar(50)) = '-' then 0 else cast(cast([Valor] as varchar(50)) as numeric(18,2)) end as Valor, 
	Cast(Operação as varchar(25))as Operacão,
      --CAST(case when  cast(Operacao = 'Adição de crédito' then 'Adição de Crédito' else Operacao end as varchar(25)) as Operação, 
	CAST(Método as varchar(20)) as Metodo, 
	Cast (Pedido as varchar(40)) as Pedido ,
	CAST([Status] as varchar(12)) as [Status],
	Cast(Tid as varchar(40)) as Tid, 
	Cast(Uuid as varchar(40)) as Uuid ,
    case when cast(Saldo as varchar(1)) = '-' or cast(Saldo as varchar(10)) = 'Depositado' then 0 else cast(cast(Saldo as varchar(50)) as numeric(18,2))  end as Saldo, 
    Cast(Empresa as varchar(20)) as Empresa,
	Cast(Liga as varchar(15)) as Liga,
	case when cast([Valor_Times] as varchar(50)) = '-' then 0 else cast(cast([Valor_Times] as varchar(50)) as numeric(18,2)) end as [Valor Times],
	case when Cast([Valor_da_Liga] as varchar(50)) = '-' then 0 else cast(cast([Valor_da_Liga] as varchar(50)) as numeric(18,2))end as [ Valor da Liga],
	case when cast(Times as varchar(50)) = '-' then 0 else cast(cast(Times as varchar(50))  as numeric(18,2)) end  as Times ,
	Cast([Transação_Relacionada] as varchar(30)) as [Transacao Relacionada]
	
	from TCS_CD_Bolada5
	
	where Cast([Status] as varchar(12)) = 'Completada'




-----------------------------------------------------------------------------------------------
-- drop tabela para ser usada em outro processo de importação 
------------------------------------------------------------------------------------------------
DROP TABLE TCS_CD_Bolada5

GO
/****** Object:  StoredProcedure [dbo].[prc_TCS_CD_Catimba_Score]    Script Date: 04/06/2021 00:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[prc_TCS_CD_Catimba_Score]

-------------------------------
--- Parametro xxxx
-------------------------------
--@xxx varchar(100)
as

insert into dbo.CD_Geral(Company,Business,ID_transacao,Id,Nome,Email,Data_Transacao,Data_Ultimo_Status,
      Tipo,Valor,[Operação],Metodo,Pedido,[Status],Tid,Uuid ,saldo,Empresa,Liga,Valor_Liga,Times,Valor_Times,Transacao_Relacionada)

select 'Catimba' as Company,
	'Catimba_Score' as Business, 
	  substring(left(replace(replace(replace( replace(cast([Data_Transação] as varchar(30)),'-',''),'T',''),':',''),'.',''), 16), 3, 16)+
   dbo.strzero(cast(cast(id as varchar(6)) as integer), 6) as IDTransacao,
	Cast( Id as Varchar(6)) as Id,
	Cast (Nome as varchar(50)) as Nome ,
	Cast (Email as varchar(50)) as Email,
	convert(varchar,([Data_Transação]),120)as [Data Transação] ,
	convert(varchar,([Data_Último_Status]),120) as [Data último Status],
    Cast (Tipo as varchar(20)) as Tipo, 
	case when cast([Valor] as varchar(50)) = '-' then 0 else cast(cast([Valor] as varchar(50)) as float) end as Valor,
	CAST(case when cast(Operação as varchar(20)) = 'Adição de crédito'  then 'Adição de Crédito'else Operação end as varchar(25)) as Operacao, 
	CAST(Método as varchar(20)) as Metodo, 
	Cast (Pedido as varchar(40)) as Pedido ,
	CAST([Status] as varchar(12)) as [Status],
	Cast(Tid as varchar(40)) as Tid, 
	Cast(Uuid as varchar(40)) as Uuid ,
	case when cast(Saldo as varchar(1)) = '-' or cast(Saldo as varchar(10)) = 'Depositado'  or cast( Saldo as varchar(13))='Premiação' or Cast(Saldo as varchar(5))=''   then 0 else cast(cast(Saldo as varchar(50)) as numeric(18,2))  end as Saldo,  
	Cast(Empresa as varchar(20)) as Empresa,
	Cast(Liga as varchar(15)) as Liga,
	case when cast([Valor_Times] as varchar(50)) = '-' then 0 else cast(cast([Valor_Times] as varchar(50)) as numeric(18,2)) end as [Valor Times],
	case when Cast([Valor_da_Liga] as varchar(50)) = '-' then 0 else cast(cast([Valor_da_liga] as varchar(50)) as numeric(18,2))end as [Valor da Liga],
	case when cast(Times as varchar(50)) = '-' then 0 else cast(cast(Times as varchar(50))  as numeric(18,2)) end  as Times ,
	Cast([Transação_Relacionada] as varchar(30)) as [Transacao Relacionada]
    
	from dbo.TCS_CD_Catimba_Score
	
	where Cast([Status] as varchar(12)) = 'Completada';



-----------------------------------------------------------------------------------------------
-- drop tabela para ser usada em outro processo de importação 
------------------------------------------------------------------------------------------------
DROP TABLE TCS_CD_Catimba_Score

GO
/****** Object:  StoredProcedure [dbo].[prc_TCS_MP_Mercado_Pago]    Script Date: 04/06/2021 00:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





------------------------------------------------------------------------------------------------
-- Procedure para importar TCS_MP_Mercado_Pago para base MP_Geral
------------------------------------[dbo].[TCS_MP_Paymee]------------------------------------------------------------
CREATE Procedure [dbo].[prc_TCS_MP_Mercado_Pago]

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
drop table TCS_MP_Mercado_Pago

GO
/****** Object:  StoredProcedure [dbo].[prc_TCS_MP_Paymee]    Script Date: 04/06/2021 00:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







------------------------------------------------------------------------------------------------
-- Procedure para importar  TCS_MP_Paymee para base MP_Geral
------------------------------------------------------------------------------------------------
CREATE Procedure [dbo].[prc_TCS_MP_Paymee]

as




INSERT INTO dbo.MP_Geral
           (company,payment_gateway,ID_transaction,ID_company,ID_gateway,date_transaction,date_due,date_completed,[status],[type],
          federal_tax_number,customer,email,amount,rate,net_value,rate_percentage, net_value_calulate,net_value_validation)

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
	   --valor
	 case when cast([Valor] as varchar(50)) = '-' then 0 else cast(cast([Valor] as varchar(50)) as numeric(18,2)) end as Valor, 
	 
	 --rate
	 cast(cast([Taxa_de_Servi_o] as varchar(50)) as numeric(18,2)) * -1 as rate,
	 
	 --net_value
	 cast(cast([Valor_Liquido] as varchar(50)) as numeric(18,2)) as Valor_Liquido, 
	
	--rate_percentage
	CASE
         WHEN  cast(cast([Taxa_de_Servi_o] as varchar(50)) as numeric(18,2)) * -1  = '0'                                           THEN 0
         WHEN  cast(cast([Valor] as varchar(50)) as numeric(18,2)) = 0 or cast(cast([Valor] as varchar(50)) as numeric(18,2)) > 0  THEN cast(cast([Taxa_de_Servi_o] as varchar(50)) as numeric(18,2)) * -1 / cast(cast([Valor] as varchar(50)) as numeric(18,2)) * 100
         ELSE  cast(cast([Taxa_de_Servi_o] as varchar(50)) as numeric(18,2)) * -1 / cast(cast([Valor] as varchar(50)) as numeric(18,2)) * 100
     END,

	 --net_value_calulate
	 cast(cast([Valor] as varchar(50)) as numeric(18,2)) - cast(cast([Taxa_de_Servi_o] as varchar(50)) as numeric(18,2)) * -1,
	 
	 --net_value_validation
	 cast(cast([Valor_Liquido] as varchar(50)) as numeric(18,2)) - cast(cast([Taxa_de_Servi_o] as varchar(50)) as numeric(18,2)) * -1 -  cast(cast([Valor] as varchar(50)) as numeric(18,2)) - cast(cast([Taxa_de_Servi_o] as varchar(50)) as numeric(18,2)) * -1

  
  FROM [dbo].[TCS_MP_Paymee]




-----------------------------------------------------------------------------------------------
-- drop tabela para ser usada em outro processo de importação 
------------------------------------------------------------------------------------------------
drop table TCS_MP_Paymee

GO
/****** Object:  StoredProcedure [dbo].[prc_TCS_MP_PicPay]    Script Date: 04/06/2021 00:21:30 ******/
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




------------------------------------------------------------------------------------------------
-- Procedure para importar  TLC_CD_Ligasclub para base CD_Geral
------------------------------------------------------------------------------------------------

CREATE procedure [dbo].[prc_TLC_CD_Ligasclub]

-------------------------------
--- Parametro xxxx
-------------------------------
--@xxx varchar(100)
as

insert into dbo.CD_Geral(Company,Business,ID_transacao,Id,Nome,Email,Data_Transacao,Data_Ultimo_Status,Tipo,
Valor,Operação,Metodo,Pedido,[Status],Tid,Uuid,Saldo,Empresa,Liga,Valor_liga,Times,Valor_Times,Transacao_Relacionada)

select 'LigasClub' as Company,
	'PicPay' as Business, 

     
    substring(left(replace(replace(replace( replace(cast([Data_Transação] as varchar(23)),'-',''),'T',''),':',''),'.',''), 13), 3, 13)+ 
	dbo.strzero(cast(cast(id as varchar(6)) as integer), 6) as IDTransacao,
	Cast(id as varchar(6)) as Id,
	CAST(Nome AS varchar(50)) as Nome,
	Cast (Email as varchar(50)) as Email,
	convert(varchar,([Data_Transação]),120)as [Data Transação] ,
	convert(varchar,([Data_Último_Status]),120) as [Data Ultimo Status],
    Cast (Tipo as varchar(20)) as Tipo, 
	case when cast([Valor] as varchar(50)) = '-' then 0 else cast(cast([Valor] as varchar(50)) as numeric(18,2)) end as Valor,
	CAST(case when cast(Operação as varchar(20)) = 'Adição de crédito'  then 'Adição de Crédito'else Operação end as varchar(25)) as Operacao, 
	CAST(Método as varchar(20)) as Metodo, 
	Cast (Pedido as varchar(40)) as Pedido ,
	CAST([Status] as varchar(12)) as [Status],
	Cast(Tid as varchar(40)) as Tid, 
	Cast(Uuid as varchar(40)) as Uuid ,
	case when cast(Saldo as varchar(1)) = '-' or cast(Saldo as varchar(10)) = 'Depositado' then 0 else cast(cast(Saldo as varchar(50)) as numeric(18,2))  end as Saldo, 
	Cast(Empresa as varchar(20)) as Empresa,
	Cast(Liga as varchar(15)) as Liga,
	case when Cast([Valor_da_Liga] as varchar(50)) = '-' then 0 else cast(cast([Valor_da_Liga] as varchar(50)) as numeric(18,2))end as [ Valor da Liga],
	case when cast(Times as varchar(50)) = '-' then 0 else cast(cast(Times as varchar(50))  as numeric(18,2)) end  as Times ,
	case when cast([Valor_Times] as varchar(50)) = '-' then 0 else cast(cast([Valor_Times] as varchar(50)) as numeric(18,2)) end as [Valor Times],
	Cast([Transação_Relacionada] as varchar(30)) as [Transacao Relacionada]
   
   from TLC_CD_Ligasclub
   
   where Cast([Status] as varchar(12)) = 'Completada';



-----------------------------------------------------------------------------------------------
-- drop tabela para ser usada em outro processo de importação 
------------------------------------------------------------------------------------------------
DROP TABLE TLC_CD_Ligasclub

GO
/****** Object:  StoredProcedure [dbo].[prc_TLC_MP_Mercado_Pago]    Script Date: 04/06/2021 00:21:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



------------------------------------------------------------------------------------------------
-- Procedure para importar TLC_MP_Mercado_Pago para base MP_Geral

CREATE Procedure [dbo].[prc_TLC_MP_Mercado_Pago]

as





INSERT INTO dbo.MP_Geral
           (company,payment_gateway,ID_transaction,ID_company,ID_gateway,date_transaction,date_completed,[status],[type],
          federal_tax_number,customer,email,rate)

		  Select 
		  'LigasClub' as Company,
		  'MercadoPago' as  Payment_Gateway,

		Cast(Identificador_de_producto_item_id as varchar(45)) as ID_transaction,  --Id_Transation
		 Cast( Código_de_referencia_external_reference as varchar(37))ID_company, --ID_company
		Cast(Número_de_operación_de_Mercado_Pago_operation_id as varchar(45)) ID_gateway,
 Convert( varchar,(Fecha_de_compra_date_created),120 )as [Fecha de compra (date_created)],
  
   --[Fecha de acreditaciÃ³n (date_approved)],
     Convert(varchar,(Fecha_de_liberación_del_dinero_date_released),120) as [Fecha de liberaciÃ³n del dinero (date_released)], 
    Cast(Estado_de_la_operación_status as varchar(12)) as [Estado de la operaciÃ³n (status)],
	'não se aplica'	as [type],
	
	'não se aplica' as federal_tax_number,
     'não se aplica' as customer,

	 Cast( E_mail_de_la_contraparte_counterpart_email as varchar(60)) as [E-mail de la contraparte (counterpart_email)],
	 case when cast([Valor_del_producto_transaction_amount] as varchar(50)) = '-' then 0 else cast(cast([Valor_del_producto_transaction_amount] as varchar(50)) as numeric(18,2)) end as Valor
  
	 
	 
	 
	 FROM [dbo].[TLC_MP_Mercado_Pago]



	 -----------------------------------------------------------------------------------------------
-- drop tabela para ser usada em outro processo de importação 
------------------------------------------------------------------------------------------------
drop table TLC_MP_Mercado_Pago

GO
/****** Object:  StoredProcedure [dbo].[prc_TLC_MP_Paymee]    Script Date: 04/06/2021 00:21:30 ******/
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





------------------------------------------------------------------------------------------------
-- Procedure para importar  TLC_MP_PicPay para base MP_Geral
------------------------------------------------------------------------------------------------
CREATE Procedure [dbo].[prc_TLC_MP_PicPay]

as

INSERT INTO dbo.MP_Geral
           (
		   company,payment_gateway,ID_transaction,ID_company,ID_gateway,date_transaction,
		   [status],[type],federal_tax_number,customer,email)
	--amount,rate,net_value)
     
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
	 --valor
	-- case when cast([Valor] as varchar(50)) = '-' then 0 else cast(cast([Valor] as varchar(50)) as numeric(18,2)) end as Valor, 
	 
	 --rate
	 --cast(cast([Taxa_de_Servi_o] as varchar(50)) as numeric(18,2)) * -1 as rate,
	 --net_value
	 --cast(cast([A_receber] as varchar(50)) as numeric(18,2)) as A_receber
	 
     
	from	[dbo].[TLC_MP_PicPay]
        
      
      
      





-- drop tabela para ser usada em outro processo de importação 
------------------------------------------------------------------------------------------------
drop table TLC_MP_PicPay




GO
