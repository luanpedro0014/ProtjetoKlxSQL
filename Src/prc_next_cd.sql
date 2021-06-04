SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



----------------------------------------------------------------------------------------------
-- Procedure para importar  TABELAS CD para base CD_Geral
------------------------------------------------------------------------------------------------

CREATE procedure [dbo].[prc_next_cd]

as

----------------------------------------------------------------------------------------------
-- Processa TCS_CD_Bolada5 para banco cd_geral
------------------------------------------------------------------------------------------------
exec prc_TCS_CD_Bolada5

----------------------------------------------------------------------------------------------
-- Processa TCS_CD_Catimba_Score para banco cd_geral
------------------------------------------------------------------------------------------------
exec prc_TCS_CD_Catimba_Score


----------------------------------------------------------------------------------------------
-- Processa TLC_CD_Ligasclub para banco cd_geral
------------------------------------------------------------------------------------------------
exec prc_TLC_CD_Ligasclub


-----------------------------------------------------------------------------------------------
-- verfica duplicidade - Mendes 25/05/2021
------------------------------------------------------------------------------------------------
--prepara copia da tabela cd_geral de registro que não são duplicado na tabela  duplicate_table
SELECT DISTINCT *
INTO duplicate_table
FROM [dbo].[CD_Geral]
GROUP BY Company,Business,ID_transacao,Id,Nome,Email,Data_Transacao,Data_Ultimo_Status,Tipo,
Valor,Operação,Metodo,Pedido,[Status],Tid,Uuid,Saldo,Empresa,Liga,Valor_liga,Times,Valor_Times,Transacao_Relacionada
HAVING COUNT(ID_transacao) > 1

--deleta registro duplicado na tabela CD_Geral
DELETE [dbo].[CD_Geral]
WHERE ID_transacao
IN (SELECT ID_transacao
FROM duplicate_table)
-- gera insert dos registro originais da tabela duplicate_table para CD_Geral
INSERT [dbo].[CD_Geral]
SELECT *
FROM duplicate_table

--apaga tabela temporaria
DROP TABLE duplicate_table


GO
