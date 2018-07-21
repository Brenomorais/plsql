-- Estrutura de repetição

--Procedure para atulizar segmento de mercado
create or replace procedure ATUALOZAR_CLI_SEG_MERCADO
        (p_id cliente.id%type,
         p_segmercado_id IN cliente.segmercado_id%type)
IS
BEGIN
    
    update cliente set segmercado_id = p_segmercado_id where id = p_id;    
    
    COMMIT;
END;

-- Estrutura de repetição para atualizar segmentos 
-- Loop baisco, que vai alterar segmercado_id para '1' até que o contador seja 'i' > 4

DECLARE
    
    v_segmercado_id cliente.segmercado_id%type := 1;
    v_i number(3);
    
BEGIN

    v_i := 1;
    
    LOOP
    
        --procedure que atualiza segmercado
        ATUALOZAR_CLI_SEG_MERCADO(v_i, v_segmercado_id);
        
        v_i := v_i + 1;
        
        EXIT WHEN v_i > 4;
        
    END LOOP;

END;

-- Laço For: nao precisa declarar variavel de controle como feito no Loop basico

DECLARE
    
    v_segmercado_id cliente.segmercado_id%type := 2;

BEGIN

    FOR i in 1..3 LOOP
    
        ATUALOZAR_CLI_SEG_MERCADO(i, v_segmercado_id);
        
    END LOOP;
    
    COMMIT;

END;

select * from cliente;

-- Parametros nomeados

-- não execução não da para saber o que significa cada parametro
execute ATUALOZAR_CLI_SEG_MERCADO(1,2);

-- Nomeando parametros para saber o nome, como isso não importa a ordem

DECLARE

    v_id              NUMBER;
    v_segmercado_id   NUMBER;
    
BEGIN

    v_id := 1;
    v_segmercado_id := 2;
    atualozar_cli_seg_mercado(p_id => v_id, p_segmercado_id => v_segmercado_id);
    
--rollback; 
END;


select * from cliente;
