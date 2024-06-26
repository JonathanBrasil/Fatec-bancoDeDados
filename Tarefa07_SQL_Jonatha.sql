-- a) Criar as seguintes tabelas:

CREATE TABLE GRAVADORA
(CodGrav int,
Nome_Grav varchar(20)
constraint pk_idgravadora primary key (CodGrav));


CREATE TABLE CDS 
(Codigo int,
Nome Varchar(30),
Gravadora int,
Data_Compra datetime,
Valor_Pago Numeric(10,2),
Local_Compra Varchar(20),
Album int,
constraint pk_idcd primary key (Codigo),
constraint fk_grav foreign Key(Gravadora) references GRAVADORA (CodGrav));

--b) Inserir 10 registros na tabela CDS e 
--5 registros na tabela GRAVADORA.

Insert into GRAVADORA values
(1, 'Columbia Records'),
(2, 'Universal Music'),
(3, 'Sony Music'),
(4, 'Warner Music'),
(5, 'Roc Nation');

select * from CDS

Insert into CDS values
(10,'Cowboy Carter', 1 , '20240329', 59.90 , 'Americanas', 1),
(15, 'Nevermind', 2 , '20240411', 39.90,'Amazon',1),
(13, 'Matriz', 3 , '20231113', 29.85,'Saraiva',1),
(40, 'Anacronico', 3 , '20231225', 45.50,'Submarino',1),
(20, 'Renaissance', 1 , '20231113', 55.99,'Submarino',1),
(26, 'Lemonade', 1 , '20231113', 49.85,'Americanas',1),
(70, 'COR', 4 , '20240213', 19.85,'Americanas',1),
(88, 'Goela Abaixo', 2 , '20240120', 18.00,'Saraiva',1),
(39, 'Batidao Tropical', 3 , '20240409', 30.00,'Americanas',1),
(40, 'Bluesman', 5 , '20240123', 16.70,'Americanas',1);

-- C) SELECIONAR TODOS OS CDS
SELECT * FROM CDS

-- D) SELECIONAR OS CAMPOS NOME E DATA_COMPRA DA TABELA CDS
SELECT NOME, DATA_COMPRA FROM CDS;

-- E) EXIBIR O TOTAL GASTO COM A COMPRA DOS CDS
SELECT SUM (VALOR_PAGO) AS 'SOMA VALOR_PAGO' FROM CDS;

-- F) MOSTRE A QUANTIDADE DE CDS
SELECT COUNT (NOME) AS 'QTD.NOME' FROM CDS;

-- G) MOSTRE O NOME DE TODOS OS CDS COMPRADOS NO SUBMARINO 
SELECT NOME FROM CDS WHERE LOCAL_COMPRA = 'SUBMARINO';

-- H) MOSTRAR TODOS OS CDS QUE S�O �LBUNS
SELECT NOME FROM CDS WHERE ALBUM = 1;

-- I) MOSTRE O VALOR DO CD QUE CUSTOU MAIS CARO
SELECT MAX (VALOR_PAGO) AS 'MAIOR VALOR_PAGO' FROM CDS;

-- J) MOSTRAR TODOS OS CDS QUE TEM NOME INICIADO PELA LETRA R.
SELECT * FROM CDS WHERE NOME LIKE 'R%';

-- K) MOSTRAR A M�DIA DO PRE�O DOS CDS;
SELECT AVG(VALOR_PAGO) AS 'M�DIA VALOR_PAGO' FROM CDS;

--L) QUANTOS CDS FORAM COMPRADOS NA AMERICANAS
SELECT COUNT (CODIGO) AS 'COMPREI NA AMERICANAS' FROM CDS WHERE LOCAL_COMPRA = 'AMERICANAS';

--M) ATUALIZAR O PRE�O DOS CDS REAJUSTANDO 10%
UPDATE CDS SET VALOR_PAGO = (VALOR_PAGO * 1.1);

-- N) MOSTRAR TODOS OS CDS COMPRADOS NO SUBMARINO, AMERICANAS E SARAIVA 
SELECT * FROM CDS WHERE LOCAL_COMPRA IN ('SUBMARINO','AMERICANAS', 'SARAIVA');

-- O) MOSTRAR TODOS OS CDS COM O C�DIGO ENTRE 20 E 30 INCLUSIVE;
SELECT * FROM CDS WHERE CODIGO>=20 AND CODIGO<=30;

--P)MOSTRAR TODOS OS CDS CUJO VALOR PAGO SEJA MAIOR QUE 25,00.
SELECT * FROM CDS WHERE VALOR_PAGO>25.00;

-- Q) MOSTRAR O PRE�O DO CD MAIS BARATO;
SELECT MIN (VALOR_PAGO) AS 'MENOR VALOR_PAGO' FROM CDS;

-- R) MOSTRAR TODOS OS LOCAIS DE COMPRA SEM DUPLICIDADE
SELECT DISTINCT LOCAL_COMPRA FROM CDS;

-- S) QUANTOS CDS EST�O COM PRE�O ACIMA DA M�DIA:
SELECT COUNT (CODIGO) AS 'qntd CDS com pre�o acima da m�dia' FROM CDS WHERE VALOR_PAGO > (SELECT AVG(VALOR_PAGO) FROM CDS);

-- T) SELECIONAR OS CDS COM DATA DE COMPRA MAIS RECENTE
SELECT * FROM CDS WHERE DATA_COMPRA = (SELECT MAX (DATA_COMPRA) AS 'MAIOR DATA_COMPRA' FROM CDS);

-- U) SELECIONAR TODOS COM PRE�O (VALOR_PAGO) ABAIXO DA M�DIA
SELECT * FROM CDS WHERE VALOR_PAGO < (SELECT AVG(VALOR_PAGO) FROM CDS);

