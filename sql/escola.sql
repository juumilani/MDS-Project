-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2-alpha
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.io
-- Model Author: Cassiano Maia


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
DROP DATABASE IF EXISTS escola_db;
CREATE DATABASE escola_db;
-- -- ddl-end --
-- 

\c escola_db;

-- object: public.Aluno | type: TABLE --
DROP TABLE IF EXISTS public.Aluno CASCADE;
CREATE TABLE public.Aluno(
	id smallint NOT NULL,
	nome text,
	id_Pai smallint,
	id_Turma smallint,
	CONSTRAINT Aluno_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.Aluno OWNER TO postgres;
-- ddl-end --

-- object: public.Pai | type: TABLE --
DROP TABLE IF EXISTS public.Pai CASCADE;
CREATE TABLE public.Pai(
	id smallint NOT NULL,
	Nome text,
	login text NOT NULL,
	senha smallint NOT NULL,
	CONSTRAINT Pai_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.Pai OWNER TO postgres;
-- ddl-end --

-- object: Pai_fk | type: CONSTRAINT --
ALTER TABLE public.Aluno DROP CONSTRAINT IF EXISTS Pai_fk CASCADE;
ALTER TABLE public.Aluno ADD CONSTRAINT Pai_fk FOREIGN KEY (id_Pai)
REFERENCES public.Pai (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.Turma | type: TABLE --
DROP TABLE IF EXISTS public.Turma CASCADE;
CREATE TABLE public.Turma(
	nome_Turma text NOT NULL,
	ano text,
	id smallint NOT NULL,
	CONSTRAINT turma_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.Turma OWNER TO postgres;
-- ddl-end --

-- object: Turma_fk | type: CONSTRAINT --
ALTER TABLE public.Aluno DROP CONSTRAINT IF EXISTS Turma_fk CASCADE;
ALTER TABLE public.Aluno ADD CONSTRAINT Turma_fk FOREIGN KEY (id_Turma)
REFERENCES public.Turma (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.Materia | type: TABLE --
DROP TABLE IF EXISTS public.Materia CASCADE;
CREATE TABLE public.Materia(
	nome_Materia text NOT NULL,
	id smallint NOT NULL,
	CONSTRAINT Materia_pk PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.Materia OWNER TO postgres;
-- ddl-end --

-- object: public.Aluno_cursa_Materia | type: TABLE --
DROP TABLE IF EXISTS public.Aluno_cursa_Materia CASCADE;
CREATE TABLE public.Aluno_cursa_Materia(
	id_Materia smallint NOT NULL,
	id_Aluno smallint NOT NULL,
	faltas smallint DEFAULT 0,
	CONSTRAINT Aluno_cursa_Materia_PL PRIMARY KEY (id_Materia,id_Aluno)

);
-- ddl-end --

-- object: Materia_fk | type: CONSTRAINT --
ALTER TABLE public.Aluno_cursa_Materia DROP CONSTRAINT IF EXISTS Materia_fk CASCADE;
ALTER TABLE public.Aluno_cursa_Materia ADD CONSTRAINT Materia_fk FOREIGN KEY (id_Materia)
REFERENCES public.Materia (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: Aluno_fk | type: CONSTRAINT --
ALTER TABLE public.Aluno_cursa_Materia DROP CONSTRAINT IF EXISTS Aluno_fk CASCADE;
ALTER TABLE public.Aluno_cursa_Materia ADD CONSTRAINT Aluno_fk FOREIGN KEY (id_Aluno)
REFERENCES public.Aluno (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

INSERT INTO Pai (id, Nome, login, senha) VALUES (1, 'Catito', 'catito', 1234);
INSERT INTO Pai (id, Nome, login, senha) VALUES (2, 'Joao',   'joao'  , 5678);

INSERT INTO Materia (nome_Materia, id) VALUES ('Matematica', 1);
INSERT INTO Materia (nome_Materia, id) VALUES ('Portugues',  2);

INSERT INTO Turma (nome_Turma, ano, id) VALUES ('Sexto ano',  2018, 1); 
INSERT INTO Turma (nome_Turma, ano, id) VALUES ('Setimo ano', 2018, 2);

INSERT INTO Aluno (id, nome, id_Pai, id_Turma) VALUES (1, 'Catitin', 1, 1);
INSERT INTO Aluno (id, nome, id_Pai, id_Turma) VALUES (2, 'Joaozin', 2, 2);