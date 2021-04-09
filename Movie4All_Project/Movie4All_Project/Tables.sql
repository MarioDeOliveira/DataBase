/***CREATE DATABASE***/

CREATE DATABASE MOVIE4ALL

/***CREATE TABLES AND INDEX'S***/


CREATE TABLE ASSOCIADOS
(
	IdAssociados int IDENTITY (1, 1) NOT NULL,
	Nome nvarchar (100) NOT NULL,
	Telemovel numeric (9) NOT NULL,
	Nif numeric (9) NOT NULL,
	Email nvarchar (50) NOT NULL,
	IdUtilizadores int NOT NULL,
	CONSTRAINT PK_IdAssociados PRIMARY KEY CLUSTERED (IdAssociados),
	CONSTRAINT UN_Associados_Nif UNIQUE (Nif),
	CONSTRAINT FK_IdUtilizadores FOREIGN KEY (IdUtilizadores) REFERENCES UTILIZADORES (IdUtilizadores)
)
GO
	CREATE NONCLUSTERED INDEX IDX_ASSOCIADOS_IdAvaliacao ON ASSOCIADOS (IdUtilizadores)


CREATE TABLE UTILIZADORES
(
	IdUtilizadores int IDENTITY (1, 1),
	Nome nvarchar (100) NOT NULL,
	Nif numeric (9) NOT NULL,
	Email nvarchar (50) NOT NULL,
	Numcartao varchar (50) NULL,
	Idade numeric (2) NOT NULL,
	CONSTRAINT UN_Utilizadores_Nif UNIQUE (Nif),
	CONSTRAINT PK_IdUtilizadores PRIMARY KEY CLUSTERED (IdUtilizadores)
)
GO


CREATE TABLE FAZER
(
	IdUtilizadores int NOT NULL,
	IdAluguer int NOT NULL,
	CONSTRAINT PK_FAZER PRIMARY KEY CLUSTERED (IdUtilizadores, IdAluguer),
	CONSTRAINT FK_FAZER_IdUtilizadores FOREIGN KEY (IdUtilizadores) REFERENCES UTILIZADORES (IdUtilizadores),
	CONSTRAINT FK_FAZER_IdAluguer FOREIGN KEY (IdAluguer) REFERENCES ALUGUER (IdAluguer)
)
GO
	CREATE NONCLUSTERED INDEX IDX_FAZER_IdUtilizadores ON FAZER (IdUtilizadores)
	CREATE NONCLUSTERED INDEX IDX_FAZER_IdAluguer ON FAZER (IdAluguer)
	drop table FAZER

CREATE TABLE ALUGUER
(
	IdAluguer int IDENTITY (1,1) NOT NULL,
	DataAluguer DateTime2 (0) NOT NULL,
	DataExpirar Datetime2 (0)NOT NULL DEFAULT getdate(),
	FormaPagamento nvarchar (50) NOT NULL, 
	ValorPago decimal (5,2) NOT NULL,
	IdShow int NOT NULL,
	CONSTRAINT PK_IdAluguer PRIMARY KEY CLUSTERED (IdAluguer),
	CONSTRAINT CHK_ALUGUER_FormaPagamento CHECK (FormaPagamento IN ('Cartão Débito', 'Cartão Crédito'))
)
GO	
drop table ALUGUER

CREATE TABLE DISPOR
(
	IdAluguer int NOT NULL,
	IdShow int NOT NULL
	CONSTRAINT PK_DISPOR PRIMARY KEY CLUSTERED (IdAluguer, IdShow)
	CONSTRAINT FK_DISPOR_IdAluguer FOREIGN KEY (IdAluguer) REFERENCES ALUGUER (IdAluguer),
	CONSTRAINT FK_DISPOR_IdShow FOREIGN KEY (IdShow) REFERENCES SHOW (IdShow)
)
GO
	CREATE NONCLUSTERED INDEX IDX_DISPOR_IdAluguer ON DISPOR (IdAluguer)
	CREATE NONCLUSTERED INDEX IDX_DISPOR_IdShow ON DISPOR (IdShow)
	drop table DISPOR

CREATE TABLE SHOW
(
	IdShow int IDENTITY (1,1) NOT NULL PRIMARY KEY,
	TituloShow nvarchar (50) NOT NULL,
	GeneroShow nvarchar (50) NOT NULL,
	Descricao nvarchar (MAX) NOT NULL,
	Ano numeric (4) NOT NULL,
	CodPaís varchar (2) NOT NULL,
	Traducao nvarchar (MAX) NOT NULL,
	IdPreco int NOT NULL,
	CONSTRAINT FK_SHOW_IdPreco FOREIGN KEY (IdPreco) REFERENCES PRECARIO (IdPreco),
)
GO
	CREATE NONCLUSTERED INDEX IDX_SHOW_IdPreco ON SHOW (IdPreco)


CREATE TABLE PRECARIO
(
	IdPreco int IDENTITY (1,1) NOT NULL,
	TipoShow nvarchar (50) NOT NULL,
	TempoAluguer int NOT NULL,						
	Preco numeric (5,2) NOT NULL,
	DataPrecario dateTime2 (7) NOT NULL,
	DataAtualPrecario dateTime2 (7) Null DEFAULT GetDate(),
	CONSTRAINT PK_PRECARIO PRIMARY KEY CLUSTERED (IdPreco)
)
GO	

CREATE TABLE EFECTUAR
(
	IdAvaliacao int NOT NULL,
	IdUtilizadores int NOT NULL,
	CONSTRAINT PK_EFECTUAR PRIMARY KEY CLUSTERED (IdAvaliacao, IdUtilizadores),
	CONSTRAINT FK_EFECTUAR_IdAvaliacao FOREIGN KEY (IdAvaliacao) REFERENCES AVALIACAO (IdAvaliacao),
	CONSTRAINT FK_EFECTUAR_IdUtilizadores FOREIGN KEY (IdUtilizadores) REFERENCES UTILIZADORES (IdUtilizadores)
)
GO
	CREATE NONCLUSTERED INDEX IDX_EFECTUAR_IdAvaliacao ON EFECTUAR (IdAvaliacao)
	CREATE NONCLUSTERED INDEX IDX_EFECTUAR_IdUtilizadores ON EFECTUAR (IdUtilizadores)


CREATE TABLE AVALIACAO
(
	IdAvaliacao int IDENTITY (1,1) NOT NULL,
	DataCriacao datetime2 (0) NOT NULL,					
	DataAtualizacao datetime2 (0) NOT NULL DEFAULT GetDate(),
	NumEstrelas int NULL CONSTRAINT DF_AVALIAÇÃO_NumEstrelas default '3',
	Texto nvarchar (250) NULL,
	CONSTRAINT PK_IdAvaliacao PRIMARY KEY CLUSTERED (IdAvaliacao),
	CONSTRAINT CHK_AVALIACAO_NumEstrelas CHECK (NumEstrelas IN ('1', '2', '3', '4', '5')),
)
GO


CREATE TABLE AVALIAR
(
	IdAvaliacao int NOT NULL,
	IdShow int NOT NULL,
	CONSTRAINT PK_AVALIAR PRIMARY KEY CLUSTERED (IdAvaliacao, IdShow),
	CONSTRAINT FK_AVALIAR_IdAvaliacao FOREIGN KEY (IdAvaliacao) REFERENCES AVALIACAO (IdAvaliacao),
	CONSTRAINT FK_AVALIAR_IdShow FOREIGN KEY (IdShow) REFERENCES SHOW (IdShow)
)
GO

	CREATE NONCLUSTERED INDEX IDX_AVALIAR_IdAvaliacao ON AVALIAR (IdAvaliacao)
	CREATE NONCLUSTERED INDEX IDX_AVALAIR_IdShow ON AVALIAR (IdShow)
	


CREATE TABLE ATORES
(
	IdAtores int IDENTITY (1,1) NOT NULL, 
	NickName nvarchar (50) NOT NULL,
	NomeAtores nvarchar (100) NOT NULL,
	GeneroAtores char (1) NOT NULL CONSTRAINT DF_ATORES_GeneroAtores default 'M',
	CONSTRAINT PK_ATORES PRIMARY KEY CLUSTERED (IdAtores),
	CONSTRAINT UN_Atores_NickName UNIQUE (NickName),
	CONSTRAINT CHK_Person_Gender CHECK ( GeneroAtores = 'M' OR GeneroAtores = 'F'),
)
GO


CREATE TABLE PARTICIPAR
(
	IdAtores int NOT NULL,
	IdShow int NOT NULL,	
	CONSTRAINT PK_PARTICIPAR PRIMARY KEY CLUSTERED (IdAtores, IdShow),
	CONSTRAINT FK_PARTICIPAR_IdAtores FOREIGN KEY (IdAtores) REFERENCES ATORES (IdAtores),
	CONSTRAINT FK_PARTICIPAR_IdShow FOREIGN KEY (IdShow) REFERENCES SHOW (IdShow),
)
GO
	CREATE NONCLUSTERED INDEX IDX_PARTICIPAR_IdAtores ON PARTICIPAR (IdAtores)
	CREATE NONCLUSTERED INDEX IDX_PARTICIPAR_IdShow ON PARTICIPAR (IdShow)


CREATE TABLE INFORMAR
(
	IdShow int NOT NULL,	
	IdTemporada int NOT NULL,
	CONSTRAINT PK_INFORMAR PRIMARY KEY CLUSTERED (IdShow, IdTemporada),
	CONSTRAINT FK_INFORMAR_IdShow FOREIGN KEY (IdShow) REFERENCES SHOW (IdShow),
	CONSTRAINT FK_INFORMAR_IdTemporada FOREIGN KEY (IdTemporada) REFERENCES TEMPORADA (IdTemporada),
)
GO
	CREATE NONCLUSTERED INDEX IDX_INFORMAR_IdShow ON INFORMAR (IdShow)
	CREATE NONCLUSTERED INDEX IDX_INFORMAR_IdTemporada ON INFORMAR (IdTemporada)


	
CREATE TABLE TEMPORADA
(
	IdTemporada int IDENTITY (1,1) NOT NULL,
	NomeTemporada nvarchar (50) NOT NULL,
	NumTemporada numeric (2) NOT NULL,
	NumEpisodios numeric (2) NOT NULL,
	CONSTRAINT PK_IdTemporada PRIMARY KEY CLUSTERED (IdTemporada)
)
GO


CREATE TABLE EPISODIO
(
	IdEpisodio int IDENTITY (1,1)  NOT NULL,
	NomeEpisodio varchar (50) NOT NULL,
	NumEpisodio numeric (2) NOT NULL,
	DataLancamento numeric (10) NOT NULL,
	IdTemporada int NOT NULL,
	CONSTRAINT PK_EPISODIO PRIMARY KEY CLUSTERED (IdEpisodio),
	CONSTRAINT FK_EPISODIO_IdTemporada FOREIGN KEY (IdTemporada) REFERENCES TEMPORADA (IdTemporada)
)
GO
	CREATE NONCLUSTERED INDEX IDX_EPISODIO_IdTemporada ON EPISODIO (IdTemporada)

	
CREATE TABLE TELEMOVEL
(
	IdUtilizadores int NOT NULL,
	Telemovel numeric (9) NOT NULL,
	CONSTRAINT PK_TELEMOVEL PRIMARY KEY CLUSTERED (Telemovel),
	CONSTRAINT FK_TELEMOVEL_IdUtilizadores FOREIGN KEY (IdUtilizadores) REFERENCES UTILIZADORES (IdUtilizadores),
)
GO
	CREATE NONCLUSTERED INDEX IDX_TELEMOVEL_IdUtilizadores ON  TELEMOVEL (IdUtilizadores)
