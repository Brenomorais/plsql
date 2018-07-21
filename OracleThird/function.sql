-- Funções em PL /SQL
-- Entrada de dados que retorna apenas uma linha de registro

--Criando função 'function'
CREATE OR REPLACE FUNCTION obter_descricao_segmercado (p_id IN segmercado.id%type)
RETURN segmercado.descricao%type

IS
    v_descricao segmercado.descricao%type;

BEGIN
    SELECT descricao INTO v_descricao
        FROM segmercado
        WHERE id = p_id;
    RETURN v_descricao;
END;

-- Executando a função criada
VARIABLE g_descricao varchar2(100)
EXECUTE :g_descricao := obter_descricao_segmercado (1)
PRINT g_descricao


-- Execuntado function dentro de um bloco  de codigo

-- Cria função
CREATE OR REPLACE FUNCTION obter_descricao_segmercado (p_id IN segmercado.id%type)
RETURN segmercado.descricao%type

IS
    v_descricao segmercado.descricao%type;

BEGIN
    SELECT descricao INTO v_descricao
        FROM segmercado
        WHERE id = p_id;
    RETURN v_descricao;
END;

-- inicia o bloco de codigo

SET SERVEROUTPUT ON

DECLARE
    v_descricao segmercado.descricao%type;

BEGIN
    v_descricao := obter_descricao_segmercado(2);
    dbms_output.put_line('Descricao: ' ||v_descricao);

END;