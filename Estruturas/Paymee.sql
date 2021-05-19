 select 
 case when cast('-' as varchar(1)) = '-' then 0 else cast(cast('-' as varchar(50)) as numeric(18,2)) end 