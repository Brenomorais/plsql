-- Procedure para incluir um novo cliente, utilizando o IF e else

-- Procedure 1 - incluir novo cliente mas sem salvar a categoria
CREATE OR REPLACE PROCEDURE INCLUIR_CLIENTE 
   (p_id in cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_CNPJ cliente.CNPJ%type ,
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;

BEGIN
    INSERT INTO cliente 
        VALUES (p_id, UPPER(p_razao_social), p_CNPJ,p_segmercado_id, SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;

END;

EXECUTE INCLUIR_CLIENTE(1, 'SUPERMERCADO XYZ', '12345', NULL, 150000);

select * from cliente;

-- Criando function para receber o valor do faturamente e retormar a catetoria que o cliente pertence, essa informação
-- será usada ser passada no insert do cliente

CREATE OR REPLACE FUNCTION categoria_cliente
    (p_faturamento_previsto IN cliente.faturamento_previsto%type) RETURN cliente.categoria%type
IS
BEGIN

    IF p_faturamento_previsto < 10000 THEN
           RETURN 'PEQUENO';
        ELSIF p_faturamento_previsto < 50000 THEN
            RETURN 'MEDIO';
        ELSIF p_faturamento_previsto < 100000 THEN
            RETURN 'MEDIO GRANDE';
        ELSE
            RETURN 'GRANDE';
        END IF;
END;


-- Reescrevendo procedure, agora fazendo uso da function nos retornar a categoria do cliente
CREATE OR REPLACE PROCEDURE INCLUIR_CLIENTE 
   (p_id in cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_CNPJ cliente.CNPJ%type ,
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;

BEGIN

    v_categoria := categoria_cliente(p_faturamento_previsto);

    INSERT INTO cliente 
        VALUES (p_id, UPPER(p_razao_social), p_CNPJ,p_segmercado_id, SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;

END;

-- executando procedure
EXECUTE INCLUIR_CLIENTE(2, 'SUPERMERCADO IJR', '67890', NULL, 90000);

SELECT * FROM CLIENTE;

