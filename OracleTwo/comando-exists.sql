-- Tabela com registro de todos alunos;

select * from aluno;

-- Selecionando Alunos que est�o matriculados 

select nome from aluno join matricula on matricula.aluno_id = aluno.id;

-- Consultado lista de alunos matriculados utlizando nome da tabela antes do campo

select aluno.nome, curso.nome from aluno 
join matricula on matricula.aluno_id = aluno.id
join curso on curso.id = matricula.curso_id;

-- Mesma consulta feita acima mas utilizando alias onde definimos um identificador para a tabela para n�o precisar repetir o nome 
-- da tabela em todos os campos, basta passar o identificar que criamos: Tabela "matricula" = m e  "aluno" = a

select a.nome, c.nome from aluno a 
join matricula m on m.aluno_id = a.id 
join curso c on c.id = m.curso_id;

-- Consultando alunos que TEM matricula e sem matricula. Utilizando o 'Exists' para verificar se o aluno tem matricula
-- No Exists passamos outra consulta, para consultar os id dos alunso que existem na tabela matricula. O resultado ser�
-- os alunos que tem matricula em algum curso.

select a.nome from aluno a where exists( select m.id from matricula m where m.aluno_id = a.id);

-- Consultado alunos que N�O TEM matricula em nenhum curso. Utilizando a mesma query  anterior mas passando o 'not' antes do   
-- 'exists' isso far� que o banco n�s mostre apenas os alunos que n�o tem o ID registrada na tabela de matriculas

select a.nome from aluno a where not exists( select m.id from matricula m where m.aluno_id = a.id);

-- Consultando se existem exercicios n�o respondidos. Os exercicios ficam registrado na tabela exercicio;

select * from exercicio;

-- Query que consulta exericios que foram respondidos
Select * from exercicio e where exists( select r.id from resposta r where r.exercicio_id = e.id);

-- Query qye consulta exericios n�o respondidos
select * from exercicio e where not exists( select r.id from resposta r where r.exercicio_id = e.id);

--  Qurey cursos que tem alunos matriculados
select c.nome from curso c where exists (select m.id from matricula m where m.curso_id = c.id);

-- Query cursos que n�o tem nenhum aluno matriculado
select c.nome from curso c where not exists (select m.id from matricula m where m.curso_id = c.id);







