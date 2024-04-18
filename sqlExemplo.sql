-- *** TABELA FUNCIONARIOS ***--

-- MATR: INT--
-- NOME: VARCHAR(40)--
-- IDADE: INT--
-- DATA__ADM: DATETIME--
-- SALARIO:NUMERIC(10,2)--
-- CIDADE: VARCHAR(40)--

CREATE TABLE funcionarios
(matr int,
nome varchar(40),
idade int,
data_adm DATETIME,
salario numeric(10,2),
cidade varchar(40),
constraint pk_funcionario primary key(matr));

--constraint serve para garantir integridade dos dados atraves de restrição.
--a chave primaria nao vai deixar a gente repetir matricula. 

SELECT * FROM funcionarios;

-- inserir dados na tabela preenchendo todas as colunas
insert into funcionarios values 
(1, 'pedro bó', 30, '20231120', 2650.00, 'Mauá'),
(2, 'marta', 35, '20220130', 1500.00, 'São Caetano Sul');

--Inserir matricula e nome de um funcionario(especificar):
INSERT INTO funcionarios (matr,nome) values (3, 'Eduardo');

--Selecionar especificos
select matr,nome from funcionarios;

--Diversos tipos de funções agregadoras
select count(*) as 'qtd func' from funcionarios; 

select max(idade) as 'mais velho' from funcionarios; 

select min(idade) as 'mais novo' from funcionarios; 

--soma tudo
select sum(salario) as 'total salario' from funcionarios; 

--media aritmetica 
select avg(salario) as 'media sal' from funcionarios; 

insert into funcionarios values 
(4, 'Eduardo', 30, '20220318', 2650.00, 'SBC'),
(5, 'Eliana', 30, '20221115', 2750.00, 'Maua');

--SELECIONAR TODOS QUE TEM O NOME INCIADO EM 'E'
select * from funcionarios where nome like 'e%';

--SELECIONAR TODOS QUE TEM O NOME ENCERRADO EM 'A'
select * from funcionarios where nome like '%A';

--SELECIONA A COLUNA MAS SEM DUPLICIDADES..
select distinct cidade from funcionarios;

--SELECIONAR SALARIOS RANGE 2000 A 2900
SELECT * FROM funcionarios WHERE salario >=2000 AND salario <=2900;
--MESMO RESULTADO
SELECT * FROM funcionarios WHERE salario BETWEEN 2000 AND 2900;

--selecionar todos que moram em uma ou outra cidade
-- 'in' substui o 'or' para textos e between para numeros
select * from funcionarios where cidade in ('Mauá','Maua', 'sbc');

--atualizar cadastro
update funcionarios set idade=35 where nome='eduardo';

--ajustar salario com 5% de aumento 
update funcionarios set salario=salario*1.05;

--order by, para ordenar
select * from funcionarios order by nome asc;
--decrescente
select * from funcionarios order by nome desc;

delete from funcionarios where nome = 'marta';

--Excluir tabela e dados
drop table funcionarios 