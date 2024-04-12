
-- BD criado em PostgreSQL versão 15

CREATE DATABASE "Escola"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
CREATE TABLE professor
(
    codp bigint NOT NULL,
    nome varchar(255) NOT NULL,
    telefone varchar(100),
    CONSTRAINT professor_pkey PRIMARY KEY (codp)
);
commit;

CREATE TABLE disciplina
(
    codd bigint NOT NULL,
    nome varchar(255) NOT NULL,
    codp bigint NOT NULL,
    CONSTRAINT disciplina_pkey PRIMARY KEY (codd)
);
commit;

CREATE TABLE aluno
(
    coda bigint NOT NULL,
    nome varchar(255) NOT NULL,
    CONSTRAINT aluno_pkey PRIMARY KEY (coda)
);
commit;

CREATE TABLE disciplina_aluno
(
    codd bigint NOT NULL,
    coda bigint NOT NULL,
	ano integer NOT NULL,
    CONSTRAINT disciplina_aluno_pkey PRIMARY KEY (codd, coda)
);
commit;


-- Cria as chaves estrangeiras entre as tabelas

ALTER TABLE disciplina add constraint disciplina_professor_fk foreign key (codp)
    REFERENCES professor(codp);
commit;

ALTER TABLE disciplina_aluno add constraint discpaluno_disciplina_fk foreign key (codd)
    REFERENCES disciplina(codd);
commit;

ALTER TABLE disciplina_aluno add constraint discpaluno_aluno_fk foreign key (coda)
    REFERENCES aluno(coda);
commit;



-- Cria as sequences para tornar a chave primária sequencial

CREATE SEQUENCE professor_sequence START 1 INCREMENT 1;
commit;

CREATE SEQUENCE disciplina_sequence START 1 INCREMENT 1;
commit;

CREATE SEQUENCE aluno_sequence START 1 INCREMENT 1;
commit;



INSERT INTO professor
( codp, nome, telefone )
VALUES
( nextval('professor_sequence'), 'João da Silva', '(11) 97656-3455' );
commit;

INSERT INTO professor
( codp, nome, telefone )
VALUES
( nextval('professor_sequence'), 'Marcelo de Souza', '(11) 99156-2311' );
commit;


INSERT INTO disciplina
( codd, nome, codp )
VALUES
( nextval('disciplina_sequence'), 'Cálculo', 1 );
commit;

INSERT INTO disciplina
( codd, nome, codp )
VALUES
( nextval('disciplina_sequence'), 'Estatística', 1 );
commit;

INSERT INTO disciplina
( codd, nome, codp )
VALUES
( nextval('disciplina_sequence'), 'Inglês', 2 );
commit;

INSERT INTO disciplina
( codd, nome, codp )
VALUES
( nextval('disciplina_sequence'), 'Espanhol', 2 );
commit;


INSERT INTO aluno
( coda, nome )
VALUES
( nextval('aluno_sequence'), 'André Macedo' );
commit;

INSERT INTO aluno
( coda, nome )
VALUES
( nextval('aluno_sequence'), 'Bruno Lima' );
commit;

INSERT INTO aluno
( coda, nome )
VALUES
( nextval('aluno_sequence'), 'Clara de Andrade' );
commit;

INSERT INTO aluno
( coda, nome )
VALUES
( nextval('aluno_sequence'), 'Daniela de Almeida' );
commit;

INSERT INTO aluno
( coda, nome )
VALUES
( nextval('aluno_sequence'), 'Elaine de Andrade' );
commit;

INSERT INTO aluno
( coda, nome )
VALUES
( nextval('aluno_sequence'), 'Fábio Moreira' );
commit;

INSERT INTO aluno
( coda, nome )
VALUES
( nextval('aluno_sequence'), 'Gabrila Lucena' );
commit;

INSERT INTO aluno
( coda, nome )
VALUES
( nextval('aluno_sequence'), 'Heitor de Lima' );
commit;

INSERT INTO aluno
( coda, nome )
VALUES
( nextval('aluno_sequence'), 'Iara Mascarenhas' );
commit;

INSERT INTO aluno
( coda, nome )
VALUES
( nextval('aluno_sequence'), 'Juliana Mota' );
commit;



INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(1, 1, 2015);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(1, 2, 2015);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(1, 3, 2015);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(1, 4, 2015);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(1, 5, 2016);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(1, 6, 2016);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(1, 7, 2018);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(1, 8, 2018);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(1, 9, 2018);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(1, 10, 2018);
commit;



INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(2, 1, 2015);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(2, 2, 2015);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(2, 3, 2015);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(2, 4, 2015);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(2, 5, 2015);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(2, 6, 2015);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(2, 7, 2018);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(2, 8, 2018);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(2, 9, 2018);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(2, 10, 2018);
commit;


INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(3, 1, 2017);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(3, 2, 2017);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(3, 3, 2017);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(3, 4, 2017);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(3, 5, 2018);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(3, 6, 2018);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(3, 7, 2020);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(3, 8, 2020);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(3, 9, 2020);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(3, 10, 2020);
commit;


INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(4, 1, 2019);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(4, 2, 2019);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(4, 3, 2019);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(4, 4, 2019);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(4, 5, 2019);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(4, 6, 2019);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(4, 7, 2020);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(4, 8, 2020);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(4, 9, 2020);
commit;

INSERT INTO disciplina_aluno
( codd, coda, ano )
VALUES
(4, 10, 2020);
commit;


-- Consultas

-- Lista com o nome de todos os alunos matriculados na disciplina de cálculo do professor João
SELECT aluno.nome AS nome_aluno, 
 disciplina_aluno.ano AS ano,
 disciplina.nome AS disciplina
FROM disciplina 
INNER JOIN professor ON
  ( professor.codp = disciplina.codp )
INNER JOIN disciplina_aluno ON
  ( disciplina_aluno.codd = disciplina.codd )
INNER JOIN aluno ON
  ( aluno.coda = disciplina_aluno.coda )
WHERE disciplina.nome = 'Cálculo'
 AND professor.nome = 'João da Silva'
ORDER BY aluno.nome;


-- Quantidade de alunos matriculados por disciplina (independente do ano)
SELECT 
 disciplina.nome AS disciplina,
 COUNT(disciplina_aluno.coda) AS qtdealunos
FROM disciplina_aluno 
INNER JOIN disciplina ON
( disciplina.codd = disciplina_aluno.codd )
GROUP BY disciplina.nome;


-- Lista de disciplinas que todos os professores lecionam
SELECT 
 disciplina.nome AS disciplina,
 professor.nome as nome_professor
FROM disciplina
INNER JOIN professor ON
( professor.codp = disciplina.codp );


-- Consulta para contar o total de professores
SELECT 
  COUNT(professor.codp) AS qtde_professores
FROM professor;


-- Lista de todos os alunos que cursaram alguma disciplina do ano 2000 até o ano 2020
SELECT DISTINCT 
  disciplina_aluno.coda AS codigo_aluno,
  aluno.nome as nome_aluno
FROM disciplina_aluno
INNER JOIN aluno ON
  ( aluno.coda = disciplina_aluno.coda )
WHERE disciplina_aluno.ano BETWEEN 2000 AND 2020