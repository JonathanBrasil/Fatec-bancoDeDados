--a) Criar a tabela EMPREGADOS:

CREATE TABLE EMPREGADOS

(MATR CHAR(6), 
NOME VARCHAR(12), 
SOBRENOME VARCHAR(15) ,
DEPT CHAR(10) ,
FONE VARCHAR(14) ,
DATA_ADM DATETIME ,
CARGO CHAR(10) ,
SEXO CHAR(1) ,
IDADE INT ,
SALARIO NUMERIC(10,2) ,
COMISSAO NUMERIC(10,2),
constraint pk_emp primary key(matr));

select * from EMPREGADOS;

insert into EMPREGADOS values
(1, 'Vando', 'Silva', 'RH',40028922, '20180101','gestor', 'M',45, 3200.00, 500),
(2, 'Milena', 'Rosa', 'RH',98098055, '20220506','Auxiliar', 'F',29, 2800.00, 300),
(3, 'Rodrigo', 'Polazi', 'TI',3604526, '20180101','Supervisor', 'M',42, 5500.00, 500),
(4, 'Jonatha', 'Brasil', 'TI',9952645544, '20231201','Estagiario', 'M',27, 1500.00, 150),
(5, 'Leticia', 'Silva', 'TI',983636458, '20231201','Estagiario', 'F',16, 1200.00, 100),
(6, 'Valdecir', 'Silva', 'Compras',99099056, '20180101','gestor', 'M',58, 3000.00, 300),
(7, 'Rodrigo', 'Coelho', 'Compras',98798754, '20230620','auxiliar', 'M',45, 3200.00, 100),
(8, 'Camila', 'Carvalho', 'Secretaria',99988833, '20190301','gestor', 'F',33, 3000.00, 500),
(9, 'Eduardo', 'Rodrigues', 'Secretaria',987958585, '20230620','auxiliar', 'M',35, 2500.00, 200),
(10, 'Fernanda', 'Alencar', 'Limpeza',96396352, '20220101','LIDER', 'F',40, 2200.00, 250);

--c) Selecionar o sobrenome, primeiro nome, departamento, data de admissão e 
SELECT SOBRENOME, NOME, DEPT, DATA_ADM, SALARIO FROM EMPREGADOS WHERE SALARIO >5000

--d) Qual a média de salários dos funcionários?
SELECT AVG(SALARIO) AS 'MEDIA SALARIO' FROM EMPREGADOS; 

--e) Quantos funcionários pertencem ao departamento de TI?
SELECT COUNT (*) AS 'QNTD FUNCIONARIOS TI' 
FROM EMPREGADOS WHERE DEPT = 'TI';

--f) Quantos funcionários temos com cargo igual a PROGRAMADOR?
SELECT COUNT (*) AS 'QNTD PROGRAMADORES' 
FROM EMPREGADOS WHERE CARGO = 'PROGRAMADOR';

--g) Qual o somatório dos salários?
SELECT SUM(SALARIO) AS 'SOMA SALARIOS' FROM EMPREGADOS;

--h) Qual o valor do maior salário?
SELECT MAX(SALARIO) AS 'MAIOR SALARIO' FROM EMPREGADOS;

--i) Qual o valor do menor salário?
SELECT MIN(SALARIO) AS 'MENOR SALARIO' FROM EMPREGADOS;

--j) Atribuir um aumento de 5% aos funcionários do departamento de TI.
UPDATE EMPREGADOS SET SALARIO = SALARIO*1.05 
WHERE DEPT = 'TI'; 

--k) Selecionar os cargos (sem duplicidade).
SELECT DISTINCT CARGO FROM EMPREGADOS;

--l) Selecionar os funcionários com idade entre 30 e 40 anos (inclusive).
SELECT * FROM EMPREGADOS WHERE IDADE BETWEEN 30 AND 40;

--m) Qual a média de idades?
SELECT AVG(IDADE) AS 'MEDIA IDADES' FROM EMPREGADOS

--n) Selecionar todos os funcionários com idade entre 20 e 30 anos (inclusive) do departamento de TI.
SELECT * FROM EMPREGADOS WHERE IDADE BETWEEN 20 AND 30;

--o) Selecionar todos os funcionários cujo nome inicia-se pela letra ‘J’.
SELECT * FROM EMPREGADOS WHERE NOME LIKE 'j%'

--p) Selecionar todos os funcionários dos departamentos de TI, Vendas e Marketing.
--VOU ADAPTAR PARA TI COMPRAS E RH *** 
SELECT * FROM EMPREGADOS WHERE DEPT IN ('TI', 'RH', 'COMPRAS'); 


--fim :) 