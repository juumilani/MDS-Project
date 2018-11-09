-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2-alpha
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: public."Aluno" | type: TABLE --
-- DROP TABLE IF EXISTS public."Aluno" CASCADE;
CREATE TABLE public."Aluno"(
	id smallint NOT NULL,
	nome text,
	"Id_Pai" smallint,
	"id_Turma" smallint,
	CONSTRAINT "Aluno_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."Aluno" OWNER TO postgres;
-- ddl-end --

-- object: public."Pai" | type: TABLE --
-- DROP TABLE IF EXISTS public."Pai" CASCADE;
CREATE TABLE public."Pai"(
	"Id" smallint NOT NULL,
	"Nome" text,
	login text NOT NULL,
	senha smallint NOT NULL,
	CONSTRAINT "Pai_pk" PRIMARY KEY ("Id")

);
-- ddl-end --
ALTER TABLE public."Pai" OWNER TO postgres;
-- ddl-end --

-- object: "Pai_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Aluno" DROP CONSTRAINT IF EXISTS "Pai_fk" CASCADE;
ALTER TABLE public."Aluno" ADD CONSTRAINT "Pai_fk" FOREIGN KEY ("Id_Pai")
REFERENCES public."Pai" ("Id") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Turma" | type: TABLE --
-- DROP TABLE IF EXISTS public."Turma" CASCADE;
CREATE TABLE public."Turma"(
	"Nome" text NOT NULL,
	"Ano" text,
	id smallint NOT NULL,
	CONSTRAINT "Turma_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."Turma" OWNER TO postgres;
-- ddl-end --

-- object: "Turma_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Aluno" DROP CONSTRAINT IF EXISTS "Turma_fk" CASCADE;
ALTER TABLE public."Aluno" ADD CONSTRAINT "Turma_fk" FOREIGN KEY ("id_Turma")
REFERENCES public."Turma" (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Materia" | type: TABLE --
-- DROP TABLE IF EXISTS public."Materia" CASCADE;
CREATE TABLE public."Materia"(
	"Nome" text NOT NULL,
	id smallint NOT NULL,
	CONSTRAINT "Materia_pk" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."Materia" OWNER TO postgres;
-- ddl-end --

-- object: public."many_Materia_has_many_Aluno" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_Materia_has_many_Aluno" CASCADE;
CREATE TABLE public."many_Materia_has_many_Aluno"(
	"id_Materia" smallint NOT NULL,
	"id_Aluno" smallint NOT NULL,
	"Faltas" smallint DEFAULT 0,
	CONSTRAINT "many_Materia_has_many_Aluno_pk" PRIMARY KEY ("id_Materia","id_Aluno")

);
-- ddl-end --

-- object: "Materia_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_Materia_has_many_Aluno" DROP CONSTRAINT IF EXISTS "Materia_fk" CASCADE;
ALTER TABLE public."many_Materia_has_many_Aluno" ADD CONSTRAINT "Materia_fk" FOREIGN KEY ("id_Materia")
REFERENCES public."Materia" (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "Aluno_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_Materia_has_many_Aluno" DROP CONSTRAINT IF EXISTS "Aluno_fk" CASCADE;
ALTER TABLE public."many_Materia_has_many_Aluno" ADD CONSTRAINT "Aluno_fk" FOREIGN KEY ("id_Aluno")
REFERENCES public."Aluno" (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


