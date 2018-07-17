-- Filtrando dados agrupados com o Having. O Having diferente do where que é usado para filtrar dados depois do From
-- podemos filtrar os dados agrupados utilizando Having.

-- Buscando a média das notas de um aluno me cada curso realizado por ele

-- Iniciamos pegando as notas
select n.nota from nota n;

-- Juntando notas com às respostas
select n.nota from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id;
    
-- Adicionando a seção
select n.nota from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id;
    
-- Adicionando os cursos
select n.nota from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id;

-- Aidcionando o aluno
select a.nome,c.nome from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id 
    join aluno a on a.id = r.aluno_id;

-- Calculando a media e agrupando pelo nome do curso e nome do aluno
select a.nome,c.nome, avg(n.nota) as media from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id 
    join aluno a on a.id = r.aluno_id
group by c.nome, a.nome;

-- Temos todas as medias dos curso realizados, podemos agora realizar um filtro por media para ver quais alunos
-- estão com média abaixo ou igual 5. Para isso vamos utilizar o Having fazer um filtro no agrupamento que realizandos

select a.nome,c.nome, avg(n.nota) as media from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id 
    join aluno a on a.id = r.aluno_id
group by c.nome, a.nome
having avg(n.nota) < 5;

-- Alunos com media maior ou igual a 5
    
select a.nome,c.nome, avg(n.nota) as media from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id 
    join aluno a on a.id = r.aluno_id
group by c.nome, a.nome
having avg(n.nota) >= 5;

-- Query para consultar a quantidade de alunos por curso e filtrando quais cursos possem apenas 3 alunos matriculados
select count(a.id) as quantidade, c.nome from curso c
    join matricula m on m.curso_id = c.id
    join aluno a on m.aluno_id = a.id
group by c.nome
having count(a.id) < 3;

-- Exiba o nome do curso e a quantidade de seções que existe nele. Mostre só cursos com mais de 3 seções

select c.nome, count(s.id) as QuantidadeSecoes from secao s
    join curso c on c.id =  s.curso_id 
group by c.nome having count(s.id) > 3;



    

