-- Buscando valores distintos mas sem repetições

-- Buscar todas as formas de pagamentos de registradas no banco

-- Campo da tabela que registra o tipo de pagamento
select tipo from matricula;

-- Consultando todas os tipos de pagamento distintas mas sem as reptidas
select distinct tipo from matricula;

-- Selecionandos matriculas que tenha pagamento dos tipos PAGA_PF ou PAGA_PJ

select count(m.id) as quantidade from matricula m;

select c.nome, count(m.id) as quantidade 
    from matricula m 
join curso c on m.curso_id = c.id group by c.nome;

select c.nome, count(m.id) as quantidade from matricula m 
    join curso c on m.curso_id = c.id 
where m.tipo = 'PAGA_PJ' or m.tipo = 'PAGA_PF'
group by c.nome;

select c.nome, m.tipo, count(m.id) as quantidade from matricula m 
    join curso c on m.curso_id = c.id 
where m.tipo = 'PAGA_PJ' or m.tipo = 'PAGA_PF'
group by c.nome, m.tipo;

-- Usando o operador IN para melhorar a query, otimazar para não precisar do OR
select c.nome, m.tipo, count(m.id) as quantidade from matricula m 
    join curso c on m.curso_id = c.id 
where m.tipo in ('PAGA_PJ', 'PAGA_PF')
group by c.nome, m.tipo;

-- Consultando uma lista de alunos a partir de um sequencia de ID

select c.nome from curso c
    join matricula m on m.curso_id = c.id
where m.aluno_id in (1, 3, 4);

select a.nome, c.nome from curso c
    join matricula m on m.curso_id = c.id
    join aluno a on m.aluno_id = a.id
where m.aluno_id in (1, 3, 4)
order by a.nome;

-- Consultando alunos que já realizaram o curso com Id 1 e 9.

-- 1 passo
select c.nome from curso c
    join matricula m on m.curso_id = c.id;
  
-- 2 passo  
select c.nome from curso c
    join matricula m on m.curso_id = c.id
    join aluno a on m.aluno_id = a.id;
    
-- 3 passo
select a.nome, c.nome from curso c
    join matricula m on m.curso_id = c.id
    join aluno a on m.aluno_id = a.id;
    
-- 4 passo e último
select a.nome, c.nome from curso c
    join matricula m on m.curso_id = c.id
    join aluno a on m.aluno_id = a.id
where c.id in (1, 9);

-- Exiba todos os tipos de matrícula que existem na tabela. Use DISTINCT para que não haja repetição.
select distinct tipo from matricula;

-- Exiba todos os cursos e a sua quantidade de matrículas. Mas filtre por matrículas dos tipos PF ou PJ

-- Usando o operador IN
select c.nome, count(m.id) from matricula m
    join curso c on c.id = m.curso_id
where m.tipo in ('PAGA_PF', 'PAGA_PJ')
group by c.nome;

-- Usando condição OR para o tipo PF ou PJ
select c.nome, count(m.id) as quantidade from curso c 
    join matricula m on c.id = m.curso_id
where m.tipo in ('PAGA_PF', 'PAGA_PJ')
group by c.nome;

-- Traga todas os exercícios e a quantidade de respostas de cada uma. Mas dessa vez, somente dos cursos com ID 1 e 3

select e.pergunta, count(r.id) from exercicio e
    join resposta r on e.id = r.exercicio_id
    join secao s on s.id = secao_id
    join curso c on s.curso_id = c.id
where c.id in (1,3)
group by e.pergunta;


   
