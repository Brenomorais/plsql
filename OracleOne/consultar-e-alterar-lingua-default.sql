-- Query para consultar qual nls_lang (linguagem-idioma) est� sendo usada pelo Oracle,
-- idiomamportante saber essa informa��o, para trabalhar com datas.

show parameter nls_lang;

-- Caso, ap�s a consulta o nls_lang, esteja em outra linguagem que n�o seja: portugues-brasil
-- e possivel, alterar o nls_lang com os comandos abaixo: altera linguagem, pa�s, caracteres e
-- formato de data.

Alter Session Set nls_language='BRAZILIAN PORTUGUESE';
Alter Session Set NLS_TERRITORY = 'BRAZIL';
Alter Session Set NLS_NUMERIC_CHARACTERS=',.';
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';

--Query que permite verificar todos as nls disponivei no Oracle.
select * from v$nls_parameters;

