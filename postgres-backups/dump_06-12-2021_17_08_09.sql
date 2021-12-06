--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:6+5vXDVFoOaj1QuyUJdOBQ==$6uBv7I6F2SnVV+znPUlJcOq/JFznadk3xtYMHPfIWV8=:pv5N3fQMO1Z7Cs2R21p5dwVGaC2ZX+zOJpHA2J357vM=';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0 (Debian 14.0-1.pgdg110+1)
-- Dumped by pg_dump version 14.0 (Debian 14.0-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0 (Debian 14.0-1.pgdg110+1)
-- Dumped by pg_dump version 14.0 (Debian 14.0-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: coffee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coffee (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    brand character varying NOT NULL,
    recommendations integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.coffee OWNER TO postgres;

--
-- Name: coffee_flavors_flavor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coffee_flavors_flavor (
    "coffeeId" integer NOT NULL,
    "flavorId" integer NOT NULL
);


ALTER TABLE public.coffee_flavors_flavor OWNER TO postgres;

--
-- Name: coffee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coffee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coffee_id_seq OWNER TO postgres;

--
-- Name: coffee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coffee_id_seq OWNED BY public.coffee.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    id integer NOT NULL,
    type character varying NOT NULL,
    name character varying NOT NULL,
    payload json NOT NULL
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- Name: flavor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flavor (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.flavor OWNER TO postgres;

--
-- Name: flavor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flavor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flavor_id_seq OWNER TO postgres;

--
-- Name: flavor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flavor_id_seq OWNED BY public.flavor.id;


--
-- Name: coffee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coffee ALTER COLUMN id SET DEFAULT nextval('public.coffee_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: flavor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flavor ALTER COLUMN id SET DEFAULT nextval('public.flavor_id_seq'::regclass);


--
-- Data for Name: coffee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coffee (id, name, description, brand, recommendations) FROM stdin;
1	NAME1	\N	BRAND1	0
2	NAME2	\N	BRAND2	0
3	NAME3	\N	BRAND3	0
\.


--
-- Data for Name: coffee_flavors_flavor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coffee_flavors_flavor ("coffeeId", "flavorId") FROM stdin;
1	1
2	2
3	3
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event (id, type, name, payload) FROM stdin;
\.


--
-- Data for Name: flavor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flavor (id, name) FROM stdin;
1	FLAV1
2	FLAV2
3	FLAV3
\.


--
-- Name: coffee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coffee_id_seq', 3, true);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_id_seq', 1, false);


--
-- Name: flavor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flavor_id_seq', 3, true);


--
-- Name: event PK_30c2f3bbaf6d34a55f8ae6e4614; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT "PK_30c2f3bbaf6d34a55f8ae6e4614" PRIMARY KEY (id);


--
-- Name: coffee PK_4d27239ee0b99a491ad806aec46; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coffee
    ADD CONSTRAINT "PK_4d27239ee0b99a491ad806aec46" PRIMARY KEY (id);


--
-- Name: coffee_flavors_flavor PK_64cde86968c8b440e3c63626e80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coffee_flavors_flavor
    ADD CONSTRAINT "PK_64cde86968c8b440e3c63626e80" PRIMARY KEY ("coffeeId", "flavorId");


--
-- Name: flavor PK_934fe79b3d8131395c29a040ee5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flavor
    ADD CONSTRAINT "PK_934fe79b3d8131395c29a040ee5" PRIMARY KEY (id);


--
-- Name: IDX_25642975c6f620d570c635f418; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_25642975c6f620d570c635f418" ON public.coffee_flavors_flavor USING btree ("flavorId");


--
-- Name: IDX_6e1de41532ad6af403d3ceb4f2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_6e1de41532ad6af403d3ceb4f2" ON public.event USING btree (name, type);


--
-- Name: IDX_9cb98a3799afc95cf71fdb1c4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_9cb98a3799afc95cf71fdb1c4f" ON public.coffee_flavors_flavor USING btree ("coffeeId");


--
-- Name: IDX_b535fbe8ec6d832dde22065ebd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_b535fbe8ec6d832dde22065ebd" ON public.event USING btree (name);


--
-- Name: coffee_flavors_flavor FK_25642975c6f620d570c635f418d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coffee_flavors_flavor
    ADD CONSTRAINT "FK_25642975c6f620d570c635f418d" FOREIGN KEY ("flavorId") REFERENCES public.flavor(id);


--
-- Name: coffee_flavors_flavor FK_9cb98a3799afc95cf71fdb1c4f9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coffee_flavors_flavor
    ADD CONSTRAINT "FK_9cb98a3799afc95cf71fdb1c4f9" FOREIGN KEY ("coffeeId") REFERENCES public.coffee(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

