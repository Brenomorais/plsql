-- Entendndo o Left Join:  Assim como o Inner join que seleciona os dados do centro da jun��o, o left join seleciona os dados
-- que n�o tem associa��o com a tabela da direita.

-- Consultando alunos que responderam os exercicios e tambem os que nao responderam nenhum exericio

-- Nessa query que retorna alunos e as quantidades de respotas, nesse caso temos apenas o centro da uni�o
-- das tabelas aluno e resposta. Caso seja preciso os alunos que n�o responderam nenhum exericio
-- e seja preciso verificar se existe respotas sem aluno: para isso tem o left e right join

select a.nome, count(r.id) as quantidade from aluno a join resposta r on r.aluno_id = a.id group by a.nome;

-- Buscando todos alunos que inclusive os que n�o tem respotas nos exercicios com left join
select a.nome, count(r.id) as quantidade from aluno a left join resposta r on r.aluno_id = a.id group by a.nome;

-- Buscando se existe respostas sem aluno com o right join. O resultado ser� todos os exericios tem alunos isso porque 
-- n�o existe nenhum registro de exericio sem aluno vinculado

select a.nome, r.resposta_dada from aluno a right join resposta r on r.aluno_id = a.id;

-- Adicionado um where para ver se o nome do aluno est� null com isso n�o teremos nenhum resultado retornado caso n�o exista
-- nenhum resposta sem aluno vinculada
select a.nome, r.resposta_dada from aluno a right join resposta r on r.aluno_id = a.id where a.nome is null;

-- Adicionando um registro de exericio sem aluno para testar a veracidade do right join
insert into resposta (id, exercicio_id, aluno_id, resposta_dada)  values (28, 1, 50000, 'c# e vb');
delete from resposta where aluno_id = 50000;

-- Exiba todos os alunos e suas poss�veis respostas. Exiba todos os alunos, mesmo que eles n�o tenham respondido nenhuma pergunta.
select a.nome, r.resposta_dada from aluno a left join resposta r on a.id = r.aluno_id;


--Exiba agora todos os alunos e suas poss�veis respostas para o exerc�cio com ID = 1. 
-- Exiba todos os alunos, at� os que n�o responderam o exerc�cio.

select a.nome, r.resposta_dada from aluno a  left join resposta r on a.id = r.aluno_id  and r.exercicio_id = 1;


