--De acordo com a especificação do projeto do banco de dados estudado, todas compras precisam ter um comprador, no nosso caso,
--até o momento só temos as compras mas não temos os devidos compradores. Vamos criar uma 'entidade' tabela para armazenar,
--os compradores para ser, vinculada com as comprars 

--script criar tabela compradores
create table compradores(
    id number primary key,
    nome varchar2(30) not null,
    endereco varchar(30) not null,
    telefone varchar(20) not null
);

--cria sequence
create sequence id_compradores_seq;

-- Inserindo regisgro na tabela compradores
INSERT INTO COMPRADORES (ID, NOME, ENDERECO, TELEFONE) VALUES (ID_COMPRADORES_SEQ.NEXTVAL, 'FLAVIO', 'RUA DO OUVIDOR, 123', '(21) 1111-1111');
INSERT INTO COMPRADORES (ID, NOME, ENDERECO, TELEFONE) VALUES (ID_COMPRADORES_SEQ.NEXTVAL, 'NICO', 'AV. PRESIDENTE VARGAS, 123', '(21) 2222-2222');

-- Toda compra precisa ter um comprador, vamos precisar fazer um vinculo entre compradores e compras, para identificar uma compra
-- temos o 'id' para identificar um comprador também temos o 'id'. Nesse negocio existe uma relação, já apresenta cada compra
-- precisa ter um comprador e também um comprador pode ter muitas compras. Em banco de dados essa relação é chamada de relacionamento
--  de "um para muitos" (one-to-many).Um comprador pode ter varias compras mas uma compra pode ter apenas um comprador envolvido.

-- Adicionaremos, na tabela compras uma referencia a tabela de compradores, adicionando um campo novo que faz referencia ao ID
-- do comprador.

ALTER TABLE COMPRAS ADD (COMPRADOR_ID NUMBER);

--todoas compras com ID menor que 8 irão fazer referencia ao Id do comprador 1
UPDATE COMPRAS SET COMPRADOR_ID = 1 WHERE ID < 8;

--todoas compras com ID maior igual que 8 irão fazer referencia ao Id do comprador 2
UPDATE COMPRAS SET COMPRADOR_ID = 2 WHERE ID >= 8;

-- Adicionando constrainsts para não permitir salvar compras que não tenha o comprador identificado
ALTER TABLE COMPRAS MODIFY (COMPRADOR_ID NUMBER NOT NULL);

-- Query para exibir mais de uma tabela.
select * from compras, compradores;

-- juntando duas tabelas diferentes, utilizando 'join' ou 'inner join'
select * from compras join compradores on compras.comprador_id = compradores.id;
SELECT * FROM COMPRAS INNER JOIN COMPRADORES ON COMPRAS.COMPRADOR_ID = COMPRADORES.ID;

--Com as alterações feitas agora temos uma referencia do comprador, na tabela compras, com isso podemos fazer consultar mais
-- elaborados como os comandos vistos até agora, obtendo informações mais precisas. Mesmo com essa alteração, podemos melhorar
-- isso e deixar mais seguro e mais integro nossos dados. Vejamos abaixo o insert:

insert into COMPRAS (id, valor, data, observacoes, recebido,forma_pagto,comprador_id) 
values (id_seq.nextval, 200, '19-01-2005', 'TESTE COMPRA', '1','DINHEIRO',10);

select * from compras where comprador_id = 10;

-- Com o insert, salvamos um compra sem problemas, mas existe um erro nesse registro, que pode tirar a integridade do dados,
-- isso porque adicionados um 'id' de comprador que não existe na tabela de compradores. Garatimos que toda compra precisa ter um
-- comprador, quando passamos o campo para not null, mas não validamos se o id realmente é de um comprador. 

-- Em banco de dados existe o conceito de 'chave estrangeira' (foreign key), esse conceito existe não existe somente no Oracle
-- mas tem todos os bancos de dados relacionais. A foreign key é uma referencia a outra tabela como foi feito com a tabela de
-- comprador\compras, mas com caracteristicas e recuros de segurança que verifica se o 'id' da chave estrangeira é realmente
-- verdadeiro, para que não seja informado um número qualquer. De modus operanti a primary key que é popularmente chamada de 
-- 'PK' a Foreing key é conhecida como FK

--alteração para adicionar chave estrangeira
ALTER TABLE compras ADD FOREIGN KEY (comprador_id) REFERENCES compradores(ID);

-- Insert com Id de comprador que não existe, o Oracle devolve um mensagem de erro, dizendo que, restrição de integridade
-- violada chave mãe não localizada.
insert into COMPRAS (id, valor, data, observacoes, recebido,forma_pagto,comprador_id) 
values (id_seq.nextval, 200, '19-01-2005', 'TESTE COMPRA', '1','DINHEIRO',3);

-- Insert com Id de comprador válido, e realizado com sucesso;
insert into COMPRAS (id, valor, data, observacoes, recebido,forma_pagto,comprador_id) 
values (id_seq.nextval, 200, '19-01-2005', 'TESTE COMPRA', '1','DINHEIRO',1);




