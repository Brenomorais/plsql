-- Conectar com usuario system
--Criando usuario novo 'developer', como padrão será cirado no tablespace Users

CREATE USER developer IDENTIFIED BY ora123 
DEFAULT tablespace users;

-- Concendendo privilégios para o usuário cirado
GRANT connect, resource TO developer;

--Deletear usuário oracle
drop user developer;

-- Alterar senha do usuario
alter user developer identified by dev123;


