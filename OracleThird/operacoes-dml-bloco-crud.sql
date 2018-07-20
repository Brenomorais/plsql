--Blocos de codicos para realizar o CRUD opera��es DML, como Insert, Update e delete

-- Bloco que realiza o Insert: � necessario informar quando a transa��o ser� encerrada caso contr�rio ele fica aberta no banco
-- para encarrar a transa��o informamos o comamdo COMMIT 

DECLARE

    v_id number(5) := 1;
    v_descricao varchar2(100) := 'varejo';

BEGIN

    insert into segmercado values (v_id, v_descricao);
    commit;
    
END;

-- Consultando registro que foi inserido no bloco
select * from segmercado;

-- Melhorando o bloc de codigo com boas pr�ticas

-- Garantindo que as variaveis v�o seguir a estrutura dos campos da tabela 
-- Definido que dados em cadeia de caracteres ser�o salvos no banco sempre em letras mai�sculas

DECLARE

    v_id segmercado.id%type := 2;
    v_descricao segmercado.descricao%type := 'atacado';
    
BEGIN

    insert into segmercado values (v_id, upper(v_descricao));
    commit;
    
END;

-- Consultado registro salvo
select * from segmercado;


-- Bloco de codigo para atualiza��o dos dados: Update
-- Bloco de codigo pode conter varias opera��es DML internamente.

DECLARE

    v_id segmercado.id%type := 1;
    v_descricao segmercado.descricao%type := 'varejista';
    
BEGIN

    update segmercado 
        set descricao = upper(v_descricao)
    where id = v_id;
    
    v_id := 2;
    v_descricao := 'atacadista';
    
    update segmercado
        set descricao = upper(v_descricao)
    where id = v_id;
    
    commit;    
    
END;

-- Consultando altera��es realizadas
select * from segmercado;

-- Bloco de codigo, com duas opera��es DML, um Insert e um Update realizados na mesma transa��o

DECLARE  

BEGIN
    
    INSERT INTO segmercado VALUES (10, 'Automotivo');
    
    UPDATE cliente SET SEGMERCADO_ID = 10 WHERE ID = 5;
    
    COMMIT;
END;


-- Deletando removendo registro : Delete
-- Insert e Delete: primeiro vamos inserir e depois deletar o registro pelo id;

-- Bloco para inserir registro

DECLARE

    v_id segmercado.id%type := 3;
    v_descricao segmercado.descricao%type := 'esportivo';

BEGIN

    insert into segmercado values (v_id, upper(v_descricao));
    
    commit;

END;

-- Consultando registros
select * from segmercado;

--Bloco para remover registro inserido anteriormente com o id = 3.

DECLARE

    v_id segmercado.id%type := 3;
    
BEGIN

    delete from segmercado where id = v_id;

    commit;
END;

-- Consultando registros
select * from segmercado;
