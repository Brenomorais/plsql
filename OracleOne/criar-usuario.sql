-- Criando usuario
CREATE USER sistema IDENTIFIED BY ora123;

-- Aplicando permissao de n�vel DBA para o usuario: para outro nivel de acesso consulte a documenta��o do oracle
GRANT DBA TO sistema;