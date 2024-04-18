--a)Criar a tabela Produtos:

CREATE TABLE Produtos
(codProd int,
descricao varchar(20),
preco numeric(9,2),
qntd int,
cor varchar(20),
constraint pk_func primary key(codProd));

--b)Inserir 10 registros:

insert into Produtos values 
(1,'Camisa',59.90,8,'Preto'),
(2,'Meia', 4.29,10,'Azul'),
(3,'Calca', 80.00,5,'Vermelho'),
(4,'Blusa',320.00,3,'Branco'),
(5,'Touca',45.80,20,'Marrom'),
(6,'Tenis',550.00,4,'Rosa'),
(7,'Casaco',300.00,12,'Dourado'),
(8,'Avental',380.00,5,'Preto'),
(9,'Moletom',100.00,15,'Roxo'),
(10,'oculos',120.00,18,'Laranja');

--c)Quantos produtos temos no cadastro?
select count(*) as 'total de produtos' from Produtos;

--d)Selecionar os produtos com preço entre 10 e 50 reais.
select * from Produtos where preco >=10 and preco <=50;

--e)Qual o valor do produto mais caro?
select max(preco) as 'produto mais caro' from Produtos;

--f)Qual o valor do produto mais barato?
select min(preco) as 'produto mais barato' from Produtos;

--g)Qual a média de preços?
select avg(preco) as 'media de precos' from Produtos;

--h)Quantos produtos vermelhos temos no cadastro?
select * from Produtos where cor = 'vermelho';

--i)Atualizar o preço dos produtos com preço abaixo de 10.00 acrescentando 15%
update Produtos set preco = (Produtos.preco + Produtos.preco*0.15) where preco < 10;

--j)Atualizar o preço dos produtos com preço acima de 500.00 com um desconto de 5%
update Produtos set preco = (Produtos.preco - Produtos.preco*0.05) where preco > 500;

--k)Excluir todos os produtos com qtde abaixo de 5
DELETE from Produtos where qntd < 5;

--l)Listar  as cores sem duplicidade
select DISTINCT cor from Produtos;

--m)Selecionar todos os produtos de cor Azul, vermelho, branco e preto.
select * from Produtos where cor = 'Azul' or cor = 'vermelho' or cor = 'branco' or cor =  'preto';

--n)Qual o somatório das quantidades?
select sum(qntd) from Produtos;

--o)Listar todos os produtos que tem descrição iniciado em ‘A’.
select * from Produtos where descricao like 'A%';

drop table Produtos