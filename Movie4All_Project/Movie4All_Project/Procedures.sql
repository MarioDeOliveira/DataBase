/*CRIAR PROCEDIMENTO*/


--PROCEDIMENTO PARA APRESENTAR ANO ATUAL COM O M�S--


CREATE OR ALTER PROCEDURE dbo.ConcatDate
AS
BEGIN
	SELECT REPLACE(CONVERT(CHAR(7), GETDATE(), 120), ' ','-') as 'ConcatDate'
END
GO

--TESTE PROCEDIMENTO--

EXECUTE dbo.ConcatDate 
