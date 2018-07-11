-- Oracle xe: alterando porta default http, que é a 8080, evitar conflito com servidor de aplicação etc.

-- Caso a porta já tenha sido alterada para outra e não sabia qual a porta está selecionada, execute a query abaixo.
select dbms_xdb.gethttpport as "HTTP-Port" from dual;

-- Alterando a porta http '8080' para porta '90', ou outra porta http não esteja em uso.
begin
	dbms_xdb.sethttpport('90');	
end;

--Verificando se alteração foi realizada, para a porta desejada.
select 
	dbms_xdb.gethttpport as "HTTP-Port"    
from dual;

--Nova URL para acessar a interface web.
http://127.0.0.1:90/apex/f?p=4950