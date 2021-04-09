/*** VISTAS***/

--NUMERO DE UTILIZADORES DE CARTAO CREDITO E DEBITO

CREATE VIEW UTILIZADORESDECARTAODEBITOCREDITO
AS
	SELECT FormaPagamento, Count (FormaPagamento) '#Vezes'
	FROM ALUGUER
	Group By FormaPagamento
GO



CREATE VIEW ShoesSemAvaliacao
AS	
SELECT AVG(CAST(NumEstrelas AS int)) AS 'Média das Avaliações', S.TituloShow
	FROM SHOW S, AVALIAR AV, AVALIACAO A
	WHERE S.IdShow = AV.IdShow
	AND AV.IdAvaliacao = A.IdAvaliacao
	GROUP BY S.TituloShow, A.NumEstrelas
	ORDER BY 1 DESC