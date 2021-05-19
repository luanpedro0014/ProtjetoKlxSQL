




	 insert into dbo.CD_Fin(Company,Business,ID_transacao,Id,Nome,Email,Data_Transacao,Data_Ultimo_Status,
      Tipo,Valor,Operação,Metodo,Pedido,[Status],Tid,Uuid ,Saldo,Empresa
      ,Liga,Valor_Liga,Times,Valor_Times,Transacao_Relacionada)
select 'Catimba' as Company,
	'Bolada5' as Business, 
  CAST(Id as varchar(5)) + 
    substring(left(replace(replace(replace( replace(cast([Data Transacao] as varchar(23)),'-',''),'T',''),':',''),'.',''), 13), 3, 13) as Id_Transacao,
	  CAST(Id as varchar(5)) + 	
		CAST(Nome AS varchar(50)) as Nome,
		Cast(Id as varchar(5)) as Id,
		Cast (Email as varchar(50)) as Email,
		convert(varchar,([Data Transacao]),120)as [Data Transação] ,
		convert(varchar,([Data Ultimo status]),120) as [Data Ultimo Status],
      Cast (Tipo as varchar(20)) as Tipo, 
	   case when cast([Valor] as varchar(50)) = '-' then 0 else cast(cast([Valor] as varchar(50)) as numeric(18,2)) end as Valor, 
	Cast(Operacao as varchar(25))as Operacão,
	--  CAST(case when Operacao = 'AdiÃ§Ã£o de crÃ©dito' then 'Adição de Crédito' else Operacao end as varchar(25)) as Operação, 
	  CAST(Metodo as varchar(20)) as Metodo, 
	  Cast (Pedido as varchar(40)) as Pedido ,
	  CAST([Status] as varchar(12)) as [Status],
	  Cast(Tid as varchar(40)) as Tid, 
	  Cast(Uuid as varchar(40)) as Uuid ,
	 case when cast(Saldo as varchar(1)) = '-' or cast(Saldo as varchar(10)) = 'Depositado' then 0 else cast(cast(Saldo as varchar(50)) as numeric(18,2))  end as Saldo, 
	   Cast(Empresa as varchar(20)) as Empresa,
	   Cast(Liga as varchar(15)) as Liga,
	    case when cast([Valor Times] as varchar(50)) = '-' then 0 else cast(cast([Valor Times] as varchar(50)) as numeric(18,2)) end as [Valor Times],
	 case when Cast([Valor da Liga] as varchar(50)) = '-' then 0 else cast(cast([Valor da liga] as varchar(50)) as numeric(18,2))end as [ Valor da Liga],
	 case when cast(Times as varchar(50)) = '-' then 0 else cast(cast(Times as varchar(50))  as numeric(18,2)) end  as Times ,
	Cast([Transacao Relacionada] as varchar(30)) as [Transacao Relacionada]
      from TCS_CD_Bolada5
	 where Cast([Status] as varchar(12)) = 'Completada';
