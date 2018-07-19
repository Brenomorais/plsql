-- Um programa escrito em PL/SQL � oficialmente chamado de Bloco.

-- Estrutura b�sica de um bloco em PL/SQL, a sintaxe se baseia na linguagem pascal que � outra linguagem de programa��o
-- Declara��o de variaveis e comandos de a��es devem terminar com o ponto e v�rgula ';'.
 
DECLARE    
    
BEGIN

END;

-- Iniciando a programa��o do bloco.

DECLARE    
    -- Declarando uma variavel 
    v_id  number(5);  
    
BEGIN
    -- Utilizando pacote dbms para exibir o valor da varial no console
    dbms_output.put_line(v_id);
END;

-- Configurando variavel de ambiente para exibir valores do bloco.

-- Por default o valor da variavel 'serveroutput' � off.
SET SERVEROUTPUT ON

DECLARE    
    -- Declarando uma variavel e atribuindo a valor
    v_id  number(5) := 0;  
    
BEGIN

    -- Utilizando pacote dbms para exibir o valor da varial no console.
    dbms_output.put_line(v_id);

    --Alterando valor da variavel
    v_id := 1;
    
    -- novamente exibindo valor da variavel .
    dbms_output.put_line(v_id);
    
END;
