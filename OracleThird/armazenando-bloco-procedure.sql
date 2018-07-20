-- Procedures, salvando bloco de codigo no banco para ser usado externamente por um aplicação client ou internamente.
-- Para criar uma 'procedure', para criar um 'procedure' não é preciso declarar o 'declare' que é utilizado nos bloco de codigo
-- nesse caso foi substituida plea cláusila IS

-- Criando procedure para salvar um novo segmento de mercado na tabela segmercado, depois de criada a procedure ela poderá
-- ser executada, passando por parametro o valor(s) do(s) campo(s) que ela precisa, que foi definido durante a criação da procedure

-- cria a procedure
CREATE PROCEDURE incluir_segmercado
(
    p_id IN NUMBER,
    p_descricao IN VARCHAR2
)
IS
BEGIN
    
    INSERT into segmercado values (p_id, UPPER(p_descricao));

    COMMIT;

END;

-- Executando a procedure 
execute incluir_segmercado(3,'Farmaceutico');

-- Verificando se registro foi inserido
select * from segmercado;

--Executando procedure dentro de um bloco pl/sql
BEGIN
    incluir_segmercado(4,'industrial');
END;

-- Verificando se registro foi inserido
select * from segmercado;

-- Manutenção da Procedure

-- Alterando definição dos dados para seguir a definição dos dados do campo da tabela, seguindo o tipo de dados corrente
-- na estrutura da tabela

-- Alterando procedure já existente: create or replace procedure. Esse comando pode ser utilizado caso a tabela não exista ela
-- sera criada caso exista ira fazer a alterações que foram digitas.

CREATE OR REPLACE PROCEDURE incluir_segmercado
(
    p_id IN segmercado.id%type,
    p_descricao IN segmercado.descricao%type
)
IS
BEGIN
    
    INSERT into segmercado values (p_id, UPPER(p_descricao));

    COMMIT;

END;
