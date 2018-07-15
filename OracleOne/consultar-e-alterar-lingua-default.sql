-- Query para consultar qual nls_lang (linguagem-idioma) está sendo usada pelo Oracle,
-- idiomamportante saber essa informação, para trabalhar com datas.

show parameter nls_lang;

-- Caso, após a consulta o nls_lang, esteja em outra linguagem que não seja: portugues-brasil
-- e possivel, alterar o nls_lang com os comandos abaixo: altera linguagem, país, caracteres e
-- formato de data.

Alter Session Set nls_language='BRAZILIAN PORTUGUESE';
Alter Session Set NLS_TERRITORY = 'BRAZIL';
Alter Session Set NLS_NUMERIC_CHARACTERS=',.';
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';

--Query que permite verificar todos as nls disponivei no Oracle.
select * from v$nls_parameters;

