--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

-- Started on 2024-05-02 22:44:20 EDT

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

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 32785)
-- Name: contacts; Type: TABLE; Schema: public; Owner: xyron
--

CREATE TABLE public.contacts (
    id bigint NOT NULL,
    firstname character varying,
    lastname character varying,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.contacts OWNER TO xyron;

--
-- TOC entry 211 (class 1259 OID 32784)
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: xyron
--

CREATE SEQUENCE public.contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO xyron;

--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 211
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xyron
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- TOC entry 3214 (class 2604 OID 32788)
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- TOC entry 3357 (class 0 OID 32785)
-- Dependencies: 212
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.contacts (id, firstname, lastname, email, created_at, updated_at) FROM stdin;
10214567667	Brian	Halligan (Sample Contact)	bh@hubspot.com	2024-04-29 02:33:19.568	2024-04-29 15:30:29.311
10222649571	Maria	Johnson (Sample Contact)	emailmaria@hubspot.com	2024-04-29 02:33:19.278	2024-04-29 02:33:37.409
10657857229	John	Doe	john@hubspot.com	2024-05-01 11:54:53.749	2024-05-01 11:55:26.289
\.


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 211
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xyron
--

SELECT pg_catalog.setval('public.contacts_id_seq', 1, false);


--
-- TOC entry 3216 (class 2606 OID 32792)
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


-- Completed on 2024-05-02 22:44:20 EDT

--
-- PostgreSQL database dump complete
--

