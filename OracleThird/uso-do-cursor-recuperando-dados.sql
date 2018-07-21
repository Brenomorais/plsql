-- Utilizando Curso para recuperar uma saida de um comando select e utilizar no bloco de codigo para realizar alguma ação,
-- o curso é uma estrutura que só faz lietura para a frente, que faz a leitura de cada linha retornada no select


-- Sintaxa de declaração do cursor

DECLARE

    v_id cliente.id%type;
    v_segmercado_id cliente.segmercado_id%type := 1;
    
    CURSOR cur_cliente is
        SELECT id
        FROM cliente;
BEGIN

END;


-- Bloco de codigo completo, realiza a alteração dos segmento utilizando loop baisco com a procedure atualizar_cli_seg_mercado

DECLARE

    v_id cliente.id%type;
    v_segmercado_id cliente.segmercado_id%type := 1;
    
    CURSOR cur_cliente is
        SELECT id
        FROM cliente;
BEGIN

    OPEN cur_cliente;

LOOP

    FETCH cur_cliente into v_id;
    EXIT WHEN cur_cliente%NOTFOUND;
    ATUALIZAR_CLI_SEG_MERCADO(v_id, v_segmercado_id);
    
END LOOP;
    
    --liberando curso da memoria
    CLOSE cur_cliente;

COMMIT;

END;

select * from cliente;

-- Cursor com o laço For, deixar o codigo mais limpo um codigo sucinto e legivel. O loop execunta automaticamente o feth
-- não precisando escrever para o fecth sair, assim que o loopo falhar será o momento de saida da estrutura, com isso o cursor
-- também já é encerrado nesse caso omitimos o close do curso.

DECLARE

    v_segmercado_id cliente.segmercado_id%type := 2;
    
    CURSOR cur_cliente is
        SELECT id
        FROM cliente;
BEGIN

    FOR cli_rec IN cur_cliente LOOP
    
        ATUALIZAR_CLI_SEG_MERCADO(cli_rec.id, v_segmercado_id);
        
    END LOOP;

    COMMIT;

END;

