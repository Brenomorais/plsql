--Tabela compras est� com campos, que permite inserir valores valores, no insert abaixo, vamos inserir 
-- um registro contendo a observacoes 'nula', se de acordo com a especifica��o do banco toda compra precisa
-- de uma observa��o, o novo registro quebra a integrigada da compra, pois nao tem observa��o, vamos estudar como
-- alterar um campo para restringir que seja inserido nulo.

INSERT INTO COMPRAS (ID, VALOR, DATA, OBSERVACOES, RECEBIDO) VALUES (ID_SEQ.NEXTVAL, 100.0, '02-JUL-2010', NULL, '1');

-- Alterando, a estrutura da tabela, especificamente o campo observacoes, para nao permitir inser��o de valores nulos

--comando lista estrutura da tabela
describe compras;
desc compras;

ALTER TABLE COMPRAS MODIFY (OBSERVACOES VARCHAR2(35) NOT NULL);

-- Por conter valores null, que inserimos acima n�o foi possivel fazer a altera��o do campo, primeiro temos que
-- alterar os valores que s�o null para n�o null.

select * from compras where OBSERVACOES is null;
update compras set OBSERVACOES = 'Compras carnaval' where id = 101;
select * from compras where id = 101;

-- Agora podemos alterar a estrutura para n�o permitir null
ALTER TABLE COMPRAS MODIFY (OBSERVACOES VARCHAR2(35) NOT NULL);

--Executando um insert com valor null, o oracle deve, reportar erro, tentemos fazer isso abaixo:
INSERT INTO COMPRAS (ID, VALOR, DATA, OBSERVACOES, RECEBIDO) VALUES (ID_SEQ.NEXTVAL, 100.0, '02-JUL-2010', NULL, '1');
-- Relat�rio de erros : ORA-01400: n�o � poss�vel inserir NULL em ("SYS"."COMPRAS"."OBSERVACOES")

-- Realizando um insert para testar a altera��o do campo defautl: como n�o foi passado um valor para o campo 'recebido
-- o banco usou o valor default que especificamos por default ou seja o valor '0'.
INSERT INTO COMPRAS (ID, VALOR, DATA, OBSERVACOES) VALUES (ID_SEQ.NEXTVAL, 189.76, '19-01-2009', 'UMA COMPRA QUALQUER');
INSERT INTO COMPRAS (ID, VALOR, DATA, OBSERVACOES) VALUES (ID_SEQ.NEXTVAL, 189.76, '09-JAN-2008', 'UMA COMPRA QUALQUER');

--Adicionando nova coluna na tabela, campo para salvar a forma de pagamento da compra, campo deve aceitar somente, 
--formas de pagamento como: cart�o de cr�dito, boleto banc�rio e dinheiro, 'cartao', 'boleto', 'dinheiro';

ALTER TABLE COMPRAS ADD (FORMA_PAGT VARCHAR2(15) CHECK (FORMA_PAGT IN ('CARTAO', 'BOLETO', 'DINHEIRO')));

--Insert com o novo campo sendo utilizado 
INSERT INTO COMPRAS (ID, VALOR, DATA, OBSERVACOES, FORMA_PAGT)
VALUES (ID_SEQ.NEXTVAL, 189.76, '09-JAN-2010', 'UMA OUTRA COMPRA QUALQUER', 'CARTAO');

--Tentativa de insert, passando valor na forma de pagamento que n�o seja o que foi definido, o oracle envia uma mensagem de erro
INSERT INTO COMPRAS (ID, VALOR, DATA, OBSERVACOES, FORMA_PAGT)
VALUES (ID_SEQ.NEXTVAL, 189.76, '09-JAN-2010', 'UMA OUTRA COMPRA QUALQUER', 'CHEQIE');

--Renomeando nome da columa 'forma_pag' para um nome mais legivel seguindo voas tecnicas de modelagem
ALTER TABLE COMPRAS RENAME COLUMN FORMA_PAGT TO FORMA_PAGTO;









