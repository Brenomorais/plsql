-- Lançado exceções, para ser exibida externamente em uma aplicação client 

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
             raise_application_error(-20010, 'Cliente já cadastrado');
END;

-- executando procedure, não é mais preciso do serveroutput não estamos utilizando o pacote dbms_output
EXECUTE INCLUIR_CLIENTE(3, 'Industria RTY', '12378', NULL, 110000);
