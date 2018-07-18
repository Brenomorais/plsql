-- Entendndo o Left Join:  Assim como o Inner join que seleciona os dados do centro da junção, o left join seleciona os dados
-- que não tem associação com a tabela da direita.

-- Consultando alunos que responderam os exercicios e tambem os que nao responderam nenhum exericio

-- Nessa query que retorna alunos e as quantidades de respotas, nesse caso temos apenas o centro da união
-- das tabelas aluno e resposta. Caso seja preciso os alunos que não responderam nenhum exericio
-- e seja preciso verificar se existe respotas sem aluno: para isso tem o left e right join

select a.nome, count(r.id) as quantidade from aluno a join resposta r on r.aluno_id = a.id group by a.nome;

-- Buscando todos alunos que inclusive os que não tem respotas nos exercicios com left join
select a.nome, count(r.id) as quantidade from aluno a left join resposta r on r.aluno_id = a.id group by a.nome;

-- Buscando se existe respostas sem aluno com o right join. O resultado será todos os exericios tem alunos isso porque 
-- não existe nenhum registro de exericio sem aluno vinculado

select a.nome, r.resposta_dada from aluno a right join resposta r on r.aluno_id = a.id;

-- Adicionado um where para ver se o nome do aluno está null com isso não teremos nenhum resultado retornado caso não exista
-- nenhum resposta sem aluno vinculada
select a.nome, r.resposta_dada from aluno a right join resposta r on r.aluno_id = a.id where a.nome is null;

-- Adicionando um registro de exericio sem aluno para testar a veracidade do right join
insert into resposta (id, exercicio_id, aluno_id, resposta_dada)  values (28, 1, 50000, 'c# e vb');
delete from resposta where aluno_id = 50000;

-- Exiba todos os alunos e suas possíveis respostas. Exiba todos os alunos, mesmo que eles não tenham respondido nenhuma pergunta.
select a.nome, r.resposta_dada from aluno a left join resposta r on a.id = r.aluno_id;


--Exiba agora todos os alunos e suas possíveis respostas para o exercício com ID = 1. 
-- Exiba todos os alunos, até os que não responderam o exercício.

select a.nome, r.resposta_dada from aluno a  left join resposta r on a.id = r.aluno_id  and r.exercicio_id = 1;


