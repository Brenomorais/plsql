-- Query para calcular média de avaliação por curso

-- selecionando as notas
select n.nota from nota n;

-- juntando as respostas com as notas
select n.nota from nota n join resposta r on r.id = n.resposta_id;

--Agora juntamos as respostas dos exericios
select n.nota from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id;

--Adicionando a seção de cada curso
select n.nota from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id;

--E o principal associar o curso e fazer a media das notas
select c.nome as Curso, avg(n.nota) as Media from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id;

-- Para resolver o erro da consulta anterior é preciso adicionar 'group by' por que estamos pedindo uma resultado que precisa
-- está associado a um grupo que é a media, por isso passamos, group by nome o banco.

select c.nome as Curso, avg(n.nota) as Media from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id
group by c.nome;

-- Consultando a quantidade de exercicios por curso

-- total geral de exercicios
select count(e.id) from exercicio e;

-- Juntando exercicios com a seção
select count(e.id) from exercicio e join secao s on s.id = e.secao_id;

-- Junção com curso
select count(e.id) from exercicio e
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id;

-- Por fim juntamos a tabela cursos e agrupamos por nomes dos cursos e temos o total de exercicios por curso    
select c.nome, count(e.id) from exercicio e
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id
group by c.nome;

-- Consultando número de alunos matriculados por curso

select c.nome from curso c;

-- Juntando cursos com matriculas
select c.nome from curso c
    join matricula m on m.curso_id = c.id;
    
-- Juntando alunos na associação 
select c.nome from curso c
    join matricula m on m.curso_id = c.id
    join aluno a on a.id = m.aluno_id;

-- Cotanddo o numero de alunos matriculados em cada curso
select c.nome, count(a.id) as quantidade from curso c
    join matricula m on m.curso_id = c.id
    join aluno a on a.id = m.aluno_id
group by c.nome;
