insert into dbo.MP_Geral2 (Consumidor, Id, Reference_ID, Tipo, [data], [Status], Total,Taxa,A_receber,Operador)
select Consumidor, ID, [Reference Id],Tipo,
	convert(varchar,([Data]),120)as [Data],[Status], 
	 case when Cast(Total as varchar(50)) = '-' then 0 else cast( cast(Total as varchar(50))  as numeric(18,2)) end  as Total,
	 case when Cast(Taxa as varchar(50)) = '-' then 0 else cast( cast(Taxa as varchar(50))  as numeric(18,2)) end as Taxa,
	 case when Cast([A receber] as varchar(50)) = '-' then 0 else cast( cast([A receber] as varchar(50))  as numeric(18,2)) end as [A receber],
	 Operador

from dbo.TLC_MP_Paymee