-- Exiba o NOME do comprador e o VALOR de todas as compras feitas antes de 09/07/2010.

select compradores.nome, compras.valor from compras 
inner join compradores on compras.comprador_id = compradores.id where compras.data  < '09/07/2010';

SELECT NOME, VALOR FROM COMPRAS JOIN COMPRADORES ON COMPRAS.COMPRADOR_ID = COMPRADORES.ID 
WHERE DATA < '09-JUL-2010';

-- Exiba todas as compras do comprador que possui ID igual a 1

--traz somente a compra com id = 1
select * from compras where comprador_id = 1;

--Traz os dados do comprador
SELECT * FROM COMPRAS JOIN COMPRADORES ON COMPRAS.COMPRADOR_ID = COMPRADORES.ID WHERE COMPRADOR_ID = 1;

--Retorma apenas dados da tabela compras 
SELECT COMPRAS.* FROM COMPRAS JOIN COMPRADORES ON COMPRAS.COMPRADOR_ID = COMPRADORES.ID WHERE NOME LIKE 'FLAVIO%';

--Exiba o nome do comprador e a soma de todas as suas compras.
SELECT NOME, SUM(VALOR) AS SOMA FROM COMPRAS 
inner join COMPRADORES ON COMPRAS.COMPRADOR_ID = COMPRADORES.ID GROUP BY NOME;

-- Foreing key que seja atribuidos valores inexistente para a FK


