-- Rownum para paginação de dados

-- exibindo soemente os 5 primeiros alunos ordenados por nome

select a.nome from aluno a order by a.nome;

-- Se tiver muitos dados, pode ser feito paginação no resultado, exibindo apenas 5 registro em cada pagina, como isso
-- evita de exibir todo o resltado de uma só vez; Query que pega somente os 5 primerios ordernados pelo nome

-- O rownum é um pseudocoluna que o oracle enumera todos os registro da consulta. Para utilizar o rownum vamos usar a subquery

select rownum, nome from (select a.nome from aluno a order by a.nome);

select rownum, nome from (select a.nome from aluno a order by a.nome);

-- Query qye consulta e seleciona apenas os 5 primeiros alunos 
select rownum, nome from (select a.nome from aluno a order by a.nome) where rownum <= 5;

-- Para ter o restante dos alunos, removendo os 5 que ja foram exibidos, basta inverter o sinal do where para > 
select * from (select rownum r, nome from (
    select a.nome from aluno a order by a.nome
)) where r > 5;


-- Exibindo um intervalo de alunos os 5 primeiros e o restante dele
select * from (select rownum r, nome from (
    select a.nome from aluno a order by a.nome
) where rownum <= 10) where r > 5;

-- Escreva uma SQL que devolva os 3 primeiros alunos que o e-mail termine com o domínio ".com".
select rownum, nome, email from (select a.nome, a.email from aluno a order by a.nome) where rownum <= 3 and email like '%.com%';

-- Escreva uma query que ordene os alunos por nome, e traga apenas os dois primeiros cujo e-mail termine com ".com".
select rownum, nome, email from (select a.nome, a.email from aluno a order by a.nome) where rownum <= 2 and email like '%.com%';


