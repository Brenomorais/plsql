-- Sub-queries: são  query interna a query principal que vai usada para forneceer dados na consulta principal

--Consultando a media geral de todos os cursos, para saber o desempenho do aluno comparado com
-- o desempenho de todos os alunos em geral

-- Fazer a media de cada aluno
select n.nota from nota n;

-- Associar as notas com as respostas
select n.nota from nota n join resposta r on r.id = n.resposta_id;

-- Associar as respostas aos exericicios
select n.nota from nota n 
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id;
    
-- Exercicios a seção
select n.nota from nota n 
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id;
    
-- Adicionando coluna nome do curso
select c.nome, n.nota from nota n 
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id;
    
-- Adicionando coluna nome do aluno
select a.nome, c.nome, n.nota from nota n 
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id
    join aluno a on r.aluno_id = a.id;
    
-- Calculando a media, mas ate agora só temos a meida de cada aluno separadamente, falta adicionar a media geral do curso
select a.nome, c.nome, avg(n.nota) as media from nota n 
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id
    join aluno a on r.aluno_id = a.id
group by a.nome, c.nome;

-- Query finalizada

select 
    a.nome,
    c.nome, 
    avg(n.nota) as Media_Aluno, 
    avg(n.nota) - (select avg(n.nota) from nota n) as Diferenca
from nota n 
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id
    join aluno a on r.aluno_id = a.id
group by a.nome, c.nome;

-- Quantidade de respostas por aluno

select a.nome as aluno, (select count(r.id) from resposta r where r.aluno_id = a.id) as QtdReposta from aluno a;

-- Quantos cursos cada aluno fez e ordenando por ordem desc

select a.nome as aluno, (select count(m.id) from matricula m where m.aluno_id = a.id) as CursosMatriculados 
from aluno a order by CursosMatriculados desc;

-- Devolva a média de notas por aluno e a diferença para a média geral. 
-- No entanto, exiba apenas alunos que tiveram alguma matrícula nos últimos 6 meses.

select 
    a.nome, 
    c.nome,
    avg(n.nota) as media, 
    avg(n.nota) - (select avg(n.nota) from nota n) as diferenca
 from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id
    join aluno a on a.id = r.aluno_id
where a.id in (select aluno_id from matricula where data > (select sysdate - interval '6' month from dual))
group by c.nome, a.nome;
