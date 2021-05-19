-- insert para incluir os dados da tabela de origem para a tabela de destino.
insert into dbo.CD_Geral(Company,Business,ID_transacao,Id,Nome,Email,Data_Transacao,Data_Ultimo_Status,Tipo,
Valor,Operação,Metodo,Pedido,[Status],Tid,Uuid,Saldo,Empresa,Liga,Valor_liga,Times,Valor_Times,Transacao_Relacionada)
-- selecionar tabela origem e realizar a conversão de dados do Id e do Data_transacao
select 'LigasClub' as Company,
	'PicPay' as Business, 

     
    substring(left(replace(replace(replace( replace(cast([Data Transacao] as varchar(23)),'-',''),'T',''),':',''),'.',''), 13), 3, 13)+ 
	 dbo.strzero(cast(cast(id as varchar(6)) as integer), 6) as IDTransacao,
    Cast(id as varchar(6)) as Id,
	CAST(upper( cast (Nome collate Latin1_General_CI_AS as varchar(50)))
	Collate Latin1_General_CI_AS as varchar(50)) as Nome,
	Cast (Email as varchar(50)) as Email,
	convert(varchar,([Data Transacao]),120)as [Data Transação] ,
	convert(varchar,([Data Ultimo status]),120) as [Data Ultimo Status],
      Cast (Tipo as varchar(20)) as Tipo, 
	  case when cast([Valor] as varchar(50)) = '-' then 0 else cast(cast([Valor] as varchar(50)) as numeric(18,2)) end as Valor,
	  CAST(case when cast(Operacao as varchar(20)) = 'AdiÃ§Ã£o de crÃ©dito'  then 'Adição de Crédito'else Operacao end as varchar(25)) as Operacao, 
	  CAST(Metodo as varchar(20)) as Metodo, 
	  Cast (Pedido as varchar(40)) as Pedido ,
	  CAST([Status] as varchar(12)) as [Status],
	  Cast(Tid as varchar(40)) as Tid, 
	  Cast(Uuid as varchar(40)) as Uuid ,
	 case when cast(Saldo as varchar(1)) = '-' or cast(Saldo as varchar(10)) = 'Depositado' then 0 else cast(cast(Saldo as varchar(50)) as numeric(18,2))  end as Saldo, 
	  Cast(Empresa as varchar(20)) as Empresa,
	  Cast(Liga as varchar(15)) as Liga,
	 case when Cast([Valor da Liga] as varchar(50)) = '-' then 0 else cast(cast([Valor da liga] as varchar(50)) as numeric(18,2))end as [ Valor da Liga],
	case when cast(Times as varchar(50)) = '-' then 0 else cast(cast(Times as varchar(50))  as numeric(18,2)) end  as Times ,
	case when cast([Valor Times] as varchar(50)) = '-' then 0 else cast(cast([Valor Times] as varchar(50)) as numeric(18,2)) end as [Valor Times],
	 
	Cast([Transacao Relacionada] as varchar(30)) as [Transacao Relacionada]
    from TLC_CD_Ligasclub
     where Cast([Status] as varchar(12)) = 'Completada';