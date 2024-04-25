  select ProductID, ProductName,UnitPrice,UnitsInStock from Products
--mostrar os produtos que são bebidas (cod categoria=1)
select * from Products where CategoryID='1'

--mostrar os fornecedores da França
select * from Suppliers where Country='France'

--mostrar os produtos com preço maior que 100
select * from Products where UnitPrice >'100'

--mostrar os pedidos do cliente de codigo HANAR
select * from Orders where CustomerID='HANAR'

--mostrar os itens do pedido numero 10260
select * from [Order Details] where OrderID='10260'

--mostrar os pedidos do funcionário Robert
select * from Employees
select * from orders where EmployeeID='7'

--mostrar os produtos com preço maior que 50 e menor que 80
select * from Products where UnitPrice >'50' and UnitPrice <'80' 

--mostrar pedidos com data do pedido maior ou igual que '01/05/2023' e menor que '31/05/2023' 
select * from Orders where OrderDate >='01/05/2023' and OrderDate <='31/05/2023 '

--MESMA COISA COM BETWEEN 
select * from Products where UnitPrice between 50 and 80  

select * from Customers where CompanyName between 'a' and 'cz' 

--mostrar todas as empresas que o nome começa com a letra 'b'
select * from Customers where CompanyName like 'b%'

--mostrar as empresas que o nome começa com a palavra 'gourmet'
select * from Customers where CompanyName like 'gourmet%'

--mostrar as empresas que o nome termina com a palavra 'gourmet'
select * from Customers where CompanyName like '%gourmet'

--mostrar as empresas que tenha a palavra 'gourmet' em qualquer parte do nome 
select * from Customers where CompanyName like '%gourmet%'

--mostrar as empresas que o nome comece com 'a' letra ou 'd'
select * from Customers where CompanyName like 'a%' or CompanyName like'd%'
select * from Customers where CompanyName like  '[ad]%' 

--mostrar as empresas que o nome comece com as letras 'A' até 'D'
select * from Customers where CompanyName like  '[a-d]%' 
 


 --
 select productname,unitprice,unitsinstock, unitprice*unitsinstock as 'subtotal'  from Products

 --products e categories
 select * from Products inner join Categories on Products.CategoryID = Categories.CategoryID

  select * from Categories  inner join products
                                        ON products.CategoryID = Categories.CategoryID
 
 --dar apelido para a tabela
 select * from Categories c inner join products p 
                                        ON p.CategoryID = c.CategoryID

-- supliers e products

 select * from Suppliers s inner join products p 
                                        ON p.SupplierID = s.SupplierID


-- orders e costumers

 select * from Orders o inner join Customers c ON o.CustomerID = c.CustomerID



-- orders e employees

 select * from Orders  inner join Employees  ON Orders.EmployeeID = Employees.EmployeeID;


 -- products e order details

  select * from [Order Details] od inner join products p 
                                        ON od.ProductID = p.ProductID
 -- orders e order details

   select * from [Order Details] od inner join Orders o 
                                        ON od.OrderID = o.OrderID
 
 --product e [order details]
 select OrderID,ProductName,od.UnitPrice,Quantity,Discount,
                    ((od.UnitPrice*Quantity) *(1-Discount)) as 'subtotal'
					from products p inner join [Order Details] od
					ON p.ProductID = od.ProductID


-- Juntando 3 tabelas 
select * from Categories c INNER JOIN Products p ON c.CategoryID = p.ProductID
INNER JOIN Suppliers s ON s.SupplierID = p.SupplierID

--employees + custumers e orders;;;;;;

select * from Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID

--products, order details, order e customers...

select * from Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID 
INNER JOIN [Order Details] od ON od.OrderID  = o.OrderID INNER JOIN Products p ON p.ProductID = od.ProductID

--**************************************
---******FUNÇÕES DE AGREGAÇÃO*************
--*************************************


----****COUNT***

--CONTA A QUANTIDADE DE REGISTROS RETORNADOS
SELECT COUNT (*) FROM Products

--CONTAR A QUANTIDADE DE PRODUTOS QUE SÃO FRUTOS DO MAR 
--Categoryid=8
select COUNT (*) from Products where CategoryID =8 

--CONTAR A QUANTIDADE DE PRODUTOS FORNECIDOS PELO FORNECEDOR DE CÓDIGO 20
select COUNT (*) from Products where SupplierID =20 

--CONTE A QUANTIDADE DE CLIENTES 
select COUNT (*) as 'quant clientes' from Customers

--CONTE A QUANTIDADE DE CLIENTES DA CIDADE DE 'LONDON'
select COUNT (*) from Customers where City='london' 

---CONTE A QUANTIDADE DE CLIENTES DOS 'USA'
select COUNT (*) from Customers where Country='usa' 


--CONTE A QUANTIDADE DE PEDIDOS DO FUNCIONARIO DE CODIGO 3
select COUNT (*) from Orders where EmployeeID=3

--CONTE A QUANTIDADE DE CLIENTES QUE O CONTACTTITLE =OWNER
select COUNT (*) from Customers where ContactTitle='owner' 

--CONTE A QUANTIDADE DE PEDIDOS DO CLIENTE DE CÓDIGO HANAR
select COUNT (*) from Orders where CustomerID='hanar'

--CONTE A QUANTIDADE DE PEDIDOS DO ANO DE 2022
select COUNT (*) from Orders where OrderDate >='01/01/2022' and OrderDate <='31/12/2022'
--ou--
select COUNT (*) from Orders where OrderDate  between '01/01/2022' and '31/12/2022'
--ou--
select COUNT (*) from Orders where year(OrderDate)=2022

-------SUM-----------
--Faz a somatória de uma coluna 
----------------------------------------
select * from Products 

--Somar todos os preços de produtos 
select SUM (unitprice) from Products 

--somar todas as quantidades de produtos do estoque unitsinstock
select SUM (unitsinstock) from Products 

--para calcular o valor do estoque é necessário somar as multiplicações do preço unitário e quantidade no estoque
--(unitprice * unitsinstock)
select SUM (unitprice*unitsinstock) from Products 

--qual é o valor que eu tenho de bebidas no meu estoque
select * from Categories
select SUM (unitprice*unitsinstock) from Products where CategoryID ='1' 

--Qual o valor eu tenho de frutos do mar no meu estoque 
select * from Categories
select SUM (unitprice*unitsinstock) from Products where CategoryID ='8'

--Qual o valor da soma de todas as vendas, ou da existencia da empresa 
select SUM (unitprice*quantity) from [Order Details]

--Qual o valor da soma da venda dos itens do pedido 10250
select SUM (unitprice*quantity) from [Order Details] where OrderID = 10250 

--Exibir o valor das vendas do mês de fevereiro de 2024

select SUM (unitprice*quantity) from [Order Details] od inner join Orders o 
                                        ON o.OrderID = od.OrderID where o.OrderDate >='01/02/2024' and OrderDate <='29/02/2024 '

--qual o valor das vendas do funcionario robert
select SUM (unitprice*quantity) from Orders as o inner join [Order Details] as od on o.OrderID=od.OrderID 
                                inner join Employees as e on o.EmployeeID = e.EmployeeID where FirstName='Robert'


---AVG
----Calcula a média aritmética

--valor médio dos preços das bebidas 
select AVG (unitprice) from products where CategoryID=1

--menor preço
select MIN (unitprice) from Products

--maior preço 
select max (unitprice) from Products

--mostra o produto com o menor preço
select * from Products where UnitPrice = 2.5

select * from Products 
       where UnitPrice = (select MIN(unitprice) from Products) 

--mostra os produtos que o preço é maior do que a média dos preços
select * from Products
         where UnitPrice <= (select AVG(unitprice) from Products) 


--Mostrar a quantidade de produtos de cada categoria 
select COUNT (*) from Products where ProductID ='1'
select COUNT (*) from Products where ProductID ='2'
select COUNT (*) from Products where ProductID ='3'
select COUNT (*) from Products where ProductID ='4'
select COUNT (*) from Products where ProductID ='5'
select COUNT (*) from Products where ProductID ='6'
select COUNT (*) from Products where ProductID ='7'
select COUNT (*) from Products where ProductID ='8'


--GROUP BY 

--No próximo exemplo fazemos o mesmo com apenas uma linha,
--mas serão exibidos valores e não saberemos a quais categorias eles pertencem

select COUNT (*) from Products group by CategoryID

--agora teremos uma legenda porem a pessoa que vai utilizar esses dados
--não são obrigados a saber de qual o código pertence a categoria 

select categoryid, count(*) from products group by categoryID

--mas para mostrar o nome da categoria temos um problema pois
--esta informação não está na tabela de produtos e sim na de Categorias 
--sendo necessario assim fazer um INNER JOIN

select Categoryname, COUNT (*) as 'quantidade' 
    from products p inner join Categories c
	        on p.CategoryID=c.CategoryID 
			group by CategoryName 

--contar a quantidade de produtos por fornecedor 
select CompanyName, COUNT (*) as 'quantidade' 
                     from products p inner join Suppliers s 
					  ON p.SupplierID=s.SupplierID 
					  group by CompanyName

--contar a quantidade de clientes por país 
select Country, COUNT (*) as 'quantidade' from Customers group by Country 

--contar a quantidade de pedidos por cliente
select CompanyName, COUNT (*) as 'quantidade'
        from Orders o inner join Customers c
		on o.CustomerID=c.CustomerID
		group by CompanyName

--contar a quantidade de pedidos por funcionarios 
select firstname, COUNT (*) as 'quantidade' 
       from Orders o inner join Employees e 
        on o.EmployeeID =e.EmployeeID 
         group by FirstName

--mostar o preço médio dos produtos por categoria 
select categoryname, AVG (unitprice) from products  p inner join Categories c
      on p.categoryid=c. CategoryID group by CategoryName 

--valor do estoque por categorias 
select categoryname, SUM (unitprice*unitsinstock) from Products p inner join Categories c 
                       on p.CategoryID=c.CategoryID group by CategoryName 


--Funçõe de String 
--retorna quantidade de caracteres 
select ASCII ('a')
select ASCII ('A')
select ASCII ('3')

--Retira espaços em branco da esquerda 
select LTRIM ('   Ivan   ')+'carlos'
--Retira espaços em branco da direita 
select RTRIM ('    Ivan   ')+'carlos'
select LTRIM ( RTRIM('   Ivan         '))+'carlos' ;

--Transforma texto em minuscula
select LOWER ('Ivan Carlos Pavão')
--Transforma texto em maíuscula 
select upper  ('Ivan Carlos Pavão')

--acrescenta espaços 
select	'Ivan'+SPACE (15)+'carlos' 

select firstname +SPACE (1)+lastname from Employees 

select firstname +' '+ lastname from Employees 

--replica o texto a quantidade de vezes indicada 
select REPLICATE ('Ivan  ',8)
select 'Pavão é lind' + REPLICATE ('o',20) 

--recorta da esquerda a quant de caracteres indicadas de um texto
select LEFT ('computador', 3)

--recorta da direita  a quant de caracteres indicadas de um texto
select RIGHT ('computador', 3)

--Recorta uma frase determinado o ponto inicial do corte e a quantidade a ser cortada de um texto
select SUBSTRING ('computador',6,4) 

select LEFT ('Isqueiro',1) + SPACE (1) +RIGHT ('bolo',2)+
SUBSTRING ('vento' ,1,2) + SPACE (1)+
SUBSTRING ('massinha' ,4,2)+ RIGHT ('david' ,1)+

--substitui um texto por outro
select REPLACE ('banana' ,'n' , 't') 
select REPLACE ('O Aurelio é feio', 'feio' , 'lindo') +REPLICATE ('o',8) 

--retorna o grau de diferença entre as palavras 
select DIFFERENCE ('abacate', 'abacate')
select DIFFERENCE ('abacate', 'abacato')
select DIFFERENCE ('abacate', 'abaca')
select DIFFERENCE ('abacate', 'abacaxi')

--Inverte o texto 
select REVERSE ('Ivan Carlos Pavão')

--FUNÇÕES DE DATA E HORA 

--Retorna a data e hora do sistema 
select GETDATE ()

select DAY (getdate())
select MONTH (getdate())
select YEAR (getdate())

/*
INTERVALOS
dd dia
mm mês 
yy ano
hh hora
mi minuto
ss segundo
ms milisegundos
ns nanosegundos 
ww numero da semana do ano
dw dia da semana 
dy dia do ano
qq trimestre 
*/ 

select DATEPART (hh,getdate()) 
select DATEPART (mi,getdate()) 
select DATEPART (ss,getdate()) 
select DATEPART (ms,getdate()) 

select DATEPART (dw,'21/05/1972') 

select DATEPART (ww,getdate()) 
select DATEPART (dw,getdate()) 
select DATEPART (qq,'29/06/2023') 
select DATEPART (dy,getdate()) 

select DATENAME (dw,'21/05/2024')
select DATENAME (MM,GETDATE ())

select * from Orders where DATEPART (qq,OrderDate)=1 and YEAR (OrderDate) = '2024' 

-- Intervalo, quantidade, data
select DATEADD (DD, 40, GETDATE ())
select DATEADD (DD, 80, GETDATE ())
select DATEADD (DD, 120, GETDATE ())
select DATEADD (mm, 9, GETDATE ())
select DATEADD (yy, 5, GETDATE ())
select DATEADD (ss, 1000000000000, GETDATE ())

--ALTERA O PADRAO DE DATA DO SISTEMA PARA DIA MES E ANO
SET DATEFORMAT DMY

--Quantos dias ja vivi.....
SELECT DATEDIFF (DD, '14/11/1990', GETDATE())
--QUANTOS SEGUNDOS
SELECT DATEDIFF (SS, '14/11/1990', GETDATE())


SELECT * FROM Orders
SELECT ORDERID, CUSTOMERID, ORDERDATE, SHIPPEDDATE, DATEDIFF (DD, ORDERDATE, SHIPPEDDATE) AS 'TEMPO DE ENVIO'
FROM Orders
--------------------------------------------------------------------------------
go
create view ClientesBrasileiros as 
            select * from customers where country='brazil' 
go

select * from ClientesBrasileiros 
---------------------------------------------------------------------------------------
go
create view AniverDoMes as 
            select * from Employees  where MONTH (birthdate)= MONTH (getdate())
go
select * from AniverDoMes 

go

CREATE PROCEDURE  PedidosCompletos (@codpedido int) as
	select * from orders where orderid = @codpedido

	select orderid,p.ProductID, ProductName, Quantity, od.UnitPrice, Discount,
	quantity*od.unitprice* (1-discount) as 'subtotal'
	from [Order Details] as od INNER JOIN Products as p 
	ON p.ProductID = od.ProductID
	where orderid = @codpedido


	select SUM (quantity*unitprice* (1-discount)) as 'total' from [Order Details]
	where orderid = @codpedido


go

exec PedidosCompletos 10248

-- fazer procedures para nota de trabalho. 

-- Crie tabela abaixo, e depois faça 4 stored procedure's
--  para Selecionar, inserir, Alterar e excluir registros

create table Professor(
      codProfessor int identity(1,1),
      nome        nvarchar(50),
      cidade      nvarchar(30),
      disciplina  nvarchar(30),     
      formacao    nvarchar(30)
)
select * from Professor

-- PROCEDURES:
-- Conjuntos de comandos SQLs que podem ser executados de uma só vez
-- Objetivo ganhar tempo e automatizar repetições
-- Mais fácil para manutenções no banco de dados


---PARA APAGAR PROCEDURE ----
if exists (select 1 from sys.objects where type = 'p' and name= 'SelecionaProf')
begin
drop procedure AtualizarProf
end
go



	--SELECIONAR PROFESSOR NOME
	GO
	CREATE PROCEDURE SelecionaProf @NomeProf nvarchar(50) AS
	SELECT * FROM Professor WHERE nome = @NomeProf
	GO
	-- COMANDO PARA EXECUTAR
	EXEC SelecionaProf 'Fretz'
	EXEC SelecionaProf 'Conceição'

--INSERIR PROFESSOR
GO
	CREATE PROCEDURE InserirProf
	@nome	nvarchar(50),
    @cidade nvarchar(30),
    @disciplina nvarchar(30),     
    @formacao nvarchar(30) AS
INSERT INTO Professor (nome,cidade,disciplina,formacao) VALUES (@nome,@cidade,@disciplina,@formacao)
SELECT * FROM Professor  Where nome = @nome 
GO
-- COMANDO PARA EXECUTAR
	EXEC InserirProf 'Fretz', 'São Paulo', 'Redes', 'Informatica'
	EXEC InserirProf 'Luciana', 'Santo André', 'Banco de Dados', 'Informatica'
	EXEC InserirProf 'Conceição', 'Mauá', 'Economia', 'Administração'
	EXEC InserirProf 'Paulo', 'Rio Grande da Serra', 'Redes', 'Matemática'
	EXEC InserirProf 'André', 'São Paulo', 'Estatística', 'Matemática'
	EXEC InserirProf 'teste', 'teste','teste', 'teste'


--DELETAR PROFESSOR
GO
CREATE PROCEDURE ApagarProf (@IdProf int) AS
DELETE FROM Professor Where codProfessor = @IdProf
GO
--EXEC
EXEC ApagarProf 10
SELECT * FROM Professor

--ALTERAR DADOS
GO
CREATE PROCEDURE AtualizarProf 
	@IdProf int,
	@nome	nvarchar(50),
    @cidade nvarchar(30),
    @disciplina nvarchar(30),     
    @formacao nvarchar(30) AS
UPDATE Professor
SET nome = @nome, cidade = @cidade, disciplina = @disciplina, formacao = @formacao
WHERE codProfessor = @IdProf
SELECT * FROM Professor WHERE codProfessor = @IdProf
GO
--Exec comando
EXEC AtualizarProf 12,'Jon', 'maua', 'Algoritimos', 'Informatica';


--********************* INCOMPLETOOOO  ****************************************************--
---CRIANDO UM PROCEDURE PARA TUDO:
GO
CREATE PROCEDURE DadosProfessor

@TipoAcao int, --1pesquisar, 2-inserir, 3-apagar, 4-alterar
@IdProf int,
@nome	nvarchar(50),
@cidade nvarchar(30),
@disciplina nvarchar(30),     
@formacao nvarchar(30) 

AS

BEGIN -- INICIO PROCEDURE:
IF (@TipoAcao = 1 ) -- SE A AÇÃO FOR CONSULTAR
	BEGIN
	SELECT * FROM Professor WHERE nome = @nome
	END

ELSE IF (@TipoAcao = 2 ) -- SE A AÇÃO FOR INSERIR
	BEGIN --inicio condicao de inserir

	IF EXISTS(SELECT * FROM Professor Where disciplina = @disciplina AND nome=@nome) 
	SELECT 'PROFESSOR JA CADASTRADO' AS ATENCAO
	ELSE
	INSERT INTO Professor (nome,cidade,disciplina,formacao) VALUES (@nome,@cidade,@disciplina,@formacao)
	SELECT * FROM Professor where @nome = nome;
	
	END -- fim condicao
ELSE IF (@TipoAcao = 3 ) -- SE A AÇÃO FOR APAGAR

	BEGIN

	IF EXISTS(SELECT * FROM Professor Where codProfessor = @IdProf)
	DELETE FROM Professor Where codProfessor = @IdProf
	ELSE
	SELECT 'CADASTRO NAO ENCONTRADO' AS ATENCAO

	END

ELSE IF (@TipoAcao = 4 ) -- SE A AÇÃO FOR ALTERAR

	BEGIN

	IF EXISTS(SELECT * FROM Professor Where codProfessor = @IdProf)
	UPDATE Professor 
	SET nome = @nome, cidade = @cidade, disciplina = @disciplina, formacao = @formacao
	WHERE codProfessor = @IdProf

	ELSE
	SELECT 'CADASTRO NAO ENCONTRADO' AS ATENCAO

	END

END -- FIM PROCEDURE
GO

--Exec dos comandos:


--********************* INCOMPLETOOOO  ****************************************************--
