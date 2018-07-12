--Ao criar o campo 'forma_pagto' todos os valores da coluna ficaram todso como null.
--Precisamos alterar isso,vamos colocar uma forma de pagamento para esses registro

select * from compras;

--udapte no campo form_pagto, alterando de null para dinheiro
update compras set forma_pagto = 'DINHEIRO';
update compras set forma_pagto = 'DINHEIRO' where forma_pagto is null;

--Adicionar valor default para o campo 'recebido', o valor default deve ser '0';
DESC COMPRAS;
--Especificando um valor default para um campo específico da tabela.
ALTER TABLE COMPRAS MODIFY (RECEBIDO CHAR DEFAULT '0' CHECK (RECEBIDO IN (0,1)));

--As constrains adicionadas atraves do alter table também podem ser utilizadas, durante a criacao
--do script de criacao da tabela

desc compras;

CREATE TABLE COMPRAS (
    ID NUMBER PRIMARY KEY,
    VALOR NUMBER,
    DATA DATE,
    OBSERVACOES VARCHAR2(30) NOT NULL,
    RECEBIDO CHAR DEFAULT '0' CHECK (RECEBIDO IN ('0','1')),
    FORMA_PAGTO VARCHAR2(15) CHECK (FORMA_PAGTO IN ('DINHEIRO', 'CARTAO', 'BOLETO'))
);


-- Tabela nova funcionarios;
CREATE TABLE FUNCIONARIOS (
    NOME VARCHAR2(100) NOT NULL,
    CARGO VARCHAR2(15) CHECK (CARGO IN ('DIRETOR', 'FUNCIONARIO')) NOT NULL,
    SALARIO NUMBER DEFAULT 10000
);

select * from funcionarios;
desc funcionarios;



