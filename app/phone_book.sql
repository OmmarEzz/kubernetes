--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.4

-- Started on 2018-08-18 14:20:06

SET statement_timeout = 0;

SET lock_timeout = 0;

SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';

SET standard_conforming_strings = on;

SELECT pg_catalog.set_config('search_path', '', false);

SET check_function_bodies = false;

SET client_min_messages = warning;

SET row_security = off;

DROP DATABASE "phonebook";

--
-- TOC entry 2156 (class 1262 OID 16432)
-- Name: phonebook; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "phonebook" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Ukrainian_Ukraine.1251' LC_CTYPE = 'Ukrainian_Ukraine.1251';

\connect "phonebook"

SET statement_timeout = 0;

SET lock_timeout = 0;

SET idle_in_transaction_session_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

SELECT pg_catalog.set_config('search_path', '', false);

SET check_function_bodies = false;

SET client_min_messages = warning;

SET row_security = off;

--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA "public" IS 'standard public schema';

--
-- TOC entry 1 (class 3079 OID 12278)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";

--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION "plpgsql"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';

--
-- TOC entry 197 (class 1259 OID 16444)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."person_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 16436)

-- Name: persons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."persons" (
    "person_id" integer DEFAULT "nextval"('"public"."person_id_seq"'::"regclass") NOT NULL,
    "person_name" "text",
    "phone" "text"
);

--
-- TOC entry 2149 (class 0 OID 16436)
-- Dependencies: 196
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO "public"."persons" ("person_id", "person_name", "phone") VALUES (1, 'John W. Smith', '+1(719)444-5555');

INSERT INTO "public"."persons" ("person_id", "person_name", "phone") VALUES (2, 'Richard Stone', '+1(614)333-2211');

INSERT INTO "public"."persons" ("person_id", "person_name", "phone") VALUES (3, 'Jeffry Wilkins', '+1(212)818-2236');
INSERT INTO "public"."persons" ("person_id", "person_name", "phone") VALUES (4, 'William Travis', '+1(453)545-0390');

INSERT INTO "public"."persons" ("person_id", "person_name", "phone") VALUES (5, 'Tony Creek', '+1(451)452-3311');

INSERT INTO "public"."persons" ("person_id", "person_name", "phone") VALUES (6, 'Ronald Steward', '+1(718)959-4310');

INSERT INTO "public"."persons" ("person_id", "person_name", "phone") VALUES (7, 'Collin Whitney', '+1(410)541-3456');

INSERT INTO "public"."persons" ("person_id", "person_name", "phone") VALUES (8, 'Steven Cromb', '+1(461)553-4312');

INSERT INTO "public"."persons" ("person_id", "person_name", "phone") VALUES (9, 'Dave Blackstock', '+1(466)443-2228');

--
-- TOC entry 2159 (class 0 OID 0)

-- Dependencies: 197
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--
SELECT pg_catalog.setval('"public"."person_id_seq"', 9, true);

--
-- TOC entry 2027 (class 2606 OID 16443)
-- Name: persons person_id_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."persons"
    ADD CONSTRAINT "person_id_pk" PRIMARY KEY ("person_id");

-- Completed on 2018-08-18 14:20:07

--
-- PostgreSQL database dump complete
--
