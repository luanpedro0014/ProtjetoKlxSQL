select 'LigasClub' as Company,'Paymee' as Business, CAST(Id as varchar(5))  + CAST ( [Data Transacao] as varchar(19) ) as Id_Transacao,Id,Nome,Email,[Data Transacao],[Data Ultimo status],
      Tipo,Valor,Operacao,Metodo,Pedido,[Status],Tid,Uuid ,Saldo,Empresa,
      Liga,Valor Liga,Times,[Valor Times],[Transacao Relacionada]
      from dbo.TLC_CD_ligasclub 



	  
	 

	

	  