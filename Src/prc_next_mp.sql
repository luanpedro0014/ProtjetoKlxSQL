SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












----------------------------------------------------------------------------------------------
-- Procedure para importar  TABELAS mp para base mp_Geral
------------------------------------------------------------------------------------------------
CREATE procedure [dbo].[prc_next_mp]

as

----------------------------------------------------------------------------------------------
-- Processa xxxx para banco mp_geral
------------------------------------------------------------------------------------------------
exec prc_TCS_MP_Paymee

----------------------------------------------------------------------------------------------
-- Processa xxxx para banco mp_geral
------------------------------------------------------------------------------------------------
exec prc_TLC_MP_Paymee


----------------------------------------------------------------------------------------------
-- Processa xxxx para banco mp_geral
------------------------------------------------------------------------------------------------
exec prc_TLC_MP_PicPay


----------------------------------------------------------------------------------------------
-- Processa xxxx para banco mp_geral
------------------------------------------------------------------------------------------------
exec prc_TCS_MP_PicPay


----------------------------------------------------------------------------------------------
-- Processa xxxx para banco mp_geral
------------------------------------------------------------------------------------------------
exec prc_TCS_MP_Mercado_Pago


----------------------------------------------------------------------------------------------
-- Processa xxxx para banco mp_geral
------------------------------------------------------------------------------------------------
exec prc_TLC_MP_Mercado_Pago



-----------------------------------------------------------------------------------------------
-- verfica duplicidade - Mendes 25/05/2021
------------------------------------------------------------------------------------------------
--prepara copia da tabela MP_geral de registro que não são duplicado na tabela  duplicate_table

SELECT DISTINCT *
INTO duplicate_table
FROM [dbo].[MP_Geral]
GROUP BY company,payment_gateway,ID_transaction,ID_company,ID_gateway,date_transaction,date_due,date_completed,[status],[type],
          federal_tax_number,customer,email,amount,rate,net_value,rate_percentage, net_value_calulate,net_value_validation
HAVING COUNT(ID_transaction) > 1

--deleta registro duplicado na tabela MP_Geral
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





