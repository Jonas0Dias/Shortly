--
-- PostgreSQL database dump
--

-- Dumped from database version 11.19
-- Dumped by pg_dump version 11.19

-- Started on 2023-03-03 17:12:05

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 32963)
-- Name: tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(36) NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 32961)
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 198
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- TOC entry 201 (class 1259 OID 32989)
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    token character varying(36) NOT NULL,
    url character varying(255) NOT NULL,
    "shortUrl" character varying(8) NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 32987)
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 200
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- TOC entry 197 (class 1259 OID 32952)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(100),
    password text NOT NULL,
    name character varying(30) NOT NULL,
    "createDate" timestamp without time zone
);


--
-- TOC entry 196 (class 1259 OID 32950)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2699 (class 2604 OID 32966)
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- TOC entry 2700 (class 2604 OID 32992)
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- TOC entry 2698 (class 2604 OID 32955)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2832 (class 0 OID 32963)
-- Dependencies: 199
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tokens VALUES (1, 2, '05b8edf6-3dda-41e7-ba5a-616e8e545ffc');


--
-- TOC entry 2834 (class 0 OID 32989)
-- Dependencies: 201
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (9, '05b8edf6-3dda-41e7-ba5a-616e8e545ffc', 'https://docs.google.com/spreadsheets/d/1vIS0xCr-KyZ8SVjWyhS8CKRjOauz2chWED_UFtRjiDY/edit#gid=214058343', 'YEnZKghL');
INSERT INTO public.urls VALUES (10, '05b8edf6-3dda-41e7-ba5a-616e8e545ffc', 'https://docs.google.com/spreadsheets/d/1vIS0xCr-KyZ8SVjWyhS8CKRjOauz2chWED_UFtRjiDY/edit#gid=214058343', 'yFdHeZj0');
INSERT INTO public.urls VALUES (11, '05b8edf6-3dda-41e7-ba5a-616e8e545ffc', 'https://docs.google.com/spreadsheets/d/1vIS0xCr-KyZ8SVjWyhS8CKRjOauz2chWED_UFtRjiDY/edit#gid=214058343', '0KgHQrED');


--
-- TOC entry 2830 (class 0 OID 32952)
-- Dependencies: 197
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'teste@gmail.com', '$2b$10$tCMPODeYEqS//MlyfLGHKeR39.um/HYGVJxdAlyJJSNvd.Z5K57z.', 'NOMETESTE', '2023-03-02 13:40:17');
INSERT INTO public.users VALUES (2, 'teste2@gmail.com', '$2b$10$2jaUrVAAG6ZsnHbUO5KRK.euaSWrAOaqP.LSPXXnZ/MsZ3AQw9G7C', 'NOMETESTE', '2023-03-02 13:40:51');
INSERT INTO public.users VALUES (3, 'teste3@gmail.com', '$2b$10$5Iy8h8bG3qd9SqihLHG2Y.o7ZxAYWk/YrvveMP6u0MfUhQI2V0LCa', 'NOMETESTE', '2023-03-02 17:39:12');
INSERT INTO public.users VALUES (4, 'jonas@gmail.com', '$2b$10$Q0Z.8G/7r1AN/h1GgO3y5.2Okp0IEpQM7YCFbDXculQfuHPpJOln6', 'jonas', '2023-03-02 18:01:39');


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 198
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tokens_id_seq', 1, true);


--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 200
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 11, true);


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 2704 (class 2606 OID 32968)
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 32994)
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 32960)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 32969)
-- Name: tokens tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2023-03-03 17:12:05

--
-- PostgreSQL database dump complete
--

