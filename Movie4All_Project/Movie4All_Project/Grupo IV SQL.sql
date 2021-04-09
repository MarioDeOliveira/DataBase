
/*RESPOSTA �S QUEST�ES DO GRUPO IV*/

--RESPOSTA � 1


SELECT U.Name, A.DataAluguer, S.TituloShow, S.CodPais, COUNT() Nome
FROM UTILIZADORES U, ALUGUER A, SHOW D 






--RESPOSTA � 2				
														--NOTA: ESTA QUERY VAI BUSCAR AS QUE TEM CLASSIFICA��ODISTINTA. 
														--ISTO PORQUE N�O DEFINI VALORES NULOS E FIZ UM CHECK DE 1 A 5 ESTRELAS 
SELECT S.*												--NO SEGUNDO J� D� RESULTADO NULO POIS TODOS OS SHOWS EST�O CLASSIFICADOS
	FROM Show S
	where S.IdShow
	NOT IN (
		SELECT DISTINCT AV.IdAvaliacao
		FROM AVALIACAO AV )



SELECT A.*,S.*
FROM AVALIACAO A, SHOW S
WHERE A.NumEstrelas = NULL


--RESPOSTA � 3

SELECT COUNT (U.Idutilizadores) '# Avalia��es', U.Nome					
	FROM UTILIZADORES U, EFECTUAR E,  AVALIACAO A
	WHERE U.IdUtilizadores = E.IdUtilizadores
	AND E.IdAvaliacao = A.IdAvaliacao
	Group by U.IdUtilizadores, U.Nome
	ORDER BY U.IdUtilizadores DESC


--RESPOSTA � 4


SELECT AVG(CAST(NumEstrelas AS int)) AS 'M�dia das Avalia��es', S.TituloShow
	FROM SHOW S, AVALIAR AV, AVALIACAO A
	WHERE S.IdShow = AV.IdShow
	AND AV.IdAvaliacao = A.IdAvaliacao
	GROUP BY S.TituloShow, A.NumEstrelas
	ORDER BY 1 DESC


--RESPOSTA � 5 -  OK

SELECT FormaPagamento, Count (FormaPagamento) '#Vezes'
	FROM ALUGUER
	Group By FormaPagamento



--RESPOSTA � 6
	

SELECT S.TituloShow, COUNT (A.IdAluguer) AS '# Alugueres'
	FROM SHOW S, ALUGUER A
	WHERE A.IdShow = S.IdShow
	GROUP BY S.TituloShow, S.IdShow
	ORDER BY 1 DESC
	