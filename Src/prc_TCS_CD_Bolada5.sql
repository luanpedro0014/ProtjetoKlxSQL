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
