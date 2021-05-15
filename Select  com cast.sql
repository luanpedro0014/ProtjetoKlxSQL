-- insert para incluir os dados da tabela de origem para a tabela de destino.
insert into dbo.CD_Fin(Company,Business,ID_transacao,Id,Nome,Email,Data_Transacao,Data_Ultimo_Status,Tipo,
Valor,Operação,Metodo,Pedido,[Status],Tid,Uuid,Saldo,Empresa,Liga,Valor_liga,Times,Valor_Times,Transacao_Relacionada)
-- selecionar tabela origem e realizar a conversão de dados do Id e do Data_transacao
select 'Catimba' as Company,'Bolada5' as Business, CAST(Id as varchar(5))  + CAST ( [Data Transacao] as varchar(19) ) as Id_Transacao,Id,CAST(Nome AS varchar(50)) as Nome,Cast (Email as varchar(50)) as Email,convert(varchar,([Data Transacao]),120)as [Data Transação] ,convert(varchar,([Data Ultimo status]),120) as [Data Ultimo Status],
      Cast (Tipo as varchar(20)) as Tipo, case when cast([Valor] as varchar(50)) = '-' then 0 else cast(cast([Valor] as varchar(50)) as numeric(18,2)) end, CAST(Operacao as varchar(25)) as Operação, CAST(Metodo as varchar(20)) as Metodo, Cast (Pedido as varchar(40)) as Pedido , CAST([Status] as varchar(12)) as [Status],Cast(Tid as varchar(40)) as Tid, Cast(Uuid as varchar(40)) as Uuid ,case when cast(Saldo as varchar(50)) = '-' then 0 else cast(cast(Saldo as varchar(50)) as numeric(18,2)) end, 
	  Cast(Empresa as varchar(20)),Cast(Liga as varchar(15)),case when Cast([Valor da Liga] as varchar(50)) = '-' then 0 else cast(cast([Valor da liga] as varchar(50)) as numeric(18,2))end, case when cast(Times as varchar(50)) = '-' then 0 else cast(cast(Times as varchar(50))  as numeric(18,2)) end , 
	  case when cast([Valor Times] as varchar(50)) = '-' then 0 else cast(cast([Valor Times] as varchar(50)) as numeric(18,2)) end, Cast([Transacao Relacionada] as varchar(30)) as [Transacao Relacionada]
      from TLC_CD_Ligasclub
	 where Cast([Status] as varchar(12)) = 'Completada';


	  
	  -- insert para incluir os dados da tabela de origem para a tabela de destino.(cd_fin_)

	  insert into dbo.CD_Fin(Company,Business,ID_transacao,Id,Nome,Email,Data_Transacao,Data_Ultimo_Status,
      Tipo,Valor,Operação,Metodo,Pedido,[Status],Tid,Uuid ,Saldo,Empresa
      ,Liga,Valor_Liga,Times,Valor_Times,Transacao_Relacionada)
-- selecionar tabela origem e realizar a conversão de dados do Id e do Data_transacao(tabela Tcs_CD_Catimba_score)
select 'Catimba' as Company,'Catimba_Score' as Business, CAST(Id as varchar(5))  + CAST ( [Data Transação] as varchar(19) ) as Id_Transacao,Id,CAST(Nome AS varchar(50)) as Nome,Cast (Email as varchar(50)) as Email,convert(varchar,([Data Transação]),120) as [Data Transação],convert(varchar,([Data Último status]),120) as [Data Ultimo Status],
       Cast(Tipo  as varchar(20)) as Tipo,case when cast(Valor as varchar(50)) = '-' then 0 else cast(cast(Valor as varchar(50)) as numeric(18,2)) end, CAST(Operação as varchar(25))as Operação, CAST(Método as varchar(20)) as Metodo, Cast(Pedido as varchar(40)) as Pedido, CAST([Status] as varchar(12)) as Status, Cast(Tid as varchar(40))as Tid, Cast (Uuid as varchar(40)) as Uuid ,case when cast(Saldo as varchar(50)) = '-' then 0 else cast(cast(Saldo as varchar(50)) as numeric(18,2)) end, Cast(Empresa as varchar(20)) as Empresa,
      Liga,  case when Cast([Valor da Liga] as varchar(50)) = '-' then 0 else cast(cast([Valor da liga] as varchar(50)) as numeric(18,2))end , case when cast(Times as varchar(50)) = '-' then 0 else cast(cast(Times as varchar(50))  as numeric(18,2)) end , 
	  case when cast([Valor Times] as varchar(50)) = '-' then 0 else cast(cast([Valor Times] as varchar(50)) as numeric(18,2)) end, Cast([Transação Relacionada] as varchar(30)) as [Transacao Relacionada]
      from dbo.TCS_CD_Catimba_Score
	 where Cast([Status] as varchar(12)) = 'Completada';


	     
		-- rt para incluir os dados da tabela de origem para a tabela de destino.
insert into dbo.CD_Fin(Company,Business,ID_transacao,Id,Nome,Email,Data_Transacao,Data_Ultimo_Status,
      Tipo,Valor,Operação,Metodo,Pedido,[Status],Tid,Uuid ,Saldo,Empresa
      ,Liga,Valor_Liga,Times,Valor_Times,Transacao_Relacionada)

	-- selecionar tabela origem e realizar a conversão de dados do Id e do Data_transacao
select 'Catimba' as Company,'Bolada5' as Business, CAST(Id as varchar(5))  + CAST ( [Data Transacao] as varchar(19) ) as Id_Transacao,Id,CAST(Nome AS varchar(50)) as Nome,Cast (Email as varchar(50)) as Email,convert(varchar,([Data Transacao]),120)as [Data Transação] ,convert(varchar,([Data Ultimo status]),120) as [Data Ultimo Status],
      Cast (Tipo as varchar(20)) as Tipo, case when cast([Valor] as varchar(50)) = '-' then 0 else cast(cast([Valor] as varchar(50)) as numeric(18,2)) end, CAST(Operacao as varchar(25)) as Operação, CAST(Metodo as varchar(20)) as Metodo, Cast (Pedido as varchar(40)) as Pedido , CAST([Status] as varchar(12)) as [Status],Cast(Tid as varchar(40)) as Tid, Cast(Uuid as varchar(40)) as Uuid ,case when cast(Saldo as varchar(50)) = '-' then 0 else cast(cast(Saldo as varchar(50)) as numeric(18,2)) end, 
	  Cast(Empresa as varchar(20)),Cast(Liga as varchar(15)),case when Cast([Valor da Liga] as varchar(50)) = '-' then 0 else cast(cast([Valor da liga] as varchar(50)) as numeric(18,2))end, case when cast(Times as varchar(50)) = '-' then 0 else cast(cast(Times as varchar(50))  as numeric(18,2)) end , 
	  case when cast([Valor Times] as varchar(50)) = '-' then 0 else cast(cast([Valor Times] as varchar(50)) as numeric(18,2)) end, Cast([Transacao Relacionada] as varchar(30)) as [Transacao Relacionada]
      from dbo.TCS_CD_Bolada5
	 where Cast([Status] as varchar(12)) = 'Completada';



	