-- No Predefined Oracle Exception:

-- Incluir um cliente com o id chave primaria null (ausencia de valor)
EXECUTE INCLUIR_CLIENTE(NULL, 'Industria RTY', '12378', NULL, 110000);

-- Criando componente de exce��o na procedure para campos null Ora-01400

create or replace PROCEDURE INCLUIR_CLIENTE 
   (p_id in cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_CNPJ cliente.CNPJ%type ,
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
    v_CNPJ cliente.cnpj%type := p_CNPJ;
    
    --criando componente de exce��o e atribuindo um codigo de erro do oracle para ele que � quando campo for null
    e_null exception;
    pragma exception_init(e_null, -1400);

BEGIN

    v_categoria := categoria_cliente(p_faturamento_previsto);

    format_cnpj(v_cnpj);

    INSERT INTO cliente 
        VALUES (p_id, UPPER(p_razao_social), v_CNPJ ,p_segmercado_id, SYSDATE, p_faturamento_previsto, v_categoria);
    
    COMMIT;
    
 -- Add exce��o para tratar erros    
EXCEPTION    
    
    -- Exce��o para quando tentar inserir cliente j� cadastrado valida o ID
    WHEN dup_val_on_index then
        raise_application_error(-20010, 'Cliente j� cadastrado');
      
    -- Exce��o para quando tentar inseir um cliente sem atribuir valor para o Id   
    WHEN e_null then
        raise_application_error(-20015, 'A coluna ID tem preenchimento obrigat�rio');
        
     -- Exce��o outras exce��es geradas n�o previsto n�o especificados
     WHEN others then
        raise_application_error(-20020, sqlerrm());        
END;

-- Teste de procedure com exce��es
EXECUTE INCLUIR_CLIENTE(NULL, 'Industria RTY', '12378', NULL, 110000);


-- Tratando erro provocados pelo desenvolvedor

-- Informando um id de cliente que n�o existe, a procedure ser� executada sem erro caso o programador
execute ATUALIZAR_CLI_SEG_MERCADO(10,1)

-- Tratando erro provocado pelo programador
CREATE OR REPLACE PROCEDURE ATUALIZAR_CLI_SEG_MERCADO
    (p_id IN cliente.id%type,
     p_segmercado_id IN cliente.segmercado_id%type)
IS
    
    e_cliente_id_inexistente exception;
    
BEGIN
    
    UPDATE cliente
        SET segmercado_id = p_segmercado_id
        WHERE id = p_id;
   
    IF SQL%NOTFOUND then
        RAISE e_cliente_id_inexistente;
        
    END IF;
    
    COMMIT;
    
EXCEPTION

    WHEN e_cliente_id_inexistente then
        raise_application_error(-20100,'Cliente inexistente');
END;


-- Agora ao executar a procedure informando um cliente que n�o existe o Oracle notificar� o  programador com a messagem
-- que foi informada no tratamendo de exce��o
EXECUTE ATUALIZAR_CLI_SEG_MERCADO(10,1)

