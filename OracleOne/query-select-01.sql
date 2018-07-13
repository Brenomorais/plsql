-- Selecione VALOR e OBSERVAÇÕES de todas as compras cuja data seja maior ou igual que 15/11/2008.

select valor, observacoes from compras where data >= '15/11/08';

select VALOR, OBSERVACOES FROM COMPRAS WHERE DATA >= '15-NOV-2008';

-- Selecione todas as compras cuja data seja maior ou igual que 15/11/2008 e menor do que 15/11/2010. 

SELECT * FROM COMPRAS WHERE DATA >= '15-11-2008' AND DATA < '15-11-2010';


-- Selecione todas as compras cujo valor esteja entre R$15,00 e R$35,00 e a observação comece com a palavra 'LANCHONETE'. 

select * from compras where valor between 15.0 and 35.0 and observacoes like 'LANCHONETE%';

SELECT * FROM COMPRAS WHERE VALOR >= 15.0 AND VALOR <= 35.0 AND OBSERVACOES LIKE 'LANCHONETE%';

-- Selecione todas as compras que já foram recebidas.

select * from compras where recebido = '1';

-- Selecione todas as compras que ainda não foram recebidas. 

select * from compras where recebido = '0';

-- Encontre o erro no insert abaixo:
INSERT INTO COMPRAS (ID, VALOR, DATA, OBSERVACOES, RECEBIDO) VALUES (ID_SEQ.NEXTVAL, 100.0, '08-JAN-2010', 'COMIDA', TRUE);

-- O oracle nao aceita valores booleanos, para o value 'recebido' está sendo atribuido o valor 'true',isso está errado,
-- pois definição da estrutura da tabela foi definido que deve-se aceitar apenas '0' ou '1'.
-- Para o insert acima, funcionar teriamos que mudar a estrutura da tabela para passar aceitar 'true' e 'false', mas 
-- mesmo assim não seria o bool verdadeiro e sim um string recebendo esses valores. Com a alteração abaixo o insert
-- seria executado sem problemas.

RECEBIDO VARCHAR2(10) CHECK (RECEBIDO IN ('TRUE', 'FALSE'))

-- Selecione todas as compras com valor maior que 5.000,00 ou que já foram recebidas:

select * from compras where valor >  5000 or recebido = 1;

-- Selecione todas as compras que o valor esteja entre 1.000,00 e 3.000,00 ou maior que 5.000,00

select * from compras where valor >= 1000 and valor <= 3000 or valor > 5000;

SELECT * FROM COMPRAS WHERE (VALOR > 1000 AND VALOR < 3000) OR (VALOR > 5000);





