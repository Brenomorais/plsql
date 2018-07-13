-- Atulizando os dados na tabela compras:

-- ex : UPDATE COMPRAS SET OBSERVACOES = 'compra emergencial';
--      UPDATE COMPRAS SET OBSERVACOES = 'uma compra comum' WHERE DATA NOT BETWEEN '05-JAN-2010' AND '25-JUN-2010';
--      UPDATE COMPRAS SET OBSERVACOES = 'datas festivas' WHERE DATA = '25-DEC-2010' OR DATA = '12-OCT-2010' OR DATA = '12-JUN-2010';

-- Deletando dados na tabela compras

-- ex:  DELETE FROM COMPRAS WHERE DATA < '01-JAN-2009';

-- Altere as compras, colocando a observação 'compras do dia dos namorados' para todas as que foram efetuadas no dia 12/06/2010.

update compras set observacoes = 'Compras do dia dos namorados' where data = '12/06/2010';

-- Altere o VALOR das compras feitas antes de 01/06/2009. Some R$10,00 ao valor atual.

update compras set valor = valor + 10  where data < '01/06/2009';

-- Atualize todas as compras feitas entre 01/07/2009 e 01/07/2010 para que elas tenham a observação 'entregue antes de 2011' 
-- e a coluna recebido com o valor '1' (TRUE).

update compras  set observacoes = 'entregue antes de 2011', recebido = '1' where data between '01/07/2009' and '01/07/2010';

-- Exclua as compras realizadas entre 05 e 20 março de 2009. Coloque abaixo o comando executado.

delete from compras where data between '05/03/2009' and '05/03/2009';

-- Use o operador NOT e monte um SELECT que retorna todas as compras com valor diferente de R$ 108,00

select * from compras where not valor = 108.0;
        

