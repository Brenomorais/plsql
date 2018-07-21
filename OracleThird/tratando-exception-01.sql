-- Execeções 'exeception'

-- Execuntando a procedure para inserir o oracle retornar uma mensagem derro, pois o cliente já existe salvo, a chave primaria
-- de valor 3 já existe na tabela de cliente e chave primaria não pode existir duplicada

EXECUTE INCLUIR_CLIENTE(3, 'Industria RTY', '12378', NULL, 110000);


-- Adicionar na procedure de incluir cliente um tratamento de erro de execução

create or replace PROCEDURE INCLUIR_CLIENTE 
   (p_id in cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_CNPJ cliente.CNPJ%type ,
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
    v_CNPJ cliente.cnpj%type := p_CNPJ;

BEGIN

    v_categoria := categoria_cliente(p_faturamento_previsto);

    format_cnpj(v_cnpj);

    INSERT INTO cliente 
        VALUES (p_id, UPPER(p_razao_social), v_CNPJ ,p_segmercado_id, SYSDATE, p_faturamento_previsto, v_categoria);
    
    COMMIT;
    
    -- Add exceção para tratar erros
    
    EXCEPTION
        WHEN dup_val_on_index then
            dbms_output.put_line ('Cliente já cadastrado');

END;


-- Executando procedure novamente, o serveroutput serve para exibir a mensagem de tratamento da exceção que foi adicionada

SET SERVEROUTPUT ON

EXECUTE INCLUIR_CLIENTE(3, 'Industria RTY', '12378', NULL, 110000);
