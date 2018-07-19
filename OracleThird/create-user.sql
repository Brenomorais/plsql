-- Conectar com usuario system
--Criando usuario novo 'developer', como padr�o ser� cirado no tablespace Users

CREATE USER developer IDENTIFIED BY ora123 
DEFAULT tablespace users;

-- Concendendo privil�gios para o usu�rio cirado
GRANT connect, resource TO developer;

--Deletear usu�rio oracle
drop user developer;

-- Alterar senha do usuario
alter user developer identified by dev123;


