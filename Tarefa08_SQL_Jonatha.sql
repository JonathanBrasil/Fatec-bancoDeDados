-- a) Criar as tabelas x Relacionamentos:

CREATE TABLE Clientes
(Codcli int,
Nome varchar(30),
Endereco varchar(20),
Cidade varchar(20),
Fone char(9),
idade int,
constraint pk_codcli primary key (Codcli));

CREATE TABLE Transportadora
(Codigo int,
Nome varchar(20),
constraint pk_codigo primary key(codigo));


CREATE TABLE Pedidos 
(NumPed int,
Cliente int,
Data_Entrega datetime,
Transport int,
constraint pk_NumPed primary key (NumPed),
constraint fk_Cliente foreign Key(Cliente) references Clientes (Codcli),
constraint fk_Transport foreign Key(Transport) references Transportadora (Codigo));

--b) Inserir 5 registros em cada tabela. 

INSERT INTO CLIENTES VALUES
(10, 'João Silva', 'Rua Ipê', 'MAUÁ', '9981719', '60'),
(20, 'Maria Alves', 'Av.Brasil', 'SBC', '987655521', '61'),
(30, 'Luiz Almeida', 'Av.Capitão João', 'MAUÁ', '98856789', '62'),
(40, 'Lourdes Maria', 'Rua Oliveira Lima', 'SANTO ANDRÉ', '32244448','63'),
(50, 'Neide Lima', 'Rua Silva', 'MAUÁ', '400289220', '64');
SELECT * FROM CLIENTES;

INSERT INTO TRANSPORTADORA VALUES
(1, 'Log'),
(2, 'ABC'),
(3, 'DEF'),
(4, 'TRANSMAUA'),
(5, 'LEVA E TRAZ');
SELECT * FROM TRANSPORTADORA;

INSERT INTO PEDIDOS VALUES
(01, 50, '20241001', 1),
(02, 40, '20241002', 5),
(03, 30, '20241003', 3),
(04, 20, '20241004', 2),
(05, 10, '20241005', 4);
SELECT * FROM PEDIDOS;



-- C) Selecionar todos os pedidos da transportadora ABC. 
SELECT * FROM Pedidos P inner join Transportadora T 
ON p.Transport = t.Codigo where t.Nome = 'ABC';

-- d) Quantos pedidos existem para o cliente 2? 
SELECT COUNT (NumPed) as 'Qntd pedidos cliente 2'
FROM Pedidos where Cliente = 20; 

-- e) Qual o número do Pedido mais recente? 
SELECT * FROM Pedidos WHERE Data_Entrega = (SELECT MAX (Data_Entrega) AS 'MAIOR DATA_COMPRA' FROM Pedidos);

-- F) Temos quantos pedidos para a Transportadora ABC? 
SELECT COUNT (NumPed) AS 'QTD Pedidos Trans.ABC'
FROM Pedidos p inner Join Transportadora t 
on p.Transport = t.Codigo where t.Nome = 'ABC';

-- g) Quantos Clientes residem em Mauá? 
Select COUNT (Codcli) from Clientes where Cidade = 'Mauá';

-- h) Selecionar Número do Pedido, Data_Entrega e Nome do Cliente. 
SELECT NumPed, Data_Entrega, Nome from Pedidos p inner join Clientes c
on p.Cliente = c.Codcli;

-- i) Selecionar Número do Pedido, Nome do Cliente e nome da Transportadora. 
SELECT NumPed, c.Nome as 'nome cliente', t.Nome as 'nome transp' FROM Pedidos p inner join Clientes c on p.Cliente = c.Codcli 
inner join Transportadora t on p.Transport = t.Codigo 

-- J) Selecionar todos os clientes da cidade de Santo André, Mauá e SBC
SELECT * FROM Clientes WHERE Cidade IN ('Santo André','Mauá', 'SBC');

-- K) Selecionar as cidades que possuem clientes, sem duplicidade;
SELECT DISTINCT(Cidade) from Clientes;

--L) Qual a média de idade dos clientes?
SELECT AVG (idade) From Clientes;

--M) ) Selecionar todos os clientes (todos os atributos) 
--que possuem idade abaixo da média
Select * from Clientes where idade < (select avg (idade) from Clientes);

-- N) Quantos clientes possuem idade acima da média?SELECT Count (CodCli) from Clientes where idade > (select avg(idade)from clientes)