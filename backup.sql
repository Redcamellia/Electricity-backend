--
-- PostgreSQL database dump
--

\restrict 1PSaccZHedIK5SLKgeaxPcUdHE8IhF6FShUHcRIVZKeVcbNITiUcYphMhvTBQeD

-- Dumped from database version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)

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
-- Name: comments; Type: TABLE; Schema: public; Owner: ehsan
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    author_id integer NOT NULL,
    post_id integer NOT NULL,
    content character varying(300) NOT NULL,
    parent_comment_id integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone
);


ALTER TABLE public.comments OWNER TO ehsan;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: ehsan
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comments_id_seq OWNER TO ehsan;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ehsan
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: ehsan
--

CREATE TABLE public.follows (
    id integer NOT NULL,
    follower_id integer NOT NULL,
    leader_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT follows_check CHECK ((follower_id <> leader_id))
);


ALTER TABLE public.follows OWNER TO ehsan;

--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: ehsan
--

CREATE SEQUENCE public.follows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.follows_id_seq OWNER TO ehsan;

--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ehsan
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: ehsan
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.likes OWNER TO ehsan;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: ehsan
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.likes_id_seq OWNER TO ehsan;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ehsan
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: ehsan
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    author_id integer NOT NULL,
    content character varying(300) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.posts OWNER TO ehsan;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: ehsan
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO ehsan;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ehsan
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ehsan
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash text NOT NULL,
    display_name character varying(50) NOT NULL,
    bio character varying(160),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    avatar_url character varying(50)
);


ALTER TABLE public.users OWNER TO ehsan;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ehsan
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO ehsan;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ehsan
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: ehsan
--

COPY public.comments (id, author_id, post_id, content, parent_comment_id, created_at, updated_at) FROM stdin;
1	15	26	Organized leading edge framework	\N	2026-01-16 00:00:00+03:30	\N
2	44	66	Persevering motivating toolset	\N	2025-11-19 00:00:00+03:30	\N
3	8	65	Organized attitude-oriented time-frame	\N	2025-10-09 00:00:00+03:30	\N
4	59	261	Virtual systemic contingency	\N	2025-12-12 00:00:00+03:30	\N
5	58	113	Decentralized executive infrastructure	\N	2026-05-26 00:00:00+03:30	\N
6	81	153	Decentralized web-enabled attitude	\N	2026-04-12 00:00:00+03:30	\N
7	74	65	User-friendly global hierarchy	\N	2026-04-17 00:00:00+03:30	\N
8	10	210	Reactive executive database	\N	2026-01-02 00:00:00+03:30	\N
9	3	340	Reverse-engineered needs-based budgetary management	\N	2026-01-03 00:00:00+03:30	\N
10	68	351	Expanded local database	\N	2025-10-01 00:00:00+03:30	\N
11	51	62	Self-enabling asynchronous groupware	\N	2025-11-17 00:00:00+03:30	\N
12	19	165	Expanded national installation	\N	2025-10-22 00:00:00+03:30	\N
13	24	253	Reverse-engineered bi-directional toolset	\N	2026-07-25 00:00:00+03:30	\N
14	76	142	Universal demand-driven internet solution	\N	2025-10-04 00:00:00+03:30	\N
15	53	396	Universal next generation adapter	\N	2026-03-07 00:00:00+03:30	2026-02-02 00:00:00+03:30
16	28	212	Advanced dedicated moratorium	\N	2026-01-23 00:00:00+03:30	\N
17	50	29	Object-based 24/7 capacity	\N	2026-02-26 00:00:00+03:30	\N
18	46	180	Quality-focused heuristic architecture	\N	2025-09-30 00:00:00+03:30	\N
19	41	103	Multi-channelled optimizing local area network	\N	2026-05-14 00:00:00+03:30	\N
20	59	373	De-engineered 6th generation project	\N	2026-06-26 00:00:00+03:30	\N
21	79	83	Multi-channelled multimedia throughput	\N	2026-05-19 00:00:00+03:30	\N
22	57	142	Pre-emptive asynchronous matrices	\N	2026-05-25 00:00:00+03:30	\N
23	41	148	Extended systemic frame	\N	2026-08-12 00:00:00+03:30	\N
24	25	358	Enterprise-wide global process improvement	\N	2026-02-22 00:00:00+03:30	\N
25	47	82	Organic exuding structure	\N	2026-03-14 00:00:00+03:30	\N
26	19	129	Secured motivating interface	\N	2026-01-17 00:00:00+03:30	\N
27	37	153	Multi-lateral zero defect challenge	\N	2026-04-14 00:00:00+03:30	\N
28	13	130	Open-architected multi-state projection	\N	2026-02-03 00:00:00+03:30	\N
29	54	82	Secured impactful intranet	\N	2025-11-13 00:00:00+03:30	\N
30	41	347	Face to face intangible productivity	\N	2026-02-25 00:00:00+03:30	2026-07-07 00:00:00+03:30
31	9	264	Phased system-worthy methodology	\N	2025-11-28 00:00:00+03:30	\N
32	79	58	Proactive regional emulation	\N	2026-06-16 00:00:00+03:30	\N
33	58	171	Diverse interactive knowledge base	\N	2026-08-28 00:00:00+03:30	\N
34	73	173	Decentralized object-oriented throughput	\N	2026-09-26 00:00:00+03:30	\N
35	16	298	Seamless next generation toolset	\N	2025-11-29 00:00:00+03:30	\N
36	63	65	Optimized dedicated artificial intelligence	\N	2026-06-24 00:00:00+03:30	\N
37	67	35	Cross-platform zero defect throughput	\N	2026-01-17 00:00:00+03:30	\N
38	54	24	Public-key cohesive local area network	\N	2026-09-23 00:00:00+03:30	\N
39	34	87	Pre-emptive motivating encoding	\N	2026-03-10 00:00:00+03:30	\N
40	78	124	Mandatory logistical conglomeration	\N	2026-02-05 00:00:00+03:30	\N
41	73	322	Automated maximized info-mediaries	\N	2026-05-02 00:00:00+03:30	\N
42	2	225	Self-enabling national policy	\N	2026-06-16 00:00:00+03:30	\N
43	41	79	Cloned asymmetric concept	\N	2026-08-17 00:00:00+03:30	\N
44	38	136	Reverse-engineered cohesive website	\N	2026-07-17 00:00:00+03:30	\N
45	52	332	Seamless 6th generation complexity	\N	2025-11-26 00:00:00+03:30	\N
46	53	44	Versatile multi-tasking moderator	\N	2025-12-17 00:00:00+03:30	\N
47	49	403	Cloned bottom-line open architecture	\N	2026-05-16 00:00:00+03:30	\N
48	73	335	Horizontal content-based initiative	\N	2026-03-27 00:00:00+03:30	\N
49	15	148	Seamless leading edge database	\N	2025-11-14 00:00:00+03:30	\N
50	24	245	Streamlined even-keeled neural-net	\N	2026-09-20 00:00:00+03:30	\N
51	37	254	Quality-focused asynchronous groupware	\N	2025-10-11 00:00:00+03:30	\N
52	7	295	Customizable modular workforce	\N	2025-11-23 00:00:00+03:30	\N
53	79	53	Synergized hybrid matrix	\N	2026-03-02 00:00:00+03:30	\N
54	78	411	Proactive well-modulated alliance	\N	2025-10-21 00:00:00+03:30	\N
55	15	240	Advanced holistic product	\N	2026-07-01 00:00:00+03:30	\N
56	38	227	Visionary bi-directional product	\N	2026-01-18 00:00:00+03:30	\N
57	22	285	Distributed intermediate open system	\N	2026-01-29 00:00:00+03:30	\N
58	23	272	Visionary actuating attitude	\N	2025-12-18 00:00:00+03:30	\N
59	76	93	Centralized multimedia open system	\N	2026-04-04 00:00:00+03:30	\N
60	38	139	Customizable coherent adapter	\N	2026-02-17 00:00:00+03:30	\N
61	62	239	Right-sized leading edge migration	\N	2026-04-17 00:00:00+03:30	\N
62	57	128	Up-sized bifurcated extranet	\N	2026-04-14 00:00:00+03:30	\N
63	21	234	Pre-emptive system-worthy conglomeration	\N	2026-08-28 00:00:00+03:30	\N
64	41	157	Extended next generation workforce	\N	2026-09-08 00:00:00+03:30	\N
65	55	374	Diverse web-enabled leverage	\N	2026-04-17 00:00:00+03:30	\N
66	2	369	Future-proofed 5th generation functionalities	\N	2026-08-31 00:00:00+03:30	2025-12-23 00:00:00+03:30
67	55	89	Optional uniform monitoring	\N	2026-08-07 00:00:00+03:30	\N
68	28	176	Integrated bifurcated installation	\N	2026-02-24 00:00:00+03:30	\N
69	64	44	Upgradable motivating flexibility	\N	2026-07-11 00:00:00+03:30	\N
70	6	27	Balanced content-based data-warehouse	\N	2025-12-16 00:00:00+03:30	\N
71	14	296	Future-proofed systemic moderator	\N	2026-07-23 00:00:00+03:30	\N
72	12	199	Universal bifurcated artificial intelligence	\N	2025-10-11 00:00:00+03:30	\N
73	27	193	Reduced needs-based extranet	\N	2026-06-28 00:00:00+03:30	\N
74	22	326	Decentralized global time-frame	\N	2025-10-03 00:00:00+03:30	\N
75	43	368	Realigned 6th generation hub	\N	2026-01-20 00:00:00+03:30	\N
76	79	412	Automated systematic firmware	\N	2025-11-19 00:00:00+03:30	\N
77	40	385	Object-based mobile model	\N	2025-12-09 00:00:00+03:30	2025-12-31 00:00:00+03:30
78	14	204	Open-source bottom-line matrices	\N	2025-12-31 00:00:00+03:30	\N
79	13	211	Stand-alone didactic leverage	\N	2026-07-17 00:00:00+03:30	2026-01-31 00:00:00+03:30
80	35	104	Organic dynamic neural-net	\N	2026-07-24 00:00:00+03:30	\N
81	75	95	Inverse client-driven migration	\N	2026-06-20 00:00:00+03:30	\N
82	14	224	Streamlined 5th generation hub	\N	2026-09-22 00:00:00+03:30	\N
83	66	60	Seamless asymmetric concept	\N	2026-01-27 00:00:00+03:30	\N
84	9	228	Synergistic stable challenge	\N	2025-12-02 00:00:00+03:30	\N
85	13	205	Universal maximized ability	\N	2026-08-03 00:00:00+03:30	\N
86	26	98	Front-line non-volatile product	\N	2026-04-04 00:00:00+03:30	\N
87	70	384	Horizontal human-resource system engine	\N	2026-09-18 00:00:00+03:30	\N
88	16	19	Automated leading edge application	\N	2026-05-02 00:00:00+03:30	\N
89	74	115	Future-proofed systematic monitoring	\N	2026-01-06 00:00:00+03:30	\N
90	43	304	Universal static infrastructure	\N	2025-12-05 00:00:00+03:30	\N
91	40	402	Organic secondary support	\N	2025-09-30 00:00:00+03:30	\N
92	2	288	Front-line national structure	\N	2026-08-07 00:00:00+03:30	2026-01-26 00:00:00+03:30
93	5	376	Persistent upward-trending circuit	\N	2025-10-07 00:00:00+03:30	\N
94	12	38	Up-sized systematic support	\N	2026-05-27 00:00:00+03:30	\N
95	43	274	Distributed well-modulated array	\N	2026-02-15 00:00:00+03:30	\N
96	21	21	Triple-buffered mobile monitoring	\N	2026-05-20 00:00:00+03:30	2026-02-02 00:00:00+03:30
97	35	242	Multi-tiered fault-tolerant methodology	\N	2025-10-07 00:00:00+03:30	2026-03-02 00:00:00+03:30
98	38	193	Multi-tiered mission-critical algorithm	\N	2026-07-18 00:00:00+03:30	\N
99	15	139	Enhanced 24/7 customer loyalty	\N	2026-06-12 00:00:00+03:30	\N
100	63	144	User-friendly tangible internet solution	\N	2026-05-13 00:00:00+03:30	\N
101	5	300	Automated well-modulated knowledge base	\N	2026-06-15 00:00:00+03:30	\N
102	79	261	Organized executive project	\N	2025-11-15 00:00:00+03:30	\N
103	25	382	Open-source eco-centric emulation	\N	2026-05-04 00:00:00+03:30	\N
104	60	37	Down-sized eco-centric hub	\N	2026-02-24 00:00:00+03:30	\N
105	76	296	Optimized heuristic paradigm	\N	2026-09-23 00:00:00+03:30	\N
106	65	41	Enterprise-wide stable benchmark	\N	2026-07-14 00:00:00+03:30	\N
107	27	404	Sharable system-worthy alliance	\N	2026-05-06 00:00:00+03:30	\N
108	29	296	Triple-buffered regional artificial intelligence	\N	2026-01-26 00:00:00+03:30	\N
109	24	129	Object-based systemic leverage	\N	2026-06-16 00:00:00+03:30	\N
110	72	216	Stand-alone even-keeled hub	\N	2026-04-11 00:00:00+03:30	\N
111	21	248	Digitized executive core	\N	2026-03-15 00:00:00+03:30	\N
112	69	331	Right-sized maximized capacity	\N	2026-06-03 00:00:00+03:30	\N
113	53	398	Switchable intangible website	\N	2026-04-18 00:00:00+03:30	\N
114	61	99	Integrated asynchronous software	\N	2025-12-29 00:00:00+03:30	\N
115	74	376	Open-source stable neural-net	\N	2026-02-07 00:00:00+03:30	\N
116	59	272	Cross-group didactic ability	\N	2025-11-02 00:00:00+03:30	\N
117	26	186	Assimilated intermediate pricing structure	\N	2026-06-30 00:00:00+03:30	\N
118	33	156	Distributed context-sensitive time-frame	\N	2026-01-27 00:00:00+03:30	\N
119	19	100	Public-key bi-directional encryption	\N	2026-08-30 00:00:00+03:30	\N
120	11	38	Open-architected needs-based standardization	\N	2025-12-25 00:00:00+03:30	\N
121	52	132	Ameliorated static access	\N	2026-06-15 00:00:00+03:30	\N
122	2	360	Adaptive 24/7 pricing structure	\N	2026-03-04 00:00:00+03:30	\N
123	76	40	Managed leading edge local area network	\N	2026-07-14 00:00:00+03:30	\N
124	21	69	Devolved grid-enabled knowledge user	\N	2025-12-23 00:00:00+03:30	\N
125	50	372	Right-sized didactic encoding	\N	2026-07-26 00:00:00+03:30	\N
126	77	387	Organic stable contingency	\N	2026-06-05 00:00:00+03:30	\N
127	22	230	Switchable web-enabled success	\N	2026-02-02 00:00:00+03:30	\N
128	10	408	Configurable grid-enabled data-warehouse	\N	2026-05-20 00:00:00+03:30	\N
129	54	113	Synergized bifurcated array	\N	2026-02-24 00:00:00+03:30	\N
130	42	361	Multi-layered actuating Graphical User Interface	\N	2026-05-29 00:00:00+03:30	\N
131	12	330	Future-proofed tertiary workforce	\N	2025-11-06 00:00:00+03:30	\N
132	60	291	Virtual upward-trending matrix	\N	2026-08-28 00:00:00+03:30	2025-12-31 00:00:00+03:30
133	34	106	Business-focused tangible contingency	\N	2025-11-04 00:00:00+03:30	\N
134	42	390	Expanded hybrid function	\N	2025-11-08 00:00:00+03:30	\N
135	61	45	Streamlined methodical emulation	\N	2026-09-08 00:00:00+03:30	\N
136	43	180	Networked well-modulated attitude	\N	2025-12-29 00:00:00+03:30	\N
137	62	302	Total dedicated budgetary management	\N	2026-01-09 00:00:00+03:30	\N
138	72	257	Cloned reciprocal approach	\N	2025-10-27 00:00:00+03:30	\N
139	38	81	Multi-layered local orchestration	\N	2026-03-26 00:00:00+03:30	\N
140	53	287	Implemented zero administration interface	\N	2026-01-20 00:00:00+03:30	\N
141	69	308	Progressive tertiary moderator	\N	2026-01-22 00:00:00+03:30	\N
142	9	367	Balanced zero administration toolset	\N	2025-12-15 00:00:00+03:30	\N
143	77	342	Implemented real-time help-desk	\N	2025-10-14 00:00:00+03:30	\N
144	58	44	Devolved composite focus group	\N	2025-12-13 00:00:00+03:30	\N
145	44	76	Organized composite project	\N	2026-03-14 00:00:00+03:30	\N
146	60	348	Grass-roots asynchronous open architecture	\N	2026-07-26 00:00:00+03:30	\N
147	35	236	Front-line maximized process improvement	\N	2026-08-12 00:00:00+03:30	\N
148	64	35	Diverse full-range encryption	\N	2026-02-01 00:00:00+03:30	\N
149	66	118	User-centric intermediate policy	\N	2026-08-14 00:00:00+03:30	\N
150	56	26	Optional leading edge solution	\N	2025-11-16 00:00:00+03:30	2026-05-19 00:00:00+03:30
151	42	250	Centralized responsive circuit	\N	2025-11-07 00:00:00+03:30	\N
152	56	116	Right-sized system-worthy customer loyalty	\N	2026-03-23 00:00:00+03:30	\N
153	68	280	Phased eco-centric productivity	\N	2025-09-30 00:00:00+03:30	\N
154	3	242	Right-sized regional conglomeration	\N	2026-08-25 00:00:00+03:30	\N
155	15	199	Polarised didactic structure	\N	2026-04-02 00:00:00+03:30	\N
156	73	176	Optional systematic customer loyalty	\N	2026-03-31 00:00:00+03:30	\N
157	52	351	Future-proofed bifurcated utilisation	\N	2026-02-01 00:00:00+03:30	\N
158	66	49	Compatible maximized artificial intelligence	\N	2026-08-23 00:00:00+03:30	\N
159	68	250	Down-sized modular algorithm	\N	2025-12-23 00:00:00+03:30	2026-07-19 00:00:00+03:30
160	10	154	Open-architected high-level workforce	\N	2025-12-09 00:00:00+03:30	\N
161	78	102	Ergonomic 3rd generation internet solution	\N	2026-01-01 00:00:00+03:30	\N
162	80	359	Compatible zero administration knowledge base	\N	2025-10-21 00:00:00+03:30	\N
163	51	360	Synchronised disintermediate firmware	\N	2025-11-28 00:00:00+03:30	2026-07-17 00:00:00+03:30
164	75	85	Intuitive 5th generation monitoring	\N	2025-12-02 00:00:00+03:30	\N
165	29	55	Stand-alone eco-centric secured line	\N	2026-06-09 00:00:00+03:30	\N
166	17	367	Up-sized full-range focus group	\N	2026-04-20 00:00:00+03:30	\N
167	15	249	Right-sized client-driven intranet	\N	2025-10-27 00:00:00+03:30	\N
168	50	403	Realigned background internet solution	\N	2025-11-07 00:00:00+03:30	\N
169	44	278	Stand-alone national support	\N	2025-12-14 00:00:00+03:30	\N
170	38	58	Open-source systematic approach	\N	2026-09-20 00:00:00+03:30	\N
171	73	178	Customizable regional initiative	\N	2026-02-01 00:00:00+03:30	\N
172	35	101	Multi-tiered zero defect productivity	\N	2025-12-04 00:00:00+03:30	\N
173	23	22	Compatible 3rd generation flexibility	\N	2025-12-18 00:00:00+03:30	\N
174	76	295	Triple-buffered fresh-thinking emulation	\N	2026-09-06 00:00:00+03:30	\N
175	17	179	Profit-focused non-volatile time-frame	\N	2025-10-10 00:00:00+03:30	\N
176	4	255	Function-based regional synergy	\N	2026-06-25 00:00:00+03:30	\N
177	22	241	Customer-focused solution-oriented access	\N	2026-05-14 00:00:00+03:30	\N
178	80	193	Assimilated asynchronous framework	\N	2025-12-24 00:00:00+03:30	\N
179	3	141	Profound transitional methodology	\N	2025-10-28 00:00:00+03:30	\N
180	61	253	Progressive bifurcated contingency	\N	2026-07-03 00:00:00+03:30	\N
181	39	130	User-centric coherent Graphic Interface	\N	2025-12-14 00:00:00+03:30	\N
182	10	402	Synergized multi-tasking benchmark	\N	2026-05-20 00:00:00+03:30	\N
183	77	146	Devolved hybrid matrices	\N	2026-08-24 00:00:00+03:30	\N
184	49	288	Compatible zero tolerance definition	\N	2026-09-12 00:00:00+03:30	\N
185	49	181	Digitized global encryption	\N	2026-01-18 00:00:00+03:30	\N
186	54	325	Persistent multi-tasking analyzer	\N	2026-02-01 00:00:00+03:30	2026-03-13 00:00:00+03:30
187	3	379	Reduced bottom-line Graphic Interface	\N	2025-11-09 00:00:00+03:30	\N
188	56	242	Triple-buffered incremental orchestration	\N	2026-05-25 00:00:00+03:30	\N
189	8	303	Re-engineered systematic concept	\N	2026-08-01 00:00:00+03:30	\N
190	73	198	Advanced bifurcated policy	\N	2025-10-31 00:00:00+03:30	\N
191	65	305	Team-oriented system-worthy support	\N	2026-07-07 00:00:00+03:30	\N
192	62	174	Extended scalable access	\N	2026-05-21 00:00:00+03:30	\N
193	39	320	Cloned intermediate model	\N	2026-07-17 00:00:00+03:30	\N
194	27	334	Cross-group stable matrices	\N	2026-04-08 00:00:00+03:30	\N
195	63	106	Diverse multimedia hierarchy	\N	2025-12-30 00:00:00+03:30	\N
196	22	315	Customer-focused client-driven focus group	\N	2025-10-11 00:00:00+03:30	\N
197	58	352	Synchronised coherent conglomeration	\N	2026-05-03 00:00:00+03:30	\N
198	60	89	Vision-oriented leading edge hub	\N	2026-06-16 00:00:00+03:30	\N
199	62	224	Upgradable 3rd generation parallelism	\N	2026-07-26 00:00:00+03:30	\N
200	65	391	Virtual multi-tasking workforce	\N	2026-01-04 00:00:00+03:30	\N
201	77	225	Profound intermediate software	\N	2025-10-14 00:00:00+03:30	\N
202	19	53	Streamlined multi-state utilisation	\N	2026-04-01 00:00:00+03:30	\N
203	8	99	Versatile discrete task-force	\N	2026-05-01 00:00:00+03:30	2025-12-26 00:00:00+03:30
204	60	357	Innovative composite installation	\N	2026-05-09 00:00:00+03:30	\N
205	71	81	Reverse-engineered 24 hour synergy	\N	2026-01-30 00:00:00+03:30	\N
206	42	287	Cloned upward-trending firmware	\N	2026-06-20 00:00:00+03:30	\N
207	55	297	Mandatory non-volatile intranet	\N	2026-09-23 00:00:00+03:30	\N
208	70	175	Open-source solution-oriented functionalities	\N	2026-07-21 00:00:00+03:30	2025-11-19 00:00:00+03:30
209	81	397	Synergized 4th generation framework	\N	2026-02-26 00:00:00+03:30	\N
210	24	58	Multi-channelled transitional task-force	\N	2025-11-10 00:00:00+03:30	\N
211	10	191	Upgradable hybrid toolset	\N	2026-04-01 00:00:00+03:30	\N
212	63	268	Open-architected dynamic Graphic Interface	\N	2026-07-03 00:00:00+03:30	\N
213	54	189	De-engineered user-facing contingency	\N	2026-06-18 00:00:00+03:30	\N
214	12	55	Team-oriented global parallelism	\N	2026-09-25 00:00:00+03:30	\N
215	46	106	Enhanced system-worthy focus group	\N	2026-01-18 00:00:00+03:30	\N
216	55	82	Quality-focused multimedia success	\N	2025-10-13 00:00:00+03:30	\N
217	80	15	Persistent 4th generation help-desk	\N	2025-12-04 00:00:00+03:30	\N
218	43	262	Universal system-worthy capacity	\N	2025-12-26 00:00:00+03:30	\N
219	37	77	Virtual analyzing policy	\N	2026-04-19 00:00:00+03:30	\N
220	71	320	Profit-focused full-range info-mediaries	\N	2026-02-12 00:00:00+03:30	\N
221	10	289	Extended hybrid concept	\N	2025-11-21 00:00:00+03:30	\N
222	27	69	Programmable stable interface	\N	2026-05-14 00:00:00+03:30	\N
223	36	128	Cloned heuristic attitude	\N	2025-10-23 00:00:00+03:30	\N
224	20	397	Profound upward-trending access	\N	2026-07-20 00:00:00+03:30	\N
225	7	38	User-friendly fault-tolerant algorithm	\N	2025-12-30 00:00:00+03:30	\N
226	43	242	Customizable maximized system engine	\N	2025-12-20 00:00:00+03:30	\N
227	48	258	Horizontal client-server superstructure	\N	2026-03-13 00:00:00+03:30	\N
228	51	315	Open-source secondary throughput	\N	2025-12-23 00:00:00+03:30	\N
229	61	106	Proactive incremental policy	\N	2025-10-13 00:00:00+03:30	\N
230	46	277	Implemented transitional info-mediaries	\N	2026-02-04 00:00:00+03:30	\N
231	44	346	Stand-alone high-level task-force	\N	2026-07-11 00:00:00+03:30	\N
232	66	280	Balanced needs-based success	\N	2025-10-03 00:00:00+03:30	\N
233	47	89	Centralized hybrid access	\N	2026-09-19 00:00:00+03:30	2025-11-29 00:00:00+03:30
234	81	251	Visionary regional complexity	\N	2026-01-21 00:00:00+03:30	2025-12-09 00:00:00+03:30
235	45	232	Synchronised mobile database	\N	2025-12-13 00:00:00+03:30	\N
236	16	59	Open-source explicit pricing structure	\N	2026-08-12 00:00:00+03:30	\N
237	20	166	Assimilated scalable attitude	\N	2025-11-10 00:00:00+03:30	\N
238	74	48	Streamlined asynchronous project	\N	2026-09-02 00:00:00+03:30	2026-06-24 00:00:00+03:30
239	13	49	Cloned even-keeled encoding	\N	2026-04-03 00:00:00+03:30	\N
240	65	344	Customer-focused actuating software	\N	2026-09-08 00:00:00+03:30	\N
241	81	317	Reduced demand-driven open system	\N	2026-06-10 00:00:00+03:30	\N
242	55	354	Virtual motivating project	\N	2026-04-13 00:00:00+03:30	\N
243	40	170	Mandatory high-level process improvement	\N	2025-10-06 00:00:00+03:30	\N
244	3	405	Front-line mission-critical parallelism	\N	2026-05-02 00:00:00+03:30	\N
245	47	392	Self-enabling heuristic Graphical User Interface	\N	2026-05-30 00:00:00+03:30	2025-10-06 00:00:00+03:30
246	6	93	Profit-focused zero defect throughput	\N	2026-05-30 00:00:00+03:30	\N
247	37	157	Quality-focused non-volatile intranet	\N	2025-10-10 00:00:00+03:30	\N
248	81	160	Fully-configurable neutral contingency	\N	2026-06-23 00:00:00+03:30	\N
249	60	308	Cloned scalable software	\N	2026-06-06 00:00:00+03:30	\N
250	3	76	Expanded systemic protocol	\N	2025-10-11 00:00:00+03:30	\N
251	32	44	Enhanced asynchronous synergy	\N	2026-01-06 00:00:00+03:30	\N
252	70	19	Optimized static contingency	\N	2026-05-08 00:00:00+03:30	2026-03-21 00:00:00+03:30
253	36	158	Persevering uniform structure	\N	2025-11-29 00:00:00+03:30	\N
254	69	213	Multi-layered web-enabled methodology	\N	2025-12-22 00:00:00+03:30	\N
255	45	291	Cloned hybrid capability	\N	2025-11-21 00:00:00+03:30	2025-11-17 00:00:00+03:30
256	34	195	Extended multimedia benchmark	\N	2026-03-23 00:00:00+03:30	\N
257	19	170	Managed encompassing parallelism	\N	2026-04-16 00:00:00+03:30	\N
258	12	351	Extended neutral knowledge base	\N	2025-11-18 00:00:00+03:30	\N
259	57	133	Secured directional open system	\N	2026-04-26 00:00:00+03:30	\N
260	45	213	User-centric static help-desk	\N	2026-02-08 00:00:00+03:30	\N
261	31	358	Enterprise-wide analyzing hub	\N	2026-08-05 00:00:00+03:30	\N
262	42	78	User-friendly object-oriented flexibility	\N	2026-09-09 00:00:00+03:30	\N
263	8	45	Advanced intangible info-mediaries	\N	2026-06-06 00:00:00+03:30	\N
264	50	147	Integrated 3rd generation toolset	\N	2026-07-16 00:00:00+03:30	\N
265	4	207	Decentralized secondary pricing structure	\N	2025-12-12 00:00:00+03:30	\N
266	47	188	User-friendly didactic leverage	\N	2026-01-24 00:00:00+03:30	\N
267	54	395	Programmable upward-trending budgetary management	\N	2025-11-20 00:00:00+03:30	\N
268	55	15	Reduced executive infrastructure	\N	2026-08-05 00:00:00+03:30	\N
269	28	116	Synergized local framework	\N	2026-05-14 00:00:00+03:30	\N
270	5	234	Cross-platform impactful help-desk	\N	2026-04-28 00:00:00+03:30	2025-11-20 00:00:00+03:30
271	19	245	Optional cohesive infrastructure	\N	2026-01-22 00:00:00+03:30	\N
272	70	145	Persistent non-volatile array	\N	2026-04-27 00:00:00+03:30	\N
273	6	265	Centralized empowering moratorium	\N	2026-07-30 00:00:00+03:30	\N
274	49	263	Re-contextualized mission-critical definition	\N	2026-06-24 00:00:00+03:30	\N
275	8	201	Down-sized foreground ability	\N	2026-07-28 00:00:00+03:30	\N
276	62	121	Assimilated intermediate access	\N	2026-01-31 00:00:00+03:30	\N
277	72	76	Fundamental background array	\N	2026-08-02 00:00:00+03:30	2026-07-21 00:00:00+03:30
278	54	186	Configurable systemic help-desk	\N	2026-02-11 00:00:00+03:30	\N
279	3	257	Visionary demand-driven definition	\N	2026-02-12 00:00:00+03:30	\N
280	39	49	Multi-channelled full-range hierarchy	\N	2026-04-24 00:00:00+03:30	\N
281	57	218	Balanced heuristic help-desk	\N	2026-04-30 00:00:00+03:30	\N
282	44	28	Universal optimizing system engine	\N	2025-10-20 00:00:00+03:30	\N
283	30	320	Cross-group human-resource orchestration	\N	2026-04-29 00:00:00+03:30	\N
284	8	69	Expanded hybrid focus group	\N	2025-11-12 00:00:00+03:30	\N
285	10	219	Optional empowering middleware	\N	2026-05-23 00:00:00+03:30	\N
286	2	387	Innovative tertiary monitoring	\N	2025-11-12 00:00:00+03:30	\N
287	4	148	Triple-buffered leading edge Graphic Interface	\N	2025-12-14 00:00:00+03:30	\N
288	43	173	Horizontal foreground paradigm	\N	2026-06-17 00:00:00+03:30	\N
289	46	153	Focused bandwidth-monitored alliance	\N	2026-02-01 00:00:00+03:30	\N
290	21	82	Operative solution-oriented installation	\N	2026-04-12 00:00:00+03:30	\N
291	19	411	Seamless fault-tolerant superstructure	\N	2026-05-25 00:00:00+03:30	\N
292	13	410	Switchable contextually-based portal	\N	2025-11-03 00:00:00+03:30	\N
293	76	192	Team-oriented optimizing analyzer	\N	2026-07-31 00:00:00+03:30	\N
294	9	134	User-friendly global application	\N	2026-03-31 00:00:00+03:30	\N
295	27	319	Switchable multi-tasking analyzer	\N	2026-02-28 00:00:00+03:30	\N
296	39	145	Customizable client-driven focus group	\N	2025-10-30 00:00:00+03:30	\N
297	20	165	Upgradable mobile secured line	\N	2025-10-10 00:00:00+03:30	\N
298	74	405	Open-source intangible info-mediaries	\N	2025-12-21 00:00:00+03:30	2026-04-19 00:00:00+03:30
299	33	42	Cloned interactive extranet	\N	2025-10-03 00:00:00+03:30	\N
300	52	167	Monitored fault-tolerant moderator	\N	2026-01-12 00:00:00+03:30	\N
301	30	143	User-friendly exuding extranet	\N	2026-05-15 00:00:00+03:30	\N
302	52	100	Monitored solution-oriented time-frame	\N	2026-06-30 00:00:00+03:30	\N
303	8	201	Future-proofed system-worthy initiative	\N	2025-11-05 00:00:00+03:30	\N
304	17	326	Reverse-engineered tangible projection	\N	2026-09-29 00:00:00+03:30	\N
305	62	69	Future-proofed mobile portal	\N	2025-10-11 00:00:00+03:30	\N
306	28	237	Devolved solution-oriented hub	\N	2026-01-27 00:00:00+03:30	2026-03-21 00:00:00+03:30
307	8	45	Organized background open architecture	\N	2026-07-10 00:00:00+03:30	\N
308	77	191	Object-based foreground leverage	\N	2025-12-26 00:00:00+03:30	\N
309	14	137	Organic object-oriented standardization	\N	2026-04-21 00:00:00+03:30	\N
310	35	57	Open-source maximized hub	\N	2026-08-06 00:00:00+03:30	\N
311	36	147	Grass-roots grid-enabled policy	\N	2026-02-21 00:00:00+03:30	\N
312	11	84	Optimized 6th generation service-desk	\N	2026-04-21 00:00:00+03:30	2026-08-01 00:00:00+03:30
313	9	90	Up-sized asymmetric support	\N	2026-02-10 00:00:00+03:30	\N
314	50	130	Profit-focused reciprocal collaboration	\N	2026-04-12 00:00:00+03:30	2026-04-26 00:00:00+03:30
315	58	55	Programmable background moderator	\N	2025-10-05 00:00:00+03:30	\N
316	23	323	Progressive 24/7 flexibility	\N	2026-03-26 00:00:00+03:30	\N
317	81	87	De-engineered scalable task-force	\N	2026-09-02 00:00:00+03:30	\N
318	28	95	Integrated explicit approach	\N	2025-12-08 00:00:00+03:30	\N
319	48	100	Reactive zero tolerance architecture	\N	2026-04-27 00:00:00+03:30	2026-08-18 00:00:00+03:30
320	15	350	Front-line value-added time-frame	\N	2025-10-11 00:00:00+03:30	\N
321	71	336	Ameliorated web-enabled throughput	\N	2025-11-12 00:00:00+03:30	\N
322	34	33	Optional demand-driven standardization	\N	2025-11-21 00:00:00+03:30	\N
323	31	50	Assimilated motivating orchestration	\N	2026-06-22 00:00:00+03:30	\N
324	24	237	Centralized discrete adapter	\N	2026-03-05 00:00:00+03:30	\N
325	31	178	Organic stable Graphic Interface	\N	2025-12-08 00:00:00+03:30	\N
326	12	386	Stand-alone client-driven moderator	\N	2025-12-17 00:00:00+03:30	\N
327	57	243	Stand-alone object-oriented moderator	\N	2026-01-17 00:00:00+03:30	\N
328	6	177	Optional next generation intranet	\N	2026-01-05 00:00:00+03:30	\N
329	40	374	Sharable leading edge internet solution	\N	2026-06-26 00:00:00+03:30	\N
330	27	145	Switchable zero tolerance service-desk	\N	2026-03-23 00:00:00+03:30	\N
331	76	318	Open-architected background concept	\N	2026-02-05 00:00:00+03:30	\N
332	66	68	Team-oriented mobile hub	\N	2026-07-31 00:00:00+03:30	\N
333	30	73	Optimized leading edge local area network	\N	2026-08-31 00:00:00+03:30	\N
334	32	328	Cross-group grid-enabled task-force	\N	2025-10-09 00:00:00+03:30	\N
335	21	399	Exclusive directional knowledge base	\N	2026-04-02 00:00:00+03:30	\N
336	15	310	Object-based background website	\N	2026-05-31 00:00:00+03:30	\N
337	48	195	Seamless bi-directional customer loyalty	\N	2025-11-25 00:00:00+03:30	\N
338	74	32	Digitized holistic strategy	\N	2026-08-25 00:00:00+03:30	\N
339	40	45	De-engineered uniform groupware	\N	2026-02-06 00:00:00+03:30	\N
340	8	253	Decentralized dynamic forecast	\N	2026-03-30 00:00:00+03:30	\N
341	24	310	Switchable disintermediate adapter	\N	2026-01-22 00:00:00+03:30	\N
342	75	34	Advanced zero administration complexity	\N	2026-06-03 00:00:00+03:30	\N
343	42	340	Inverse heuristic algorithm	\N	2025-11-04 00:00:00+03:30	\N
344	14	208	Progressive solution-oriented installation	\N	2026-05-23 00:00:00+03:30	\N
345	24	142	Multi-lateral 24 hour knowledge base	\N	2025-11-14 00:00:00+03:30	\N
346	24	109	Re-contextualized client-driven paradigm	\N	2026-09-02 00:00:00+03:30	\N
347	54	88	Ergonomic multi-state matrices	\N	2026-03-26 00:00:00+03:30	\N
348	63	241	Organized leading edge extranet	\N	2025-12-11 00:00:00+03:30	\N
349	3	375	Intuitive uniform parallelism	\N	2026-01-27 00:00:00+03:30	\N
350	40	186	Synergistic 5th generation customer loyalty	\N	2026-07-12 00:00:00+03:30	\N
351	81	369	Advanced clear-thinking local area network	\N	2025-11-13 00:00:00+03:30	\N
352	14	256	Up-sized national support	\N	2025-12-25 00:00:00+03:30	2026-03-20 00:00:00+03:30
353	41	119	Face to face bifurcated capability	\N	2026-07-23 00:00:00+03:30	\N
354	75	390	Universal content-based website	\N	2025-10-19 00:00:00+03:30	\N
355	40	380	Expanded next generation database	\N	2025-12-21 00:00:00+03:30	2026-09-22 00:00:00+03:30
356	70	283	Synergized discrete moderator	\N	2026-01-01 00:00:00+03:30	\N
357	49	172	Diverse dedicated hub	\N	2025-11-04 00:00:00+03:30	\N
358	23	189	Implemented local matrices	\N	2025-12-25 00:00:00+03:30	\N
359	20	104	Progressive solution-oriented architecture	\N	2026-06-09 00:00:00+03:30	\N
360	46	16	Object-based mobile productivity	\N	2026-05-03 00:00:00+03:30	\N
361	15	288	Advanced mobile local area network	\N	2026-04-13 00:00:00+03:30	\N
362	59	402	Reactive intangible monitoring	\N	2026-05-04 00:00:00+03:30	\N
363	53	359	Multi-channelled static instruction set	\N	2026-08-16 00:00:00+03:30	\N
364	19	147	Cross-platform homogeneous middleware	\N	2026-08-09 00:00:00+03:30	\N
365	49	18	Re-contextualized fresh-thinking secured line	\N	2025-11-23 00:00:00+03:30	\N
366	50	334	Innovative system-worthy flexibility	\N	2026-08-27 00:00:00+03:30	\N
367	53	320	Pre-emptive radical open architecture	\N	2026-04-14 00:00:00+03:30	\N
368	45	271	Innovative non-volatile model	\N	2026-02-10 00:00:00+03:30	\N
369	27	264	Grass-roots needs-based knowledge base	\N	2026-09-04 00:00:00+03:30	\N
370	66	70	Universal empowering groupware	\N	2026-06-14 00:00:00+03:30	\N
371	2	174	Centralized solution-oriented secured line	\N	2026-03-31 00:00:00+03:30	\N
372	2	364	Reverse-engineered incremental success	\N	2026-01-09 00:00:00+03:30	\N
373	17	31	Centralized value-added architecture	\N	2026-04-15 00:00:00+03:30	\N
374	10	125	Enhanced asynchronous complexity	\N	2026-01-30 00:00:00+03:30	2026-07-17 00:00:00+03:30
375	64	48	Pre-emptive even-keeled knowledge user	\N	2026-07-21 00:00:00+03:30	\N
376	46	189	Enterprise-wide maximized capability	\N	2026-07-02 00:00:00+03:30	\N
377	77	46	Exclusive context-sensitive migration	\N	2026-01-04 00:00:00+03:30	\N
378	61	185	Exclusive background migration	\N	2026-09-16 00:00:00+03:30	\N
379	21	77	Synergistic optimizing concept	\N	2025-10-13 00:00:00+03:30	\N
380	17	104	Down-sized background website	\N	2026-01-21 00:00:00+03:30	\N
381	35	123	Multi-tiered discrete encryption	\N	2026-02-20 00:00:00+03:30	\N
382	58	60	Multi-tiered actuating internet solution	\N	2026-04-15 00:00:00+03:30	\N
383	10	146	Balanced tangible frame	\N	2026-08-01 00:00:00+03:30	\N
384	24	347	Optional maximized system engine	\N	2025-12-11 00:00:00+03:30	\N
385	68	289	Robust intermediate approach	\N	2026-02-24 00:00:00+03:30	\N
386	22	117	Distributed fault-tolerant frame	\N	2025-11-27 00:00:00+03:30	\N
387	58	29	Enhanced empowering installation	\N	2026-01-19 00:00:00+03:30	\N
388	15	208	Grass-roots modular complexity	\N	2026-02-10 00:00:00+03:30	\N
389	30	229	Balanced zero tolerance installation	\N	2026-01-08 00:00:00+03:30	\N
390	66	90	Persistent dynamic conglomeration	\N	2026-02-23 00:00:00+03:30	\N
391	35	352	Networked homogeneous neural-net	\N	2026-06-20 00:00:00+03:30	\N
392	55	62	Programmable hybrid complexity	\N	2025-11-30 00:00:00+03:30	\N
393	80	234	Synergized zero administration internet solution	\N	2026-02-16 00:00:00+03:30	2026-01-06 00:00:00+03:30
394	31	208	Team-oriented foreground definition	\N	2026-01-09 00:00:00+03:30	\N
395	6	154	Assimilated demand-driven emulation	\N	2026-08-18 00:00:00+03:30	\N
396	57	95	Ergonomic executive open system	\N	2026-07-16 00:00:00+03:30	\N
397	40	406	Pre-emptive analyzing capability	\N	2026-09-24 00:00:00+03:30	\N
398	27	307	Synergistic static benchmark	\N	2026-02-02 00:00:00+03:30	\N
399	71	177	Universal transitional protocol	\N	2026-03-28 00:00:00+03:30	\N
400	34	386	Customer-focused object-oriented capability	\N	2025-10-06 00:00:00+03:30	\N
401	30	149	Implemented 6th generation help-desk	\N	2026-08-14 00:00:00+03:30	\N
402	59	148	De-engineered bandwidth-monitored hub	\N	2026-01-23 00:00:00+03:30	2026-03-28 00:00:00+03:30
403	20	180	Automated fresh-thinking product	\N	2026-07-09 00:00:00+03:30	\N
404	59	15	Upgradable bottom-line adapter	\N	2025-10-12 00:00:00+03:30	\N
405	24	263	De-engineered 3rd generation data-warehouse	\N	2026-09-14 00:00:00+03:30	\N
406	62	205	Cloned heuristic attitude	\N	2025-12-18 00:00:00+03:30	\N
407	79	232	Universal foreground focus group	\N	2026-06-19 00:00:00+03:30	\N
408	5	177	Total demand-driven hub	\N	2026-06-25 00:00:00+03:30	\N
409	32	120	Profound global challenge	\N	2026-09-15 00:00:00+03:30	\N
410	68	364	Multi-channelled mobile open system	\N	2026-08-03 00:00:00+03:30	\N
411	68	318	Stand-alone cohesive secured line	\N	2026-04-26 00:00:00+03:30	2025-12-10 00:00:00+03:30
412	22	158	Multi-lateral incremental standardization	\N	2026-01-31 00:00:00+03:30	\N
413	21	69	Public-key object-oriented matrices	\N	2025-10-27 00:00:00+03:30	\N
414	35	286	Re-contextualized responsive middleware	\N	2026-09-11 00:00:00+03:30	\N
415	29	194	Face to face object-oriented extranet	\N	2026-03-01 00:00:00+03:30	\N
416	9	327	Multi-channelled 24/7 algorithm	\N	2026-06-21 00:00:00+03:30	\N
417	20	136	Horizontal zero tolerance core	\N	2026-09-14 00:00:00+03:30	\N
418	79	289	Secured optimal support	\N	2026-08-02 00:00:00+03:30	\N
419	35	401	Assimilated analyzing success	\N	2026-08-13 00:00:00+03:30	\N
420	62	272	Self-enabling 5th generation function	\N	2025-10-16 00:00:00+03:30	\N
421	17	302	Front-line asymmetric superstructure	\N	2025-10-19 00:00:00+03:30	\N
422	74	96	Diverse static hardware	\N	2026-04-16 00:00:00+03:30	\N
423	4	151	Assimilated zero tolerance leverage	\N	2026-05-05 00:00:00+03:30	\N
424	15	40	Assimilated heuristic neural-net	\N	2026-01-17 00:00:00+03:30	\N
425	3	169	Adaptive systemic success	\N	2026-03-18 00:00:00+03:30	\N
426	62	285	Extended web-enabled ability	\N	2026-01-24 00:00:00+03:30	\N
427	29	95	Up-sized methodical artificial intelligence	\N	2026-02-28 00:00:00+03:30	2026-09-26 00:00:00+03:30
428	16	242	Cloned 6th generation data-warehouse	\N	2025-10-19 00:00:00+03:30	\N
429	72	407	Networked real-time moratorium	\N	2026-02-05 00:00:00+03:30	\N
430	68	354	Team-oriented content-based utilisation	\N	2025-12-06 00:00:00+03:30	2025-10-31 00:00:00+03:30
431	73	48	Distributed solution-oriented capability	\N	2026-06-06 00:00:00+03:30	\N
432	76	23	Horizontal 24 hour artificial intelligence	\N	2026-01-16 00:00:00+03:30	\N
433	34	382	Front-line modular help-desk	\N	2026-08-13 00:00:00+03:30	\N
434	64	24	Enhanced even-keeled neural-net	\N	2025-12-15 00:00:00+03:30	\N
435	63	386	Cross-platform 5th generation structure	\N	2026-08-15 00:00:00+03:30	\N
436	4	214	Programmable user-facing projection	\N	2026-05-22 00:00:00+03:30	\N
437	78	231	Secured holistic attitude	\N	2025-11-16 00:00:00+03:30	\N
438	49	172	Multi-tiered discrete methodology	\N	2025-12-17 00:00:00+03:30	\N
439	2	401	Persistent bifurcated local area network	\N	2026-09-18 00:00:00+03:30	\N
440	76	230	Digitized executive ability	\N	2026-05-26 00:00:00+03:30	\N
441	50	333	Stand-alone composite local area network	\N	2026-05-17 00:00:00+03:30	\N
442	45	59	Digitized 5th generation architecture	\N	2026-09-20 00:00:00+03:30	\N
443	53	211	Intuitive uniform standardization	\N	2026-04-24 00:00:00+03:30	\N
444	59	189	Synchronised uniform interface	\N	2025-10-27 00:00:00+03:30	\N
445	15	259	Organized holistic policy	\N	2026-06-19 00:00:00+03:30	\N
446	10	78	Synergistic grid-enabled service-desk	\N	2026-01-10 00:00:00+03:30	\N
447	54	381	Public-key systematic workforce	\N	2026-04-20 00:00:00+03:30	\N
448	63	220	Synergistic dedicated leverage	\N	2026-08-21 00:00:00+03:30	\N
449	67	368	Integrated content-based artificial intelligence	\N	2025-12-04 00:00:00+03:30	\N
450	30	296	Mandatory client-driven Graphical User Interface	\N	2026-09-14 00:00:00+03:30	\N
451	20	55	Configurable optimizing methodology	\N	2026-04-23 00:00:00+03:30	\N
452	68	363	Customizable system-worthy adapter	\N	2026-06-10 00:00:00+03:30	\N
453	26	287	Cross-platform bi-directional budgetary management	\N	2026-05-01 00:00:00+03:30	\N
454	21	257	Reactive systematic frame	\N	2026-07-17 00:00:00+03:30	\N
455	78	201	Reduced multi-tasking utilisation	\N	2026-02-20 00:00:00+03:30	\N
456	28	169	Visionary regional model	\N	2026-05-23 00:00:00+03:30	\N
457	25	115	Total maximized info-mediaries	\N	2026-05-03 00:00:00+03:30	\N
458	79	380	Team-oriented cohesive task-force	\N	2025-12-16 00:00:00+03:30	\N
459	28	214	Grass-roots 5th generation customer loyalty	\N	2026-03-20 00:00:00+03:30	\N
460	24	86	De-engineered 5th generation analyzer	\N	2025-10-06 00:00:00+03:30	\N
461	67	378	Face to face radical functionalities	\N	2026-01-28 00:00:00+03:30	\N
462	55	288	Focused static intranet	\N	2025-11-04 00:00:00+03:30	\N
463	27	180	Progressive directional instruction set	\N	2026-04-14 00:00:00+03:30	\N
464	53	21	Synchronised mission-critical knowledge user	\N	2026-02-20 00:00:00+03:30	\N
465	27	115	Integrated global frame	\N	2025-12-13 00:00:00+03:30	\N
466	36	69	Sharable well-modulated matrix	\N	2026-06-19 00:00:00+03:30	\N
467	53	328	Object-based systemic parallelism	\N	2026-08-10 00:00:00+03:30	\N
468	24	132	Operative radical internet solution	\N	2026-01-08 00:00:00+03:30	\N
469	67	106	Total 5th generation leverage	\N	2026-09-14 00:00:00+03:30	2026-01-12 00:00:00+03:30
470	72	231	Universal attitude-oriented core	\N	2025-09-30 00:00:00+03:30	\N
471	29	219	Secured dynamic adapter	\N	2026-04-21 00:00:00+03:30	\N
472	16	152	Organized multimedia benchmark	\N	2025-12-22 00:00:00+03:30	2026-09-24 00:00:00+03:30
473	68	89	Enhanced upward-trending protocol	\N	2026-07-23 00:00:00+03:30	\N
474	81	151	Right-sized full-range archive	\N	2025-11-12 00:00:00+03:30	\N
475	33	101	Distributed didactic portal	\N	2026-07-17 00:00:00+03:30	\N
476	7	187	User-friendly composite parallelism	\N	2026-07-28 00:00:00+03:30	\N
477	70	161	Team-oriented full-range ability	\N	2026-07-09 00:00:00+03:30	\N
478	68	23	Progressive fresh-thinking help-desk	\N	2026-04-24 00:00:00+03:30	2025-10-03 00:00:00+03:30
479	64	258	Synchronised solution-oriented attitude	\N	2026-03-01 00:00:00+03:30	2026-09-14 00:00:00+03:30
480	7	60	Sharable multimedia secured line	\N	2025-11-15 00:00:00+03:30	\N
481	19	51	Fully-configurable bandwidth-monitored system engine	\N	2026-03-31 00:00:00+03:30	\N
482	38	306	Triple-buffered cohesive model	\N	2026-08-27 00:00:00+03:30	\N
483	31	95	Upgradable intangible extranet	\N	2026-01-08 00:00:00+03:30	\N
484	42	376	Synchronised impactful groupware	\N	2025-12-08 00:00:00+03:30	\N
485	27	31	Total foreground ability	\N	2026-04-30 00:00:00+03:30	\N
486	71	327	Synergistic client-driven concept	\N	2026-09-04 00:00:00+03:30	\N
487	60	310	Public-key 3rd generation framework	\N	2026-08-25 00:00:00+03:30	\N
488	22	73	Centralized uniform paradigm	\N	2026-01-11 00:00:00+03:30	\N
489	46	311	Extended multi-tasking capability	\N	2026-01-20 00:00:00+03:30	\N
490	28	59	Synergistic contextually-based concept	\N	2026-04-14 00:00:00+03:30	\N
491	31	273	Cloned grid-enabled matrix	\N	2026-03-13 00:00:00+03:30	\N
492	61	308	Secured transitional secured line	\N	2026-07-28 00:00:00+03:30	\N
493	69	169	Multi-layered mobile moderator	\N	2026-03-27 00:00:00+03:30	\N
494	69	335	Synergized client-driven definition	\N	2025-12-24 00:00:00+03:30	\N
495	57	80	Self-enabling maximized open architecture	\N	2026-04-26 00:00:00+03:30	\N
496	11	168	Business-focused human-resource protocol	\N	2025-12-19 00:00:00+03:30	\N
497	64	404	Centralized dynamic collaboration	\N	2025-12-19 00:00:00+03:30	\N
498	74	371	Progressive 6th generation groupware	\N	2026-09-16 00:00:00+03:30	\N
499	52	384	Proactive 24/7 artificial intelligence	\N	2026-08-15 00:00:00+03:30	2026-03-22 00:00:00+03:30
500	54	75	Quality-focused content-based service-desk	\N	2026-07-02 00:00:00+03:30	\N
501	57	125	Customer-focused grid-enabled open system	\N	2026-08-13 00:00:00+03:30	\N
502	25	324	Extended well-modulated service-desk	\N	2026-01-25 00:00:00+03:30	\N
503	53	322	Horizontal transitional flexibility	\N	2025-10-16 00:00:00+03:30	\N
504	11	132	Enhanced asymmetric policy	\N	2025-12-21 00:00:00+03:30	2026-08-27 00:00:00+03:30
505	52	214	Stand-alone multi-state open system	\N	2026-07-06 00:00:00+03:30	2026-02-22 00:00:00+03:30
506	63	78	Reduced secondary paradigm	\N	2026-05-31 00:00:00+03:30	\N
507	19	94	Pre-emptive motivating throughput	\N	2026-02-17 00:00:00+03:30	2026-03-08 00:00:00+03:30
508	29	115	Triple-buffered impactful challenge	\N	2026-03-11 00:00:00+03:30	2026-06-16 00:00:00+03:30
509	81	85	Seamless foreground complexity	\N	2026-07-27 00:00:00+03:30	\N
510	8	184	Stand-alone attitude-oriented throughput	\N	2026-08-18 00:00:00+03:30	\N
511	6	29	Secured motivating analyzer	\N	2025-12-27 00:00:00+03:30	\N
512	49	285	Innovative explicit emulation	\N	2026-04-18 00:00:00+03:30	\N
513	75	346	Monitored exuding capability	\N	2026-09-22 00:00:00+03:30	\N
514	34	108	Re-engineered optimizing knowledge base	\N	2026-08-24 00:00:00+03:30	\N
515	51	30	Expanded 4th generation model	\N	2026-07-11 00:00:00+03:30	\N
516	12	324	Progressive demand-driven knowledge base	\N	2026-04-27 00:00:00+03:30	\N
517	69	216	Cloned interactive time-frame	\N	2026-07-21 00:00:00+03:30	\N
518	22	179	Business-focused maximized strategy	\N	2026-05-04 00:00:00+03:30	\N
519	54	38	Quality-focused interactive website	\N	2026-01-04 00:00:00+03:30	\N
520	77	207	Grass-roots solution-oriented open system	\N	2026-09-24 00:00:00+03:30	\N
521	39	84	Configurable secondary architecture	\N	2026-08-03 00:00:00+03:30	\N
522	81	324	Versatile real-time open architecture	\N	2026-03-04 00:00:00+03:30	\N
523	12	295	Customer-focused clear-thinking capacity	\N	2026-04-17 00:00:00+03:30	\N
524	77	402	Streamlined clear-thinking installation	\N	2026-08-11 00:00:00+03:30	\N
525	26	97	Profound demand-driven function	\N	2026-03-09 00:00:00+03:30	\N
526	21	161	Secured systemic productivity	\N	2026-09-08 00:00:00+03:30	\N
527	37	197	Persevering foreground customer loyalty	\N	2026-08-28 00:00:00+03:30	\N
528	13	137	Multi-channelled directional process improvement	\N	2025-10-09 00:00:00+03:30	\N
529	56	27	Upgradable analyzing website	\N	2026-03-28 00:00:00+03:30	\N
530	46	215	Distributed dynamic database	\N	2026-07-02 00:00:00+03:30	\N
531	48	195	Vision-oriented directional adapter	\N	2026-06-16 00:00:00+03:30	\N
532	32	123	Monitored modular matrices	\N	2026-03-03 00:00:00+03:30	2026-09-14 00:00:00+03:30
533	18	221	Open-source bottom-line definition	\N	2026-07-24 00:00:00+03:30	2026-06-15 00:00:00+03:30
534	68	152	Phased holistic open architecture	\N	2026-02-06 00:00:00+03:30	\N
535	9	328	Triple-buffered clear-thinking workforce	\N	2026-05-13 00:00:00+03:30	\N
536	30	341	Pre-emptive dynamic adapter	\N	2025-10-09 00:00:00+03:30	\N
537	39	134	Managed executive database	\N	2026-01-13 00:00:00+03:30	\N
538	45	165	Upgradable empowering conglomeration	\N	2026-09-15 00:00:00+03:30	\N
539	7	73	Multi-channelled full-range structure	\N	2026-04-28 00:00:00+03:30	\N
540	39	103	Public-key heuristic standardization	\N	2025-12-26 00:00:00+03:30	\N
541	65	169	Multi-lateral optimizing project	\N	2025-10-15 00:00:00+03:30	\N
542	75	349	Enhanced bi-directional database	\N	2026-04-18 00:00:00+03:30	\N
543	46	215	Synergistic value-added strategy	\N	2026-07-23 00:00:00+03:30	\N
544	53	163	Realigned foreground analyzer	\N	2026-04-17 00:00:00+03:30	\N
545	69	150	Object-based object-oriented productivity	\N	2025-11-10 00:00:00+03:30	\N
546	27	60	Exclusive 24/7 intranet	\N	2026-08-03 00:00:00+03:30	\N
547	57	279	Operative bottom-line info-mediaries	\N	2026-08-26 00:00:00+03:30	\N
548	47	291	Customer-focused multimedia approach	\N	2026-07-08 00:00:00+03:30	\N
549	75	394	Adaptive 5th generation Graphical User Interface	\N	2026-01-10 00:00:00+03:30	\N
550	50	244	Upgradable homogeneous encoding	\N	2026-02-19 00:00:00+03:30	\N
551	46	60	Profound non-volatile core	\N	2025-12-20 00:00:00+03:30	\N
552	52	47	Cross-platform systematic extranet	\N	2026-01-18 00:00:00+03:30	\N
553	73	372	Quality-focused needs-based benchmark	\N	2026-08-07 00:00:00+03:30	\N
554	77	278	Function-based dynamic circuit	\N	2026-01-04 00:00:00+03:30	\N
555	80	193	Seamless zero administration capacity	\N	2026-02-24 00:00:00+03:30	\N
556	43	302	Customizable 24 hour encoding	\N	2025-10-29 00:00:00+03:30	\N
557	13	343	Phased bifurcated strategy	\N	2026-01-23 00:00:00+03:30	\N
558	35	37	Multi-channelled 6th generation open architecture	\N	2026-01-15 00:00:00+03:30	\N
559	18	100	Reactive well-modulated open architecture	\N	2026-02-13 00:00:00+03:30	\N
560	67	320	Multi-channelled well-modulated time-frame	\N	2025-11-22 00:00:00+03:30	\N
561	79	367	Intuitive leading edge portal	\N	2025-11-04 00:00:00+03:30	\N
562	63	261	Reactive client-server framework	\N	2026-09-07 00:00:00+03:30	\N
563	40	221	Reactive 4th generation flexibility	\N	2025-11-24 00:00:00+03:30	\N
564	78	325	Devolved 4th generation installation	\N	2026-07-02 00:00:00+03:30	\N
565	19	217	Vision-oriented 24/7 superstructure	\N	2026-05-30 00:00:00+03:30	\N
566	52	229	Decentralized fresh-thinking knowledge user	\N	2026-08-14 00:00:00+03:30	\N
567	70	75	Open-architected directional emulation	\N	2026-04-29 00:00:00+03:30	\N
568	11	247	Public-key methodical ability	\N	2026-05-29 00:00:00+03:30	2026-07-20 00:00:00+03:30
569	31	268	Open-source systemic encoding	\N	2026-01-05 00:00:00+03:30	\N
570	23	77	Sharable 6th generation approach	\N	2025-11-03 00:00:00+03:30	\N
571	50	29	Focused system-worthy framework	\N	2026-05-24 00:00:00+03:30	\N
572	41	102	Business-focused mission-critical archive	\N	2025-10-27 00:00:00+03:30	\N
573	11	372	User-centric national circuit	\N	2026-08-27 00:00:00+03:30	\N
574	5	124	Streamlined multi-state projection	\N	2026-06-16 00:00:00+03:30	\N
575	72	153	Reverse-engineered real-time software	\N	2026-01-14 00:00:00+03:30	\N
576	16	322	Distributed multi-tasking projection	\N	2025-12-03 00:00:00+03:30	\N
577	51	357	De-engineered non-volatile alliance	\N	2025-12-23 00:00:00+03:30	\N
578	48	221	Triple-buffered optimizing frame	\N	2026-03-21 00:00:00+03:30	\N
579	26	219	Customizable transitional parallelism	\N	2025-11-28 00:00:00+03:30	\N
580	34	406	Seamless contextually-based time-frame	\N	2025-12-25 00:00:00+03:30	\N
581	42	198	Organic hybrid matrices	\N	2026-07-11 00:00:00+03:30	\N
582	56	308	Seamless zero tolerance migration	\N	2026-02-02 00:00:00+03:30	\N
583	7	136	Front-line human-resource portal	\N	2026-06-12 00:00:00+03:30	\N
584	33	233	Down-sized system-worthy collaboration	\N	2026-01-14 00:00:00+03:30	\N
585	66	62	Seamless high-level hardware	\N	2025-10-06 00:00:00+03:30	\N
586	67	185	Open-source real-time solution	\N	2026-02-02 00:00:00+03:30	\N
587	49	26	Synergized non-volatile budgetary management	\N	2025-10-07 00:00:00+03:30	\N
588	57	95	Profound fault-tolerant artificial intelligence	\N	2026-07-18 00:00:00+03:30	\N
589	27	309	Upgradable uniform software	\N	2026-07-05 00:00:00+03:30	2026-08-02 00:00:00+03:30
590	28	110	Universal bottom-line productivity	\N	2025-12-13 00:00:00+03:30	\N
591	10	320	Fully-configurable bifurcated adapter	\N	2026-08-06 00:00:00+03:30	\N
592	48	371	Multi-tiered systemic open architecture	\N	2025-11-19 00:00:00+03:30	\N
593	17	301	Diverse optimizing info-mediaries	\N	2026-05-23 00:00:00+03:30	\N
594	69	50	Distributed global matrix	\N	2026-04-20 00:00:00+03:30	\N
595	14	198	Centralized high-level concept	\N	2026-05-24 00:00:00+03:30	\N
596	56	91	Grass-roots fresh-thinking productivity	\N	2026-06-10 00:00:00+03:30	\N
597	31	156	Versatile secondary model	\N	2026-04-15 00:00:00+03:30	\N
598	12	380	Re-engineered zero defect hierarchy	\N	2026-03-25 00:00:00+03:30	\N
599	58	17	User-friendly multi-state projection	\N	2026-03-20 00:00:00+03:30	\N
600	11	390	Switchable non-volatile project	\N	2026-09-01 00:00:00+03:30	\N
601	50	128	Re-engineered secondary algorithm	\N	2026-01-11 00:00:00+03:30	\N
602	77	340	Realigned needs-based analyzer	\N	2025-10-15 00:00:00+03:30	\N
603	41	73	Networked background monitoring	\N	2026-07-20 00:00:00+03:30	2026-05-29 00:00:00+03:30
604	44	290	Organic background access	\N	2026-02-19 00:00:00+03:30	\N
605	28	298	Balanced reciprocal adapter	\N	2026-01-19 00:00:00+03:30	\N
606	50	144	Enhanced tertiary service-desk	\N	2026-05-12 00:00:00+03:30	\N
607	69	213	Phased next generation leverage	\N	2026-09-15 00:00:00+03:30	\N
608	81	157	Ameliorated disintermediate utilisation	\N	2026-07-13 00:00:00+03:30	\N
609	9	174	Configurable coherent analyzer	\N	2025-10-18 00:00:00+03:30	\N
610	22	45	Innovative demand-driven policy	\N	2026-01-05 00:00:00+03:30	2026-03-31 00:00:00+03:30
611	52	57	Configurable optimal superstructure	\N	2025-10-28 00:00:00+03:30	\N
612	52	372	Open-architected solution-oriented forecast	\N	2026-02-09 00:00:00+03:30	\N
613	80	172	Distributed object-oriented Graphic Interface	\N	2026-02-07 00:00:00+03:30	2025-12-08 00:00:00+03:30
614	65	236	Right-sized real-time solution	\N	2026-07-25 00:00:00+03:30	2025-09-30 00:00:00+03:30
615	32	288	Pre-emptive bi-directional info-mediaries	\N	2025-11-02 00:00:00+03:30	\N
616	47	72	Triple-buffered regional alliance	\N	2026-09-04 00:00:00+03:30	2026-07-01 00:00:00+03:30
617	10	187	Organized modular encryption	\N	2025-10-25 00:00:00+03:30	\N
618	52	224	Balanced methodical application	\N	2025-10-31 00:00:00+03:30	\N
619	40	240	Pre-emptive coherent intranet	\N	2026-05-11 00:00:00+03:30	\N
620	40	195	Expanded bi-directional adapter	\N	2026-01-08 00:00:00+03:30	\N
621	78	212	Switchable web-enabled strategy	\N	2026-04-30 00:00:00+03:30	\N
622	52	92	User-centric human-resource software	\N	2026-06-25 00:00:00+03:30	2026-08-04 00:00:00+03:30
623	6	353	Versatile discrete open architecture	\N	2025-10-31 00:00:00+03:30	\N
624	17	100	Advanced 3rd generation policy	\N	2026-02-07 00:00:00+03:30	\N
625	75	93	Multi-layered zero administration matrix	\N	2026-02-09 00:00:00+03:30	\N
626	9	281	Innovative demand-driven service-desk	\N	2026-05-11 00:00:00+03:30	\N
627	60	123	Synergized tangible website	\N	2025-11-22 00:00:00+03:30	\N
628	73	86	Pre-emptive stable artificial intelligence	\N	2026-09-22 00:00:00+03:30	\N
629	54	130	Multi-lateral leading edge knowledge base	\N	2026-05-19 00:00:00+03:30	\N
630	17	217	Distributed non-volatile solution	\N	2026-08-15 00:00:00+03:30	\N
631	68	287	Robust background product	\N	2026-02-12 00:00:00+03:30	2025-10-19 00:00:00+03:30
632	79	316	Virtual actuating open system	\N	2025-10-29 00:00:00+03:30	\N
633	6	256	Expanded multi-state data-warehouse	\N	2026-06-12 00:00:00+03:30	\N
634	33	410	Profound radical utilisation	\N	2026-05-04 00:00:00+03:30	\N
635	12	83	Future-proofed fresh-thinking productivity	\N	2026-04-10 00:00:00+03:30	\N
636	75	70	Fundamental system-worthy implementation	\N	2026-02-25 00:00:00+03:30	\N
637	30	189	Stand-alone regional data-warehouse	\N	2026-01-10 00:00:00+03:30	\N
638	6	235	Cloned empowering process improvement	\N	2026-07-30 00:00:00+03:30	\N
639	44	139	Pre-emptive systematic instruction set	\N	2026-08-17 00:00:00+03:30	\N
640	57	228	Devolved fresh-thinking knowledge user	\N	2026-07-31 00:00:00+03:30	\N
641	15	154	Synergized background forecast	\N	2026-04-05 00:00:00+03:30	2025-11-04 00:00:00+03:30
642	33	276	User-centric 24/7 installation	\N	2025-11-17 00:00:00+03:30	\N
643	38	368	Implemented grid-enabled Graphical User Interface	\N	2026-03-26 00:00:00+03:30	2026-09-11 00:00:00+03:30
644	3	241	Synergistic upward-trending matrices	\N	2026-04-05 00:00:00+03:30	\N
645	12	278	Persistent actuating toolset	\N	2025-12-04 00:00:00+03:30	2026-04-22 00:00:00+03:30
646	58	394	Fully-configurable discrete initiative	\N	2026-08-25 00:00:00+03:30	\N
647	41	309	Synchronised asymmetric data-warehouse	\N	2026-02-24 00:00:00+03:30	\N
648	72	217	Progressive zero administration website	\N	2025-10-27 00:00:00+03:30	\N
649	5	117	Object-based 5th generation capacity	\N	2026-04-15 00:00:00+03:30	\N
650	78	297	Multi-lateral maximized capability	\N	2026-08-28 00:00:00+03:30	\N
651	64	284	Enhanced real-time benchmark	\N	2026-05-13 00:00:00+03:30	2025-10-26 00:00:00+03:30
652	32	241	Organized content-based migration	\N	2025-10-30 00:00:00+03:30	\N
653	81	267	Polarised neutral Graphical User Interface	\N	2026-02-05 00:00:00+03:30	\N
654	13	122	Face to face mobile access	\N	2025-12-06 00:00:00+03:30	\N
655	57	53	Programmable multi-tasking productivity	\N	2026-09-21 00:00:00+03:30	\N
656	11	146	Multi-channelled object-oriented functionalities	\N	2026-06-20 00:00:00+03:30	\N
657	33	333	Cloned actuating installation	\N	2026-03-19 00:00:00+03:30	\N
658	42	336	Re-engineered mission-critical firmware	\N	2026-07-04 00:00:00+03:30	\N
659	32	331	Profound systematic frame	\N	2026-03-27 00:00:00+03:30	2026-09-26 00:00:00+03:30
660	75	326	Stand-alone incremental definition	\N	2026-06-01 00:00:00+03:30	\N
661	52	346	Ameliorated multi-tasking benchmark	\N	2026-04-30 00:00:00+03:30	\N
662	49	259	Managed 24 hour groupware	\N	2026-01-09 00:00:00+03:30	\N
663	26	39	Robust incremental synergy	\N	2026-02-06 00:00:00+03:30	\N
664	2	106	Customizable next generation knowledge base	\N	2026-04-26 00:00:00+03:30	\N
665	77	249	Monitored interactive frame	\N	2026-06-09 00:00:00+03:30	\N
666	10	63	Customer-focused multi-tasking extranet	\N	2025-11-20 00:00:00+03:30	2026-04-19 00:00:00+03:30
667	2	410	Managed reciprocal project	\N	2026-02-05 00:00:00+03:30	\N
668	69	351	Balanced eco-centric ability	\N	2026-08-28 00:00:00+03:30	\N
669	12	358	Centralized solution-oriented open system	\N	2026-07-11 00:00:00+03:30	\N
670	27	328	Progressive contextually-based standardization	\N	2026-01-17 00:00:00+03:30	2026-05-22 00:00:00+03:30
671	21	42	Cross-group modular database	\N	2026-04-13 00:00:00+03:30	2026-09-22 00:00:00+03:30
672	27	187	Integrated local utilisation	\N	2026-07-25 00:00:00+03:30	\N
673	30	229	Digitized even-keeled projection	\N	2026-07-04 00:00:00+03:30	\N
674	81	253	Automated empowering complexity	\N	2026-03-10 00:00:00+03:30	\N
675	53	257	Face to face neutral paradigm	\N	2026-08-11 00:00:00+03:30	\N
676	6	312	Persistent asymmetric service-desk	\N	2026-04-24 00:00:00+03:30	\N
677	36	144	Future-proofed dedicated monitoring	\N	2026-08-25 00:00:00+03:30	\N
678	70	184	Multi-lateral 24 hour analyzer	\N	2026-03-08 00:00:00+03:30	\N
679	73	96	Operative optimizing project	\N	2026-09-17 00:00:00+03:30	2026-01-01 00:00:00+03:30
680	47	401	Synergized bi-directional leverage	\N	2026-08-02 00:00:00+03:30	\N
681	30	292	Customizable motivating initiative	\N	2026-09-18 00:00:00+03:30	\N
682	69	188	Configurable contextually-based initiative	\N	2026-03-20 00:00:00+03:30	\N
683	54	184	Quality-focused 4th generation success	\N	2026-05-20 00:00:00+03:30	\N
684	3	253	Re-engineered intermediate complexity	\N	2026-08-30 00:00:00+03:30	\N
685	25	381	User-friendly asynchronous alliance	\N	2026-05-08 00:00:00+03:30	\N
686	77	294	Advanced value-added pricing structure	\N	2025-10-05 00:00:00+03:30	\N
687	18	277	Fundamental local infrastructure	\N	2025-11-22 00:00:00+03:30	\N
688	50	362	Horizontal multi-state superstructure	\N	2026-06-06 00:00:00+03:30	2026-03-06 00:00:00+03:30
689	19	202	Customizable stable data-warehouse	\N	2026-09-17 00:00:00+03:30	\N
690	36	41	Virtual zero administration middleware	\N	2025-10-30 00:00:00+03:30	\N
691	30	53	Devolved content-based Graphic Interface	\N	2026-02-10 00:00:00+03:30	2026-08-21 00:00:00+03:30
692	21	75	Reverse-engineered tangible local area network	\N	2025-10-03 00:00:00+03:30	\N
693	58	193	Streamlined didactic moratorium	\N	2026-01-17 00:00:00+03:30	\N
694	57	362	Mandatory homogeneous budgetary management	\N	2026-09-15 00:00:00+03:30	\N
695	72	224	Vision-oriented 3rd generation standardization	\N	2026-08-06 00:00:00+03:30	\N
696	35	108	Progressive methodical projection	\N	2026-02-10 00:00:00+03:30	\N
697	2	267	Distributed optimizing alliance	\N	2025-10-05 00:00:00+03:30	\N
698	34	223	Assimilated 24 hour toolset	\N	2026-07-22 00:00:00+03:30	\N
699	50	72	Organic impactful model	\N	2025-10-13 00:00:00+03:30	\N
700	26	297	Streamlined reciprocal support	\N	2026-01-06 00:00:00+03:30	\N
701	33	173	Phased incremental portal	\N	2026-01-04 00:00:00+03:30	\N
702	81	198	Focused actuating Graphical User Interface	\N	2025-11-05 00:00:00+03:30	\N
703	57	396	Phased content-based groupware	\N	2025-11-18 00:00:00+03:30	\N
704	18	402	Assimilated contextually-based alliance	\N	2026-08-20 00:00:00+03:30	\N
705	61	54	Programmable attitude-oriented throughput	\N	2026-04-18 00:00:00+03:30	\N
706	53	361	Managed tangible infrastructure	\N	2026-03-27 00:00:00+03:30	\N
707	23	284	Programmable solution-oriented hardware	\N	2025-11-19 00:00:00+03:30	\N
708	43	321	Object-based optimal ability	\N	2026-09-04 00:00:00+03:30	\N
709	54	238	Vision-oriented responsive help-desk	\N	2026-05-01 00:00:00+03:30	2026-06-10 00:00:00+03:30
710	9	126	Virtual holistic forecast	\N	2026-08-19 00:00:00+03:30	\N
711	74	39	Diverse 6th generation interface	\N	2026-07-18 00:00:00+03:30	\N
712	81	31	Right-sized user-facing standardization	\N	2026-09-27 00:00:00+03:30	\N
713	78	372	Distributed object-oriented contingency	\N	2026-08-06 00:00:00+03:30	2026-04-29 00:00:00+03:30
714	64	376	Virtual leading edge knowledge base	\N	2026-03-13 00:00:00+03:30	\N
715	80	46	Focused demand-driven budgetary management	\N	2025-10-15 00:00:00+03:30	\N
716	59	213	Persevering encompassing synergy	\N	2026-03-30 00:00:00+03:30	\N
717	4	76	Distributed value-added toolset	\N	2026-06-28 00:00:00+03:30	\N
718	4	308	Robust transitional middleware	\N	2026-02-25 00:00:00+03:30	\N
719	12	409	Optimized intermediate interface	\N	2026-01-15 00:00:00+03:30	\N
720	34	129	Multi-layered web-enabled complexity	\N	2026-05-23 00:00:00+03:30	\N
721	71	318	Function-based regional groupware	\N	2025-12-01 00:00:00+03:30	\N
722	6	296	Profound uniform implementation	\N	2026-07-15 00:00:00+03:30	\N
723	55	240	Mandatory reciprocal infrastructure	\N	2025-12-31 00:00:00+03:30	\N
724	41	401	Polarised dynamic algorithm	\N	2026-08-20 00:00:00+03:30	\N
725	49	281	Automated national firmware	\N	2025-10-01 00:00:00+03:30	\N
726	52	367	Multi-lateral national function	\N	2025-12-29 00:00:00+03:30	\N
727	42	334	Grass-roots radical functionalities	\N	2026-06-14 00:00:00+03:30	2025-10-10 00:00:00+03:30
728	74	250	Implemented fault-tolerant knowledge base	\N	2026-09-20 00:00:00+03:30	2026-03-21 00:00:00+03:30
729	20	339	Up-sized secondary parallelism	\N	2026-01-04 00:00:00+03:30	\N
730	50	229	Organic secondary definition	\N	2026-09-06 00:00:00+03:30	\N
731	79	366	Advanced systemic success	\N	2025-10-12 00:00:00+03:30	2025-11-21 00:00:00+03:30
732	31	342	Integrated real-time parallelism	\N	2026-02-10 00:00:00+03:30	\N
733	64	272	Cross-group context-sensitive website	\N	2026-07-10 00:00:00+03:30	\N
734	76	27	Synergistic executive capacity	\N	2026-06-30 00:00:00+03:30	\N
735	50	20	Future-proofed 24/7 workforce	\N	2026-05-11 00:00:00+03:30	\N
736	21	308	Streamlined maximized protocol	\N	2025-10-22 00:00:00+03:30	\N
737	70	208	Compatible homogeneous extranet	\N	2026-04-03 00:00:00+03:30	\N
738	13	356	Team-oriented 4th generation implementation	\N	2025-12-17 00:00:00+03:30	\N
739	41	41	Open-source 3rd generation capacity	\N	2026-07-04 00:00:00+03:30	\N
740	14	206	Re-contextualized global orchestration	\N	2025-10-19 00:00:00+03:30	\N
741	12	227	Implemented object-oriented hub	\N	2025-10-25 00:00:00+03:30	\N
742	4	230	Monitored stable contingency	\N	2025-12-25 00:00:00+03:30	\N
743	61	213	Focused client-server artificial intelligence	\N	2026-01-19 00:00:00+03:30	\N
744	49	71	Extended high-level workforce	\N	2026-04-17 00:00:00+03:30	\N
745	3	398	Intuitive bottom-line help-desk	\N	2026-07-12 00:00:00+03:30	\N
746	52	361	Vision-oriented asymmetric open system	\N	2026-08-13 00:00:00+03:30	\N
747	58	396	Profound upward-trending capacity	\N	2026-09-13 00:00:00+03:30	\N
748	25	407	Synergistic radical concept	\N	2025-11-21 00:00:00+03:30	\N
749	31	388	Ameliorated solution-oriented paradigm	\N	2026-03-19 00:00:00+03:30	\N
750	29	73	Grass-roots grid-enabled framework	\N	2026-05-21 00:00:00+03:30	2026-03-05 00:00:00+03:30
751	25	389	Enterprise-wide homogeneous algorithm	\N	2026-08-16 00:00:00+03:30	\N
752	21	56	Universal cohesive interface	\N	2026-06-20 00:00:00+03:30	\N
753	12	324	Upgradable didactic knowledge user	\N	2026-07-30 00:00:00+03:30	\N
754	26	109	Object-based radical definition	\N	2025-10-29 00:00:00+03:30	\N
755	60	349	Robust didactic methodology	\N	2025-12-05 00:00:00+03:30	\N
756	69	42	Ameliorated context-sensitive emulation	\N	2026-08-02 00:00:00+03:30	\N
757	6	273	Multi-channelled tangible forecast	\N	2025-11-30 00:00:00+03:30	\N
758	47	345	Devolved multi-state algorithm	\N	2026-05-20 00:00:00+03:30	\N
759	44	354	Reduced upward-trending groupware	\N	2026-01-23 00:00:00+03:30	\N
760	4	166	Innovative empowering moderator	\N	2026-01-28 00:00:00+03:30	\N
761	81	68	Open-source dynamic open architecture	\N	2025-12-10 00:00:00+03:30	2025-11-20 00:00:00+03:30
762	5	89	Secured zero tolerance orchestration	\N	2025-11-09 00:00:00+03:30	\N
763	19	340	Enhanced multi-state ability	\N	2025-12-27 00:00:00+03:30	2025-12-22 00:00:00+03:30
764	14	129	Multi-channelled leading edge migration	\N	2026-01-21 00:00:00+03:30	\N
765	58	396	Team-oriented systematic info-mediaries	\N	2026-02-21 00:00:00+03:30	\N
766	46	237	Virtual neutral database	\N	2025-12-23 00:00:00+03:30	\N
767	35	411	Face to face incremental hub	\N	2026-08-19 00:00:00+03:30	\N
768	44	65	Multi-lateral uniform framework	\N	2026-09-06 00:00:00+03:30	\N
769	10	189	Right-sized motivating workforce	\N	2026-05-17 00:00:00+03:30	\N
770	24	239	Assimilated heuristic strategy	\N	2026-03-20 00:00:00+03:30	\N
771	33	305	Re-contextualized non-volatile standardization	\N	2025-10-05 00:00:00+03:30	\N
772	80	386	Reactive zero tolerance database	\N	2026-05-25 00:00:00+03:30	\N
773	24	304	Proactive empowering matrices	\N	2026-02-19 00:00:00+03:30	2026-02-17 00:00:00+03:30
774	69	116	Adaptive multimedia instruction set	\N	2026-09-22 00:00:00+03:30	\N
775	2	206	Horizontal transitional architecture	\N	2026-07-16 00:00:00+03:30	\N
776	18	35	Future-proofed empowering implementation	\N	2025-12-05 00:00:00+03:30	\N
777	69	328	Sharable 4th generation algorithm	\N	2025-12-13 00:00:00+03:30	\N
778	33	200	Grass-roots transitional complexity	\N	2025-10-26 00:00:00+03:30	\N
779	41	21	Multi-lateral motivating Graphic Interface	\N	2026-01-24 00:00:00+03:30	\N
780	47	145	Operative neutral Graphic Interface	\N	2025-10-25 00:00:00+03:30	\N
781	41	271	Optimized content-based monitoring	\N	2026-01-10 00:00:00+03:30	\N
782	12	278	Multi-lateral executive data-warehouse	\N	2026-09-13 00:00:00+03:30	\N
783	66	104	Managed fresh-thinking policy	\N	2025-10-14 00:00:00+03:30	\N
784	32	271	Centralized user-facing open architecture	\N	2025-11-27 00:00:00+03:30	\N
785	39	142	Monitored multi-tasking service-desk	\N	2026-08-14 00:00:00+03:30	\N
786	9	73	Integrated needs-based moratorium	\N	2026-01-19 00:00:00+03:30	\N
787	64	137	Reverse-engineered discrete hierarchy	\N	2025-11-22 00:00:00+03:30	\N
788	71	236	Function-based static alliance	\N	2025-12-18 00:00:00+03:30	\N
789	55	96	User-centric homogeneous emulation	\N	2026-03-02 00:00:00+03:30	\N
790	77	293	Self-enabling coherent methodology	\N	2026-01-03 00:00:00+03:30	\N
791	55	17	Reverse-engineered stable interface	\N	2025-12-11 00:00:00+03:30	\N
792	61	123	Intuitive heuristic array	\N	2026-08-28 00:00:00+03:30	\N
793	65	366	Networked 24/7 projection	\N	2026-05-20 00:00:00+03:30	\N
794	7	156	Ergonomic tangible strategy	\N	2026-09-17 00:00:00+03:30	\N
795	37	277	Managed 3rd generation flexibility	\N	2026-02-04 00:00:00+03:30	\N
796	53	224	Distributed interactive software	\N	2026-07-22 00:00:00+03:30	\N
797	13	229	Realigned non-volatile challenge	\N	2026-04-10 00:00:00+03:30	\N
798	32	54	Quality-focused even-keeled local area network	\N	2025-12-23 00:00:00+03:30	\N
799	57	341	Integrated real-time knowledge base	\N	2025-11-11 00:00:00+03:30	\N
800	40	39	Reverse-engineered responsive groupware	\N	2026-02-20 00:00:00+03:30	\N
801	7	324	Horizontal asymmetric adapter	\N	2025-12-21 00:00:00+03:30	2026-04-16 00:00:00+03:30
802	19	314	Networked transitional moratorium	\N	2026-06-08 00:00:00+03:30	\N
803	41	383	Decentralized 3rd generation throughput	\N	2025-12-25 00:00:00+03:30	\N
804	22	238	Quality-focused mobile interface	\N	2026-02-13 00:00:00+03:30	\N
805	52	207	Intuitive uniform budgetary management	\N	2026-09-13 00:00:00+03:30	\N
806	27	24	Programmable multi-state knowledge base	\N	2026-07-05 00:00:00+03:30	\N
807	10	143	Reverse-engineered responsive collaboration	\N	2026-09-28 00:00:00+03:30	\N
808	28	190	Stand-alone optimal projection	\N	2026-02-01 00:00:00+03:30	\N
809	61	308	Versatile holistic collaboration	\N	2026-03-04 00:00:00+03:30	\N
810	6	244	Optimized impactful open system	\N	2026-05-22 00:00:00+03:30	\N
811	19	54	Ameliorated heuristic migration	\N	2025-12-17 00:00:00+03:30	\N
812	6	151	Devolved zero defect adapter	\N	2026-09-22 00:00:00+03:30	\N
813	74	292	Distributed secondary flexibility	\N	2026-03-02 00:00:00+03:30	\N
814	13	48	Grass-roots grid-enabled neural-net	\N	2026-01-22 00:00:00+03:30	\N
815	13	291	Versatile upward-trending protocol	\N	2026-03-17 00:00:00+03:30	\N
816	48	235	Sharable upward-trending extranet	\N	2026-04-21 00:00:00+03:30	\N
817	53	221	Grass-roots web-enabled leverage	\N	2026-06-08 00:00:00+03:30	\N
818	75	227	Digitized encompassing standardization	\N	2026-02-08 00:00:00+03:30	\N
819	5	80	Intuitive mission-critical alliance	\N	2026-08-02 00:00:00+03:30	\N
820	56	219	Configurable human-resource superstructure	\N	2026-04-27 00:00:00+03:30	2026-05-07 00:00:00+03:30
821	47	217	Expanded fault-tolerant hierarchy	\N	2026-07-28 00:00:00+03:30	\N
822	29	263	Adaptive uniform synergy	\N	2026-06-26 00:00:00+03:30	2026-09-17 00:00:00+03:30
823	59	264	Re-contextualized attitude-oriented solution	\N	2026-09-03 00:00:00+03:30	\N
824	45	152	User-centric coherent superstructure	\N	2025-11-13 00:00:00+03:30	2026-07-28 00:00:00+03:30
825	34	292	Triple-buffered local website	\N	2026-03-22 00:00:00+03:30	\N
826	81	229	Horizontal heuristic workforce	\N	2026-04-07 00:00:00+03:30	\N
827	22	21	Realigned radical complexity	\N	2026-03-09 00:00:00+03:30	\N
828	39	54	Compatible mission-critical hierarchy	\N	2026-03-12 00:00:00+03:30	2026-05-12 00:00:00+03:30
829	33	248	Reverse-engineered static concept	\N	2026-05-04 00:00:00+03:30	\N
830	5	284	Balanced transitional solution	\N	2025-10-23 00:00:00+03:30	2025-12-13 00:00:00+03:30
831	27	42	Innovative fresh-thinking analyzer	\N	2026-02-22 00:00:00+03:30	2026-02-11 00:00:00+03:30
832	6	285	Future-proofed encompassing installation	\N	2026-02-05 00:00:00+03:30	\N
833	77	366	Programmable systemic implementation	\N	2025-12-24 00:00:00+03:30	\N
834	49	166	Intuitive 4th generation adapter	\N	2026-06-04 00:00:00+03:30	\N
835	32	304	Extended bifurcated challenge	\N	2026-07-21 00:00:00+03:30	\N
836	31	236	Face to face user-facing architecture	\N	2026-01-14 00:00:00+03:30	\N
837	4	295	Pre-emptive motivating infrastructure	\N	2025-10-29 00:00:00+03:30	2026-03-17 00:00:00+03:30
838	27	223	Versatile cohesive customer loyalty	\N	2026-01-17 00:00:00+03:30	\N
839	36	84	Configurable exuding synergy	\N	2026-08-01 00:00:00+03:30	\N
840	78	303	Reverse-engineered incremental encryption	\N	2026-01-17 00:00:00+03:30	\N
841	35	67	Versatile zero tolerance info-mediaries	\N	2026-06-19 00:00:00+03:30	\N
842	7	182	Visionary static conglomeration	\N	2026-03-09 00:00:00+03:30	\N
843	14	144	Polarised 4th generation moratorium	\N	2026-07-23 00:00:00+03:30	\N
844	16	167	Streamlined well-modulated forecast	\N	2026-03-25 00:00:00+03:30	\N
845	75	43	Fully-configurable global software	\N	2025-10-26 00:00:00+03:30	\N
846	40	194	Profit-focused client-server task-force	\N	2026-08-15 00:00:00+03:30	\N
847	35	408	Visionary asynchronous software	\N	2026-08-27 00:00:00+03:30	\N
848	42	177	Right-sized intangible open architecture	\N	2025-11-14 00:00:00+03:30	\N
849	69	47	Enterprise-wide value-added implementation	\N	2026-09-03 00:00:00+03:30	\N
850	57	184	Assimilated systemic attitude	\N	2026-03-28 00:00:00+03:30	2025-12-23 00:00:00+03:30
851	60	361	Seamless encompassing frame	\N	2026-09-21 00:00:00+03:30	\N
852	58	16	Public-key mobile function	\N	2026-02-26 00:00:00+03:30	\N
853	75	332	Public-key solution-oriented projection	\N	2026-02-14 00:00:00+03:30	\N
854	60	305	Quality-focused motivating hierarchy	\N	2025-11-26 00:00:00+03:30	\N
855	38	332	Versatile analyzing protocol	\N	2026-02-17 00:00:00+03:30	\N
856	79	194	Organized scalable project	\N	2026-09-22 00:00:00+03:30	\N
857	45	206	Self-enabling methodical frame	\N	2026-09-17 00:00:00+03:30	\N
858	72	228	Progressive directional implementation	\N	2025-12-12 00:00:00+03:30	\N
859	8	345	Phased even-keeled utilisation	\N	2026-08-04 00:00:00+03:30	\N
860	23	352	Fully-configurable fault-tolerant algorithm	\N	2026-01-24 00:00:00+03:30	\N
861	49	302	Quality-focused next generation local area network	\N	2026-06-21 00:00:00+03:30	\N
862	52	64	Assimilated maximized product	\N	2025-12-10 00:00:00+03:30	\N
863	35	216	Open-architected 6th generation firmware	\N	2026-02-23 00:00:00+03:30	\N
864	11	306	Down-sized homogeneous approach	\N	2026-08-06 00:00:00+03:30	\N
865	49	43	Virtual zero administration encoding	\N	2026-07-17 00:00:00+03:30	\N
866	20	181	Versatile optimal array	\N	2026-06-08 00:00:00+03:30	\N
867	7	19	Reduced coherent methodology	\N	2025-10-30 00:00:00+03:30	\N
868	80	242	Organic maximized website	\N	2026-06-17 00:00:00+03:30	\N
869	78	301	Streamlined context-sensitive archive	\N	2026-03-28 00:00:00+03:30	\N
870	61	94	Secured next generation moderator	\N	2026-05-02 00:00:00+03:30	2026-08-25 00:00:00+03:30
871	8	399	Focused optimal emulation	\N	2026-05-06 00:00:00+03:30	\N
872	73	93	Stand-alone didactic solution	\N	2026-02-21 00:00:00+03:30	\N
873	52	368	Balanced optimal hub	\N	2026-09-22 00:00:00+03:30	\N
874	3	297	Multi-lateral fresh-thinking challenge	\N	2026-05-21 00:00:00+03:30	\N
875	5	386	Expanded empowering ability	\N	2026-09-17 00:00:00+03:30	\N
876	64	399	Centralized 4th generation flexibility	\N	2026-03-28 00:00:00+03:30	\N
877	28	368	Synergized multi-state protocol	\N	2025-10-01 00:00:00+03:30	2026-05-22 00:00:00+03:30
878	18	100	Extended logistical architecture	\N	2026-01-21 00:00:00+03:30	2026-09-08 00:00:00+03:30
879	80	116	Synergized logistical hardware	\N	2026-07-10 00:00:00+03:30	\N
880	78	300	Persistent intangible solution	\N	2025-10-20 00:00:00+03:30	\N
881	56	86	Ergonomic multimedia forecast	\N	2026-03-21 00:00:00+03:30	\N
882	61	17	Innovative didactic analyzer	\N	2026-01-13 00:00:00+03:30	2026-03-21 00:00:00+03:30
883	11	353	Expanded 24/7 orchestration	\N	2025-11-20 00:00:00+03:30	\N
884	24	17	Profound human-resource function	\N	2026-02-10 00:00:00+03:30	\N
885	68	149	Cross-platform national capacity	\N	2026-07-13 00:00:00+03:30	2026-08-02 00:00:00+03:30
886	64	94	Optimized client-driven Graphical User Interface	\N	2025-12-12 00:00:00+03:30	\N
887	58	398	Grass-roots neutral conglomeration	\N	2026-04-02 00:00:00+03:30	\N
888	71	226	Multi-lateral 5th generation website	\N	2026-09-24 00:00:00+03:30	\N
889	3	337	Balanced maximized monitoring	\N	2026-05-15 00:00:00+03:30	2025-12-05 00:00:00+03:30
890	75	65	Re-contextualized heuristic artificial intelligence	\N	2025-10-14 00:00:00+03:30	\N
891	50	148	Versatile homogeneous product	\N	2026-06-09 00:00:00+03:30	\N
892	64	199	Managed well-modulated knowledge user	\N	2025-12-04 00:00:00+03:30	\N
893	67	166	Advanced 24/7 system engine	\N	2025-10-25 00:00:00+03:30	\N
894	48	182	Optimized zero defect forecast	\N	2026-06-27 00:00:00+03:30	\N
895	77	364	Business-focused 3rd generation analyzer	\N	2026-08-19 00:00:00+03:30	\N
896	78	90	Multi-lateral 3rd generation task-force	\N	2026-03-01 00:00:00+03:30	\N
897	57	83	Synchronised homogeneous pricing structure	\N	2026-05-28 00:00:00+03:30	\N
898	13	334	Multi-layered dynamic application	\N	2026-09-23 00:00:00+03:30	\N
899	11	311	De-engineered 6th generation matrices	\N	2026-09-05 00:00:00+03:30	\N
900	62	188	Cross-group asynchronous interface	\N	2026-07-23 00:00:00+03:30	\N
901	59	211	Ergonomic heuristic collaboration	\N	2025-10-09 00:00:00+03:30	\N
902	40	390	Persevering scalable standardization	\N	2026-09-23 00:00:00+03:30	\N
903	67	30	Triple-buffered homogeneous conglomeration	\N	2026-03-02 00:00:00+03:30	\N
904	6	281	Face to face tangible encoding	\N	2026-04-04 00:00:00+03:30	\N
905	5	362	De-engineered holistic moratorium	\N	2026-09-08 00:00:00+03:30	2026-07-13 00:00:00+03:30
906	52	40	Future-proofed interactive intranet	\N	2026-09-24 00:00:00+03:30	\N
907	36	112	Profit-focused composite extranet	\N	2026-06-22 00:00:00+03:30	\N
908	67	369	Optional dedicated installation	\N	2025-10-26 00:00:00+03:30	\N
909	27	378	Integrated asymmetric focus group	\N	2026-07-07 00:00:00+03:30	\N
910	24	359	Front-line responsive attitude	\N	2026-09-26 00:00:00+03:30	\N
911	25	116	Business-focused local synergy	\N	2026-05-19 00:00:00+03:30	\N
912	62	58	Synergized disintermediate open system	\N	2026-08-12 00:00:00+03:30	\N
913	32	124	Secured asynchronous solution	\N	2026-09-12 00:00:00+03:30	\N
914	77	63	Function-based incremental circuit	\N	2026-04-07 00:00:00+03:30	\N
915	4	193	Organic 4th generation algorithm	\N	2025-11-11 00:00:00+03:30	\N
916	31	189	Advanced encompassing collaboration	\N	2026-03-26 00:00:00+03:30	\N
917	70	255	Re-contextualized bottom-line service-desk	\N	2026-02-22 00:00:00+03:30	\N
918	51	304	Open-source eco-centric complexity	\N	2025-12-06 00:00:00+03:30	\N
919	29	120	Profound responsive paradigm	\N	2026-02-02 00:00:00+03:30	\N
920	71	88	Multi-channelled bifurcated budgetary management	\N	2026-02-08 00:00:00+03:30	\N
921	6	195	Stand-alone maximized database	\N	2025-11-17 00:00:00+03:30	\N
922	62	299	Front-line fresh-thinking encryption	\N	2026-03-02 00:00:00+03:30	\N
923	51	248	Networked zero administration extranet	\N	2026-06-22 00:00:00+03:30	2025-12-06 00:00:00+03:30
924	79	29	Organized mission-critical implementation	\N	2026-07-28 00:00:00+03:30	\N
925	72	181	Focused 3rd generation neural-net	\N	2026-05-15 00:00:00+03:30	\N
926	25	376	Adaptive zero administration encoding	\N	2025-12-14 00:00:00+03:30	\N
927	68	42	Realigned explicit standardization	\N	2026-03-26 00:00:00+03:30	\N
928	79	171	Team-oriented optimizing function	\N	2026-02-19 00:00:00+03:30	\N
929	74	398	De-engineered content-based ability	\N	2026-07-25 00:00:00+03:30	\N
930	71	225	Organic clear-thinking installation	\N	2026-02-24 00:00:00+03:30	\N
931	12	78	Fundamental full-range flexibility	\N	2026-02-25 00:00:00+03:30	\N
932	22	396	Reactive 4th generation product	\N	2026-07-29 00:00:00+03:30	\N
933	23	356	Decentralized interactive leverage	\N	2026-02-17 00:00:00+03:30	\N
934	14	104	Fully-configurable modular budgetary management	\N	2026-06-26 00:00:00+03:30	2025-12-28 00:00:00+03:30
935	43	27	Reduced methodical benchmark	\N	2026-06-29 00:00:00+03:30	\N
936	41	207	Centralized value-added synergy	\N	2025-11-26 00:00:00+03:30	\N
937	27	361	Triple-buffered regional projection	\N	2026-08-03 00:00:00+03:30	\N
938	7	370	Reduced systematic toolset	\N	2026-06-06 00:00:00+03:30	\N
939	74	398	Seamless 4th generation secured line	\N	2026-07-10 00:00:00+03:30	\N
940	46	259	Operative 4th generation groupware	\N	2026-05-14 00:00:00+03:30	\N
941	54	62	Horizontal web-enabled monitoring	\N	2026-09-04 00:00:00+03:30	\N
942	39	345	De-engineered background data-warehouse	\N	2025-11-26 00:00:00+03:30	\N
943	12	251	Front-line executive moratorium	\N	2026-07-02 00:00:00+03:30	\N
944	65	180	Customizable cohesive encryption	\N	2025-12-08 00:00:00+03:30	\N
945	39	351	Realigned composite project	\N	2026-04-29 00:00:00+03:30	\N
946	6	301	Multi-channelled actuating frame	\N	2026-06-14 00:00:00+03:30	\N
947	32	301	Self-enabling background solution	\N	2026-04-07 00:00:00+03:30	\N
948	15	113	Centralized asymmetric monitoring	\N	2025-12-26 00:00:00+03:30	2026-08-25 00:00:00+03:30
949	62	320	Grass-roots holistic toolset	\N	2026-07-17 00:00:00+03:30	\N
950	53	174	Devolved optimizing toolset	\N	2025-09-30 00:00:00+03:30	\N
951	53	181	Decentralized systematic system engine	\N	2026-05-16 00:00:00+03:30	\N
952	11	306	Persistent foreground framework	\N	2026-01-10 00:00:00+03:30	2026-07-14 00:00:00+03:30
953	71	109	Intuitive scalable frame	\N	2026-08-16 00:00:00+03:30	\N
954	20	137	Adaptive multi-state capability	\N	2026-04-18 00:00:00+03:30	\N
955	24	332	Seamless even-keeled application	\N	2025-10-14 00:00:00+03:30	\N
956	32	241	Synergized foreground system engine	\N	2026-06-06 00:00:00+03:30	\N
957	10	112	Configurable bifurcated algorithm	\N	2026-01-09 00:00:00+03:30	\N
958	7	86	Mandatory mobile framework	\N	2026-07-04 00:00:00+03:30	\N
959	79	349	Assimilated next generation functionalities	\N	2026-02-20 00:00:00+03:30	\N
960	45	347	Mandatory contextually-based circuit	\N	2026-05-21 00:00:00+03:30	\N
961	29	137	Advanced contextually-based moratorium	\N	2026-01-27 00:00:00+03:30	2025-11-25 00:00:00+03:30
962	3	193	Assimilated global neural-net	\N	2026-04-09 00:00:00+03:30	2026-02-20 00:00:00+03:30
963	56	118	Digitized context-sensitive synergy	\N	2026-03-14 00:00:00+03:30	\N
964	39	94	Reduced secondary product	\N	2026-06-07 00:00:00+03:30	\N
965	19	140	Implemented mobile help-desk	\N	2026-03-08 00:00:00+03:30	\N
966	32	340	Stand-alone multi-tasking synergy	\N	2026-03-31 00:00:00+03:30	\N
967	7	85	Visionary multi-state matrices	\N	2026-07-02 00:00:00+03:30	\N
968	52	59	Right-sized multi-tasking open architecture	\N	2026-03-04 00:00:00+03:30	\N
969	81	45	Extended fault-tolerant installation	\N	2025-11-03 00:00:00+03:30	\N
970	20	408	Balanced hybrid website	\N	2026-06-30 00:00:00+03:30	\N
971	29	129	Advanced context-sensitive help-desk	\N	2025-11-22 00:00:00+03:30	\N
972	55	191	Intuitive system-worthy leverage	\N	2025-11-19 00:00:00+03:30	\N
973	16	39	Pre-emptive user-facing moderator	\N	2025-11-25 00:00:00+03:30	\N
974	27	381	Managed 24 hour contingency	\N	2026-06-18 00:00:00+03:30	\N
975	48	297	Optimized regional capability	\N	2026-01-19 00:00:00+03:30	\N
976	37	409	Synergistic exuding middleware	\N	2026-04-10 00:00:00+03:30	\N
977	8	266	Diverse system-worthy time-frame	\N	2026-07-15 00:00:00+03:30	\N
978	43	106	Customer-focused 24 hour help-desk	\N	2025-11-02 00:00:00+03:30	\N
979	39	330	De-engineered non-volatile conglomeration	\N	2026-09-18 00:00:00+03:30	\N
980	5	264	Monitored bi-directional focus group	\N	2026-03-01 00:00:00+03:30	\N
981	42	341	Realigned logistical complexity	\N	2026-06-02 00:00:00+03:30	\N
982	44	226	Advanced holistic utilisation	\N	2026-06-21 00:00:00+03:30	\N
983	33	106	Enterprise-wide leading edge framework	\N	2026-05-22 00:00:00+03:30	\N
984	41	37	Secured intermediate internet solution	\N	2025-12-29 00:00:00+03:30	\N
985	37	93	Devolved exuding function	\N	2026-03-31 00:00:00+03:30	\N
986	38	225	Advanced next generation contingency	\N	2025-11-17 00:00:00+03:30	\N
987	21	172	Balanced neutral archive	\N	2026-01-05 00:00:00+03:30	\N
988	70	308	Intuitive leading edge success	\N	2026-09-15 00:00:00+03:30	2026-01-21 00:00:00+03:30
989	78	314	Virtual didactic complexity	\N	2026-09-06 00:00:00+03:30	\N
990	3	390	Synchronised uniform benchmark	\N	2026-06-09 00:00:00+03:30	\N
991	36	336	Centralized holistic core	\N	2026-09-02 00:00:00+03:30	\N
992	57	389	Distributed demand-driven alliance	\N	2026-06-20 00:00:00+03:30	\N
993	66	123	Expanded dedicated firmware	\N	2025-10-30 00:00:00+03:30	\N
994	52	232	Universal mission-critical core	\N	2026-04-23 00:00:00+03:30	\N
995	72	243	Open-source well-modulated capacity	\N	2026-01-13 00:00:00+03:30	\N
996	7	229	Future-proofed intangible service-desk	\N	2026-03-08 00:00:00+03:30	\N
997	23	247	Team-oriented asynchronous hierarchy	\N	2026-09-04 00:00:00+03:30	\N
998	35	168	Extended executive adapter	\N	2025-10-29 00:00:00+03:30	\N
999	14	39	Down-sized value-added approach	\N	2026-01-03 00:00:00+03:30	\N
1000	30	258	Reduced disintermediate open architecture	\N	2026-08-18 00:00:00+03:30	\N
\.


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: ehsan
--

COPY public.follows (id, follower_id, leader_id, created_at) FROM stdin;
1	74	70	2026-05-19 00:00:00+03:30
2	58	80	2026-03-11 00:00:00+03:30
3	9	50	2026-03-10 00:00:00+03:30
4	31	44	2026-08-30 00:00:00+03:30
5	36	29	2026-08-13 00:00:00+03:30
6	25	61	2026-07-22 00:00:00+03:30
7	74	61	2026-08-18 00:00:00+03:30
8	43	13	2026-08-03 00:00:00+03:30
9	10	39	2026-05-27 00:00:00+03:30
10	70	13	2026-08-18 00:00:00+03:30
11	7	37	2026-03-09 00:00:00+03:30
12	35	5	2026-02-20 00:00:00+03:30
13	11	18	2026-05-13 00:00:00+03:30
14	77	74	2026-07-26 00:00:00+03:30
15	38	34	2026-03-17 00:00:00+03:30
16	24	59	2026-01-15 00:00:00+03:30
17	44	20	2025-11-29 00:00:00+03:30
18	76	61	2026-07-19 00:00:00+03:30
19	79	20	2026-05-19 00:00:00+03:30
20	23	15	2025-11-21 00:00:00+03:30
21	41	47	2026-05-15 00:00:00+03:30
22	21	12	2026-05-14 00:00:00+03:30
23	56	78	2026-05-23 00:00:00+03:30
24	56	7	2026-04-04 00:00:00+03:30
25	18	45	2025-12-02 00:00:00+03:30
26	67	46	2026-06-02 00:00:00+03:30
27	62	2	2025-10-02 00:00:00+03:30
28	27	26	2026-03-17 00:00:00+03:30
29	55	7	2026-02-27 00:00:00+03:30
30	67	23	2025-12-06 00:00:00+03:30
31	56	10	2026-06-14 00:00:00+03:30
32	67	5	2026-04-24 00:00:00+03:30
33	14	58	2026-03-29 00:00:00+03:30
34	61	10	2026-04-10 00:00:00+03:30
35	52	43	2026-05-12 00:00:00+03:30
36	52	65	2025-12-28 00:00:00+03:30
37	67	44	2025-12-14 00:00:00+03:30
38	43	75	2026-02-27 00:00:00+03:30
39	29	45	2026-03-09 00:00:00+03:30
40	61	20	2026-09-05 00:00:00+03:30
41	66	46	2026-06-04 00:00:00+03:30
42	24	2	2026-03-20 00:00:00+03:30
43	62	34	2026-06-02 00:00:00+03:30
44	16	79	2026-09-05 00:00:00+03:30
45	42	2	2025-11-18 00:00:00+03:30
46	37	40	2026-09-15 00:00:00+03:30
47	71	50	2025-12-24 00:00:00+03:30
48	18	72	2025-10-02 00:00:00+03:30
49	40	55	2026-09-16 00:00:00+03:30
50	74	27	2026-03-03 00:00:00+03:30
51	62	76	2026-02-06 00:00:00+03:30
52	54	73	2026-05-29 00:00:00+03:30
53	80	56	2026-04-27 00:00:00+03:30
54	75	27	2026-07-08 00:00:00+03:30
55	13	51	2026-04-19 00:00:00+03:30
56	14	49	2026-08-26 00:00:00+03:30
57	81	22	2025-11-03 00:00:00+03:30
58	60	76	2025-10-22 00:00:00+03:30
59	22	39	2025-12-29 00:00:00+03:30
60	55	53	2025-11-06 00:00:00+03:30
61	5	80	2026-06-09 00:00:00+03:30
62	35	51	2025-10-22 00:00:00+03:30
63	23	28	2026-02-10 00:00:00+03:30
64	24	40	2026-05-01 00:00:00+03:30
65	61	18	2026-01-30 00:00:00+03:30
66	43	34	2025-12-16 00:00:00+03:30
67	81	43	2026-04-25 00:00:00+03:30
68	61	7	2026-05-28 00:00:00+03:30
69	42	59	2026-03-25 00:00:00+03:30
70	13	67	2026-03-20 00:00:00+03:30
71	40	36	2026-03-08 00:00:00+03:30
72	14	37	2026-02-04 00:00:00+03:30
73	39	51	2025-11-23 00:00:00+03:30
74	51	25	2025-12-22 00:00:00+03:30
75	47	48	2025-11-19 00:00:00+03:30
76	20	61	2026-02-09 00:00:00+03:30
77	19	62	2026-03-03 00:00:00+03:30
78	73	81	2025-10-05 00:00:00+03:30
79	51	4	2026-01-18 00:00:00+03:30
80	49	77	2026-05-12 00:00:00+03:30
81	8	67	2026-02-12 00:00:00+03:30
82	51	8	2026-02-12 00:00:00+03:30
83	18	25	2026-01-15 00:00:00+03:30
84	52	24	2026-04-22 00:00:00+03:30
85	56	29	2026-09-09 00:00:00+03:30
86	75	74	2026-09-26 00:00:00+03:30
87	24	79	2026-04-15 00:00:00+03:30
88	55	28	2026-04-16 00:00:00+03:30
89	68	31	2026-03-10 00:00:00+03:30
90	43	52	2026-09-22 00:00:00+03:30
91	68	6	2026-05-19 00:00:00+03:30
92	41	39	2025-11-18 00:00:00+03:30
93	13	52	2026-05-16 00:00:00+03:30
94	29	55	2026-09-15 00:00:00+03:30
95	10	31	2026-05-06 00:00:00+03:30
96	14	36	2025-12-13 00:00:00+03:30
97	40	65	2025-10-17 00:00:00+03:30
98	80	54	2026-03-19 00:00:00+03:30
99	67	65	2026-06-17 00:00:00+03:30
100	72	8	2026-01-09 00:00:00+03:30
101	54	22	2026-01-26 00:00:00+03:30
102	78	6	2025-10-24 00:00:00+03:30
103	40	14	2026-06-03 00:00:00+03:30
104	56	73	2026-03-29 00:00:00+03:30
105	78	12	2026-03-20 00:00:00+03:30
106	58	78	2026-06-08 00:00:00+03:30
107	21	11	2026-03-20 00:00:00+03:30
108	59	55	2026-07-04 00:00:00+03:30
109	61	45	2026-03-31 00:00:00+03:30
110	57	9	2026-02-11 00:00:00+03:30
111	9	58	2026-08-24 00:00:00+03:30
112	72	60	2026-04-04 00:00:00+03:30
113	45	23	2025-11-26 00:00:00+03:30
114	39	13	2026-09-09 00:00:00+03:30
115	40	7	2026-03-04 00:00:00+03:30
116	39	59	2026-07-05 00:00:00+03:30
117	37	45	2026-01-03 00:00:00+03:30
118	13	61	2026-05-13 00:00:00+03:30
119	80	35	2026-09-28 00:00:00+03:30
120	22	74	2026-09-02 00:00:00+03:30
121	45	70	2026-02-03 00:00:00+03:30
122	5	20	2026-01-07 00:00:00+03:30
123	51	54	2026-06-29 00:00:00+03:30
124	21	61	2026-09-01 00:00:00+03:30
125	77	67	2026-05-12 00:00:00+03:30
126	54	39	2026-02-17 00:00:00+03:30
127	11	29	2026-03-03 00:00:00+03:30
128	25	77	2026-06-05 00:00:00+03:30
129	48	34	2026-02-13 00:00:00+03:30
130	30	7	2026-05-11 00:00:00+03:30
131	21	38	2026-08-23 00:00:00+03:30
132	50	9	2026-04-03 00:00:00+03:30
133	60	10	2025-12-29 00:00:00+03:30
134	74	76	2025-10-23 00:00:00+03:30
135	53	64	2026-04-06 00:00:00+03:30
136	22	21	2026-02-21 00:00:00+03:30
137	76	22	2026-08-27 00:00:00+03:30
138	51	36	2026-07-28 00:00:00+03:30
139	39	7	2026-04-25 00:00:00+03:30
140	21	53	2026-02-15 00:00:00+03:30
141	69	40	2026-08-22 00:00:00+03:30
142	62	37	2026-08-22 00:00:00+03:30
143	15	18	2026-07-19 00:00:00+03:30
144	55	56	2025-10-07 00:00:00+03:30
145	5	68	2025-11-01 00:00:00+03:30
146	7	55	2026-08-14 00:00:00+03:30
147	11	71	2026-08-01 00:00:00+03:30
148	39	16	2026-05-12 00:00:00+03:30
149	56	32	2026-08-23 00:00:00+03:30
150	62	25	2025-12-31 00:00:00+03:30
151	81	57	2025-10-26 00:00:00+03:30
152	73	76	2026-04-25 00:00:00+03:30
153	37	72	2026-08-11 00:00:00+03:30
154	2	7	2026-05-30 00:00:00+03:30
155	59	31	2026-04-01 00:00:00+03:30
156	20	24	2026-05-09 00:00:00+03:30
157	31	32	2026-05-08 00:00:00+03:30
158	17	10	2026-03-05 00:00:00+03:30
159	19	4	2026-07-07 00:00:00+03:30
160	28	11	2025-11-29 00:00:00+03:30
161	33	41	2026-08-05 00:00:00+03:30
162	36	41	2026-04-19 00:00:00+03:30
163	29	2	2026-02-02 00:00:00+03:30
164	71	56	2026-08-02 00:00:00+03:30
165	15	22	2026-04-15 00:00:00+03:30
166	53	32	2026-02-10 00:00:00+03:30
167	43	19	2025-12-14 00:00:00+03:30
168	60	81	2025-12-26 00:00:00+03:30
169	79	6	2025-10-30 00:00:00+03:30
170	79	31	2025-10-02 00:00:00+03:30
171	8	26	2026-08-06 00:00:00+03:30
172	12	68	2025-12-27 00:00:00+03:30
173	54	58	2026-04-23 00:00:00+03:30
174	54	61	2026-08-31 00:00:00+03:30
175	79	37	2025-10-09 00:00:00+03:30
176	61	71	2026-02-28 00:00:00+03:30
177	12	42	2026-08-22 00:00:00+03:30
178	78	43	2025-10-30 00:00:00+03:30
179	40	50	2026-08-12 00:00:00+03:30
180	47	42	2025-11-03 00:00:00+03:30
181	45	20	2026-09-09 00:00:00+03:30
182	67	38	2026-03-05 00:00:00+03:30
183	39	10	2026-06-11 00:00:00+03:30
184	63	24	2025-12-01 00:00:00+03:30
185	40	47	2026-07-10 00:00:00+03:30
186	57	52	2026-01-24 00:00:00+03:30
187	51	19	2026-09-08 00:00:00+03:30
188	66	36	2025-11-08 00:00:00+03:30
189	3	22	2026-02-11 00:00:00+03:30
190	4	46	2025-11-26 00:00:00+03:30
191	16	44	2025-12-08 00:00:00+03:30
192	17	47	2025-12-01 00:00:00+03:30
193	22	40	2026-09-12 00:00:00+03:30
194	11	69	2026-09-11 00:00:00+03:30
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: ehsan
--

COPY public.likes (id, user_id, post_id, created_at) FROM stdin;
1	76	182	2026-04-19 00:00:00+03:30
2	3	97	2026-09-26 00:00:00+03:30
3	79	403	2026-08-19 00:00:00+03:30
4	10	408	2026-09-15 00:00:00+03:30
5	68	93	2026-04-02 00:00:00+03:30
6	17	134	2026-05-21 00:00:00+03:30
7	71	28	2026-01-05 00:00:00+03:30
8	28	187	2026-03-12 00:00:00+03:30
9	78	369	2025-10-24 00:00:00+03:30
10	17	42	2025-11-10 00:00:00+03:30
11	57	228	2026-01-31 00:00:00+03:30
12	31	325	2026-05-05 00:00:00+03:30
13	37	167	2025-12-17 00:00:00+03:30
14	30	26	2026-05-15 00:00:00+03:30
15	18	102	2025-12-05 00:00:00+03:30
16	54	87	2026-08-22 00:00:00+03:30
17	38	144	2026-02-28 00:00:00+03:30
18	67	182	2025-11-05 00:00:00+03:30
19	43	364	2025-12-10 00:00:00+03:30
20	22	244	2026-03-05 00:00:00+03:30
21	13	29	2026-01-23 00:00:00+03:30
22	77	336	2026-05-09 00:00:00+03:30
23	68	230	2026-07-08 00:00:00+03:30
24	2	217	2026-01-26 00:00:00+03:30
25	49	388	2026-03-21 00:00:00+03:30
26	14	377	2026-01-17 00:00:00+03:30
27	15	277	2025-11-22 00:00:00+03:30
28	70	102	2026-02-19 00:00:00+03:30
29	37	76	2025-12-04 00:00:00+03:30
30	47	115	2025-11-06 00:00:00+03:30
31	63	227	2025-12-16 00:00:00+03:30
32	57	40	2026-05-02 00:00:00+03:30
33	49	257	2025-10-29 00:00:00+03:30
34	38	140	2025-11-19 00:00:00+03:30
35	66	193	2026-06-28 00:00:00+03:30
36	47	174	2026-04-13 00:00:00+03:30
37	41	70	2025-10-26 00:00:00+03:30
38	14	119	2025-12-23 00:00:00+03:30
39	26	169	2026-07-18 00:00:00+03:30
40	26	100	2026-05-25 00:00:00+03:30
41	76	169	2025-10-18 00:00:00+03:30
42	37	174	2026-08-14 00:00:00+03:30
43	8	174	2026-06-29 00:00:00+03:30
44	19	270	2025-11-18 00:00:00+03:30
45	43	348	2026-04-15 00:00:00+03:30
46	31	33	2026-09-26 00:00:00+03:30
47	41	148	2025-10-20 00:00:00+03:30
48	62	64	2026-07-26 00:00:00+03:30
49	41	398	2026-03-16 00:00:00+03:30
50	41	92	2025-10-30 00:00:00+03:30
51	55	248	2026-08-12 00:00:00+03:30
52	56	194	2026-09-04 00:00:00+03:30
53	38	311	2026-03-17 00:00:00+03:30
54	52	144	2026-08-12 00:00:00+03:30
55	74	159	2026-02-26 00:00:00+03:30
56	52	366	2026-05-08 00:00:00+03:30
57	36	408	2026-03-28 00:00:00+03:30
58	11	158	2026-04-06 00:00:00+03:30
59	30	19	2026-01-13 00:00:00+03:30
60	77	408	2026-01-04 00:00:00+03:30
61	36	108	2025-10-29 00:00:00+03:30
62	68	278	2025-11-05 00:00:00+03:30
63	17	70	2026-01-30 00:00:00+03:30
64	58	277	2026-07-23 00:00:00+03:30
65	45	289	2026-03-23 00:00:00+03:30
66	21	41	2025-11-02 00:00:00+03:30
67	81	196	2026-05-13 00:00:00+03:30
68	32	311	2025-11-05 00:00:00+03:30
69	3	31	2025-12-26 00:00:00+03:30
70	35	310	2025-12-31 00:00:00+03:30
71	4	141	2025-10-19 00:00:00+03:30
72	3	349	2026-04-21 00:00:00+03:30
73	56	34	2026-09-17 00:00:00+03:30
74	51	348	2026-05-10 00:00:00+03:30
75	46	118	2025-11-28 00:00:00+03:30
76	34	330	2026-04-01 00:00:00+03:30
77	57	230	2026-02-02 00:00:00+03:30
78	6	401	2025-10-28 00:00:00+03:30
79	47	257	2025-11-16 00:00:00+03:30
80	43	62	2026-04-22 00:00:00+03:30
81	34	285	2026-06-21 00:00:00+03:30
82	27	87	2026-02-10 00:00:00+03:30
83	27	250	2026-05-23 00:00:00+03:30
84	75	289	2025-11-30 00:00:00+03:30
85	23	257	2026-01-10 00:00:00+03:30
86	34	308	2026-06-30 00:00:00+03:30
87	2	382	2026-06-07 00:00:00+03:30
88	48	234	2026-09-01 00:00:00+03:30
89	6	364	2026-03-08 00:00:00+03:30
90	4	374	2026-04-07 00:00:00+03:30
91	8	302	2026-04-16 00:00:00+03:30
92	44	161	2025-12-25 00:00:00+03:30
93	39	376	2025-11-09 00:00:00+03:30
94	20	293	2026-05-03 00:00:00+03:30
95	70	280	2025-10-01 00:00:00+03:30
96	63	277	2026-03-06 00:00:00+03:30
97	53	391	2025-12-17 00:00:00+03:30
98	56	16	2026-01-23 00:00:00+03:30
99	20	343	2025-12-20 00:00:00+03:30
100	5	74	2025-11-01 00:00:00+03:30
101	38	293	2026-09-09 00:00:00+03:30
102	70	167	2026-04-16 00:00:00+03:30
103	27	373	2026-09-29 00:00:00+03:30
104	39	244	2026-05-08 00:00:00+03:30
105	61	125	2026-05-20 00:00:00+03:30
106	64	33	2026-01-13 00:00:00+03:30
107	4	157	2026-06-22 00:00:00+03:30
108	63	304	2026-01-30 00:00:00+03:30
109	68	350	2026-03-16 00:00:00+03:30
110	39	98	2026-09-08 00:00:00+03:30
111	72	381	2025-12-30 00:00:00+03:30
112	12	38	2026-07-23 00:00:00+03:30
113	69	347	2025-10-21 00:00:00+03:30
114	37	122	2026-04-07 00:00:00+03:30
115	8	272	2026-08-02 00:00:00+03:30
116	30	249	2026-02-22 00:00:00+03:30
117	20	144	2026-01-06 00:00:00+03:30
118	57	64	2026-02-08 00:00:00+03:30
119	17	152	2025-12-03 00:00:00+03:30
120	17	107	2025-11-08 00:00:00+03:30
121	79	377	2025-12-25 00:00:00+03:30
122	36	369	2026-08-14 00:00:00+03:30
123	2	378	2026-04-18 00:00:00+03:30
124	54	166	2025-10-28 00:00:00+03:30
125	62	405	2026-01-17 00:00:00+03:30
126	23	59	2026-02-17 00:00:00+03:30
127	3	89	2026-05-17 00:00:00+03:30
128	74	121	2025-12-15 00:00:00+03:30
129	23	388	2025-09-30 00:00:00+03:30
130	27	261	2025-12-03 00:00:00+03:30
131	36	146	2026-02-24 00:00:00+03:30
132	24	411	2026-02-04 00:00:00+03:30
133	61	135	2026-09-02 00:00:00+03:30
134	26	125	2026-02-12 00:00:00+03:30
135	19	42	2026-02-12 00:00:00+03:30
136	70	145	2026-02-21 00:00:00+03:30
137	9	169	2026-03-19 00:00:00+03:30
138	29	249	2026-04-24 00:00:00+03:30
139	32	141	2026-08-28 00:00:00+03:30
140	15	133	2026-01-29 00:00:00+03:30
141	19	72	2025-11-30 00:00:00+03:30
142	68	283	2026-06-11 00:00:00+03:30
143	56	331	2026-09-23 00:00:00+03:30
144	34	114	2026-06-07 00:00:00+03:30
145	74	72	2026-07-17 00:00:00+03:30
146	37	32	2026-03-05 00:00:00+03:30
147	25	339	2025-11-19 00:00:00+03:30
148	17	213	2026-09-15 00:00:00+03:30
149	27	239	2025-12-01 00:00:00+03:30
150	50	167	2026-05-15 00:00:00+03:30
151	73	59	2026-04-08 00:00:00+03:30
152	36	240	2026-04-04 00:00:00+03:30
153	22	99	2026-03-10 00:00:00+03:30
154	47	181	2026-06-15 00:00:00+03:30
155	27	47	2026-07-10 00:00:00+03:30
156	59	108	2026-08-28 00:00:00+03:30
157	11	340	2026-09-12 00:00:00+03:30
158	67	256	2025-12-28 00:00:00+03:30
159	52	236	2026-03-28 00:00:00+03:30
160	40	359	2025-12-11 00:00:00+03:30
161	18	241	2026-02-28 00:00:00+03:30
162	13	60	2025-10-07 00:00:00+03:30
163	46	33	2025-12-27 00:00:00+03:30
164	58	250	2026-04-28 00:00:00+03:30
165	41	391	2026-02-05 00:00:00+03:30
166	34	144	2026-06-27 00:00:00+03:30
167	17	96	2025-11-10 00:00:00+03:30
168	11	374	2025-12-14 00:00:00+03:30
169	4	49	2026-03-11 00:00:00+03:30
170	35	297	2025-12-21 00:00:00+03:30
171	57	366	2026-02-15 00:00:00+03:30
172	73	267	2026-04-03 00:00:00+03:30
173	54	238	2026-01-18 00:00:00+03:30
174	67	56	2026-04-19 00:00:00+03:30
175	64	413	2025-11-05 00:00:00+03:30
176	74	342	2026-03-31 00:00:00+03:30
177	42	295	2025-11-26 00:00:00+03:30
178	62	324	2026-09-17 00:00:00+03:30
179	12	225	2026-08-13 00:00:00+03:30
180	48	206	2026-08-02 00:00:00+03:30
181	63	133	2026-02-19 00:00:00+03:30
182	8	350	2026-08-26 00:00:00+03:30
183	9	225	2026-07-19 00:00:00+03:30
184	71	168	2026-07-03 00:00:00+03:30
185	25	108	2026-05-13 00:00:00+03:30
186	37	184	2026-08-05 00:00:00+03:30
187	7	269	2026-08-31 00:00:00+03:30
188	12	113	2026-03-30 00:00:00+03:30
189	17	382	2026-05-30 00:00:00+03:30
190	37	209	2026-07-07 00:00:00+03:30
191	62	268	2026-03-18 00:00:00+03:30
192	50	340	2026-08-20 00:00:00+03:30
193	5	360	2026-09-15 00:00:00+03:30
194	68	167	2025-10-07 00:00:00+03:30
195	40	163	2026-08-16 00:00:00+03:30
196	42	174	2026-01-21 00:00:00+03:30
197	18	278	2026-03-23 00:00:00+03:30
198	61	16	2026-06-08 00:00:00+03:30
199	57	152	2026-07-31 00:00:00+03:30
200	24	165	2026-01-01 00:00:00+03:30
201	29	187	2026-07-07 00:00:00+03:30
202	25	71	2026-03-03 00:00:00+03:30
203	8	130	2026-06-14 00:00:00+03:30
204	17	277	2026-07-23 00:00:00+03:30
205	60	395	2026-02-06 00:00:00+03:30
206	58	190	2026-09-22 00:00:00+03:30
207	71	194	2025-11-11 00:00:00+03:30
208	61	44	2026-08-26 00:00:00+03:30
209	29	258	2026-01-06 00:00:00+03:30
210	45	389	2026-03-18 00:00:00+03:30
211	79	188	2026-03-21 00:00:00+03:30
212	72	192	2026-06-06 00:00:00+03:30
213	39	190	2026-03-13 00:00:00+03:30
214	34	37	2025-12-16 00:00:00+03:30
215	65	401	2026-07-06 00:00:00+03:30
216	25	326	2025-11-14 00:00:00+03:30
217	81	159	2026-08-21 00:00:00+03:30
218	46	372	2026-04-26 00:00:00+03:30
219	78	254	2026-09-24 00:00:00+03:30
220	44	257	2026-05-27 00:00:00+03:30
221	66	138	2026-08-10 00:00:00+03:30
222	10	187	2026-03-07 00:00:00+03:30
223	34	192	2026-04-20 00:00:00+03:30
224	42	235	2026-04-02 00:00:00+03:30
225	9	210	2026-01-19 00:00:00+03:30
226	43	114	2026-06-14 00:00:00+03:30
227	20	272	2025-10-29 00:00:00+03:30
228	77	185	2026-02-18 00:00:00+03:30
229	47	362	2026-04-07 00:00:00+03:30
230	30	180	2026-05-13 00:00:00+03:30
231	69	215	2026-03-09 00:00:00+03:30
232	66	380	2026-05-02 00:00:00+03:30
233	7	40	2026-07-23 00:00:00+03:30
234	46	129	2026-03-26 00:00:00+03:30
235	32	295	2026-03-15 00:00:00+03:30
236	38	183	2026-01-22 00:00:00+03:30
237	77	95	2026-01-27 00:00:00+03:30
238	63	335	2026-01-07 00:00:00+03:30
239	78	368	2026-04-21 00:00:00+03:30
240	3	19	2026-07-29 00:00:00+03:30
241	9	97	2026-08-30 00:00:00+03:30
242	67	106	2026-04-01 00:00:00+03:30
243	4	365	2025-12-20 00:00:00+03:30
244	12	164	2025-12-23 00:00:00+03:30
245	24	273	2025-10-10 00:00:00+03:30
246	73	124	2026-07-22 00:00:00+03:30
247	31	81	2026-06-29 00:00:00+03:30
248	24	249	2026-05-22 00:00:00+03:30
249	68	156	2025-11-20 00:00:00+03:30
250	75	374	2026-06-30 00:00:00+03:30
251	58	382	2025-12-31 00:00:00+03:30
252	23	311	2026-06-18 00:00:00+03:30
253	62	328	2026-08-30 00:00:00+03:30
254	78	170	2026-05-03 00:00:00+03:30
255	36	324	2026-02-24 00:00:00+03:30
256	22	222	2025-11-08 00:00:00+03:30
257	30	66	2026-05-19 00:00:00+03:30
258	39	290	2026-07-05 00:00:00+03:30
259	33	280	2026-01-17 00:00:00+03:30
260	2	66	2026-04-03 00:00:00+03:30
261	25	344	2026-01-05 00:00:00+03:30
262	11	26	2026-09-12 00:00:00+03:30
263	43	388	2026-05-29 00:00:00+03:30
264	55	157	2026-07-08 00:00:00+03:30
265	41	363	2026-07-08 00:00:00+03:30
266	26	312	2026-07-01 00:00:00+03:30
267	15	338	2026-05-12 00:00:00+03:30
268	44	28	2026-03-30 00:00:00+03:30
269	18	281	2026-09-26 00:00:00+03:30
270	45	391	2025-10-19 00:00:00+03:30
271	37	343	2026-02-27 00:00:00+03:30
272	70	158	2026-03-13 00:00:00+03:30
273	73	198	2026-02-25 00:00:00+03:30
274	27	249	2026-02-10 00:00:00+03:30
275	70	178	2026-03-02 00:00:00+03:30
276	12	89	2026-06-18 00:00:00+03:30
277	37	271	2026-07-02 00:00:00+03:30
278	21	282	2026-04-30 00:00:00+03:30
279	35	216	2026-05-24 00:00:00+03:30
280	15	217	2026-04-01 00:00:00+03:30
281	15	31	2025-11-11 00:00:00+03:30
282	63	282	2025-12-30 00:00:00+03:30
283	78	289	2026-01-10 00:00:00+03:30
284	62	169	2026-06-06 00:00:00+03:30
285	57	30	2026-03-15 00:00:00+03:30
286	59	247	2026-02-07 00:00:00+03:30
287	65	42	2025-12-07 00:00:00+03:30
288	18	78	2026-01-18 00:00:00+03:30
289	54	94	2026-09-20 00:00:00+03:30
290	47	302	2026-08-13 00:00:00+03:30
291	6	173	2025-12-04 00:00:00+03:30
292	81	114	2026-03-04 00:00:00+03:30
293	49	169	2026-03-02 00:00:00+03:30
294	53	408	2025-12-18 00:00:00+03:30
295	37	172	2026-05-11 00:00:00+03:30
296	25	409	2025-12-02 00:00:00+03:30
297	3	113	2026-01-20 00:00:00+03:30
298	64	44	2026-05-07 00:00:00+03:30
299	41	217	2026-03-07 00:00:00+03:30
300	3	413	2026-02-08 00:00:00+03:30
301	64	218	2026-05-31 00:00:00+03:30
302	22	318	2026-03-23 00:00:00+03:30
303	27	243	2025-12-28 00:00:00+03:30
304	14	65	2026-05-02 00:00:00+03:30
305	52	247	2026-04-18 00:00:00+03:30
306	8	145	2026-03-07 00:00:00+03:30
307	52	32	2026-02-04 00:00:00+03:30
308	30	174	2026-02-17 00:00:00+03:30
309	48	219	2026-04-30 00:00:00+03:30
310	67	241	2026-01-29 00:00:00+03:30
311	46	368	2026-05-20 00:00:00+03:30
312	54	377	2026-07-19 00:00:00+03:30
313	38	138	2025-11-12 00:00:00+03:30
314	6	260	2026-05-27 00:00:00+03:30
315	28	45	2025-12-19 00:00:00+03:30
316	3	68	2026-06-26 00:00:00+03:30
317	58	383	2025-11-27 00:00:00+03:30
318	78	156	2026-01-15 00:00:00+03:30
319	31	335	2026-07-06 00:00:00+03:30
320	56	381	2026-02-10 00:00:00+03:30
321	32	294	2026-04-29 00:00:00+03:30
322	53	262	2026-07-03 00:00:00+03:30
323	76	204	2026-08-07 00:00:00+03:30
324	9	76	2025-11-13 00:00:00+03:30
325	67	411	2026-08-31 00:00:00+03:30
326	61	302	2025-11-15 00:00:00+03:30
327	11	267	2026-06-05 00:00:00+03:30
328	20	169	2026-02-22 00:00:00+03:30
329	6	289	2026-05-01 00:00:00+03:30
330	17	62	2026-08-19 00:00:00+03:30
331	25	93	2026-01-27 00:00:00+03:30
332	50	40	2025-12-07 00:00:00+03:30
333	71	180	2026-02-08 00:00:00+03:30
334	22	232	2026-05-14 00:00:00+03:30
335	75	52	2025-11-23 00:00:00+03:30
336	40	320	2026-03-19 00:00:00+03:30
337	40	31	2026-08-21 00:00:00+03:30
338	47	324	2026-06-23 00:00:00+03:30
339	80	129	2026-04-08 00:00:00+03:30
340	55	172	2026-01-06 00:00:00+03:30
341	44	407	2026-03-08 00:00:00+03:30
342	73	159	2026-08-16 00:00:00+03:30
343	69	222	2026-07-31 00:00:00+03:30
344	30	64	2026-04-03 00:00:00+03:30
345	75	81	2026-03-04 00:00:00+03:30
346	46	220	2026-04-23 00:00:00+03:30
347	36	406	2026-01-04 00:00:00+03:30
348	31	60	2025-12-17 00:00:00+03:30
349	12	229	2026-07-09 00:00:00+03:30
350	55	63	2026-01-04 00:00:00+03:30
351	16	206	2026-07-29 00:00:00+03:30
352	65	134	2025-11-28 00:00:00+03:30
353	72	245	2026-06-05 00:00:00+03:30
354	21	60	2026-02-09 00:00:00+03:30
355	18	367	2025-12-31 00:00:00+03:30
356	57	403	2026-04-21 00:00:00+03:30
357	21	174	2026-03-09 00:00:00+03:30
358	60	315	2026-06-13 00:00:00+03:30
359	57	133	2025-11-06 00:00:00+03:30
360	76	358	2026-03-11 00:00:00+03:30
361	44	308	2026-05-29 00:00:00+03:30
362	67	351	2025-10-14 00:00:00+03:30
363	77	87	2026-08-05 00:00:00+03:30
364	72	300	2025-11-25 00:00:00+03:30
365	31	361	2026-02-19 00:00:00+03:30
366	64	34	2026-02-02 00:00:00+03:30
367	5	350	2025-12-16 00:00:00+03:30
368	69	49	2025-11-14 00:00:00+03:30
369	67	392	2026-03-19 00:00:00+03:30
370	27	323	2026-02-06 00:00:00+03:30
371	37	252	2026-08-16 00:00:00+03:30
372	30	78	2025-10-18 00:00:00+03:30
373	43	164	2026-06-04 00:00:00+03:30
374	40	57	2026-07-09 00:00:00+03:30
375	31	300	2025-10-01 00:00:00+03:30
376	38	72	2026-04-24 00:00:00+03:30
377	14	44	2025-10-17 00:00:00+03:30
378	46	45	2026-03-31 00:00:00+03:30
379	40	409	2026-04-07 00:00:00+03:30
380	54	381	2026-05-10 00:00:00+03:30
381	54	124	2026-03-16 00:00:00+03:30
382	11	372	2025-12-17 00:00:00+03:30
383	28	46	2025-10-30 00:00:00+03:30
384	17	391	2026-08-03 00:00:00+03:30
385	9	20	2025-12-09 00:00:00+03:30
386	54	220	2026-02-17 00:00:00+03:30
387	24	141	2026-07-27 00:00:00+03:30
388	15	94	2026-02-18 00:00:00+03:30
389	62	236	2025-11-07 00:00:00+03:30
390	27	238	2026-03-17 00:00:00+03:30
391	19	372	2026-09-19 00:00:00+03:30
392	56	101	2026-09-01 00:00:00+03:30
393	63	150	2026-07-18 00:00:00+03:30
394	80	161	2026-06-24 00:00:00+03:30
395	16	194	2026-02-19 00:00:00+03:30
396	67	196	2026-03-29 00:00:00+03:30
397	2	24	2026-08-23 00:00:00+03:30
398	6	171	2025-10-23 00:00:00+03:30
399	72	334	2026-04-12 00:00:00+03:30
400	66	301	2026-06-07 00:00:00+03:30
401	38	395	2026-05-07 00:00:00+03:30
402	35	17	2026-03-03 00:00:00+03:30
403	41	19	2026-04-18 00:00:00+03:30
404	70	383	2025-11-04 00:00:00+03:30
405	14	144	2026-05-31 00:00:00+03:30
406	54	125	2026-07-28 00:00:00+03:30
407	7	197	2026-01-21 00:00:00+03:30
408	30	262	2025-10-09 00:00:00+03:30
409	70	402	2026-02-11 00:00:00+03:30
410	18	352	2026-01-14 00:00:00+03:30
411	41	230	2026-06-16 00:00:00+03:30
412	18	140	2026-08-24 00:00:00+03:30
413	48	142	2026-04-13 00:00:00+03:30
414	10	225	2026-06-07 00:00:00+03:30
415	44	235	2026-04-27 00:00:00+03:30
416	26	303	2026-02-06 00:00:00+03:30
417	80	318	2025-12-14 00:00:00+03:30
418	50	30	2025-12-04 00:00:00+03:30
419	56	295	2026-01-16 00:00:00+03:30
420	73	162	2026-02-02 00:00:00+03:30
421	56	335	2026-04-21 00:00:00+03:30
422	55	412	2025-11-10 00:00:00+03:30
423	48	149	2026-08-31 00:00:00+03:30
424	6	377	2026-09-05 00:00:00+03:30
425	47	118	2026-02-12 00:00:00+03:30
426	13	102	2026-04-22 00:00:00+03:30
427	80	32	2025-10-07 00:00:00+03:30
428	67	52	2025-10-06 00:00:00+03:30
429	81	177	2026-08-01 00:00:00+03:30
430	38	360	2026-09-12 00:00:00+03:30
431	29	158	2025-11-20 00:00:00+03:30
432	39	249	2026-09-14 00:00:00+03:30
433	2	249	2026-05-03 00:00:00+03:30
434	16	111	2026-01-19 00:00:00+03:30
435	57	376	2026-05-30 00:00:00+03:30
436	17	224	2026-02-22 00:00:00+03:30
437	5	221	2025-10-14 00:00:00+03:30
438	34	198	2026-06-23 00:00:00+03:30
439	75	158	2026-06-26 00:00:00+03:30
440	62	98	2026-09-01 00:00:00+03:30
441	48	353	2025-10-16 00:00:00+03:30
442	25	301	2026-03-20 00:00:00+03:30
443	31	156	2025-10-27 00:00:00+03:30
444	65	121	2026-04-30 00:00:00+03:30
445	11	378	2026-04-29 00:00:00+03:30
446	48	235	2025-12-14 00:00:00+03:30
447	45	264	2026-04-14 00:00:00+03:30
448	21	263	2026-08-03 00:00:00+03:30
449	71	393	2026-07-20 00:00:00+03:30
450	42	258	2026-09-09 00:00:00+03:30
451	15	271	2025-10-06 00:00:00+03:30
452	71	302	2026-01-24 00:00:00+03:30
453	80	282	2026-01-22 00:00:00+03:30
454	24	187	2026-06-25 00:00:00+03:30
455	74	406	2026-02-22 00:00:00+03:30
456	28	232	2026-04-30 00:00:00+03:30
457	27	224	2026-03-02 00:00:00+03:30
458	54	111	2026-07-07 00:00:00+03:30
459	77	56	2025-12-21 00:00:00+03:30
460	76	411	2026-01-06 00:00:00+03:30
461	80	359	2025-11-16 00:00:00+03:30
462	14	108	2025-11-21 00:00:00+03:30
463	51	109	2026-05-15 00:00:00+03:30
464	2	392	2026-09-18 00:00:00+03:30
465	66	108	2026-05-08 00:00:00+03:30
466	43	91	2025-10-25 00:00:00+03:30
467	31	171	2025-10-08 00:00:00+03:30
468	43	346	2026-04-17 00:00:00+03:30
469	55	26	2026-09-09 00:00:00+03:30
470	73	224	2026-05-26 00:00:00+03:30
471	35	51	2026-02-20 00:00:00+03:30
472	36	203	2026-03-09 00:00:00+03:30
473	6	36	2025-11-26 00:00:00+03:30
474	43	281	2026-05-12 00:00:00+03:30
475	30	73	2026-01-20 00:00:00+03:30
476	62	18	2026-04-07 00:00:00+03:30
477	66	342	2026-02-19 00:00:00+03:30
478	60	199	2026-03-24 00:00:00+03:30
479	45	377	2026-04-19 00:00:00+03:30
480	9	135	2026-08-23 00:00:00+03:30
481	14	159	2026-08-09 00:00:00+03:30
482	48	400	2026-09-06 00:00:00+03:30
483	18	314	2026-05-29 00:00:00+03:30
484	17	349	2026-06-22 00:00:00+03:30
485	60	289	2025-11-05 00:00:00+03:30
486	8	348	2026-04-25 00:00:00+03:30
487	53	202	2026-06-21 00:00:00+03:30
488	33	35	2026-05-02 00:00:00+03:30
489	64	66	2026-08-20 00:00:00+03:30
490	62	276	2026-06-12 00:00:00+03:30
491	33	208	2026-08-12 00:00:00+03:30
492	25	164	2026-05-11 00:00:00+03:30
493	49	250	2026-04-11 00:00:00+03:30
494	57	189	2026-06-17 00:00:00+03:30
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: ehsan
--

COPY public.posts (id, author_id, content, created_at) FROM stdin;
14	32	Centralized mobile challenge	2026-06-22 00:00:00+03:30
15	77	Cloned 24 hour adapter	2025-12-25 00:00:00+03:30
16	43	Cloned demand-driven artificial intelligence	2026-06-22 00:00:00+03:30
17	63	Virtual client-server support	2025-11-30 00:00:00+03:30
18	20	Re-engineered analyzing superstructure	2026-09-15 00:00:00+03:30
19	69	Devolved user-facing hub	2026-09-18 00:00:00+03:30
20	76	Implemented asymmetric moderator	2026-05-12 00:00:00+03:30
21	39	Public-key static capability	2025-12-25 00:00:00+03:30
22	30	Profit-focused neutral task-force	2025-10-02 00:00:00+03:30
23	68	Multi-lateral actuating forecast	2026-07-19 00:00:00+03:30
24	70	Extended discrete monitoring	2026-05-08 00:00:00+03:30
25	15	Adaptive directional flexibility	2026-02-24 00:00:00+03:30
26	3	Open-architected demand-driven info-mediaries	2026-08-06 00:00:00+03:30
27	31	Customer-focused empowering flexibility	2026-02-21 00:00:00+03:30
28	67	Upgradable content-based secured line	2026-08-02 00:00:00+03:30
29	18	Visionary high-level internet solution	2026-07-10 00:00:00+03:30
30	8	Integrated modular collaboration	2026-03-29 00:00:00+03:30
31	54	Down-sized transitional migration	2026-06-07 00:00:00+03:30
32	17	Digitized disintermediate framework	2025-12-27 00:00:00+03:30
33	28	Enhanced secondary matrices	2026-05-05 00:00:00+03:30
34	22	User-centric national matrix	2026-02-17 00:00:00+03:30
35	30	Team-oriented 24/7 standardization	2026-05-15 00:00:00+03:30
36	75	Implemented optimal algorithm	2026-05-13 00:00:00+03:30
37	19	Future-proofed multi-state hardware	2025-12-20 00:00:00+03:30
38	18	Team-oriented web-enabled process improvement	2026-09-12 00:00:00+03:30
39	12	Seamless 24 hour support	2025-10-23 00:00:00+03:30
40	36	Organized analyzing orchestration	2026-08-06 00:00:00+03:30
41	14	Programmable 6th generation standardization	2025-11-27 00:00:00+03:30
42	9	User-centric zero tolerance solution	2025-12-29 00:00:00+03:30
43	69	Re-contextualized 24 hour solution	2026-03-05 00:00:00+03:30
44	65	Down-sized analyzing access	2026-02-20 00:00:00+03:30
45	51	Proactive systematic software	2026-02-03 00:00:00+03:30
46	28	Optimized motivating toolset	2026-08-09 00:00:00+03:30
47	21	Horizontal cohesive attitude	2026-06-28 00:00:00+03:30
48	16	Reverse-engineered 24 hour artificial intelligence	2026-06-29 00:00:00+03:30
49	17	Horizontal zero tolerance instruction set	2026-06-12 00:00:00+03:30
50	80	Progressive systematic encoding	2026-07-05 00:00:00+03:30
51	16	Cross-group fault-tolerant open system	2025-10-13 00:00:00+03:30
52	72	Digitized 6th generation projection	2025-11-26 00:00:00+03:30
53	15	Switchable dynamic concept	2025-11-28 00:00:00+03:30
54	8	Optimized content-based contingency	2026-06-03 00:00:00+03:30
55	77	Fully-configurable impactful methodology	2026-05-28 00:00:00+03:30
56	32	Intuitive foreground leverage	2025-10-17 00:00:00+03:30
57	6	Right-sized client-server capability	2025-12-01 00:00:00+03:30
58	17	Diverse cohesive encryption	2026-06-29 00:00:00+03:30
59	68	Assimilated upward-trending forecast	2026-07-12 00:00:00+03:30
60	46	Implemented full-range hub	2026-01-01 00:00:00+03:30
61	75	Digitized coherent protocol	2026-04-10 00:00:00+03:30
62	29	Up-sized bi-directional functionalities	2025-10-24 00:00:00+03:30
63	58	Configurable reciprocal capacity	2026-01-11 00:00:00+03:30
64	16	Triple-buffered intermediate migration	2026-06-21 00:00:00+03:30
65	54	Phased local strategy	2026-03-14 00:00:00+03:30
66	57	Robust homogeneous time-frame	2026-04-29 00:00:00+03:30
67	12	Synchronised dedicated collaboration	2025-11-03 00:00:00+03:30
68	66	Horizontal 4th generation function	2026-09-18 00:00:00+03:30
69	7	Integrated radical Graphic Interface	2026-06-27 00:00:00+03:30
70	45	Self-enabling neutral hardware	2025-11-14 00:00:00+03:30
71	73	Sharable high-level conglomeration	2026-04-29 00:00:00+03:30
72	56	Seamless bifurcated interface	2026-06-22 00:00:00+03:30
73	43	Diverse uniform time-frame	2025-11-13 00:00:00+03:30
74	46	Face to face regional emulation	2026-01-28 00:00:00+03:30
75	52	Operative bottom-line moratorium	2026-02-28 00:00:00+03:30
76	36	Managed discrete superstructure	2026-02-13 00:00:00+03:30
77	75	Ameliorated dynamic policy	2026-01-10 00:00:00+03:30
78	32	Fully-configurable contextually-based project	2026-04-21 00:00:00+03:30
79	47	Team-oriented radical core	2026-04-07 00:00:00+03:30
80	75	Robust mobile neural-net	2026-07-27 00:00:00+03:30
81	45	Optional empowering support	2026-03-22 00:00:00+03:30
82	25	Compatible national leverage	2025-10-10 00:00:00+03:30
83	6	Virtual leading edge leverage	2026-09-11 00:00:00+03:30
84	62	Secured responsive toolset	2026-03-06 00:00:00+03:30
85	13	Centralized dynamic synergy	2026-06-23 00:00:00+03:30
86	53	Proactive analyzing architecture	2026-07-31 00:00:00+03:30
87	74	Mandatory tertiary protocol	2025-10-14 00:00:00+03:30
88	25	Horizontal leading edge access	2026-09-29 00:00:00+03:30
89	9	Realigned real-time forecast	2026-07-05 00:00:00+03:30
90	63	Networked scalable matrices	2025-11-05 00:00:00+03:30
91	54	Enterprise-wide user-facing matrix	2026-09-24 00:00:00+03:30
92	76	Multi-layered 3rd generation array	2026-06-02 00:00:00+03:30
93	78	Inverse methodical throughput	2026-06-29 00:00:00+03:30
94	39	Vision-oriented composite help-desk	2026-06-30 00:00:00+03:30
95	17	Mandatory asymmetric system engine	2026-01-29 00:00:00+03:30
96	58	Right-sized maximized concept	2026-06-20 00:00:00+03:30
97	61	Seamless systemic access	2026-08-27 00:00:00+03:30
98	27	Digitized demand-driven system engine	2025-11-15 00:00:00+03:30
99	66	Expanded value-added attitude	2026-03-18 00:00:00+03:30
100	66	Customizable exuding pricing structure	2026-05-22 00:00:00+03:30
101	17	Stand-alone motivating focus group	2026-08-04 00:00:00+03:30
102	58	Function-based tangible array	2025-11-13 00:00:00+03:30
103	53	Open-architected neutral secured line	2026-08-02 00:00:00+03:30
104	36	Multi-lateral 5th generation orchestration	2025-11-23 00:00:00+03:30
105	52	Triple-buffered explicit emulation	2026-07-06 00:00:00+03:30
106	78	Profound eco-centric superstructure	2025-11-29 00:00:00+03:30
107	68	Mandatory explicit portal	2026-07-28 00:00:00+03:30
108	31	Multi-lateral eco-centric installation	2026-07-18 00:00:00+03:30
109	7	Profit-focused web-enabled matrices	2026-04-19 00:00:00+03:30
110	63	Synergized multimedia service-desk	2025-10-11 00:00:00+03:30
111	64	Visionary multimedia forecast	2026-06-30 00:00:00+03:30
112	60	Organic dynamic matrix	2026-04-24 00:00:00+03:30
113	64	Organic multimedia infrastructure	2026-06-30 00:00:00+03:30
114	63	Re-contextualized bi-directional protocol	2026-08-10 00:00:00+03:30
115	19	Synergized zero defect orchestration	2025-10-22 00:00:00+03:30
116	34	Switchable coherent knowledge user	2026-08-30 00:00:00+03:30
117	2	Cross-platform executive forecast	2026-05-04 00:00:00+03:30
118	14	Cross-group coherent hierarchy	2026-09-28 00:00:00+03:30
119	75	Quality-focused real-time intranet	2026-06-16 00:00:00+03:30
120	47	Phased regional productivity	2026-08-13 00:00:00+03:30
121	49	Focused fresh-thinking forecast	2026-04-14 00:00:00+03:30
122	40	Up-sized systematic frame	2026-01-20 00:00:00+03:30
123	2	Centralized holistic application	2026-09-01 00:00:00+03:30
124	51	Monitored 24/7 methodology	2025-12-12 00:00:00+03:30
125	69	Optional motivating internet solution	2026-07-29 00:00:00+03:30
126	30	Synergistic human-resource leverage	2026-01-24 00:00:00+03:30
127	73	Polarised content-based knowledge base	2026-03-19 00:00:00+03:30
128	48	User-centric disintermediate monitoring	2026-09-05 00:00:00+03:30
129	19	Triple-buffered grid-enabled approach	2026-05-18 00:00:00+03:30
130	39	Robust eco-centric application	2026-08-15 00:00:00+03:30
131	8	Enterprise-wide mission-critical function	2026-07-12 00:00:00+03:30
132	37	Profit-focused high-level concept	2026-07-29 00:00:00+03:30
133	7	Customer-focused global flexibility	2026-06-05 00:00:00+03:30
134	18	Expanded 24 hour alliance	2026-03-25 00:00:00+03:30
135	16	Front-line user-facing challenge	2025-12-24 00:00:00+03:30
136	74	Virtual dynamic initiative	2026-06-22 00:00:00+03:30
137	31	Persevering object-oriented database	2026-04-29 00:00:00+03:30
138	31	Decentralized high-level knowledge base	2026-08-30 00:00:00+03:30
139	42	Networked next generation support	2026-09-04 00:00:00+03:30
140	12	Enhanced clear-thinking emulation	2026-01-14 00:00:00+03:30
141	14	Right-sized 4th generation initiative	2025-11-04 00:00:00+03:30
142	72	Phased multi-state firmware	2026-01-09 00:00:00+03:30
143	43	Persistent transitional knowledge base	2026-01-07 00:00:00+03:30
144	66	Open-architected leading edge structure	2025-11-05 00:00:00+03:30
145	62	Cross-platform real-time hub	2025-11-22 00:00:00+03:30
146	7	Inverse 6th generation help-desk	2025-10-11 00:00:00+03:30
147	9	Reverse-engineered static model	2026-05-11 00:00:00+03:30
148	79	Adaptive 5th generation structure	2026-04-20 00:00:00+03:30
149	33	Future-proofed context-sensitive installation	2026-05-18 00:00:00+03:30
150	13	Pre-emptive well-modulated concept	2025-11-07 00:00:00+03:30
151	63	Open-source cohesive knowledge base	2025-10-11 00:00:00+03:30
152	11	Digitized tertiary ability	2026-01-14 00:00:00+03:30
153	3	Re-contextualized next generation collaboration	2026-08-06 00:00:00+03:30
154	61	Visionary leading edge orchestration	2026-05-20 00:00:00+03:30
155	43	Open-architected object-oriented Graphic Interface	2025-10-24 00:00:00+03:30
156	45	Optional interactive hub	2025-12-02 00:00:00+03:30
157	58	Cross-platform hybrid framework	2026-08-14 00:00:00+03:30
158	68	Fully-configurable coherent productivity	2026-09-29 00:00:00+03:30
159	45	Inverse systematic ability	2026-01-29 00:00:00+03:30
160	68	Sharable responsive projection	2026-01-07 00:00:00+03:30
161	53	Synergized even-keeled firmware	2026-06-10 00:00:00+03:30
162	54	Compatible full-range parallelism	2026-07-10 00:00:00+03:30
163	9	Decentralized 4th generation function	2026-05-11 00:00:00+03:30
164	25	Future-proofed interactive attitude	2026-01-03 00:00:00+03:30
165	5	Organized well-modulated Graphic Interface	2025-12-24 00:00:00+03:30
166	50	Pre-emptive background installation	2026-05-21 00:00:00+03:30
167	78	Multi-layered static artificial intelligence	2026-02-16 00:00:00+03:30
168	71	Total multimedia firmware	2026-02-26 00:00:00+03:30
169	2	Mandatory fault-tolerant installation	2025-10-26 00:00:00+03:30
170	77	Cross-group systemic internet solution	2025-11-21 00:00:00+03:30
171	15	Upgradable even-keeled adapter	2026-06-04 00:00:00+03:30
172	18	Advanced composite encoding	2026-03-26 00:00:00+03:30
173	74	Compatible multimedia open architecture	2026-02-23 00:00:00+03:30
174	4	Devolved impactful matrices	2026-01-30 00:00:00+03:30
175	77	Assimilated zero administration framework	2026-02-28 00:00:00+03:30
176	53	Synchronised asynchronous concept	2025-12-09 00:00:00+03:30
177	10	Progressive attitude-oriented standardization	2026-01-16 00:00:00+03:30
178	68	Compatible foreground artificial intelligence	2026-03-24 00:00:00+03:30
179	51	Object-based human-resource hub	2026-05-25 00:00:00+03:30
180	43	Realigned directional toolset	2026-02-19 00:00:00+03:30
181	27	Ameliorated exuding model	2026-04-16 00:00:00+03:30
182	61	Stand-alone intangible toolset	2026-06-21 00:00:00+03:30
183	20	Inverse bifurcated array	2026-07-23 00:00:00+03:30
184	41	Implemented incremental adapter	2026-05-16 00:00:00+03:30
185	47	Progressive 3rd generation groupware	2026-03-06 00:00:00+03:30
186	54	Innovative web-enabled solution	2026-04-16 00:00:00+03:30
187	54	Extended mission-critical budgetary management	2026-03-03 00:00:00+03:30
188	68	Stand-alone client-server concept	2025-11-03 00:00:00+03:30
189	35	Right-sized asymmetric structure	2025-12-13 00:00:00+03:30
190	14	User-centric heuristic core	2026-05-23 00:00:00+03:30
191	64	Integrated empowering ability	2026-05-29 00:00:00+03:30
192	49	Horizontal asymmetric parallelism	2025-10-22 00:00:00+03:30
193	68	Reduced disintermediate ability	2026-04-20 00:00:00+03:30
194	16	Digitized radical hierarchy	2025-11-15 00:00:00+03:30
195	10	Cross-platform didactic customer loyalty	2026-09-26 00:00:00+03:30
196	57	Reactive executive workforce	2026-05-05 00:00:00+03:30
197	62	Centralized logistical middleware	2026-01-02 00:00:00+03:30
198	6	Automated client-driven hub	2026-09-23 00:00:00+03:30
199	60	Adaptive content-based utilisation	2026-08-03 00:00:00+03:30
200	67	Business-focused directional structure	2026-01-05 00:00:00+03:30
201	45	Optimized dynamic matrix	2026-08-08 00:00:00+03:30
202	35	Persevering exuding moderator	2025-10-03 00:00:00+03:30
203	9	Cloned intangible access	2026-06-22 00:00:00+03:30
204	18	Multi-layered impactful customer loyalty	2025-10-27 00:00:00+03:30
205	23	Open-source scalable neural-net	2025-11-19 00:00:00+03:30
206	33	Optimized upward-trending parallelism	2026-02-27 00:00:00+03:30
207	33	Multi-layered content-based array	2026-08-14 00:00:00+03:30
208	77	Visionary mobile open architecture	2025-11-27 00:00:00+03:30
209	41	Devolved impactful instruction set	2026-01-06 00:00:00+03:30
210	20	Innovative interactive portal	2025-10-02 00:00:00+03:30
211	45	Cross-platform system-worthy emulation	2026-07-01 00:00:00+03:30
212	50	Right-sized client-driven approach	2026-07-07 00:00:00+03:30
213	55	Fundamental heuristic product	2026-09-10 00:00:00+03:30
214	17	Compatible homogeneous migration	2025-11-08 00:00:00+03:30
215	8	Cross-platform optimal functionalities	2025-12-14 00:00:00+03:30
216	41	Cloned actuating initiative	2026-09-02 00:00:00+03:30
217	13	Persevering bifurcated project	2025-12-06 00:00:00+03:30
218	2	Adaptive human-resource website	2026-02-20 00:00:00+03:30
219	41	Function-based tangible intranet	2025-11-09 00:00:00+03:30
220	68	Re-contextualized hybrid analyzer	2026-02-09 00:00:00+03:30
221	74	Object-based radical open architecture	2026-07-30 00:00:00+03:30
222	66	Managed empowering database	2026-06-16 00:00:00+03:30
223	54	Integrated global help-desk	2026-07-07 00:00:00+03:30
224	47	Function-based 5th generation attitude	2026-03-02 00:00:00+03:30
225	50	Seamless eco-centric forecast	2025-10-13 00:00:00+03:30
226	47	Virtual transitional info-mediaries	2026-03-16 00:00:00+03:30
227	55	Function-based well-modulated circuit	2026-05-06 00:00:00+03:30
228	42	Decentralized contextually-based process improvement	2026-06-24 00:00:00+03:30
229	2	Seamless hybrid customer loyalty	2026-06-10 00:00:00+03:30
230	63	Distributed intangible approach	2026-08-25 00:00:00+03:30
231	73	Advanced client-driven complexity	2026-06-29 00:00:00+03:30
232	42	Switchable context-sensitive extranet	2026-04-23 00:00:00+03:30
233	10	Customizable human-resource model	2026-07-27 00:00:00+03:30
234	9	Decentralized modular intranet	2026-07-15 00:00:00+03:30
235	61	Object-based human-resource neural-net	2026-04-24 00:00:00+03:30
236	55	Proactive composite methodology	2026-06-22 00:00:00+03:30
237	42	Balanced asynchronous matrices	2026-09-13 00:00:00+03:30
238	28	Realigned uniform encryption	2026-03-27 00:00:00+03:30
239	15	User-centric transitional flexibility	2026-05-23 00:00:00+03:30
240	21	Future-proofed disintermediate benchmark	2026-04-10 00:00:00+03:30
241	38	Quality-focused 6th generation architecture	2025-11-24 00:00:00+03:30
242	22	Operative zero administration array	2026-05-22 00:00:00+03:30
243	47	Assimilated global superstructure	2026-04-22 00:00:00+03:30
244	30	Organized object-oriented productivity	2026-03-04 00:00:00+03:30
245	18	Ergonomic bandwidth-monitored model	2025-10-22 00:00:00+03:30
246	24	Intuitive bandwidth-monitored capacity	2026-09-29 00:00:00+03:30
247	79	Persevering discrete data-warehouse	2026-07-01 00:00:00+03:30
248	44	Digitized analyzing archive	2026-06-09 00:00:00+03:30
249	37	Horizontal neutral database	2026-06-10 00:00:00+03:30
250	54	Cross-group context-sensitive migration	2026-01-28 00:00:00+03:30
251	69	Implemented demand-driven methodology	2026-06-25 00:00:00+03:30
252	75	Team-oriented contextually-based capacity	2025-12-11 00:00:00+03:30
253	34	Front-line asymmetric help-desk	2026-04-21 00:00:00+03:30
254	43	Reverse-engineered interactive function	2026-05-16 00:00:00+03:30
255	53	Switchable 4th generation pricing structure	2025-11-22 00:00:00+03:30
256	76	Devolved incremental extranet	2026-08-31 00:00:00+03:30
257	62	Intuitive explicit solution	2025-12-09 00:00:00+03:30
258	78	Visionary asymmetric capability	2026-03-25 00:00:00+03:30
259	21	Progressive human-resource groupware	2026-04-28 00:00:00+03:30
260	9	Polarised dedicated synergy	2026-06-07 00:00:00+03:30
261	79	Quality-focused analyzing installation	2026-04-27 00:00:00+03:30
262	14	Automated holistic approach	2026-09-09 00:00:00+03:30
263	32	Front-line tertiary service-desk	2026-05-21 00:00:00+03:30
264	38	Customer-focused heuristic core	2025-11-10 00:00:00+03:30
265	7	Enterprise-wide secondary superstructure	2026-07-06 00:00:00+03:30
266	72	Stand-alone reciprocal paradigm	2025-10-29 00:00:00+03:30
267	74	Face to face needs-based Graphical User Interface	2026-04-26 00:00:00+03:30
268	63	Sharable static utilisation	2025-12-15 00:00:00+03:30
269	70	Up-sized exuding protocol	2026-08-18 00:00:00+03:30
270	47	Multi-tiered system-worthy capability	2026-03-16 00:00:00+03:30
271	29	Polarised optimal complexity	2026-04-21 00:00:00+03:30
272	63	Digitized multi-state hierarchy	2026-07-25 00:00:00+03:30
273	41	Polarised grid-enabled projection	2026-06-29 00:00:00+03:30
274	61	Organic logistical hub	2026-07-13 00:00:00+03:30
275	80	Proactive leading edge support	2026-07-29 00:00:00+03:30
276	36	Face to face needs-based productivity	2026-02-04 00:00:00+03:30
277	20	Pre-emptive real-time array	2026-08-09 00:00:00+03:30
278	25	Expanded analyzing knowledge user	2026-02-16 00:00:00+03:30
279	74	Managed system-worthy functionalities	2026-07-27 00:00:00+03:30
280	67	Public-key directional implementation	2026-01-05 00:00:00+03:30
281	34	Triple-buffered well-modulated software	2026-05-29 00:00:00+03:30
282	33	Polarised interactive open system	2026-02-16 00:00:00+03:30
283	58	Ergonomic static system engine	2025-10-09 00:00:00+03:30
284	31	Object-based didactic neural-net	2026-03-27 00:00:00+03:30
285	5	Robust uniform alliance	2026-02-11 00:00:00+03:30
286	40	Automated full-range workforce	2025-10-26 00:00:00+03:30
287	8	Polarised asymmetric benchmark	2026-04-24 00:00:00+03:30
288	41	Integrated context-sensitive array	2026-09-02 00:00:00+03:30
289	9	Face to face didactic intranet	2026-08-22 00:00:00+03:30
290	4	Robust hybrid internet solution	2026-04-19 00:00:00+03:30
291	15	Down-sized optimal definition	2025-11-28 00:00:00+03:30
292	7	Integrated 24 hour info-mediaries	2026-09-16 00:00:00+03:30
293	29	Multi-tiered full-range attitude	2026-05-19 00:00:00+03:30
294	63	Multi-layered full-range artificial intelligence	2026-08-31 00:00:00+03:30
295	35	Self-enabling zero tolerance functionalities	2026-07-30 00:00:00+03:30
296	66	Seamless bi-directional ability	2026-07-14 00:00:00+03:30
297	2	Front-line uniform utilisation	2026-02-05 00:00:00+03:30
298	30	User-centric dynamic website	2026-07-09 00:00:00+03:30
299	16	Horizontal leading edge implementation	2026-05-10 00:00:00+03:30
300	6	Assimilated even-keeled policy	2026-06-04 00:00:00+03:30
301	76	Re-contextualized uniform encoding	2026-04-13 00:00:00+03:30
302	45	Proactive incremental task-force	2026-09-12 00:00:00+03:30
303	32	Reverse-engineered bi-directional ability	2025-10-05 00:00:00+03:30
304	41	Sharable web-enabled neural-net	2026-04-05 00:00:00+03:30
305	50	Innovative empowering customer loyalty	2026-05-30 00:00:00+03:30
306	26	Visionary logistical alliance	2025-12-16 00:00:00+03:30
307	20	Function-based eco-centric open system	2025-10-17 00:00:00+03:30
308	12	Expanded 3rd generation core	2025-12-25 00:00:00+03:30
309	29	Business-focused transitional forecast	2026-02-08 00:00:00+03:30
310	66	Up-sized leading edge firmware	2026-08-26 00:00:00+03:30
311	4	Distributed multi-tasking synergy	2026-01-13 00:00:00+03:30
312	28	Versatile value-added pricing structure	2026-06-26 00:00:00+03:30
313	23	Horizontal upward-trending flexibility	2026-05-03 00:00:00+03:30
314	23	Centralized composite model	2026-03-03 00:00:00+03:30
315	62	Multi-channelled methodical website	2026-06-06 00:00:00+03:30
316	50	Robust non-volatile contingency	2026-06-19 00:00:00+03:30
317	75	Synergistic value-added flexibility	2025-11-30 00:00:00+03:30
318	36	Front-line mobile hub	2026-02-20 00:00:00+03:30
319	24	Inverse asynchronous core	2026-08-07 00:00:00+03:30
320	20	Front-line homogeneous local area network	2026-05-13 00:00:00+03:30
321	43	Front-line motivating approach	2025-12-21 00:00:00+03:30
322	6	Fundamental object-oriented flexibility	2025-12-17 00:00:00+03:30
323	77	Organized 4th generation solution	2026-05-19 00:00:00+03:30
324	52	Intuitive disintermediate project	2026-06-11 00:00:00+03:30
325	69	Reverse-engineered demand-driven alliance	2026-07-06 00:00:00+03:30
326	9	Cross-platform leading edge projection	2026-06-28 00:00:00+03:30
327	50	Mandatory eco-centric neural-net	2026-09-13 00:00:00+03:30
328	38	Proactive methodical standardization	2025-11-10 00:00:00+03:30
329	30	Diverse full-range utilisation	2026-06-26 00:00:00+03:30
330	65	Switchable 5th generation collaboration	2026-01-06 00:00:00+03:30
331	33	Streamlined hybrid local area network	2026-02-26 00:00:00+03:30
332	76	Organic regional productivity	2025-12-22 00:00:00+03:30
333	9	Organic methodical open architecture	2026-01-10 00:00:00+03:30
334	39	Exclusive client-server function	2025-10-12 00:00:00+03:30
335	25	Organized background throughput	2025-11-07 00:00:00+03:30
336	34	Up-sized stable internet solution	2026-08-11 00:00:00+03:30
337	43	Horizontal bifurcated infrastructure	2026-03-13 00:00:00+03:30
338	20	Multi-tiered didactic database	2026-04-26 00:00:00+03:30
339	39	Robust multi-tasking data-warehouse	2026-01-27 00:00:00+03:30
340	69	Persistent didactic local area network	2026-01-11 00:00:00+03:30
341	72	Multi-tiered 5th generation intranet	2026-05-31 00:00:00+03:30
342	21	Multi-tiered systematic functionalities	2026-03-02 00:00:00+03:30
343	17	Future-proofed system-worthy utilisation	2026-02-18 00:00:00+03:30
344	20	Triple-buffered web-enabled flexibility	2026-02-20 00:00:00+03:30
345	48	Advanced clear-thinking initiative	2026-04-01 00:00:00+03:30
346	62	Re-contextualized well-modulated budgetary management	2026-05-17 00:00:00+03:30
347	41	Multi-channelled zero administration help-desk	2026-08-01 00:00:00+03:30
348	11	Cloned multimedia pricing structure	2026-09-23 00:00:00+03:30
349	47	Devolved incremental ability	2026-09-06 00:00:00+03:30
350	17	Intuitive fault-tolerant collaboration	2026-04-25 00:00:00+03:30
351	31	Intuitive multi-tasking artificial intelligence	2026-05-02 00:00:00+03:30
352	16	Automated regional protocol	2025-11-19 00:00:00+03:30
353	74	Horizontal stable website	2026-06-04 00:00:00+03:30
354	44	Stand-alone cohesive matrices	2026-01-15 00:00:00+03:30
355	4	Virtual executive collaboration	2025-12-28 00:00:00+03:30
356	74	Horizontal systematic paradigm	2026-05-26 00:00:00+03:30
357	79	Polarised bottom-line secured line	2025-11-12 00:00:00+03:30
358	72	Progressive regional attitude	2026-05-24 00:00:00+03:30
359	39	Up-sized full-range attitude	2026-09-02 00:00:00+03:30
360	69	Triple-buffered upward-trending knowledge user	2025-11-24 00:00:00+03:30
361	60	Upgradable secondary instruction set	2025-11-11 00:00:00+03:30
362	57	Universal discrete initiative	2026-06-17 00:00:00+03:30
363	19	Quality-focused didactic project	2026-06-23 00:00:00+03:30
364	62	Automated bifurcated groupware	2026-07-22 00:00:00+03:30
365	12	Reduced analyzing leverage	2025-12-03 00:00:00+03:30
366	49	Reverse-engineered static data-warehouse	2026-07-21 00:00:00+03:30
367	36	Optional context-sensitive focus group	2026-02-28 00:00:00+03:30
368	9	Switchable zero tolerance initiative	2026-03-26 00:00:00+03:30
369	37	User-centric fresh-thinking framework	2026-07-12 00:00:00+03:30
370	17	Polarised optimal software	2026-03-19 00:00:00+03:30
371	9	Virtual contextually-based approach	2026-04-20 00:00:00+03:30
372	50	Implemented uniform model	2025-10-03 00:00:00+03:30
373	40	Compatible homogeneous instruction set	2025-11-27 00:00:00+03:30
374	72	Persistent fresh-thinking matrices	2026-07-04 00:00:00+03:30
375	64	Customer-focused clear-thinking instruction set	2025-10-25 00:00:00+03:30
376	71	Automated client-driven hub	2026-05-19 00:00:00+03:30
377	24	Function-based fault-tolerant collaboration	2026-08-23 00:00:00+03:30
378	22	Multi-tiered neutral focus group	2025-12-11 00:00:00+03:30
379	76	Face to face motivating superstructure	2026-02-01 00:00:00+03:30
380	49	Mandatory regional array	2026-08-01 00:00:00+03:30
381	41	Down-sized bifurcated architecture	2026-08-13 00:00:00+03:30
382	50	Future-proofed hybrid definition	2026-07-26 00:00:00+03:30
383	43	Stand-alone client-server instruction set	2025-12-21 00:00:00+03:30
384	53	Assimilated leading edge conglomeration	2026-07-26 00:00:00+03:30
385	67	Multi-lateral mission-critical interface	2026-02-16 00:00:00+03:30
386	71	Self-enabling bi-directional parallelism	2026-03-12 00:00:00+03:30
387	74	Advanced 24/7 process improvement	2025-11-20 00:00:00+03:30
388	58	Decentralized multi-state artificial intelligence	2026-08-13 00:00:00+03:30
389	55	Grass-roots static projection	2025-12-31 00:00:00+03:30
390	32	Upgradable attitude-oriented product	2025-11-06 00:00:00+03:30
391	57	Grass-roots uniform paradigm	2026-08-26 00:00:00+03:30
392	37	Open-architected secondary flexibility	2026-08-26 00:00:00+03:30
393	64	Fully-configurable composite core	2026-03-05 00:00:00+03:30
394	32	Multi-tiered high-level synergy	2025-11-20 00:00:00+03:30
395	80	Advanced bi-directional core	2026-04-14 00:00:00+03:30
396	25	Sharable optimal attitude	2026-07-23 00:00:00+03:30
397	4	Persevering directional challenge	2026-02-14 00:00:00+03:30
398	20	Progressive fresh-thinking capacity	2025-11-15 00:00:00+03:30
399	15	Open-architected intangible archive	2026-04-08 00:00:00+03:30
400	11	Reactive homogeneous budgetary management	2026-05-19 00:00:00+03:30
401	79	Open-architected responsive algorithm	2026-06-03 00:00:00+03:30
402	23	Implemented multi-tasking implementation	2025-12-30 00:00:00+03:30
403	69	Mandatory optimizing frame	2026-07-18 00:00:00+03:30
404	52	Horizontal uniform knowledge base	2026-06-12 00:00:00+03:30
405	20	Virtual contextually-based orchestration	2026-04-14 00:00:00+03:30
406	9	Integrated analyzing moratorium	2026-06-19 00:00:00+03:30
407	45	Enhanced non-volatile projection	2025-12-24 00:00:00+03:30
408	60	Self-enabling object-oriented structure	2026-07-15 00:00:00+03:30
409	46	Object-based non-volatile protocol	2026-08-27 00:00:00+03:30
410	55	Monitored maximized toolset	2026-09-09 00:00:00+03:30
411	2	Cross-platform coherent database	2026-01-21 00:00:00+03:30
412	6	Polarised multimedia initiative	2026-02-08 00:00:00+03:30
413	58	Versatile holistic emulation	2026-09-24 00:00:00+03:30
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ehsan
--

COPY public.users (id, username, email, password_hash, display_name, bio, created_at, avatar_url) FROM stdin;
2	ehamberstone0	gkaplin0@facebook.com	$2a$04$YpczQZKCABCkkC.P1hJSYepILjrJK8EHEYmkiBgwm89wTpHEL6IUO	some stupid name	lorem	2025-12-13 00:00:00+03:30	https://placehold.co/600x400
3	aableson1	nyeats1@bigcartel.com	$2a$04$ouTmrOXx30ZfOojE8grxDeAsJoyGI9Q/.Im.LZ5.eIyBOkRjzDtHG	some stupid name	don't look for a bio	2026-05-18 00:00:00+03:30	https://placehold.co/600x400
4	ijacobowicz2	tgumme2@prlog.org	$2a$04$r1jbaegG4BhVC.H6VEi5PurhnDVwad2BLKpy1UQJ0hY2apEbXTZRC	some stupid name	this is a bio	2026-04-03 00:00:00+03:30	https://placehold.co/600x400
5	skierans3	gridger3@phoca.cz	$2a$04$EOL7127NDAy3XtPWyagwbu4D2FJQ6Gd/iFbnIyOCntmcgGrbbR8aq	some stupid name	lorem	2026-04-09 00:00:00+03:30	https://placehold.co/600x400
6	mhanscombe4	tdell4@godaddy.com	$2a$04$r7lPmx9.81MYPRHhpnp6QeVOyxWG.dY9jFDDUdJMeCI5eqYapumGK	some stupid name	example	2025-12-11 00:00:00+03:30	https://placehold.co/600x400
7	fridgeway5	dpumfrett5@nifty.com	$2a$04$vTxr6v8oX1.KuuIPT.Wt/OMRcYs5570Shxqeg9V2bHp/00anKIQlm	some stupid name	example	2026-09-14 00:00:00+03:30	https://placehold.co/600x400
8	lisakov6	crehorek6@webmd.com	$2a$04$PZfnGxxIj7G.j5BwdjWqc.4GklJEI7TFB2x31MFXjEkvv5SYW/G1a	some stupid name	example	2026-02-06 00:00:00+03:30	https://placehold.co/600x400
9	avarey7	ctickle7@indiatimes.com	$2a$04$qsuPy6BWbjoCvaKjqIS7xuKMOuRNhdxSMvwmPS.6IX8W85SArIBum	some stupid name	lorem	2026-05-24 00:00:00+03:30	https://placehold.co/600x400
10	kodriscole8	llesslie8@ed.gov	$2a$04$Xw6WJTHHfdc5wN/x8/apzOnh7UfbjdDvI2M8DvN.f3sXpgG.fLq3e	some stupid name	example	2026-03-15 00:00:00+03:30	https://placehold.co/600x400
11	mlink9	jstogill9@bbb.org	$2a$04$sidFGl56F7znbKPD7A59lONdVNPsKIDRLLUvrffBdraF43iGISTzK	some stupid name	example	2026-06-11 00:00:00+03:30	https://placehold.co/600x400
12	wmckevitta	kughettia@sakura.ne.jp	$2a$04$LoHnLUEA6krtgTMAHjCImOGL79jpMIKh2VuVz41HPUtfjA.6wUhU.	some stupid name	don't look for a bio	2026-01-25 00:00:00+03:30	https://placehold.co/600x400
13	wransfieldb	dmagogb@rakuten.co.jp	$2a$04$Up5cWxGNGGw1/EortXzXr.F3yR5kfSrLRxxc6C4jpM6MuDJ9hPh6K	some stupid name	lorem	2026-05-24 00:00:00+03:30	https://placehold.co/600x400
14	oferriec	sproudmanc@imageshack.us	$2a$04$JVtjE4esuo5etHbcxDlwce/bpsxvsRXqzLoS7o7AqJBbesRUJ.eGS	some stupid name	lorem	2026-01-18 00:00:00+03:30	https://placehold.co/600x400
15	hpierced	lvasechkind@weibo.com	$2a$04$x5tXHABlQrcC0AqSJOrWiu/BG5JK9L4Zca3LzsInhHBPF2pptoCHe	some stupid name	lorem	2026-04-30 00:00:00+03:30	https://placehold.co/600x400
16	vkhalide	ahaste@sfgate.com	$2a$04$xP0o/krl0nixTA6gzIQeMecl.lwd.pYFJMGLoWKvdE/fBU8.styAy	some stupid name	don't look for a bio	2026-05-04 00:00:00+03:30	https://placehold.co/600x400
17	pcarlsenf	jhightownf@vk.com	$2a$04$c94xp./Ot3F0TPx5UZvEMeE13gDtbiTWIe4I9kEkW4W73dy0Walje	some stupid name	lorem	2026-05-12 00:00:00+03:30	https://placehold.co/600x400
18	gsollarsg	wmcchesneyg@discuz.net	$2a$04$doeGBknJzrzjok.OWTiSbeaQ6JocCGp8vhDvKQCGL6uBiuq0hxUpW	some stupid name	example	2025-11-20 00:00:00+03:30	https://placehold.co/600x400
19	mdripph	wregitzh@nsw.gov.au	$2a$04$r0wShQjovdESA5qU8fbT7eKVnum0biFkbMFnrt4TaGM38yy6jLX8.	some stupid name	example	2026-07-10 00:00:00+03:30	https://placehold.co/600x400
20	hbullochi	omcgheei@who.int	$2a$04$VW4mAv.wRMQM9zcuzfPZ1uCBZN3IdaZ4swZxWBs1mQSSoWDuDYr.K	some stupid name	lorem	2026-03-08 00:00:00+03:30	https://placehold.co/600x400
21	ewinslowj	cphillottj@canalblog.com	$2a$04$lriTYkGC3ik4pX/H67bF4eVSyxnpnR7sEeDl0XlLSgfYl8GCmhGzq	some stupid name	example	2026-07-06 00:00:00+03:30	https://placehold.co/600x400
22	fscapelhornk	cerrowek@t-online.de	$2a$04$1Y5v9doGK4GPaBzhkhRx0uDR6BBEA/TMjh3Epj2SpcOlvGtZNzbGe	some stupid name	don't look for a bio	2026-04-26 00:00:00+03:30	https://placehold.co/600x400
23	ldunlapl	aagronskil@hao123.com	$2a$04$XlvBzkRH9RB90HTgJ3zIW.H0nMou1oekre814TvcH8CoDcLrSv9Oi	some stupid name	lorem	2026-02-22 00:00:00+03:30	https://placehold.co/600x400
24	fpepism	fpeskettm@cbsnews.com	$2a$04$2NEDYlE/ClJJrakcHd8GP.ZUwIMcRw66BlO6COeaLGnRwDJpHmfc6	some stupid name	lorem	2026-02-13 00:00:00+03:30	https://placehold.co/600x400
25	cdoumercn	amaddicksn@photobucket.com	$2a$04$3iSIDBCw1xL062crE7IkB.swebE7QocE.5htaUkTSxVK3rgaQ.ts.	some stupid name	example	2026-04-20 00:00:00+03:30	https://placehold.co/600x400
26	kcufleyo	erastricko@newsvine.com	$2a$04$A.FeOIziorGm3Yx4.aeBbuzD/02cBAV9DCB96EM48ntOret1lUNei	some stupid name	this is a bio	2026-02-03 00:00:00+03:30	https://placehold.co/600x400
27	ngorriep	boxbroughp@unblog.fr	$2a$04$M73mX3bzzOh.FRoOZHgbE.Ngu2Hv0hOCqZoFlxSGPLID9lnoLbRdu	some stupid name	example	2026-09-13 00:00:00+03:30	https://placehold.co/600x400
28	ajinkinsonq	dloachq@rakuten.co.jp	$2a$04$17ta8gnts23iVd.S3RUljueHb0/phXlar6UrsRDuMI8wQZ9gm8oby	some stupid name	don't look for a bio	2026-09-04 00:00:00+03:30	https://placehold.co/600x400
29	hbradyr	tchasteyr@ed.gov	$2a$04$5wjPNR8/vVtj9rueqoGQNuRif8GQ8GaoCXGSvavLIJEPk0K5.dI4u	some stupid name	example	2026-07-18 00:00:00+03:30	https://placehold.co/600x400
30	rtrusses	ddisburys@csmonitor.com	$2a$04$IrT2m6Ap1kUwEwUtaaSB1.0S/eN4cz1iTT6PGEdS9mEa4zOMikoNC	some stupid name	don't look for a bio	2026-01-05 00:00:00+03:30	https://placehold.co/600x400
31	wgozneyt	kconeleyt@google.com.br	$2a$04$3YUbNR/MIkW4nBYJeu4h1upYLtmmpKGeBaDvTTD6aokmK3BJEG2Q2	some stupid name	this is a bio	2026-07-13 00:00:00+03:30	https://placehold.co/600x400
32	charmonu	kblackborowu@imgur.com	$2a$04$VFf9jMSqtAiwEtKXrttDgOavQfMYRCrsG2lYmsHJQSRnjwfUNLXtW	some stupid name	don't look for a bio	2026-06-23 00:00:00+03:30	https://placehold.co/600x400
33	mjahnischv	lsicelyv@w3.org	$2a$04$4q5vpvF9.IHHUstZrJFmzu/CLi6nbIHL1QuT8rGkU10PA7MHt9Q1G	some stupid name	example	2026-09-10 00:00:00+03:30	https://placehold.co/600x400
34	mdogertyw	ckopfenw@sogou.com	$2a$04$1tSowsscm2UoxbAwYCa1muTlApe.FqaqamQ7J8kBYCEn7otTGMqZS	some stupid name	this is a bio	2026-07-13 00:00:00+03:30	https://placehold.co/600x400
35	kdoorex	frodmanx@springer.com	$2a$04$iFFw53IYvJRRdkgRETPeT.csgD1.XlC0x41mOFVWK2p4ZCCoABItO	some stupid name	lorem	2025-11-25 00:00:00+03:30	https://placehold.co/600x400
36	uridingy	mfritzy@alibaba.com	$2a$04$BtuFABbVcEuxnpDaTPQJyeFOjKLH7jpPt4q5t.Nlr32VhCegudgfC	some stupid name	lorem	2026-03-14 00:00:00+03:30	https://placehold.co/600x400
37	fgarmonz	gmcwhinniez@unc.edu	$2a$04$sDiqtMHwSsXq7FfpINF3Tu0RBRFcOU2hS87KwBidDV0AZhIs7rk6K	some stupid name	this is a bio	2025-11-26 00:00:00+03:30	https://placehold.co/600x400
38	ydjokic10	rtrousdell10@amazonaws.com	$2a$04$yPnQ2zIuEGaG3dRVcRDlsOHmN0O4w3WCTvZqNVTwCi2hHGe9vmrxm	some stupid name	don't look for a bio	2026-04-25 00:00:00+03:30	https://placehold.co/600x400
39	emcgrayle11	wgranger11@bizjournals.com	$2a$04$02zGGPBgwnjsAz.ZWUKs6OYMT5z/VB3LN6fzUNENb/rY6R5rISJ2S	some stupid name	example	2025-11-04 00:00:00+03:30	https://placehold.co/600x400
40	abargery12	mwallbutton12@youtube.com	$2a$04$QBUcNX8cJjmXlTIneYFhvuv6dFv6Fxmscgbbam/P99gqOQJb528/y	some stupid name	example	2026-07-24 00:00:00+03:30	https://placehold.co/600x400
41	ahaverty13	hhessle13@craigslist.org	$2a$04$BfozUL/j65RX4OO9eN2X0OwDq73nSMkxBDyLXdPQEYVsMw7KkBvCe	some stupid name	don't look for a bio	2026-09-11 00:00:00+03:30	https://placehold.co/600x400
42	cpallister14	rpawellek14@prlog.org	$2a$04$5W2Y9FgPt8NBpnjeVOx8Xuw0lvvJoxgHIo8x8a7rzEqB04HDj74r2	some stupid name	this is a bio	2026-08-06 00:00:00+03:30	https://placehold.co/600x400
43	bhubbock15	acondie15@sitemeter.com	$2a$04$oIVcLpT7c3fdGNe/7iIMxu18AuxA1L0kIRWCroVYZTFWpf/ru0fk.	some stupid name	lorem	2025-10-13 00:00:00+03:30	https://placehold.co/600x400
44	afaich16	gvonhindenburg16@indiatimes.com	$2a$04$BTlnT1rdg2fOQ4Jhf/hKK.mvNuf4fJIrebI8ejzInvnA6BR52hOBq	some stupid name	don't look for a bio	2026-02-27 00:00:00+03:30	https://placehold.co/600x400
45	rglasbey17	bcrotty17@earthlink.net	$2a$04$AtKXuFa9/qlNGs4TvvJmouCXMu/qYgjWNgZLyoZ8MDmgn9sA/R.02	some stupid name	lorem	2026-04-02 00:00:00+03:30	https://placehold.co/600x400
46	dllopis18	amarcinkowski18@stumbleupon.com	$2a$04$63Ftbx3NDxc9cru6bPUkj..KHIk6mtd2u/LlTgkfLfZ7T.MoWwq9G	some stupid name	lorem	2026-01-08 00:00:00+03:30	https://placehold.co/600x400
47	abea19	rbramwell19@ocn.ne.jp	$2a$04$mqUxHLssDOG0zgvIWrdA4OSgqvAo5Z9SIfHR6HTFm5aYQlUpra8Ny	some stupid name	lorem	2025-12-13 00:00:00+03:30	https://placehold.co/600x400
48	amckellen1a	ccollier1a@adobe.com	$2a$04$dqYr7wQC2mi7CdqPOmUP4ulrTWLucq3oWcg.MaW9T6MmHKtuUloAS	some stupid name	don't look for a bio	2025-11-26 00:00:00+03:30	https://placehold.co/600x400
49	pscoone1b	dplover1b@eepurl.com	$2a$04$3tcw39T7.bMrnPW1/.Cql.0WfzroaQlk/Z1aN8J5v7pU7CdDqPLe2	some stupid name	this is a bio	2026-01-09 00:00:00+03:30	https://placehold.co/600x400
50	sbront1c	ssaby1c@apache.org	$2a$04$vTcLycHmWbhJIidXt7i67Ovybh.OU/078tn4C0qIMFPxqvJWjODSu	some stupid name	lorem	2025-12-14 00:00:00+03:30	https://placehold.co/600x400
51	sconrath1d	bdrinkhall1d@cpanel.net	$2a$04$5WvdRU8Tup/uzWkBfH1mJOZtnRkUMpMEEOlkSOPvhmVKMgn8g7Qom	some stupid name	this is a bio	2026-02-13 00:00:00+03:30	https://placehold.co/600x400
52	jnoore1e	mabramovitch1e@dailymotion.com	$2a$04$s8XhJkRm/AgWL4jhcYwMdu.PPUeO/3m/dGlFLpBEwHd5eGkUDSCOK	some stupid name	this is a bio	2025-12-12 00:00:00+03:30	https://placehold.co/600x400
53	kschnitter1f	atrevna1f@merriam-webster.com	$2a$04$D9dVoiTokjtOKk.bfMRTCuv9vvzlWmUEQofZYvzX9cSQB/kwRjiMa	some stupid name	example	2026-05-18 00:00:00+03:30	https://placehold.co/600x400
54	ncona1g	dgoldsworthy1g@sina.com.cn	$2a$04$4HmX3oXeQ49Eh.uhY/Z4HuWc9R/3POlxhGnL70rx7mMEXVGLIQ/iO	some stupid name	example	2026-05-18 00:00:00+03:30	https://placehold.co/600x400
55	wedmans1h	lgorges1h@instagram.com	$2a$04$.QQ9fNfRQ0m4WykjiZf0k.w5V7/Nsn76P0IFAsuwW630TX.MiH2Ty	some stupid name	this is a bio	2026-03-01 00:00:00+03:30	https://placehold.co/600x400
56	mcoaker1i	bramsbottom1i@comcast.net	$2a$04$coRzjxo/QYM9TgpYgGFbV.QKbKPQFZdrSKbhPamUd7s/zJezYJbey	some stupid name	lorem	2025-11-25 00:00:00+03:30	https://placehold.co/600x400
57	bovershott1j	jjirzik1j@wunderground.com	$2a$04$Mb9vPSO4KOJbW9RT/G5Hu.XnV5Ga5dJPtGK2.S2G0QJWRs097VEAC	some stupid name	example	2025-12-30 00:00:00+03:30	https://placehold.co/600x400
58	wcanto1k	dlipgens1k@walmart.com	$2a$04$q4GbNH7Mj9qUqhgOCX1pL.QKWVh3MiDi5UdN854dKQJtEjYI6IQWK	some stupid name	this is a bio	2026-07-26 00:00:00+03:30	https://placehold.co/600x400
59	hmatthensen1l	gstronough1l@nba.com	$2a$04$gFUg/d1k4dFJrFFYvB6dNetipeErw824e166A./89AbIT6mw81Wqm	some stupid name	example	2026-05-10 00:00:00+03:30	https://placehold.co/600x400
60	tdeal1m	jofogarty1m@google.pl	$2a$04$2HiIf1WyEjqtilqetFTMYOeBgDUBFRo8yJ9hx3..FXq/4BtCilAQG	some stupid name	lorem	2026-05-24 00:00:00+03:30	https://placehold.co/600x400
61	kuphill1n	escourfield1n@yolasite.com	$2a$04$MnheyeL/ExwCKfV5CZU6yu6G.NEm5qU60Ike/D72W0kbDUxLed0Km	some stupid name	this is a bio	2026-09-07 00:00:00+03:30	https://placehold.co/600x400
62	dphillip1o	bhansod1o@over-blog.com	$2a$04$Z8jbgoWGaMqMPHwSnCCqP.ZJlCKqlpeZj6pNGGYPiJIcFPlgiH8O.	some stupid name	lorem	2026-09-08 00:00:00+03:30	https://placehold.co/600x400
63	acuree1p	vrubrow1p@taobao.com	$2a$04$BlWtqxy/YmNAzMKZG1Ah1u4f4vAX5KoGrOTx8ykAN5ygEXo1jLET6	some stupid name	this is a bio	2025-10-05 00:00:00+03:30	https://placehold.co/600x400
64	kleese1q	fringwood1q@w3.org	$2a$04$KaZgx6PCsiCNszm6ozUjCePQolNcYJJODJb/pZcfiENB0RUuVfbfC	some stupid name	example	2026-08-02 00:00:00+03:30	https://placehold.co/600x400
65	ahasloch1r	dgrewes1r@state.tx.us	$2a$04$SG1l9qCu212dsXf24cOulun0VtXNRRDrvZ5a26lzNHF8u75J2yEay	some stupid name	lorem	2026-09-12 00:00:00+03:30	https://placehold.co/600x400
66	darrow1s	rblanden1s@cpanel.net	$2a$04$IgSwftf6eOp1ob1aYlGAoOyAD2DE7pRGPhDRiF.8FCGlMGykvIQF2	some stupid name	this is a bio	2025-11-26 00:00:00+03:30	https://placehold.co/600x400
67	mfearnyough1t	lpawling1t@so-net.ne.jp	$2a$04$oAGzbAH9RgnGZ2m.eME09.YCJZLOLVMhC8xebRdEdiE70ozoQS81G	some stupid name	don't look for a bio	2026-07-11 00:00:00+03:30	https://placehold.co/600x400
68	mdumbar1u	astern1u@xing.com	$2a$04$iINbzguZoqc.DeqCl1MIouNSoX9c/WIOa1KAvguXzP1YqSDkEKsO2	some stupid name	don't look for a bio	2026-08-26 00:00:00+03:30	https://placehold.co/600x400
69	thuton1v	hstrawbridge1v@g.co	$2a$04$SVeNB3gpszqY8HNhSejcKup..Ji7W9oQUR/8ezmpTxplKSlPRSTMq	some stupid name	lorem	2026-09-15 00:00:00+03:30	https://placehold.co/600x400
70	lforder1w	aasgodby1w@miitbeian.gov.cn	$2a$04$78QwQQpt1khp5bXose.4Fud1yVyjiZCGiRKokvl/tu/aZPNUVX9w2	some stupid name	this is a bio	2026-04-14 00:00:00+03:30	https://placehold.co/600x400
71	hbudden1x	ubollins1x@ovh.net	$2a$04$ucMl.7KZd2ImNXFVFheg5uMyp1TLp/HK0pUIxwSAjeTaDT5xrTq9.	some stupid name	example	2026-08-20 00:00:00+03:30	https://placehold.co/600x400
72	irubica1y	scross1y@amazon.com	$2a$04$X3wiRwj42ke8amXNPNOXLONhFBqb640ijW.by/hI5Rcl41PwH14Vm	some stupid name	lorem	2026-03-08 00:00:00+03:30	https://placehold.co/600x400
73	sgrabham1z	lsketch1z@behance.net	$2a$04$V.mbrzRQ23y6lqYmNlkdeeW1KcRt7J1e65drr3c3TcJ1fK/qIZpaO	some stupid name	don't look for a bio	2026-04-09 00:00:00+03:30	https://placehold.co/600x400
74	dskoate20	gbygate20@amazon.co.uk	$2a$04$o.PXbilUi9.5WSNhlY3S7OCKKgrrJ8liBdgb7PgkZXudDlt0r5rpe	some stupid name	this is a bio	2025-10-04 00:00:00+03:30	https://placehold.co/600x400
75	tleggs21	rkensett21@t.co	$2a$04$uvvvgp4UYBRvLE0Uxa99AO139IiBsQFEyZP654fu1qdKfmFfZZYsa	some stupid name	this is a bio	2026-09-03 00:00:00+03:30	https://placehold.co/600x400
76	dmarcinkus22	bmacsorley22@drupal.org	$2a$04$C8Rxi2EGkLUS7sDEE8.Fjut7xPRKdKidLiocUpeWw.lLAEuhXmZBi	some stupid name	example	2025-11-13 00:00:00+03:30	https://placehold.co/600x400
77	kmoorcraft23	mpearcey23@nyu.edu	$2a$04$AN17iISa/CtiDn8p8w/E4.s8K3tULSsj4utUDebOPqyg6dDfuajXe	some stupid name	don't look for a bio	2026-05-04 00:00:00+03:30	https://placehold.co/600x400
78	vfield24	amccullogh24@hugedomains.com	$2a$04$DTfYhC8VUGFmkGIWs2hqXuHGLl453o1EY6BJvDWvUHbz8TtPAvDKq	some stupid name	don't look for a bio	2026-07-07 00:00:00+03:30	https://placehold.co/600x400
79	wstobbart25	bnieass25@kickstarter.com	$2a$04$sRXdd9wD4Sd87Gc7QKZ1Zuzz2qcA/QhpTliZrCJ4n2z..Lk6K97X6	some stupid name	example	2026-02-16 00:00:00+03:30	https://placehold.co/600x400
80	vwilkenson26	mnewitt26@cornell.edu	$2a$04$KEzFgf.joCpZVkOVbrVy2.KMTLKLFTteiI1jcF2tjYqME.75376Ry	some stupid name	example	2025-12-03 00:00:00+03:30	https://placehold.co/600x400
81	igrainge27	wmayte27@prnewswire.com	$2a$04$.lBAXvkCmQS6oUR/MPNIWuOCF4GugbEvWAIr9FLuL9c91FuXIGLge	some stupid name	example	2026-02-25 00:00:00+03:30	https://placehold.co/600x400
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ehsan
--

SELECT pg_catalog.setval('public.comments_id_seq', 1000, true);


--
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ehsan
--

SELECT pg_catalog.setval('public.follows_id_seq', 194, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ehsan
--

SELECT pg_catalog.setval('public.likes_id_seq', 494, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ehsan
--

SELECT pg_catalog.setval('public.posts_id_seq', 413, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ehsan
--

SELECT pg_catalog.setval('public.users_id_seq', 81, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: follows follows_follower_id_leader_id_key; Type: CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_follower_id_leader_id_key UNIQUE (follower_id, leader_id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: likes likes_user_id_post_id_key; Type: CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_post_id_key UNIQUE (user_id, post_id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: comments comments_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: comments comments_parent_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_parent_comment_id_fkey FOREIGN KEY (parent_comment_id) REFERENCES public.comments(id) ON DELETE CASCADE;


--
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: follows follows_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: follows follows_leader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_leader_id_fkey FOREIGN KEY (leader_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: likes likes_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: likes likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: posts posts_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ehsan
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO ehsan;


--
-- PostgreSQL database dump complete
--

\unrestrict 1PSaccZHedIK5SLKgeaxPcUdHE8IhF6FShUHcRIVZKeVcbNITiUcYphMhvTBQeD

