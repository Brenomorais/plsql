-- Retorne a média das avaliação por curso

select c.nome, avg(n.nota) as media from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id
group by c.nome;

-- Selecione o curso e as médias de notas, levando em conta somente alunos que tenham "Silva" ou "Santos" no sobrenome

select c.nome, avg(n.nota) as media from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id
    join aluno a on a.id = r.aluno_id
where a.nome like '%Santos%' or a.nome like '%Silva%'
group by c.nome;

-- Conte a quantidade de respostas por exercício. Exiba a pergunta e o número de respostas.

select e.pergunta as Exericio, count(r.exercicio_id) as NumeroRespostas from resposta r
    join exercicio e on e.id = r.exercicio_id
group by e.pergunta;

select e.pergunta, count(r.id) as NumeroRespostas from exercicio e 
    join resposta r on r.exercicio_id = e.id
group by e.pergunta;

-- Ordene o resultado da query anterior ordenando pelo numero de respostas ordem descrescente
select e.pergunta, count(r.id) as NumeroRespostas from exercicio e 
    join resposta r on r.exercicio_id = e.id
group by e.pergunta
order by count(r.id) desc;


select a.nome as Aluno , c.nome as Curso, avg(n.nota) as Media from nota n
    join resposta r on r.id = n.resposta_id
    join exercicio e on e.id = r.exercicio_id
    join secao s on s.id = e.secao_id
    join curso c on c.id = s.curso_id
    join aluno a on a.id = r.aluno_id
where a.nome like '%Santos%' or a.nome like '%Silva%'
group by c.nome, a.nome;
