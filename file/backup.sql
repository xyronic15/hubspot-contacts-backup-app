--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

-- Started on 2024-05-02 22:37:05 EDT

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
-- TOC entry 210 (class 1259 OID 32777)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: xyron
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO xyron;

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
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 211
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xyron
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- TOC entry 209 (class 1259 OID 32770)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: xyron
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO xyron;

--
-- TOC entry 222 (class 1259 OID 32867)
-- Name: solid_queue_blocked_executions; Type: TABLE; Schema: public; Owner: xyron
--

CREATE TABLE public.solid_queue_blocked_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    queue_name character varying NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    concurrency_key character varying NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_blocked_executions OWNER TO xyron;

--
-- TOC entry 221 (class 1259 OID 32866)
-- Name: solid_queue_blocked_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: xyron
--

CREATE SEQUENCE public.solid_queue_blocked_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_blocked_executions_id_seq OWNER TO xyron;

--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 221
-- Name: solid_queue_blocked_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xyron
--

ALTER SEQUENCE public.solid_queue_blocked_executions_id_seq OWNED BY public.solid_queue_blocked_executions.id;


--
-- TOC entry 220 (class 1259 OID 32858)
-- Name: solid_queue_claimed_executions; Type: TABLE; Schema: public; Owner: xyron
--

CREATE TABLE public.solid_queue_claimed_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    process_id bigint,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_claimed_executions OWNER TO xyron;

--
-- TOC entry 219 (class 1259 OID 32857)
-- Name: solid_queue_claimed_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: xyron
--

CREATE SEQUENCE public.solid_queue_claimed_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_claimed_executions_id_seq OWNER TO xyron;

--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 219
-- Name: solid_queue_claimed_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xyron
--

ALTER SEQUENCE public.solid_queue_claimed_executions_id_seq OWNED BY public.solid_queue_claimed_executions.id;


--
-- TOC entry 224 (class 1259 OID 32879)
-- Name: solid_queue_failed_executions; Type: TABLE; Schema: public; Owner: xyron
--

CREATE TABLE public.solid_queue_failed_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    error text,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_failed_executions OWNER TO xyron;

--
-- TOC entry 223 (class 1259 OID 32878)
-- Name: solid_queue_failed_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: xyron
--

CREATE SEQUENCE public.solid_queue_failed_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_failed_executions_id_seq OWNER TO xyron;

--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 223
-- Name: solid_queue_failed_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xyron
--

ALTER SEQUENCE public.solid_queue_failed_executions_id_seq OWNED BY public.solid_queue_failed_executions.id;


--
-- TOC entry 214 (class 1259 OID 32818)
-- Name: solid_queue_jobs; Type: TABLE; Schema: public; Owner: xyron
--

CREATE TABLE public.solid_queue_jobs (
    id bigint NOT NULL,
    queue_name character varying NOT NULL,
    class_name character varying NOT NULL,
    arguments text,
    priority integer DEFAULT 0 NOT NULL,
    active_job_id character varying,
    scheduled_at timestamp(6) without time zone,
    finished_at timestamp(6) without time zone,
    concurrency_key character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_jobs OWNER TO xyron;

--
-- TOC entry 213 (class 1259 OID 32817)
-- Name: solid_queue_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: xyron
--

CREATE SEQUENCE public.solid_queue_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_jobs_id_seq OWNER TO xyron;

--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 213
-- Name: solid_queue_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xyron
--

ALTER SEQUENCE public.solid_queue_jobs_id_seq OWNED BY public.solid_queue_jobs.id;


--
-- TOC entry 226 (class 1259 OID 32889)
-- Name: solid_queue_pauses; Type: TABLE; Schema: public; Owner: xyron
--

CREATE TABLE public.solid_queue_pauses (
    id bigint NOT NULL,
    queue_name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_pauses OWNER TO xyron;

--
-- TOC entry 225 (class 1259 OID 32888)
-- Name: solid_queue_pauses_id_seq; Type: SEQUENCE; Schema: public; Owner: xyron
--

CREATE SEQUENCE public.solid_queue_pauses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_pauses_id_seq OWNER TO xyron;

--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 225
-- Name: solid_queue_pauses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xyron
--

ALTER SEQUENCE public.solid_queue_pauses_id_seq OWNED BY public.solid_queue_pauses.id;


--
-- TOC entry 228 (class 1259 OID 32899)
-- Name: solid_queue_processes; Type: TABLE; Schema: public; Owner: xyron
--

CREATE TABLE public.solid_queue_processes (
    id bigint NOT NULL,
    kind character varying NOT NULL,
    last_heartbeat_at timestamp(6) without time zone NOT NULL,
    supervisor_id bigint,
    pid integer NOT NULL,
    hostname character varying,
    metadata text,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_processes OWNER TO xyron;

--
-- TOC entry 227 (class 1259 OID 32898)
-- Name: solid_queue_processes_id_seq; Type: SEQUENCE; Schema: public; Owner: xyron
--

CREATE SEQUENCE public.solid_queue_processes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_processes_id_seq OWNER TO xyron;

--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 227
-- Name: solid_queue_processes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xyron
--

ALTER SEQUENCE public.solid_queue_processes_id_seq OWNED BY public.solid_queue_processes.id;


--
-- TOC entry 218 (class 1259 OID 32845)
-- Name: solid_queue_ready_executions; Type: TABLE; Schema: public; Owner: xyron
--

CREATE TABLE public.solid_queue_ready_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    queue_name character varying NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_ready_executions OWNER TO xyron;

--
-- TOC entry 217 (class 1259 OID 32844)
-- Name: solid_queue_ready_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: xyron
--

CREATE SEQUENCE public.solid_queue_ready_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_ready_executions_id_seq OWNER TO xyron;

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 217
-- Name: solid_queue_ready_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xyron
--

ALTER SEQUENCE public.solid_queue_ready_executions_id_seq OWNED BY public.solid_queue_ready_executions.id;


--
-- TOC entry 232 (class 1259 OID 32949)
-- Name: solid_queue_recurring_executions; Type: TABLE; Schema: public; Owner: xyron
--

CREATE TABLE public.solid_queue_recurring_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    task_key character varying NOT NULL,
    run_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_recurring_executions OWNER TO xyron;

--
-- TOC entry 231 (class 1259 OID 32948)
-- Name: solid_queue_recurring_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: xyron
--

CREATE SEQUENCE public.solid_queue_recurring_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_recurring_executions_id_seq OWNER TO xyron;

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 231
-- Name: solid_queue_recurring_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xyron
--

ALTER SEQUENCE public.solid_queue_recurring_executions_id_seq OWNED BY public.solid_queue_recurring_executions.id;


--
-- TOC entry 216 (class 1259 OID 32833)
-- Name: solid_queue_scheduled_executions; Type: TABLE; Schema: public; Owner: xyron
--

CREATE TABLE public.solid_queue_scheduled_executions (
    id bigint NOT NULL,
    job_id bigint NOT NULL,
    queue_name character varying NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    scheduled_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_scheduled_executions OWNER TO xyron;

--
-- TOC entry 215 (class 1259 OID 32832)
-- Name: solid_queue_scheduled_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: xyron
--

CREATE SEQUENCE public.solid_queue_scheduled_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_scheduled_executions_id_seq OWNER TO xyron;

--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 215
-- Name: solid_queue_scheduled_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xyron
--

ALTER SEQUENCE public.solid_queue_scheduled_executions_id_seq OWNED BY public.solid_queue_scheduled_executions.id;


--
-- TOC entry 230 (class 1259 OID 32910)
-- Name: solid_queue_semaphores; Type: TABLE; Schema: public; Owner: xyron
--

CREATE TABLE public.solid_queue_semaphores (
    id bigint NOT NULL,
    key character varying NOT NULL,
    value integer DEFAULT 1 NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_semaphores OWNER TO xyron;

--
-- TOC entry 229 (class 1259 OID 32909)
-- Name: solid_queue_semaphores_id_seq; Type: SEQUENCE; Schema: public; Owner: xyron
--

CREATE SEQUENCE public.solid_queue_semaphores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solid_queue_semaphores_id_seq OWNER TO xyron;

--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 229
-- Name: solid_queue_semaphores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xyron
--

ALTER SEQUENCE public.solid_queue_semaphores_id_seq OWNED BY public.solid_queue_semaphores.id;


--
-- TOC entry 3227 (class 2604 OID 32788)
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 32870)
-- Name: solid_queue_blocked_executions id; Type: DEFAULT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_blocked_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_blocked_executions_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 32861)
-- Name: solid_queue_claimed_executions id; Type: DEFAULT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_claimed_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_claimed_executions_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 32882)
-- Name: solid_queue_failed_executions id; Type: DEFAULT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_failed_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_failed_executions_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 32821)
-- Name: solid_queue_jobs id; Type: DEFAULT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_jobs ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_jobs_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 32892)
-- Name: solid_queue_pauses id; Type: DEFAULT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_pauses ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_pauses_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 32902)
-- Name: solid_queue_processes id; Type: DEFAULT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_processes ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_processes_id_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 32848)
-- Name: solid_queue_ready_executions id; Type: DEFAULT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_ready_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_ready_executions_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 32952)
-- Name: solid_queue_recurring_executions id; Type: DEFAULT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_recurring_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_recurring_executions_id_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 32836)
-- Name: solid_queue_scheduled_executions id; Type: DEFAULT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_scheduled_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_scheduled_executions_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 32913)
-- Name: solid_queue_semaphores id; Type: DEFAULT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_semaphores ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_semaphores_id_seq'::regclass);


--
-- TOC entry 3439 (class 0 OID 32777)
-- Dependencies: 210
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-04-29 20:56:25.44556	2024-04-29 20:56:25.445566
\.


--
-- TOC entry 3441 (class 0 OID 32785)
-- Dependencies: 212
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.contacts (id, firstname, lastname, email, created_at, updated_at) FROM stdin;
10214567667	Brian	Halligan (Sample Contact)	bh@hubspot.com	2024-04-29 02:33:19.568	2024-04-29 15:30:29.311
10222649571	Maria	Johnson (Sample Contact)	emailmaria@hubspot.com	2024-04-29 02:33:19.278	2024-04-29 02:33:37.409
10657857229	John	Doe	john@hubspot.com	2024-05-01 11:54:53.749	2024-05-01 11:55:26.289
\.


--
-- TOC entry 3438 (class 0 OID 32770)
-- Dependencies: 209
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.schema_migrations (version) FROM stdin;
20240429205045
20240503015620
20240503015621
20240503015622
\.


--
-- TOC entry 3451 (class 0 OID 32867)
-- Dependencies: 222
-- Data for Name: solid_queue_blocked_executions; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.solid_queue_blocked_executions (id, job_id, queue_name, priority, concurrency_key, expires_at, created_at) FROM stdin;
\.


--
-- TOC entry 3449 (class 0 OID 32858)
-- Dependencies: 220
-- Data for Name: solid_queue_claimed_executions; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.solid_queue_claimed_executions (id, job_id, process_id, created_at) FROM stdin;
22	22	20	2024-05-03 02:37:05.177637
\.


--
-- TOC entry 3453 (class 0 OID 32879)
-- Dependencies: 224
-- Data for Name: solid_queue_failed_executions; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.solid_queue_failed_executions (id, job_id, error, created_at) FROM stdin;
\.


--
-- TOC entry 3443 (class 0 OID 32818)
-- Dependencies: 214
-- Data for Name: solid_queue_jobs; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.solid_queue_jobs (id, queue_name, class_name, arguments, priority, active_job_id, scheduled_at, finished_at, concurrency_key, created_at, updated_at) FROM stdin;
1	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"1d9c56e5-515a-4f51-981a-d6661fcaa4c2","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:18:48.515387500Z","scheduled_at":"2024-05-03T02:18:48.515329400Z"}	0	1d9c56e5-515a-4f51-981a-d6661fcaa4c2	2024-05-03 02:18:48.515329	2024-05-03 02:18:49.343816	\N	2024-05-03 02:18:48.576934	2024-05-03 02:18:49.343816
2	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"9de1ab77-674b-4250-ac4c-9b77d8110278","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:13.034318500Z","scheduled_at":"2024-05-03T02:35:13.034186800Z"}	0	9de1ab77-674b-4250-ac4c-9b77d8110278	2024-05-03 02:35:13.034186	2024-05-03 02:35:14.105484	\N	2024-05-03 02:35:13.119825	2024-05-03 02:35:14.105484
3	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"5499143b-1850-4357-a838-8d686f08236a","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:14.001727500Z","scheduled_at":"2024-05-03T02:35:14.001705500Z"}	0	5499143b-1850-4357-a838-8d686f08236a	2024-05-03 02:35:14.001705	2024-05-03 02:35:14.478688	\N	2024-05-03 02:35:14.00195	2024-05-03 02:35:14.478688
4	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"b0c757ee-7688-4755-9822-784f60f774f5","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:15.001887200Z","scheduled_at":"2024-05-03T02:35:15.001859800Z"}	0	b0c757ee-7688-4755-9822-784f60f774f5	2024-05-03 02:35:15.001859	2024-05-03 02:35:15.484956	\N	2024-05-03 02:35:15.00219	2024-05-03 02:35:15.484956
5	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"e476b995-3383-4e77-b9a3-486e13cc62b2","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:16.001851700Z","scheduled_at":"2024-05-03T02:35:16.001829100Z"}	0	e476b995-3383-4e77-b9a3-486e13cc62b2	2024-05-03 02:35:16.001829	2024-05-03 02:35:16.558558	\N	2024-05-03 02:35:16.002095	2024-05-03 02:35:16.558558
6	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"743bdc93-bf43-42d5-b095-cd69586ed2be","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:17.001787600Z","scheduled_at":"2024-05-03T02:35:17.001764100Z"}	0	743bdc93-bf43-42d5-b095-cd69586ed2be	2024-05-03 02:35:17.001764	2024-05-03 02:35:17.439122	\N	2024-05-03 02:35:17.002038	2024-05-03 02:35:17.439122
7	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"7a445e97-be32-4c3b-9b8d-01afd5f0ebc2","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:18.001448000Z","scheduled_at":"2024-05-03T02:35:18.001431000Z"}	0	7a445e97-be32-4c3b-9b8d-01afd5f0ebc2	2024-05-03 02:35:18.001431	2024-05-03 02:35:18.392193	\N	2024-05-03 02:35:18.001661	2024-05-03 02:35:18.392193
8	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"9b809e7b-65cc-4794-b982-967750a2d81d","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:19.001499300Z","scheduled_at":"2024-05-03T02:35:19.001482200Z"}	0	9b809e7b-65cc-4794-b982-967750a2d81d	2024-05-03 02:35:19.001482	2024-05-03 02:35:19.383721	\N	2024-05-03 02:35:19.001693	2024-05-03 02:35:19.383721
9	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"7b4f6540-85ad-43ce-955f-a70b78c42f82","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:20.002317600Z","scheduled_at":"2024-05-03T02:35:20.002300800Z"}	0	7b4f6540-85ad-43ce-955f-a70b78c42f82	2024-05-03 02:35:20.0023	2024-05-03 02:35:20.39003	\N	2024-05-03 02:35:20.00251	2024-05-03 02:35:20.39003
10	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"84a73196-0a7a-48d2-8866-022bfaf89248","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:21.001562000Z","scheduled_at":"2024-05-03T02:35:21.001543400Z"}	0	84a73196-0a7a-48d2-8866-022bfaf89248	2024-05-03 02:35:21.001543	2024-05-03 02:35:21.475336	\N	2024-05-03 02:35:21.001822	2024-05-03 02:35:21.475336
11	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"258b2b4e-227d-417d-a8ff-77de8d687288","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:22.001322400Z","scheduled_at":"2024-05-03T02:35:22.001305800Z"}	0	258b2b4e-227d-417d-a8ff-77de8d687288	2024-05-03 02:35:22.001305	2024-05-03 02:35:22.480875	\N	2024-05-03 02:35:22.001528	2024-05-03 02:35:22.480875
12	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"77ccaea5-cfc2-4fca-ac29-96ce2dedf03e","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:23.003818500Z","scheduled_at":"2024-05-03T02:35:23.003766600Z"}	0	77ccaea5-cfc2-4fca-ac29-96ce2dedf03e	2024-05-03 02:35:23.003766	2024-05-03 02:35:23.500735	\N	2024-05-03 02:35:23.004482	2024-05-03 02:35:23.500735
13	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"1d93ddb9-3042-437f-bc7d-0c4c095d5517","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:24.002430300Z","scheduled_at":"2024-05-03T02:35:24.002408900Z"}	0	1d93ddb9-3042-437f-bc7d-0c4c095d5517	2024-05-03 02:35:24.002408	2024-05-03 02:35:24.366653	\N	2024-05-03 02:35:24.002686	2024-05-03 02:35:24.366653
14	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"bbd4edc0-d7ef-408a-9e09-91e571c55623","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:25.001729800Z","scheduled_at":"2024-05-03T02:35:25.001707500Z"}	0	bbd4edc0-d7ef-408a-9e09-91e571c55623	2024-05-03 02:35:25.001707	2024-05-03 02:35:25.439153	\N	2024-05-03 02:35:25.00194	2024-05-03 02:35:25.439153
15	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"cf8a8d8d-80cf-4001-96bf-aa117a6eab0a","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:26.005863200Z","scheduled_at":"2024-05-03T02:35:26.005808900Z"}	0	cf8a8d8d-80cf-4001-96bf-aa117a6eab0a	2024-05-03 02:35:26.005808	2024-05-03 02:35:26.417421	\N	2024-05-03 02:35:26.006568	2024-05-03 02:35:26.417421
16	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"ca15c6a5-5f65-4a76-a722-74e813d62060","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:27.002445400Z","scheduled_at":"2024-05-03T02:35:27.002425300Z"}	0	ca15c6a5-5f65-4a76-a722-74e813d62060	2024-05-03 02:35:27.002425	2024-05-03 02:35:27.572732	\N	2024-05-03 02:35:27.00268	2024-05-03 02:35:27.572732
17	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"faf89b16-5c95-4cf5-8fef-e7fd99cc50c3","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:28.004043000Z","scheduled_at":"2024-05-03T02:35:28.003989700Z"}	0	faf89b16-5c95-4cf5-8fef-e7fd99cc50c3	2024-05-03 02:35:28.003989	2024-05-03 02:35:28.463176	\N	2024-05-03 02:35:28.004799	2024-05-03 02:35:28.463176
18	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"bad73809-900a-4f89-af88-2323f9ceb77f","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:29.003966500Z","scheduled_at":"2024-05-03T02:35:29.003928300Z"}	0	bad73809-900a-4f89-af88-2323f9ceb77f	2024-05-03 02:35:29.003928	2024-05-03 02:35:29.524093	\N	2024-05-03 02:35:29.004566	2024-05-03 02:35:29.524093
19	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"0c396d27-3c9a-4c03-9568-bff97fb7352c","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:30.004297000Z","scheduled_at":"2024-05-03T02:35:30.004244800Z"}	0	0c396d27-3c9a-4c03-9568-bff97fb7352c	2024-05-03 02:35:30.004244	2024-05-03 02:35:30.603381	\N	2024-05-03 02:35:30.004894	2024-05-03 02:35:30.603381
20	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"342dadb9-05f3-4a37-8248-96435ce07767","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:31.001763600Z","scheduled_at":"2024-05-03T02:35:31.001746800Z"}	0	342dadb9-05f3-4a37-8248-96435ce07767	2024-05-03 02:35:31.001746	2024-05-03 02:35:31.371992	\N	2024-05-03 02:35:31.001956	2024-05-03 02:35:31.371992
21	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"5d4e7a37-457c-4756-baa8-b3558499f71b","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:35:32.001528700Z","scheduled_at":"2024-05-03T02:35:32.001500600Z"}	0	5d4e7a37-457c-4756-baa8-b3558499f71b	2024-05-03 02:35:32.0015	2024-05-03 02:35:32.600327	\N	2024-05-03 02:35:32.001868	2024-05-03 02:35:32.600327
22	default	BackupContactsJob	{"job_class":"BackupContactsJob","job_id":"d503320d-eee0-4756-9e9b-bf181fdab08e","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2024-05-03T02:37:05.035583200Z","scheduled_at":"2024-05-03T02:37:05.035489700Z"}	0	d503320d-eee0-4756-9e9b-bf181fdab08e	2024-05-03 02:37:05.035489	\N	\N	2024-05-03 02:37:05.064679	2024-05-03 02:37:05.064679
\.


--
-- TOC entry 3455 (class 0 OID 32889)
-- Dependencies: 226
-- Data for Name: solid_queue_pauses; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.solid_queue_pauses (id, queue_name, created_at) FROM stdin;
\.


--
-- TOC entry 3457 (class 0 OID 32899)
-- Dependencies: 228
-- Data for Name: solid_queue_processes; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.solid_queue_processes (id, kind, last_heartbeat_at, supervisor_id, pid, hostname, metadata, created_at) FROM stdin;
19	Supervisor	2024-05-03 02:37:05.383025	\N	7985	DESKTOP-VSOVEJO	\N	2024-05-03 02:36:05.372385
21	Dispatcher	2024-05-03 02:37:05.435915	19	8129	DESKTOP-VSOVEJO	{"polling_interval":1,"batch_size":500,"concurrency_maintenance_interval":600,"recurring_schedule":{"backup_contacts_job":{"schedule":"5 * * * * *","class_name":"BackupContactsJob","arguments":[]}}}	2024-05-03 02:36:05.395079
20	Worker	2024-05-03 02:37:05.435653	19	8133	DESKTOP-VSOVEJO	{"polling_interval":0.1,"queues":"*","thread_pool_size":3}	2024-05-03 02:36:05.396229
\.


--
-- TOC entry 3447 (class 0 OID 32845)
-- Dependencies: 218
-- Data for Name: solid_queue_ready_executions; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.solid_queue_ready_executions (id, job_id, queue_name, priority, created_at) FROM stdin;
\.


--
-- TOC entry 3461 (class 0 OID 32949)
-- Dependencies: 232
-- Data for Name: solid_queue_recurring_executions; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.solid_queue_recurring_executions (id, job_id, task_key, run_at, created_at) FROM stdin;
1	2	backup_contacts_job	2024-05-03 02:35:13	2024-05-03 02:35:13.165512
2	3	backup_contacts_job	2024-05-03 02:35:14	2024-05-03 02:35:14.073478
3	4	backup_contacts_job	2024-05-03 02:35:15	2024-05-03 02:35:15.017214
4	5	backup_contacts_job	2024-05-03 02:35:16	2024-05-03 02:35:16.014234
5	6	backup_contacts_job	2024-05-03 02:35:17	2024-05-03 02:35:17.01539
6	7	backup_contacts_job	2024-05-03 02:35:18	2024-05-03 02:35:18.017453
7	8	backup_contacts_job	2024-05-03 02:35:19	2024-05-03 02:35:19.02292
8	9	backup_contacts_job	2024-05-03 02:35:20	2024-05-03 02:35:20.012447
9	10	backup_contacts_job	2024-05-03 02:35:21	2024-05-03 02:35:21.015402
10	11	backup_contacts_job	2024-05-03 02:35:22	2024-05-03 02:35:22.016241
11	12	backup_contacts_job	2024-05-03 02:35:23	2024-05-03 02:35:23.027459
12	13	backup_contacts_job	2024-05-03 02:35:24	2024-05-03 02:35:24.029275
13	14	backup_contacts_job	2024-05-03 02:35:25	2024-05-03 02:35:25.012699
14	15	backup_contacts_job	2024-05-03 02:35:26	2024-05-03 02:35:26.016752
15	16	backup_contacts_job	2024-05-03 02:35:27	2024-05-03 02:35:27.015172
16	17	backup_contacts_job	2024-05-03 02:35:28	2024-05-03 02:35:28.028596
17	18	backup_contacts_job	2024-05-03 02:35:29	2024-05-03 02:35:29.01972
18	19	backup_contacts_job	2024-05-03 02:35:30	2024-05-03 02:35:30.016927
19	20	backup_contacts_job	2024-05-03 02:35:31	2024-05-03 02:35:31.011337
20	21	backup_contacts_job	2024-05-03 02:35:32	2024-05-03 02:35:32.015781
21	22	backup_contacts_job	2024-05-03 02:37:05	2024-05-03 02:37:05.098568
\.


--
-- TOC entry 3445 (class 0 OID 32833)
-- Dependencies: 216
-- Data for Name: solid_queue_scheduled_executions; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.solid_queue_scheduled_executions (id, job_id, queue_name, priority, scheduled_at, created_at) FROM stdin;
\.


--
-- TOC entry 3459 (class 0 OID 32910)
-- Dependencies: 230
-- Data for Name: solid_queue_semaphores; Type: TABLE DATA; Schema: public; Owner: xyron
--

COPY public.solid_queue_semaphores (id, key, value, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 211
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xyron
--

SELECT pg_catalog.setval('public.contacts_id_seq', 1, false);


--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 221
-- Name: solid_queue_blocked_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xyron
--

SELECT pg_catalog.setval('public.solid_queue_blocked_executions_id_seq', 1, false);


--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 219
-- Name: solid_queue_claimed_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xyron
--

SELECT pg_catalog.setval('public.solid_queue_claimed_executions_id_seq', 22, true);


--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 223
-- Name: solid_queue_failed_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xyron
--

SELECT pg_catalog.setval('public.solid_queue_failed_executions_id_seq', 1, false);


--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 213
-- Name: solid_queue_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xyron
--

SELECT pg_catalog.setval('public.solid_queue_jobs_id_seq', 22, true);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 225
-- Name: solid_queue_pauses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xyron
--

SELECT pg_catalog.setval('public.solid_queue_pauses_id_seq', 1, false);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 227
-- Name: solid_queue_processes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xyron
--

SELECT pg_catalog.setval('public.solid_queue_processes_id_seq', 21, true);


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 217
-- Name: solid_queue_ready_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xyron
--

SELECT pg_catalog.setval('public.solid_queue_ready_executions_id_seq', 22, true);


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 231
-- Name: solid_queue_recurring_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xyron
--

SELECT pg_catalog.setval('public.solid_queue_recurring_executions_id_seq', 21, true);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 215
-- Name: solid_queue_scheduled_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xyron
--

SELECT pg_catalog.setval('public.solid_queue_scheduled_executions_id_seq', 1, false);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 229
-- Name: solid_queue_semaphores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xyron
--

SELECT pg_catalog.setval('public.solid_queue_semaphores_id_seq', 1, false);


--
-- TOC entry 3246 (class 2606 OID 32783)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 3248 (class 2606 OID 32792)
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 32776)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3273 (class 2606 OID 32875)
-- Name: solid_queue_blocked_executions solid_queue_blocked_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_blocked_executions
    ADD CONSTRAINT solid_queue_blocked_executions_pkey PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 32863)
-- Name: solid_queue_claimed_executions solid_queue_claimed_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_claimed_executions
    ADD CONSTRAINT solid_queue_claimed_executions_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 32886)
-- Name: solid_queue_failed_executions solid_queue_failed_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_failed_executions
    ADD CONSTRAINT solid_queue_failed_executions_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 32826)
-- Name: solid_queue_jobs solid_queue_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_jobs
    ADD CONSTRAINT solid_queue_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 32896)
-- Name: solid_queue_pauses solid_queue_pauses_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_pauses
    ADD CONSTRAINT solid_queue_pauses_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 32906)
-- Name: solid_queue_processes solid_queue_processes_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_processes
    ADD CONSTRAINT solid_queue_processes_pkey PRIMARY KEY (id);


--
-- TOC entry 3264 (class 2606 OID 32853)
-- Name: solid_queue_ready_executions solid_queue_ready_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_ready_executions
    ADD CONSTRAINT solid_queue_ready_executions_pkey PRIMARY KEY (id);


--
-- TOC entry 3292 (class 2606 OID 32956)
-- Name: solid_queue_recurring_executions solid_queue_recurring_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_recurring_executions
    ADD CONSTRAINT solid_queue_recurring_executions_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 32841)
-- Name: solid_queue_scheduled_executions solid_queue_scheduled_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_scheduled_executions
    ADD CONSTRAINT solid_queue_scheduled_executions_pkey PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 32918)
-- Name: solid_queue_semaphores solid_queue_semaphores_pkey; Type: CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_semaphores
    ADD CONSTRAINT solid_queue_semaphores_pkey PRIMARY KEY (id);


--
-- TOC entry 3269 (class 1259 OID 32877)
-- Name: index_solid_queue_blocked_executions_for_maintenance; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_blocked_executions_for_maintenance ON public.solid_queue_blocked_executions USING btree (expires_at, concurrency_key);


--
-- TOC entry 3270 (class 1259 OID 32947)
-- Name: index_solid_queue_blocked_executions_for_release; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_blocked_executions_for_release ON public.solid_queue_blocked_executions USING btree (concurrency_key, priority, job_id);


--
-- TOC entry 3271 (class 1259 OID 32876)
-- Name: index_solid_queue_blocked_executions_on_job_id; Type: INDEX; Schema: public; Owner: xyron
--

CREATE UNIQUE INDEX index_solid_queue_blocked_executions_on_job_id ON public.solid_queue_blocked_executions USING btree (job_id);


--
-- TOC entry 3265 (class 1259 OID 32864)
-- Name: index_solid_queue_claimed_executions_on_job_id; Type: INDEX; Schema: public; Owner: xyron
--

CREATE UNIQUE INDEX index_solid_queue_claimed_executions_on_job_id ON public.solid_queue_claimed_executions USING btree (job_id);


--
-- TOC entry 3266 (class 1259 OID 32865)
-- Name: index_solid_queue_claimed_executions_on_process_id_and_job_id; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_claimed_executions_on_process_id_and_job_id ON public.solid_queue_claimed_executions USING btree (process_id, job_id);


--
-- TOC entry 3256 (class 1259 OID 32843)
-- Name: index_solid_queue_dispatch_all; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_dispatch_all ON public.solid_queue_scheduled_executions USING btree (scheduled_at, priority, job_id);


--
-- TOC entry 3274 (class 1259 OID 32887)
-- Name: index_solid_queue_failed_executions_on_job_id; Type: INDEX; Schema: public; Owner: xyron
--

CREATE UNIQUE INDEX index_solid_queue_failed_executions_on_job_id ON public.solid_queue_failed_executions USING btree (job_id);


--
-- TOC entry 3249 (class 1259 OID 32831)
-- Name: index_solid_queue_jobs_for_alerting; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_jobs_for_alerting ON public.solid_queue_jobs USING btree (scheduled_at, finished_at);


--
-- TOC entry 3250 (class 1259 OID 32830)
-- Name: index_solid_queue_jobs_for_filtering; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_jobs_for_filtering ON public.solid_queue_jobs USING btree (queue_name, finished_at);


--
-- TOC entry 3251 (class 1259 OID 32828)
-- Name: index_solid_queue_jobs_on_active_job_id; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_jobs_on_active_job_id ON public.solid_queue_jobs USING btree (active_job_id);


--
-- TOC entry 3252 (class 1259 OID 32827)
-- Name: index_solid_queue_jobs_on_class_name; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_jobs_on_class_name ON public.solid_queue_jobs USING btree (class_name);


--
-- TOC entry 3253 (class 1259 OID 32829)
-- Name: index_solid_queue_jobs_on_finished_at; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_jobs_on_finished_at ON public.solid_queue_jobs USING btree (finished_at);


--
-- TOC entry 3277 (class 1259 OID 32897)
-- Name: index_solid_queue_pauses_on_queue_name; Type: INDEX; Schema: public; Owner: xyron
--

CREATE UNIQUE INDEX index_solid_queue_pauses_on_queue_name ON public.solid_queue_pauses USING btree (queue_name);


--
-- TOC entry 3260 (class 1259 OID 32855)
-- Name: index_solid_queue_poll_all; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_poll_all ON public.solid_queue_ready_executions USING btree (priority, job_id);


--
-- TOC entry 3261 (class 1259 OID 32856)
-- Name: index_solid_queue_poll_by_queue; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_poll_by_queue ON public.solid_queue_ready_executions USING btree (queue_name, priority, job_id);


--
-- TOC entry 3280 (class 1259 OID 32907)
-- Name: index_solid_queue_processes_on_last_heartbeat_at; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_processes_on_last_heartbeat_at ON public.solid_queue_processes USING btree (last_heartbeat_at);


--
-- TOC entry 3281 (class 1259 OID 32908)
-- Name: index_solid_queue_processes_on_supervisor_id; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_processes_on_supervisor_id ON public.solid_queue_processes USING btree (supervisor_id);


--
-- TOC entry 3262 (class 1259 OID 32854)
-- Name: index_solid_queue_ready_executions_on_job_id; Type: INDEX; Schema: public; Owner: xyron
--

CREATE UNIQUE INDEX index_solid_queue_ready_executions_on_job_id ON public.solid_queue_ready_executions USING btree (job_id);


--
-- TOC entry 3289 (class 1259 OID 32957)
-- Name: index_solid_queue_recurring_executions_on_job_id; Type: INDEX; Schema: public; Owner: xyron
--

CREATE UNIQUE INDEX index_solid_queue_recurring_executions_on_job_id ON public.solid_queue_recurring_executions USING btree (job_id);


--
-- TOC entry 3290 (class 1259 OID 32958)
-- Name: index_solid_queue_recurring_executions_on_task_key_and_run_at; Type: INDEX; Schema: public; Owner: xyron
--

CREATE UNIQUE INDEX index_solid_queue_recurring_executions_on_task_key_and_run_at ON public.solid_queue_recurring_executions USING btree (task_key, run_at);


--
-- TOC entry 3257 (class 1259 OID 32842)
-- Name: index_solid_queue_scheduled_executions_on_job_id; Type: INDEX; Schema: public; Owner: xyron
--

CREATE UNIQUE INDEX index_solid_queue_scheduled_executions_on_job_id ON public.solid_queue_scheduled_executions USING btree (job_id);


--
-- TOC entry 3284 (class 1259 OID 32920)
-- Name: index_solid_queue_semaphores_on_expires_at; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_semaphores_on_expires_at ON public.solid_queue_semaphores USING btree (expires_at);


--
-- TOC entry 3285 (class 1259 OID 32919)
-- Name: index_solid_queue_semaphores_on_key; Type: INDEX; Schema: public; Owner: xyron
--

CREATE UNIQUE INDEX index_solid_queue_semaphores_on_key ON public.solid_queue_semaphores USING btree (key);


--
-- TOC entry 3286 (class 1259 OID 32921)
-- Name: index_solid_queue_semaphores_on_key_and_value; Type: INDEX; Schema: public; Owner: xyron
--

CREATE INDEX index_solid_queue_semaphores_on_key_and_value ON public.solid_queue_semaphores USING btree (key, value);


--
-- TOC entry 3298 (class 2606 OID 32959)
-- Name: solid_queue_recurring_executions fk_rails_318a5533ed; Type: FK CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_recurring_executions
    ADD CONSTRAINT fk_rails_318a5533ed FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- TOC entry 3297 (class 2606 OID 32932)
-- Name: solid_queue_failed_executions fk_rails_39bbc7a631; Type: FK CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_failed_executions
    ADD CONSTRAINT fk_rails_39bbc7a631 FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- TOC entry 3296 (class 2606 OID 32922)
-- Name: solid_queue_blocked_executions fk_rails_4cd34e2228; Type: FK CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_blocked_executions
    ADD CONSTRAINT fk_rails_4cd34e2228 FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- TOC entry 3294 (class 2606 OID 32937)
-- Name: solid_queue_ready_executions fk_rails_81fcbd66af; Type: FK CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_ready_executions
    ADD CONSTRAINT fk_rails_81fcbd66af FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- TOC entry 3295 (class 2606 OID 32927)
-- Name: solid_queue_claimed_executions fk_rails_9cfe4d4944; Type: FK CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_claimed_executions
    ADD CONSTRAINT fk_rails_9cfe4d4944 FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- TOC entry 3293 (class 2606 OID 32942)
-- Name: solid_queue_scheduled_executions fk_rails_c4316f352d; Type: FK CONSTRAINT; Schema: public; Owner: xyron
--

ALTER TABLE ONLY public.solid_queue_scheduled_executions
    ADD CONSTRAINT fk_rails_c4316f352d FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


-- Completed on 2024-05-02 22:37:05 EDT

--
-- PostgreSQL database dump complete
--

