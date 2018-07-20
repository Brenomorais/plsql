-- Procedures, salvando bloco de codigo no banco para ser usado externamente por um aplica��o client ou internamente.
-- Para criar uma 'procedure', para criar um 'procedure' n�o � preciso declarar o 'declare' que � utilizado nos bloco de codigo
-- nesse caso foi substituida plea cl�usila IS

-- Criando procedure para salvar um novo segmento de mercado na tabela segmercado, depois de criada a procedure ela poder�
-- ser executada, passando por parametro o valor(s) do(s) campo(s) que ela precisa, que foi definido durante a cria��o da procedure

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

-- Manuten��o da Procedure

-- Alterando defini��o dos dados para seguir a defini��o dos dados do campo da tabela, seguindo o tipo de dados corrente
-- na estrutura da tabela

-- Alterando procedure j� existente: create or replace procedure. Esse comando pode ser utilizado caso a tabela n�o exista ela
-- sera criada caso exista ira fazer a altera��es que foram digitas.

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
