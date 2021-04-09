/* INSERIR VALORES NAS TABELAS*/

/*DADOS NA TABELA PRECARIO*/

INSERT INTO PRECARIO (TipoShow, TempoAluguer, Preco, DataPrecario, DataAtualPrecario)
VALUES
	('Filmes', '1',' 1', '2020-08-16', '2020-08-16'),
	('Documentarios', '3', '1', '2020-08-16', '2020-08-16'),
	('Series', '1', '0.5', '2020-08-16', '2020-08-16')


/*DADOS NA TABELA UTILIZADORES*/

INSERT INTO UTILIZADORES (Nome, Nif, Email, Numcartao, Idade)
VALUES
	('Mario Oliveira', '243348514', 'maryuoliveira@hotmail.com', '334564434', '37'),
	('Pedro Teixeira', '238574831', 'pacteixeira@gmail.com', '334765343', '38'),
	('Pedro fernandes', '275493754', 'pedromqfernandes.2@gmail.com', '554562318', '41'),
	('Carla Silva', '254473385', 'to.carlasilva@gmail.com', '556456438', '35'),
	('Catarina Silva', '295574386', 'kattgsilva@gmail.com', '456832547', '32'),
	('Romao Gemo', '357438459', 'student.gemo@gmail.com', '554434829', '39'),
	('Sergio Silva', '332547854', 'sergiommaria@gmail.com', ' ', '40'),
	('Igor santos', '254478964', 'igorvalter@gmail.com', '325478654', '29'),
	('Diogo Martins', '231548796', 'dvmartins76@gmail.com', '325478314', '30'),
	('Filipe Piloto', '341545879', 'Filipepiloto1985@gmail.com', '124536878', '38'),
	('Ricardo Santana', '312547895', 'ribosisa@gmail.com', '234357478', '33')


INSERT INTO TELEMOVEL (IdUtilizadores, Telemovel)
VALUES
	('1', '915742548'),
	('2', '914563234'),
	('3', '915742437'),
	('4', '934567832'),
	('5', '934537898'),
	('6', '923478654'),
	('7', '933454654'),
	('8', '914433593'),
	('9', '961234456'),
	('10', '969128543'),
	('11', '923488545')

	 
INSERT INTO SHOW (TituloShow, GeneroShow, Descricao, Ano, CodPaís, Traducao, IdPreco)
VALUES
	('MATRIX', 'SCI-FI', 'Um hacker de computador aprende com rebeldes misteriosos sobre a verdadeira natureza de sua realidade e seu papel na guerra contra seus controladores.', '1999', 'US', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', '3'),
	('PS I LOVE YOU', 'ROMANCE', 'Uma jovem viúva descobre que seu falecido marido deixou dez mensagens com o objetivo de ajudar a aliviar sua dor e começar uma nova vida.', '2008', 'US', 'A young widow discovers that her late husband has left her 10 messages intended to help ease her pain and start a new life.', '3'),
	('TAXI - UMA VIAGEM ALUCINANTE', 'AÇÃO', 'Para tirar seu histórico de dirigir manchado, um taxista descolado precisa ser motorista de um inspetor policial perdedor na pista de ladrões de banco alemães.','1998','FR','To work off his tarnished driving record, a hip taxi driver must chauffeur a loser police inspector on the trail of German bank robbers.', '3'),
	('O AMOR ACONTECE', 'DRAMA', 'Segue a vida de oito casais muito diferentes ao lidar com suas vidas amorosas em vários contos vagamente inter-relacionados, todos ambientados durante um mês frenético antes do Natal em Londres, Inglaterra', '2003','GB', 'Follows the lives of eight very different couples in dealing with their love lives in various loosely interrelated tales all set during a frantic month before Christmas in London, England', '3'),
	('THE RING - O AVISO', 'TERROR', 'Um jornalista deve investigar uma fita de vídeo misteriosa que parece causar a morte de qualquer pessoa uma semana após a exibição.', '2002', 'US', 'A journalist must investigate a mysterious videotape which seems to cause the death of anyone one week to the day after they view it.', '3'),
	('JURASSIC PARK', 'ADVENTURE', 'Um paleontólogo pragmático visitando um parque temático quase completo tem a tarefa de proteger algumas crianças depois que uma falha de energia faz com que os dinossauros clonados do parque se soltem.', '1997', 'US', 'A pragmatic paleontologist visiting an almost complete theme park is tasked with protecting a couple of kids after a power failure causes the parks cloned dinosaurs to run loose.', '3'),
	('A CANÇÃO DE LISBOA', 'MUSICAL', 'Quão felizes e orgulhosas são aquelas duas senhoras que regressam ao Porto! Graças a eles, o sobrinho brilhante pode estudar medicina em Lisboa e pode já ter se tornado médico.', '2016', 'PT', 'How happy and proud they are those two ladies back in Oporto! Thanks to them, their bright nephew can study medicine in Lisbon and may already have become a doctor.', '3'),
	('STAR WARS', 'SCI.FI', 'A história de luke skywalker contra as forças do mal.','2001', 'US', 'The story of luke skywalker against the curtains of evil', '3')
	
Insert into Avaliacao (DataCriacao, DataAtualizacao, NumEstrelas, Texto)
Values 
		('2020-01-18', '2020-05-23','5', 'Wonderful'),
		('2019-03-12', '2020-04-21','5', ''),
		('2020-06-15', '2020-07-06','3','Podia ser melhor!'),
		('2019-01-31', '2019-12-23','3', 'Deu para a pipoca'),
		('2020-02-28', '2020-03-20','4',''),
		('2016-01-15', '2017-05-01','5',''),
		('2018-09-18', '2019-10-23','2', 'Não gostei de certo tipo de cenas'),
		
		
Insert into PRECARIO (TipoShow, TempoAluguer, Preco, DataPrecario)
Values 
		('Filmes', '1', '1', getDate()),
		('Documentários', '3', '1', getdate()),
		('Séries', '1', '0.5', getDate())	


Insert into ALUGUER (DataAluguer, DataExpirar, FormaPagamento, ValorPago, IdShow)
Values 
		('2020-01-20', '2020-01-21', 'Cartão Débito', '1', '1'),
		('2020-03-21', '2020-03-22', 'Cartão Débito', '1', '1'),
		('2020-05-18', '2020-05-19', 'Cartão Débito', '1', '3'),
		('2020-04-03', '2020-04-04', 'Cartão Débito', '1', '4'),
		('2020-05-10', '2020-05-11', 'Cartão Crédito','1', '5'),
		('2020-04-15', '2020-04-16', 'Cartão Débito', '1', '2'),
		('2020-03-23', '2020-03-24', 'Cartão Débito', '1', '1')