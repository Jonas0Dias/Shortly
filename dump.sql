CREATE DATABASE shortly
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


-- Table: public.tokens

-- DROP TABLE IF EXISTS public.tokens;

CREATE TABLE IF NOT EXISTS public.tokens
(
    id integer NOT NULL DEFAULT 'nextval('tokens_id_seq'::regclass)',
    user_id integer NOT NULL,
    token character varying(36) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tokens_pkey PRIMARY KEY (id),
    CONSTRAINT tokens_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tokens
    OWNER to postgres;

    -- Table: public.urls

-- DROP TABLE IF EXISTS public.urls;

CREATE TABLE IF NOT EXISTS public.urls
(
    id integer NOT NULL DEFAULT 'nextval('urls_id_seq'::regclass)',
    token character varying(36) COLLATE pg_catalog."default" NOT NULL,
    url character varying(255) COLLATE pg_catalog."default" NOT NULL,
    "shortUrl" character varying(8) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT urls_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.urls
    OWNER to postgres;

    -- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL DEFAULT 'nextval('users_id_seq'::regclass)',
    email character varying(100) COLLATE pg_catalog."default",
    password text COLLATE pg_catalog."default" NOT NULL,
    name character varying(30) COLLATE pg_catalog."default" NOT NULL,
    "createDate" timestamp without time zone,
    CONSTRAINT users_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;


