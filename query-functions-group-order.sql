-- Utilizando a fun��o 'sum' que permite somar valores no banco de dados
-- por exemplo podemos obertor o valor total de todas compras, somando o valor de todos os registor
select sum(valor) from compras;

-- Podemos utilizar o where para filtrar a nossa soma, passando por exemplo um data ou todas as recebidas
select sum(valor) from compras where recebido = 1;
select sum(valor) from compras where data < '01-01-2010';
select sum(valor) from compras where data between '01-01-2010' and '31-01-2010' and recebido = '0';

-- Calculando a m�dia de valores, com o 'avg'
select avg(valor) from compras where data < '01-jan-2010';
select avg(valor) from compras where data < '01-01-2011';

-- Juntando a soma com a media
SELECT AVG(VALOR) AS MEDIA, SUM(VALOR) AS SOMA FROM COMPRAS WHERE DATA < '01-JAN-2010';

-- Podemos contar valores atrav�s da funciont 'count'
SELECT COUNT(VALOR) as Total_Contas_Recebidas from COMPRAS WHERE recebido = 1;
SELECT COUNT(VALOR) as Total_Contas_A_Recerber From COMPRAS WHERE recebido = 0;

SELECT COUNT(VALOR) as Total_Contas_Recebidas, sum(valor) as Recebidas from COMPRAS WHERE recebido = 1;
SELECT COUNT(VALOR) as Total_Contas_A_Recerber, sum(valor) as N�o_recebidas From COMPRAS WHERE recebido = 0;

-- Agrupando registro de acordo com um valor espec�fico
select sum(valor) as Total_Compras_Agrupas from compras group by recebido;

SELECT RECEBIDO, SUM(VALOR) AS SOMA, COUNT(VALOR) AS TOTAL FROM COMPRAS GROUP BY RECEBIDO;

-- Ordernando valores com o camando order by permite orderm 'asc' e 'dec'

-- orderna��o por orderm de valores da soma decrescente
SELECT RECEBIDO, SUM(VALOR) AS SOMA, COUNT(VALOR) AS TOTAL FROM COMPRAS GROUP BY RECEBIDO ORDER BY SOMA DESC;

-- orderna��o por orderm de valores da soma ascendente
SELECT RECEBIDO, SUM(VALOR) AS SOMA, COUNT(VALOR) AS TOTAL FROM COMPRAS GROUP BY RECEBIDO ORDER BY SOMA ASC;






