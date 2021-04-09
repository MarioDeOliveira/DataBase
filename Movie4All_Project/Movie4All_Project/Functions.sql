/*CALCULAR O VALOR A PAGAR NO ALUGUER DE UMA SÉRIE*/

/*FUNCTION*/

CREATE OR ALTER FUNCTION dbo.CaculoAluguer
(
	@NumeroEpisodio int, 
	@PrecoEpisodio numeric (5,2)
)
RETURNS numeric (5,2)
AS
BEGIN
	DECLARE
		@Aluguer numeric (5,2)

	SET @Aluguer = (@NumeroEpisodio * 3) * @PrecoEpisodio;

	RETURN @Aluguer;
END
GO

/*TESTE CALCULO*/

SELECT dbo.CaculoAluguer(10, 2) AS 'Valor a Pagar'
GO

