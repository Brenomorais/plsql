-- Oracle xe: alterando porta default http, que � a 8080, evitar conflito com servidor de aplica��o etc.

-- Caso a porta j� tenha sido alterada para outra e n�o sabia qual a porta est� selecionada, execute a query abaixo.
select dbms_xdb.gethttpport as "HTTP-Port" from dual;

-- Alterando a porta http '8080' para porta '90', ou outra porta http n�o esteja em uso.
begin
	dbms_xdb.sethttpport('90');	
end;

--Verificando se altera��o foi realizada, para a porta desejada.
select 
	dbms_xdb.gethttpport as "HTTP-Port"    
from dual;

--Nova URL para acessar a interface web.
http://127.0.0.1:90/apex/f?p=4950