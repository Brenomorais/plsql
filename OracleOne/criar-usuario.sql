-- Criando usuario
CREATE USER sistema IDENTIFIED BY ora123;

-- Aplicando permissao de nível DBA para o usuario: para outro nivel de acesso consulte a documentação do oracle
GRANT DBA TO sistema;