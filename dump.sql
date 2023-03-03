--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: jonas
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO jonas;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tokens; Type: TABLE; Schema: public; Owner: jonas
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character(36) NOT NULL
);


ALTER TABLE public.tokens OWNER TO jonas;

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: jonas
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO jonas;

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jonas
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: jonas
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    token character varying(36) NOT NULL,
    url character varying(255) NOT NULL,
    "shortUrl" character varying(8) NOT NULL
);


ALTER TABLE public.urls OWNER TO jonas;

--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: jonas
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.urls_id_seq OWNER TO jonas;

--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jonas
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jonas
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(100),
    password text NOT NULL,
    name character varying(30) NOT NULL,
    "createDate" date
);


ALTER TABLE public.users OWNER TO jonas;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jonas
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO jonas;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jonas
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: jonas
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: jonas
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: jonas
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: jonas
--

COPY public.tokens (id, user_id, token) FROM stdin;
\.


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: jonas
--

COPY public.urls (id, token, url, "shortUrl") FROM stdin;
1	Bearer	https://chat.openai.com/chat	iKVLyWLd
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jonas
--

COPY public.users (id, email, password, name, "createDate") FROM stdin;
1	rodrigo@test.com	$2b$10$hzHm4.mJ7rk1FGcjxsUvoeQosCnEVyASi/QyqeZmuRTQvYMf4dWay	rodrigo	2023-03-02
\.


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jonas
--

SELECT pg_catalog.setval('public.tokens_id_seq', 1, false);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jonas
--

SELECT pg_catalog.setval('public.urls_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jonas
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: jonas
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: jonas
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_token_key UNIQUE (token);


--
-- Name: tokens tokens_user_id_key; Type: CONSTRAINT; Schema: public; Owner: jonas
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_user_id_key UNIQUE (user_id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: jonas
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: jonas
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jonas
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jonas
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO jonas;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES  TO jonas;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS  TO jonas;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO jonas;


--
-- PostgreSQL database dump complete
--

