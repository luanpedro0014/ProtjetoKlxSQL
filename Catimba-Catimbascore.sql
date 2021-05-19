

  
  -- insert para incluir os dados da tabela de origem para a tabela de destino.(cd_fin_)
	  insert into dbo.CD_Geral(Company,Business,ID_transacao,Id,Nome,Email,Data_Transacao,Data_Ultimo_Status,
      Tipo,Valor,Operação,Metodo,Pedido,[Status],Tid,Uuid ,Saldo,Empresa
      ,Liga,Valor_Liga,Times,Valor_Times,Transacao_Relacionada)
-- selecionar tabela origem e realizar a conversão de dados do Id e do Data_transacao


select 'Catimba' as Company,
	'Catimba_Score' as Business, 
	  substring(left(replace(replace(replace( replace(cast([Data Transação] as varchar(30)),'-',''),'T',''),':',''),'.',''), 16), 3, 16)+
   dbo.strzero(cast(cast(id as varchar(6)) as integer), 6) as IDTransacao,
	Cast( Id as Varchar(6)) as Id,
	CAST(case  when cast (Nome AS varchar(50))= 'Luiz ClÃ¡udio Andrade Ferreira' then 'Luiz Claudio Andrade Ferreira'else Nome end as varchar(50)) as Nome,
	Cast (Email as varchar(50)) as Email,
	convert(varchar,([Data Transação]),120)as [Data Transação] ,
	convert(varchar,([Data Último status]),120) as [Data Último Status],
      Cast (Tipo as varchar(20)) as Tipo, 
	  case when cast([Valor] as varchar(50)) = '-' then 0 else cast(cast([Valor] as varchar(50)) as numeric(18,2)) end as Valor,
	  CAST(case when cast(Operação as varchar(20)) = 'AdiÃ§Ã£o de crÃ©dito'  then 'Adição de Crédito'else Operação end as varchar(25)) as Operacao, 
	  CAST(Método as varchar(20)) as Método, 
	  Cast (Pedido as varchar(40)) as Pedido ,
	  CAST([Status] as varchar(12)) as [Status],
	  Cast(Tid as varchar(40)) as Tid, 
	  Cast(Uuid as varchar(40)) as Uuid ,
 case when cast(Saldo as varchar(1)) = '-' or cast(Saldo as varchar(10)) = 'Depositado'  or cast( Saldo as varchar(13))='PremiaÃ§Ã£o' or Cast(Saldo as varchar(5))=''   then 0 else cast(cast(Saldo as varchar(50)) as numeric(18,2))  end as Saldo,  
	 Cast(Empresa as varchar(20)) as Empresa,
	 Cast(Liga as varchar(15)) as Liga,
	 case when cast([Valor Times] as varchar(50)) = '-' then 0 else cast(cast([Valor Times] as varchar(50)) as numeric(18,2)) end as [Valor Times],
	 case when Cast([Valor da Liga] as varchar(50)) = '-' then 0 else cast(cast([Valor da liga] as varchar(50)) as numeric(18,2))end as [Valor da Liga],
	 case when cast(Times as varchar(50)) = '-' then 0 else cast(cast(Times as varchar(50))  as numeric(18,2)) end  as Times ,
	  Cast([Transação Relacionada] as varchar(30)) as [Transacao Relacionada]
      from dbo.TCS_CD_Catimba_Score
	 where Cast([Status] as varchar(12)) = 'Completada';
