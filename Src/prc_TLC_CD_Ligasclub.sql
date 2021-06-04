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



