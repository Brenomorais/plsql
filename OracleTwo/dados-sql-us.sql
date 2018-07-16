DROP TABLE aluno;

CREATE TABLE aluno (
  id number primary key,
  nome varchar2(30) DEFAULT '' NOT NULL,
  email varchar2(30) DEFAULT '' NOT NULL
);

INSERT INTO aluno (id, nome, email) VALUES (1, 'Joao da Silva', 'joao@dasilva.com');
INSERT INTO aluno (id, nome, email) VALUES (2, 'Frederico Jose', 'fred@jose.com');
INSERT INTO aluno (id, nome, email) VALUES (3, 'Alberto Santos', 'alberto@santos.com');
INSERT INTO aluno (id, nome, email) VALUES (4, 'Renata Alonso', 'renata@alonso.com');
INSERT INTO aluno (id, nome, email) VALUES (5, 'Paulo da Silva', 'paulo@dasilva.com');
INSERT INTO aluno (id, nome, email) VALUES (6, 'Carlos Cunha', 'carlos@cunha.com');
INSERT INTO aluno (id, nome, email) VALUES (7, 'Paulo Jose', 'paulo@jose.com');
INSERT INTO aluno (id, nome, email) VALUES (8, 'Manoel Santos', 'manoel@santos.com');
INSERT INTO aluno (id, nome, email) VALUES (9, 'Renata Ferreira', 'renata@ferreira.com');
INSERT INTO aluno (id, nome, email) VALUES (10, 'Paula Soares', 'paula@soares.com');
INSERT INTO aluno (id, nome, email) VALUES (11, 'Jose da Silva', 'jose@dasilva.com');
INSERT INTO aluno (id, nome, email) VALUES (12, 'Danilo Cunha', 'danilo@cunha.com');
INSERT INTO aluno (id, nome, email) VALUES (13, 'Zilmira Jose', 'zilmira@jose.com');
INSERT INTO aluno (id, nome, email) VALUES (14, 'Cristaldo Santos', 'cristaldo@santos.com');
INSERT INTO aluno (id, nome, email) VALUES (15, 'Osmir Ferreira', 'osmir@ferreira.com');
INSERT INTO aluno (id, nome, email) VALUES (16, 'Claudio Soares', 'claudio@soares.com');


DROP TABLE curso;

CREATE TABLE curso (
  id number primary key,
  nome varchar2(40) DEFAULT '' NOT NULL
);

INSERT INTO curso (id, nome) VALUES (1, 'SQL e banco de dados');
INSERT INTO curso (id, nome) VALUES (2, 'Desenvolvimento web com VRaptor');
INSERT INTO curso (id, nome) VALUES (3, 'Scrum e metodos ageis');
INSERT INTO curso (id, nome) VALUES (4, 'C# e orientacao a objetos');
INSERT INTO curso (id, nome) VALUES (5, 'Java e orientacao a objetos');
INSERT INTO curso (id, nome) VALUES (6, 'Desenvolvimento mobile com iOS');
INSERT INTO curso (id, nome) VALUES (7, 'Desenvolvimento mobile com Android');
INSERT INTO curso (id, nome) VALUES (8, 'Ruby on Rails');
INSERT INTO curso (id, nome) VALUES (9, 'PHP e MySql');


DROP TABLE exercicio;

CREATE TABLE exercicio (
  id number primary key,
  secao_id number NOT NULL,
  pergunta varchar2(30) NOT NULL,
  resposta_oficial varchar2(75) NOT NULL
);

INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (1, 1, 'O que eh um select?', 'Uma consulta que devolve resultados');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (2, 1, 'Como funciona um select?', 'select campos from tabela');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (3, 2, 'O que eh um update?', 'Serve pra alterar dados');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (4, 2, 'Perigos do update?', 'Nao pode esquecer de colocar where');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (5, 3, 'O que eh um delete?', 'Deleta uma linha do banco de dados');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (6, 3, 'Cuidados com ele?', 'Nao pode esquecer do where');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (7, 4, 'O que eh um insert?', 'Serve para inserir um dado no banco');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (8, 4, 'Como funciona?', 'insert into (coluna1, coluna2) values (v1, v2)');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (9, 5, 'Como funciona a web?', 'Requisicao e resposta');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (10, 5, 'Que linguagens posso ajudar?', 'Varias, como Java, Php, C#, etc');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (11, 6, 'O que eh MVC?', 'Model View Controller');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (12, 6, 'Frameworks que usam?', 'Vraptor, Spring MVC, Struts, etc');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (13, 7, 'O que eh a classe Result?', 'Serve para lidar com o resultado');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (14, 8, 'O que eh um interceptor?', 'Eh como se fosse um filtro que eh executado antes');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (15, 8, 'Quando usar?', 'Tratamento de excecoes, conexao com o banco de dados');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (16, 9, 'O que eh iteracao', 'Tempo que voce tem pra agregar valor');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (17, 9, 'Qual tamanho bom?', 'De 2 a 4 semanas, segundo o Scrum Guide antigo');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (18, 10, 'O que sao retrospectiva?', 'Reunioes onde a ideia eh melhorar o processo');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (19, 10, 'Quando devemos fazer?', 'Geralmente a cada iteracao');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (20, 11, 'O que eh a reuniao diaria?', 'Uma pequena reuniao para informar a equipe sobre o andamento da iteracao');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (21, 11, 'Quando fazemos?', 'Uma vez por dia, em um horario fixo e pre definido');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (22, 12, 'O que eh kanban?', 'Um metodo agil');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (23, 12, 'O que eh xp?', 'Outro metodo agil');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (24, 12, 'Tem outros?', 'Lean, Crystal, FDD');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (25, 13, 'O que eh a web?', 'Eh a internet, ue');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (26, 13, 'Como funciona a web?', 'Requisicao e resposta');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (27, 14, 'O que eh o apache?', 'Servidor que sabe trabalhar com HTTP');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (28, 14, 'Java funciona?', 'Sim, quando colocamos o tomcat junto com ele');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (29, 15, 'O que eh mysql', 'Essa voce sabe, certo? :)');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (30, 16, 'O que eh deploy?', 'Eh o processo de colocarmos a aplicacao no ar');
INSERT INTO exercicio (id, secao_id, pergunta, resposta_oficial) VALUES (31, 16, 'Como faz?', 'Em php, basta copiar os arquivos Php, em Java, basta copiar o jar');


DROP TABLE matricula;

CREATE TABLE matricula (
  id number primary key,
  aluno_id number NOT NULL,
  curso_id number NOT NULL,
  data date NOT NULL,
  tipo varchar2(20) DEFAULT '' NOT NULL
);

INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (1, 1, 1, '25-NOV-2014','PAGA_PF');
INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (2, 2, 1, '25-MAY-2015','PAGA_PJ');
INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (3, 3, 3, '21-JUL-2015','PAGA_PF');
INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (4, 4, 4, '15-MAY-2015','PAGA_CHEQUE');
INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (5, 7, 1, '10-MAR-2015', 'PAGA_BOLETO');
INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (6, 8, 3, '05-MAY-2014', 'PAGA_PJ');
INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (7, 9, 2, '07-FEB-2015', 'PAGA_PF');
INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (8, 10, 7, '15-JAN-2015', 'PAGA_PJ');
INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (9, 4, 7, '08-JUL-2014', 'PAGA_PJ');
INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (10, 8, 1, '01-JUN-2014', 'PAGA_CHEQUE');
INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (11, 1, 4, '10-NOV-2014', 'PAGA_BOLETO');
INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (12, 2, 4, '01-OCT-2014', 'PAGA_PJ');
INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (13, 3, 4, '15-NOV-2014', 'PAGA_PF');
INSERT INTO matricula (id, aluno_id, curso_id, data, tipo) VALUES (14, 2, 2, '04-JAN-2015', 'PAGA_PJ');

DROP TABLE nota;

CREATE TABLE nota (
  id number primary key,
  resposta_id number DEFAULT NULL,
  nota number DEFAULT NULL
);

INSERT INTO nota (id, resposta_id, nota) VALUES (1, 1, 8);
INSERT INTO nota (id, resposta_id, nota) VALUES (2, 2, 0);
INSERT INTO nota (id, resposta_id, nota) VALUES (3, 3, 7);
INSERT INTO nota (id, resposta_id, nota) VALUES (4, 4, 6);
INSERT INTO nota (id, resposta_id, nota) VALUES (5, 5, 9);
INSERT INTO nota (id, resposta_id, nota) VALUES (6, 6, 10);
INSERT INTO nota (id, resposta_id, nota) VALUES (7, 7, 4);
INSERT INTO nota (id, resposta_id, nota) VALUES (8, 8, 4);
INSERT INTO nota (id, resposta_id, nota) VALUES (9, 9, 7);
INSERT INTO nota (id, resposta_id, nota) VALUES (10, 10, 8);
INSERT INTO nota (id, resposta_id, nota) VALUES (11, 11, 6);
INSERT INTO nota (id, resposta_id, nota) VALUES (12, 12, 7);
INSERT INTO nota (id, resposta_id, nota) VALUES (13, 13, 4);
INSERT INTO nota (id, resposta_id, nota) VALUES (14, 14, 9);
INSERT INTO nota (id, resposta_id, nota) VALUES (15, 15, 3);
INSERT INTO nota (id, resposta_id, nota) VALUES (16, 16, 5);
INSERT INTO nota (id, resposta_id, nota) VALUES (17, 17, 5);
INSERT INTO nota (id, resposta_id, nota) VALUES (18, 18, 5);
INSERT INTO nota (id, resposta_id, nota) VALUES (19, 19, 6);
INSERT INTO nota (id, resposta_id, nota) VALUES (20, 20, 8);
INSERT INTO nota (id, resposta_id, nota) VALUES (21, 21, 8);
INSERT INTO nota (id, resposta_id, nota) VALUES (22, 22, 9);
INSERT INTO nota (id, resposta_id, nota) VALUES (23, 23, 10);
INSERT INTO nota (id, resposta_id, nota) VALUES (24, 24, 2);
INSERT INTO nota (id, resposta_id, nota) VALUES (25, 25, 0);
INSERT INTO nota (id, resposta_id, nota) VALUES (26, 26, 1);
INSERT INTO nota (id, resposta_id, nota) VALUES (27, 27, 4);


DROP TABLE resposta;

CREATE TABLE resposta (
  id number primary key,
  exercicio_id number DEFAULT NULL,
  aluno_id number DEFAULT NULL,
  resposta_dada varchar2(85)
);

INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (1, 1, 1, 'Uma selecao');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (2, 2, 1, 'Vish, nao sei');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (3, 3, 1, 'Alterar dados');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (4, 4, 1, 'Asquecer o where e alterar tudo');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (5, 5, 1, 'Apagar coisas');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (6, 6, 1, 'Tambem nao pode esquecer o where');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (7, 7, 1, 'Inserir dados');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (8, 1, 2, 'Buscar dados');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (9, 2, 2, 'Select campos from tabela');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (10, 13, 2, 'Alterar coisas');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (11, 4, 2, 'Vish, nao sei');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (12, 16, 3, 'Tempo pra fazer algo');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (13, 17, 3, '1 a 4 semanas');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (14, 18, 3, 'Melhoria do processo');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (15, 19, 3, 'Todo dia');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (16, 20, 3, 'Reuniao de status');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (17, 21, 3, 'Todo dia');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (18, 22, 3, 'O quadro branco');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (19, 23, 3, 'Um metodo agil');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (20, 24, 3, 'Tem varios outros');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (21, 25, 4, 'Eh a internet');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (22, 26, 4, 'Browser faz requisicao, servidor manda resposta');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (23, 27, 4, 'Eh o servidor que lida com http');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (24, 28, 4, 'Nao sei');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (25, 29, 4, 'Banco de dados!');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (26, 30, 4, 'Eh colocar a app na internet');
INSERT INTO resposta (id, exercicio_id, aluno_id, resposta_dada) VALUES (27, 31, 4, 'Depende da tecnologia, mas geralmente eh levar pra um servidor que ta na internet');


DROP TABLE secao;

CREATE TABLE secao (
  id number primary key,
  curso_id number NOT NULL,
  titulo varchar2(25) DEFAULT '' NOT NULL,
  explicacao varchar2(50) NOT NULL,
  numero number NOT NULL
);

INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (1, 1, 'Aprendendo o SELECT', 'Explicacao do capitulo Aprendendo o SELECT',1);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (2, 1, 'Aprendendo o UPDATE', 'Explicacao do capitulo Aprendendo o UPDATE',2);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (3, 1, 'Aprendendo o DELETE', 'Explicacao do capitulo Aprendendo o DELETE',3);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (4, 1, 'Aprendendo o INSERT', 'Explicacao do capitulo Aprendendo o INSERT',4);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (5, 2, 'O que eh a Web?', 'Explicacao do capitulo O que eh a Web?',1);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (6, 2, 'Entendendo o MVC', 'Explicacao do capitulo Entendendo o MVC',2);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (7, 2, 'O objeto Result', 'Explicacao do capitulo O objeto Result',3);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (8, 2, 'Interceptor', 'Explicacao do capitulo Interceptor',4);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (9, 3, 'Planejando a iteracao', 'Explicacao do capitulo Planejando a iteracao',1);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (10, 3, 'Retrospectivas', 'Explicacao do capitulo Retrospectivas',2);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (11, 3, 'Reuniao Diaria', 'Explicacao do capitulo Reuniao Diaria',3);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (12, 3, 'Kanban e XP', 'Explicacao do capitulo Kanban e XP',4);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (13, 4, 'Introducao a Web', 'Explicacao do capitulo Introducao a Web',1);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (14, 4, 'O servidor Apache', 'Explicacao do capitulo O servidor Apache',2);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (15, 4, 'Lidando com o MySql', 'Explicacao do capitulo Lidando com o MySql',3);
INSERT INTO secao (id, curso_id, titulo, explicacao, numero) VALUES (16, 4, 'Instalando a aplicacao', 'Explicacao do capitulo Instalando a aplicacao',4);
