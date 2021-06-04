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
