-- Procedure que retorna valores
-- Procedures Format_cnpj, recebe o valor do cnpj sem mascara de formatação retorna o cpnj formatado com a devida mascara

CREATE OR REPLACE PROCEDURE FORMAT_CNPJ
    (p_cnpj IN OUT cliente.CNPJ%type)

IS
BEGIN
    p_cnpj := substr(p_cnpj,1,2) || '/' || substr(p_cnpj,3);
END;

-- Criando uma variavel de ambiente do SQL Developer
VARIABLE g_cnpj varchar2(10)
EXECUTE :g_cnpj := '12345'
PRINT g_cnpj

-- Executa procedure recebendo variavel como parametro
EXECUTE FORMAT_CNPJ(:g_cnpj)
PRINT g_cnpj

-- Procedure para incluir cliente que utiliza a procedure para formatar o cnpj internamente:

CREATE OR REPLACE PROCEDURE INCLUIR_CLIENTE 
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

END;

-- Executando procedure
EXECUTE INCLUIR_CLIENTE(4, 'Fabrica ABC', '12345', NULL, 110000);

select * from cliente
