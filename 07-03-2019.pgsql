--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: app1_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app1_company (
    "cId" character varying(50) NOT NULL,
    "cName" character varying(50) NOT NULL,
    "cPass" character varying(50) NOT NULL,
    "cEmail" character varying(50) NOT NULL,
    "cType" character varying(50) NOT NULL,
    "cSize" integer NOT NULL,
    "cLoc" character varying(50) NOT NULL
);


ALTER TABLE public.app1_company OWNER TO postgres;

--
-- Name: app1_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app1_employee (
    emp_id character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    dept character varying(50) NOT NULL,
    ques_1_id character varying(5) NOT NULL,
    ans_1 character varying(50) NOT NULL,
    ques_2_id character varying(5) NOT NULL,
    ans_2 character varying(50) NOT NULL,
    gender character varying(50) NOT NULL,
    phone character varying(20) NOT NULL
);


ALTER TABLE public.app1_employee OWNER TO postgres;

--
-- Name: app1_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app1_products (
    "pId" character varying(50) NOT NULL,
    "pName" character varying(50) NOT NULL,
    "pPrize" integer NOT NULL
);


ALTER TABLE public.app1_products OWNER TO postgres;

--
-- Name: app1_tcp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app1_tcp (
    id integer NOT NULL,
    qty integer NOT NULL,
    "cId" character varying(50) NOT NULL,
    "pId" character varying(50) NOT NULL,
    "tId" character varying(50) NOT NULL
);


ALTER TABLE public.app1_tcp OWNER TO postgres;

--
-- Name: app1_tcp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app1_tcp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app1_tcp_id_seq OWNER TO postgres;

--
-- Name: app1_tcp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app1_tcp_id_seq OWNED BY public.app1_tcp.id;


--
-- Name: app1_temp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app1_temp (
    temp_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.app1_temp OWNER TO postgres;

--
-- Name: app1_transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app1_transactions (
    "tId" character varying(50) NOT NULL,
    amt integer NOT NULL,
    "dateTime" timestamp with time zone NOT NULL,
    remarks character varying(50) NOT NULL
);


ALTER TABLE public.app1_transactions OWNER TO postgres;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: app1_tcp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app1_tcp ALTER COLUMN id SET DEFAULT nextval('public.app1_tcp_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: app1_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app1_company ("cId", "cName", "cPass", "cEmail", "cType", "cSize", "cLoc") FROM stdin;
C0001	Google	Google1213	google@gmail.com	Technical	300	Bhopal
C0002	Microsoft	Microsoft123	microsoft@gmail.com	Technical	20	Bangalore
C0003	Oracle	Oracle123	oracle@gmail.com	Marketing	40	Pune
C0005	Dell EMC	d7j2L07VT4ZybPf8EdsMQz+gZ0tm6LuZkXAzQqGRBfs=	dell@dell.com	Technical	30	Domlur
C0004	Onco	DkNqbUscqEiIaXRFYkn4S4w1RhOHmufTPqAzij5cKzY=	nam@onco.com	Technical	79	Salarpuria Satva, Koramangala, Bangalore
\.


--
-- Data for Name: app1_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app1_employee (emp_id, name, password, email, dept, ques_1_id, ans_1, ques_2_id, ans_2, gender, phone) FROM stdin;
TCH007	Akshat Trivedi	THRmZMWmo53GSD69JPNPo4FOAucixdWWxWxZJYnZP9Q=	akshat.trivedi08@gmail.com	DJ	1	Mal	1	dsa	male	7000079368
TCH008	Akshat Trivedi	VFOz8OR/ZFFXGmEV7OVfpUAs/31c3gqhMqrloqv6g+0=	akshat.trivedi08@gmail.com	Gamer	1	mo	1	dasasc	male	7000079368
TCH081	Akshat Trivedi	X6V/at019poicvvLL2H/vYEm07ofH0jO8Z4gGs1Gotw=	dnsakl	dsa	1	camsp	1	nasdckl	Male	7000079368
TCH013	Harry Potter	riH0TQ+xQwcW6Vn2N0NQog6FLF2YgfgSFkSsE4P2/ZY=	harry.potter@gmail.com	Check	1	25Dec	1	Hogwarts	Male	10101001
TCH023	Abhinav Shandilya	FeEaaxk7J370C6s5i+EErTwR2X5lcILKvjy47HlyM+c=	abhinav8769@gmail.com	Dahi	1	Krishna Priya	1	Anganwadi	Male	461284721
TCH077	Mohinish Nandwana	dAJ74Rc5GJGi68aOs0RPvYWSAMjmgy2c3n9aKwxf77Y=	moz@gmail.com	PWD	1	abcd	1	pqr	male	127402174021
TCH011	Ashish Gaud	Z/rlwB7BtPgZwL1HbeEsViVl6Ueun4spcxYMaVCb3iI=	ashishgmail	Technician	1	Mera Aashu	1	Sant mary	Male	427874827
\.


--
-- Data for Name: app1_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app1_products ("pId", "pName", "pPrize") FROM stdin;
P0002	CPU	2000
P0003	Mouse	200
P0004	Hard Disk	4000
P0005	Floppy	400
P0006	USB	1000
P0007	Monitor	4000
P0010	Motherboard	20000
P0011	dsanl	890
P0001	Laptop	40000
\.


--
-- Data for Name: app1_tcp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app1_tcp (id, qty, "cId", "pId", "tId") FROM stdin;
2	10	C0002	P0001	T00002
3	20	C0002	P0002	T00002
4	70	C0003	P0005	T00005
6	3	C0003	P0006	T00005
1	4	C0001	P0010	T00001
8	8	C0001	P0006	T00001
9	23	C0001	P0004	T00001
10	1	C0001	P0010	T00004
11	5	C0001	P0006	T00004
12	3	C0004	P0006	T00003
13	1	C0004	P0002	T00003
14	5	C0001	P0003	T00007
15	5	C0002	P0003	T00008
16	1	C0002	P0006	T00008
\.


--
-- Data for Name: app1_temp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app1_temp (temp_id, name) FROM stdin;
2	FAkshat
3	FAkshat
1	Mohan
50	FAkshat
30	FAkshat
\.


--
-- Data for Name: app1_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app1_transactions ("tId", amt, "dateTime", remarks) FROM stdin;
T00001	124	2019-02-12 01:39:44.05461+05:30	TIMEZONE PROBLEM
T00002	412	2019-02-12 01:40:11.934205+05:30	FINAL CHECK
T00005	20000	2019-02-17 17:59:12.068107+05:30	Good sales
T00004	25000	2019-03-03 06:26:52.019481+05:30	New Google Transaction
T00003	10000	2019-03-03 17:21:25.882207+05:30	Impressive
T00007	1000	2019-03-03 17:24:18.485362+05:30	Easy To buy
T00008	2000	2019-03-03 17:27:06.585251+05:30	Good Work
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add employee	7	add_employee
26	Can change employee	7	change_employee
27	Can delete employee	7	delete_employee
28	Can view employee	7	view_employee
29	Can add temp	8	add_temp
30	Can change temp	8	change_temp
31	Can delete temp	8	delete_temp
32	Can view temp	8	view_temp
33	Can add products	9	add_products
34	Can change products	9	change_products
35	Can delete products	9	delete_products
36	Can view products	9	view_products
37	Can add company	10	add_company
38	Can change company	10	change_company
39	Can delete company	10	delete_company
40	Can view company	10	view_company
41	Can add transactions	11	add_transactions
42	Can change transactions	11	change_transactions
43	Can delete transactions	11	delete_transactions
44	Can view transactions	11	view_transactions
45	Can add tcp	12	add_tcp
46	Can change tcp	12	change_tcp
47	Can delete tcp	12	delete_tcp
48	Can view tcp	12	view_tcp
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$120000$9wsqDIVxeIfq$W2XImxMKQmjlyKyKJKEX8irkhhODgLAa2FBNfYWU2vQ=	2019-03-03 04:37:30.571738+05:30	t	akki7	Akshat	Trivedi	akshat.trivedi08@gmail.com	t	t	2019-02-10 03:28:49+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-02-10 03:36:45.94566+05:30	TCH001	TCH001;Akshat Trivedi;Akshat Trivedi;akshat.trivedi08@gmail.com;Trivedi7;Coder;7000079368;4;blahbalh;2;lollol	1	[{"added": {}}]	7	2
2	2019-02-10 03:36:49.411509+05:30	TCH001	TCH001;Akshat Trivedi;Akshat Trivedi;akshat.trivedi08@gmail.com;Trivedi7;Coder;7000079368;4;blahbalh;2;lollol	2	[]	7	2
3	2019-02-10 03:37:35.172355+05:30	2	akki7	2	[{"changed": {"fields": ["first_name", "last_name", "last_login"]}}]	4	2
4	2019-02-11 20:37:16.076193+05:30	C0001	C0001;Wipro Turbo;Wipro1234;wipro@gmail.com;Finance;20;Bangalore	1	[{"added": {}}]	10	2
5	2019-02-11 20:46:14.515915+05:30	5	C0001;Wipro Turbo;Wipro1234;wipro@gmail.com;Finance;20;Bangalore;CPU;200	1	[{"added": {}}]	9	2
6	2019-02-11 20:46:23.435178+05:30	5	C0001;Wipro Turbo;Wipro1234;wipro@gmail.com;Finance;20;Bangalore;CPU;200	2	[]	9	2
7	2019-02-11 20:46:52.900164+05:30	6	C0001;Wipro Turbo;Wipro1234;wipro@gmail.com;Finance;20;Bangalore;Monitor;203	1	[{"added": {}}]	9	2
8	2019-02-11 20:53:50.690856+05:30	C0002	C0002;Infosys;Infosys1223;info@gmail.com;Technical;43;Mysore	1	[{"added": {}}]	10	2
9	2019-02-11 20:53:53.518013+05:30	C0002	C0002;Infosys;Infosys1223;info@gmail.com;Technical;43;Mysore	2	[]	10	2
10	2019-02-11 21:05:07.348702+05:30	7	C0002;Infosys;Infosys1223;info@gmail.com;Technical;43;Mysore;LAN Cables;50	1	[{"added": {}}]	9	2
11	2019-02-11 21:07:51.11853+05:30	C0003	C0003;Google;Google1213;google@gmail.com;Technical;100;Bangalore	1	[{"added": {}}]	10	2
12	2019-02-11 21:08:19.09297+05:30	8	C0003;Google;Google1213;google@gmail.com;Technical;100;Bangalore;Laptops;40000	1	[{"added": {}}]	9	2
13	2019-02-11 21:09:04.369128+05:30	1	C0003;Google;Google1213;google@gmail.com;Technical;100;Bangalore;100000	1	[{"added": {}}]	11	2
14	2019-02-12 00:39:17.071631+05:30	T00001	T00001;10000;2019-02-11 19:09:17.071104+00:00;Better Results	1	[{"added": {}}]	11	2
15	2019-02-12 00:49:01.815817+05:30	T00001	T00001;10000;2019-02-11 19:09:17.071104+00:00;Better Results	3		11	2
16	2019-02-12 00:49:21.825814+05:30	T00001	T00001;10000;2019-02-11 19:19:21.825412+00:00;Good Quality	1	[{"added": {}}]	11	2
17	2019-02-12 00:50:35.489957+05:30	T00002	T00002;1;2019-02-11 19:20:35.489224+00:00;xz	1	[{"added": {}}]	11	2
18	2019-02-12 00:56:51.291214+05:30	T00003	T00003;10021;2019-02-12 00:56:25+05:30;Hello NEw Migrations	1	[{"added": {}}]	11	2
19	2019-02-12 01:05:26.036995+05:30	TCH004	TCH004;4214;2019-02-12 01:05:13+05:30;check	1	[{"added": {}}]	11	2
20	2019-02-12 01:16:06.173063+05:30	T00004	T00004;217;2019-02-12 01:15:20+05:30;Check Again	1	[{"added": {}}]	11	2
21	2019-02-12 01:17:10.018923+05:30	TCH0005	TCH0005;12734;2019-02-12 01:16:49+05:30;Why	1	[{"added": {}}]	11	2
22	2019-02-12 01:24:21.185592+05:30	sad	sad;412;2019-02-11 19:54:21.184419+00:00;saddas	1	[{"added": {}}]	11	2
23	2019-02-12 01:24:48.99271+05:30	HI Again	HI Again;2141;2019-02-11 19:54:48.992302+00:00;Time Error Check	1	[{"added": {}}]	11	2
24	2019-02-12 01:30:52.085759+05:30	FINAL	FINAL;124;2019-02-12 01:30:52.085641;Correct	1	[{"added": {}}]	11	2
25	2019-02-12 01:38:40.717377+05:30	TCH0007	TCH0007;57;2019-02-12 01:38:40.717308;TIMEZONE PROBLEM	1	[{"added": {}}]	11	2
26	2019-02-12 01:39:31.925006+05:30	TCH004	TCH004;4214;2019-02-12 01:05:13;check	3		11	2
27	2019-02-12 01:39:31.944777+05:30	TCH0007	TCH0007;57;2019-02-12 01:38:40.716994;TIMEZONE PROBLEM	3		11	2
28	2019-02-12 01:39:31.96115+05:30	TCH0005	TCH0005;12734;2019-02-12 01:16:49;Why	3		11	2
29	2019-02-12 01:39:31.977958+05:30	T00004	T00004;217;2019-02-12 01:15:20;Check Again	3		11	2
30	2019-02-12 01:39:32.053168+05:30	T00003	T00003;10021;2019-02-12 00:56:25;Hello NEw Migrations	3		11	2
31	2019-02-12 01:39:32.070099+05:30	T00002	T00002;1;2019-02-12 00:50:35.489224;xz	3		11	2
32	2019-02-12 01:39:32.086528+05:30	T00001	T00001;10000;2019-02-12 00:49:21.825412;Good Quality	3		11	2
33	2019-02-12 01:39:32.103396+05:30	sad	sad;412;2019-02-12 01:24:21.184419;saddas	3		11	2
34	2019-02-12 01:39:32.120004+05:30	HI Again	HI Again;2141;2019-02-12 01:24:48.992302;Time Error Check	3		11	2
35	2019-02-12 01:39:32.136432+05:30	FINAL	FINAL;124;2019-02-12 01:30:52.085322;Correct	3		11	2
36	2019-02-12 01:39:44.055021+05:30	T00001	T00001;124;2019-02-12 01:39:44.054610;TIMEZONE PROBLEM	1	[{"added": {}}]	11	2
37	2019-02-12 01:40:11.934638+05:30	T00002	T00002;412;2019-02-12 01:40:11.934205;FINAL CHECK	1	[{"added": {}}]	11	2
38	2019-02-12 01:43:06.126672+05:30	C0001	C0001;Google;Google1213;google@gmail.com;Technical;300;Bhopal	1	[{"added": {}}]	10	2
39	2019-02-12 01:43:34.19381+05:30	P0001	P0001;Laptops;40000	1	[{"added": {}}]	9	2
40	2019-02-12 01:43:52.614622+05:30	1	C0001;Google;Google1213;google@gmail.com;Technical;300;Bhopal;P0001;Laptops;40000;T00002;412;2019-02-12 01:40:11.934205;FINAL CHECK;4	1	[{"added": {}}]	12	2
41	2019-02-16 22:15:30.936038+05:30	TCH077	TCH077;Mohinish Nandwana;Male;moz@gmail.com;Mohinish123;Coder;2930284379;1;abc;2;pqr	1	[{"added": {}}]	7	2
42	2019-02-16 22:16:46.769432+05:30	TCH077	TCH077;Mohinish Nandwana;Male;moz@gmail.com;Mohinish123;Coder;2930284379;1;abc;2;pqr	3		7	2
43	2019-02-16 22:16:46.977786+05:30	TCH001	TCH001;Akshat Trivedi;Akshat Trivedi;akshat.trivedi08@gmail.com;Trivedi7;Coder;7000079368;4;blahbalh;2;lollol	3		7	2
44	2019-02-17 17:44:07.324837+05:30	P0002	P0002;CPU;2000	1	[{"added": {}}]	9	2
45	2019-02-17 17:44:23.453187+05:30	P0003	P0003;Mouse;200	1	[{"added": {}}]	9	2
46	2019-02-17 17:44:40.838676+05:30	Keyboard	Keyboard;RAM;2000	1	[{"added": {}}]	9	2
47	2019-02-17 17:45:11.947241+05:30	P0004	P0004;Hard Disk;4000	1	[{"added": {}}]	9	2
48	2019-02-17 17:45:29.106085+05:30	P0005	P0005;Floppy;400	1	[{"added": {}}]	9	2
49	2019-02-17 17:45:44.374619+05:30	P0006	P0006;USB;1000	1	[{"added": {}}]	9	2
50	2019-02-17 17:46:34.980378+05:30	P00007	P00007;Monitor;4000	1	[{"added": {}}]	9	2
51	2019-02-17 17:47:15.461242+05:30	P0007	P0007;Monitor;4000	2	[{"changed": {"fields": ["pId"]}}]	9	2
52	2019-02-17 17:47:36.244509+05:30	P00007	P00007;Monitor;4000	3		9	2
53	2019-02-17 17:47:36.273933+05:30	Keyboard	Keyboard;RAM;2000	3		9	2
54	2019-02-17 17:48:26.546707+05:30	C0002	C0002;Microsoft;Microsoft123;microsoft@gmail.com;Technical;20;Bangalore	1	[{"added": {}}]	10	2
55	2019-02-17 17:49:23.478927+05:30	C0003	C0003;Oracle;Oracle123;oracle@gmail.com;Marketing;40;Pune	1	[{"added": {}}]	10	2
56	2019-02-17 17:57:35.439353+05:30	2	C0002;Microsoft;Microsoft123;microsoft@gmail.com;Technical;20;Bangalore;P0001;Laptops;40000;T00002;412;2019-02-12 01:40:11.934205;FINAL CHECK;10	1	[{"added": {}}]	12	2
57	2019-02-17 17:57:53.948069+05:30	3	C0002;Microsoft;Microsoft123;microsoft@gmail.com;Technical;20;Bangalore;P0002;CPU;2000;T00002;412;2019-02-12 01:40:11.934205;FINAL CHECK;20	1	[{"added": {}}]	12	2
58	2019-02-17 17:59:12.06847+05:30	T00005	T00005;20000;2019-02-17 17:59:12.068107;Good sales	1	[{"added": {}}]	11	2
59	2019-02-18 00:24:18.289501+05:30	4	C0003;Oracle;Oracle123;oracle@gmail.com;Marketing;40;Pune;P0005;Floppy;400;T00005;20000;2019-02-17 17:59:12.068107;Good sales;70	1	[{"added": {}}]	12	2
60	2019-02-18 00:24:47.120078+05:30	5	C0003;Oracle;Oracle123;oracle@gmail.com;Marketing;40;Pune;P0007;Monitor;4000;T00001;124;2019-02-12 01:39:44.054610;TIMEZONE PROBLEM;2	1	[{"added": {}}]	12	2
61	2019-02-18 00:25:02.937396+05:30	6	C0003;Oracle;Oracle123;oracle@gmail.com;Marketing;40;Pune;P0006;USB;1000;T00005;20000;2019-02-17 17:59:12.068107;Good sales;3	1	[{"added": {}}]	12	2
62	2019-02-18 00:26:38.338327+05:30	7	C0003;Oracle;Oracle123;oracle@gmail.com;Marketing;40;Pune;P0006;USB;1000;T00005;20000;2019-02-17 17:59:12.068107;Good sales;70	1	[{"added": {}}]	12	2
63	2019-03-03 04:39:49.456688+05:30	5	C0003;Oracle;Oracle123;oracle@gmail.com;Marketing;40;Pune;P0007;Monitor;4000;T00001;124;2019-02-12 01:39:44.054610;TIMEZONE PROBLEM;2	3		12	2
64	2019-03-03 04:40:26.457151+05:30	1	C0001;Google;Google1213;google@gmail.com;Technical;300;Bhopal;P0010;Motherboard;20000;T00001;124;2019-02-12 01:39:44.054610;TIMEZONE PROBLEM;4	2	[{"changed": {"fields": ["pId", "tId"]}}]	12	2
65	2019-03-03 04:40:41.846742+05:30	1	C0001;Google;Google1213;google@gmail.com;Technical;300;Bhopal;P0010;Motherboard;20000;T00001;124;2019-02-12 01:39:44.054610;TIMEZONE PROBLEM;4	2	[]	12	2
66	2019-03-03 04:40:57.363699+05:30	8	C0001;Google;Google1213;google@gmail.com;Technical;300;Bhopal;P0006;USB;1000;T00001;124;2019-02-12 01:39:44.054610;TIMEZONE PROBLEM;8	1	[{"added": {}}]	12	2
67	2019-03-03 04:41:17.612464+05:30	9	C0001;Google;Google1213;google@gmail.com;Technical;300;Bhopal;P0004;Hard Disk;4000;T00001;124;2019-02-12 01:39:44.054610;TIMEZONE PROBLEM;23	1	[{"added": {}}]	12	2
68	2019-03-03 06:26:52.021304+05:30	T00004	T00004;25000;2019-03-03 06:26:52.019481;New Google Transaction	1	[{"added": {}}]	11	2
69	2019-03-03 06:35:51.505015+05:30	10	C0001;Google;Google1213;google@gmail.com;Technical;300;Bhopal;P0010;Motherboard;20000;T00004;25000;2019-03-03 06:26:52.019481;New Google Transaction;1	1	[{"added": {}}]	12	2
70	2019-03-03 06:36:13.875469+05:30	11	C0001;Google;Google1213;google@gmail.com;Technical;300;Bhopal;P0006;USB;1000;T00004;25000;2019-03-03 06:26:52.019481;New Google Transaction;5	1	[{"added": {}}]	12	2
71	2019-03-03 17:21:25.882808+05:30	T00003	T00003;10000;2019-03-03 17:21:25.882207;Impressive	1	[{"added": {}}]	11	2
72	2019-03-03 17:22:03.970955+05:30	12	C0004;Onco;DkNqbUscqEiIaXRFYkn4S4w1RhOHmufTPqAzij5cKzY=;onco.com;Web Development;79;Salarpuria Satva, Koramangala, Bangalore;P0006;USB;1000;T00003;10000;2019-03-03 17:21:25.882207;Impressive;3	1	[{"added": {}}]	12	2
73	2019-03-03 17:22:25.093611+05:30	13	C0004;Onco;DkNqbUscqEiIaXRFYkn4S4w1RhOHmufTPqAzij5cKzY=;onco.com;Web Development;79;Salarpuria Satva, Koramangala, Bangalore;P0002;CPU;2000;T00003;10000;2019-03-03 17:21:25.882207;Impressive;1	1	[{"added": {}}]	12	2
74	2019-03-03 17:24:18.4858+05:30	T00007	T00007;1000;2019-03-03 17:24:18.485362;Easy To buy	1	[{"added": {}}]	11	2
75	2019-03-03 17:25:28.31808+05:30	14	C0001;Google;Google1213;google@gmail.com;Technical;300;Bhopal;P0003;Mouse;200;T00007;1000;2019-03-03 17:24:18.485362;Easy To buy;5	1	[{"added": {}}]	12	2
76	2019-03-03 17:27:06.58556+05:30	T00008	T00008;2000;2019-03-03 17:27:06.585251;Good Work	1	[{"added": {}}]	11	2
77	2019-03-03 17:27:48.984966+05:30	15	C0002;Microsoft;Microsoft123;microsoft@gmail.com;Technical;20;Bangalore;P0003;Mouse;200;T00008;2000;2019-03-03 17:27:06.585251;Good Work;5	1	[{"added": {}}]	12	2
78	2019-03-03 17:28:16.291528+05:30	16	C0002;Microsoft;Microsoft123;microsoft@gmail.com;Technical;20;Bangalore;P0006;USB;1000;T00008;2000;2019-03-03 17:27:06.585251;Good Work;1	1	[{"added": {}}]	12	2
79	2019-03-03 18:12:24.428105+05:30	P0001	P0001;Laptop;40000	2	[{"changed": {"fields": ["pName"]}}]	9	2
80	2019-03-03 18:16:31.182237+05:30	7	C0003;Oracle;Oracle123;oracle@gmail.com;Marketing;40;Pune;P0006;USB;1000;T00005;20000;2019-02-17 17:59:12.068107;Good sales;70	3		12	2
81	2019-03-03 18:21:26.681381+05:30	C0004	C0004;Onco;DkNqbUscqEiIaXRFYkn4S4w1RhOHmufTPqAzij5cKzY=;nam@onco.com;Technical;79;Salarpuria Satva, Koramangala, Bangalore	2	[{"changed": {"fields": ["cEmail", "cType"]}}]	10	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	app1	employee
8	app1	temp
9	app1	products
10	app1	company
11	app1	transactions
12	app1	tcp
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-02-10 02:04:25.304295+05:30
2	auth	0001_initial	2019-02-10 02:04:26.466084+05:30
3	admin	0001_initial	2019-02-10 02:04:26.791415+05:30
4	admin	0002_logentry_remove_auto_add	2019-02-10 02:04:26.828133+05:30
5	admin	0003_logentry_add_action_flag_choices	2019-02-10 02:04:26.870661+05:30
6	app1	0001_initial	2019-02-10 02:04:26.958106+05:30
7	app1	0002_auto_20190205_0853	2019-02-10 02:04:27.05051+05:30
8	app1	0003_auto_20190208_1920	2019-02-10 02:04:27.099753+05:30
9	app1	0004_auto_20190208_1932	2019-02-10 02:04:27.18361+05:30
10	app1	0005_auto_20190208_1932	2019-02-10 02:04:27.204556+05:30
11	app1	0006_temp	2019-02-10 02:04:27.291714+05:30
12	app1	0007_auto_20190209_0719	2019-02-10 02:04:27.313262+05:30
13	app1	0008_auto_20190209_1517	2019-02-10 02:04:27.459358+05:30
14	contenttypes	0002_remove_content_type_name	2019-02-10 02:04:27.532186+05:30
15	auth	0002_alter_permission_name_max_length	2019-02-10 02:04:27.565994+05:30
16	auth	0003_alter_user_email_max_length	2019-02-10 02:04:27.617057+05:30
17	auth	0004_alter_user_username_opts	2019-02-10 02:04:27.654571+05:30
18	auth	0005_alter_user_last_login_null	2019-02-10 02:04:27.707981+05:30
19	auth	0006_require_contenttypes_0002	2019-02-10 02:04:27.725362+05:30
20	auth	0007_alter_validators_add_error_messages	2019-02-10 02:04:27.765894+05:30
21	auth	0008_alter_user_username_max_length	2019-02-10 02:04:27.875569+05:30
22	auth	0009_alter_user_last_name_max_length	2019-02-10 02:04:27.925334+05:30
23	sessions	0001_initial	2019-02-10 02:04:28.150894+05:30
24	app1	0009_company_products_transactions	2019-02-11 20:22:29.789873+05:30
25	app1	0010_auto_20190211_1513	2019-02-11 20:43:23.744317+05:30
26	app1	0011_auto_20190211_1536	2019-02-11 21:06:38.588469+05:30
27	app1	0009_auto_20190211_1853	2019-02-12 00:27:49.686606+05:30
28	app1	0010_auto_20190212_0055	2019-02-12 00:55:42.009021+05:30
29	app1	0011_auto_20190212_0104	2019-02-12 01:04:23.91692+05:30
30	app1	0012_auto_20190212_0116	2019-02-12 01:16:24.141323+05:30
31	app1	0013_auto_20190212_0121	2019-02-12 01:21:14.271677+05:30
32	app1	0014_auto_20190212_0122	2019-02-12 01:22:06.225505+05:30
33	app1	0015_auto_20190212_0124	2019-02-12 01:24:09.534124+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
6i3k0kpapd1kgx5bed4cl08e2vcdm6bx	MTVlNzIwNWZlOTFjYTg2ODY0OTNkOTQwNzY2MDMyOGY2MDk1MzhjZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyM2FmODY3ODdmOTljZTVhMmYxNTFjY2YxMWE1YjU1ODBhNTIxMGZiIn0=	2019-02-26 00:50:11.203347+05:30
qoyo1w0u0c9lcxtaui9stcyr1edg14xt	MTVlNzIwNWZlOTFjYTg2ODY0OTNkOTQwNzY2MDMyOGY2MDk1MzhjZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyM2FmODY3ODdmOTljZTVhMmYxNTFjY2YxMWE1YjU1ODBhNTIxMGZiIn0=	2019-03-17 04:37:30.889234+05:30
\.


--
-- Name: app1_tcp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app1_tcp_id_seq', 16, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 81, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 33, true);


--
-- Name: app1_company app1_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app1_company
    ADD CONSTRAINT app1_company_pkey PRIMARY KEY ("cId");


--
-- Name: app1_employee app1_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app1_employee
    ADD CONSTRAINT app1_employee_pkey PRIMARY KEY (emp_id);


--
-- Name: app1_products app1_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app1_products
    ADD CONSTRAINT app1_products_pkey PRIMARY KEY ("pId");


--
-- Name: app1_tcp app1_tcp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app1_tcp
    ADD CONSTRAINT app1_tcp_pkey PRIMARY KEY (id);


--
-- Name: app1_temp app1_temp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app1_temp
    ADD CONSTRAINT app1_temp_pkey PRIMARY KEY (temp_id);


--
-- Name: app1_transactions app1_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app1_transactions
    ADD CONSTRAINT app1_transactions_pkey PRIMARY KEY ("tId");


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: app1_company_cId_da5455d4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "app1_company_cId_da5455d4_like" ON public.app1_company USING btree ("cId" varchar_pattern_ops);


--
-- Name: app1_products_pId_d40ef420_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "app1_products_pId_d40ef420_like" ON public.app1_products USING btree ("pId" varchar_pattern_ops);


--
-- Name: app1_tcp_cId_90336395; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "app1_tcp_cId_90336395" ON public.app1_tcp USING btree ("cId");


--
-- Name: app1_tcp_cId_90336395_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "app1_tcp_cId_90336395_like" ON public.app1_tcp USING btree ("cId" varchar_pattern_ops);


--
-- Name: app1_tcp_pId_abadf620; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "app1_tcp_pId_abadf620" ON public.app1_tcp USING btree ("pId");


--
-- Name: app1_tcp_pId_abadf620_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "app1_tcp_pId_abadf620_like" ON public.app1_tcp USING btree ("pId" varchar_pattern_ops);


--
-- Name: app1_tcp_tId_aa4a74dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "app1_tcp_tId_aa4a74dc" ON public.app1_tcp USING btree ("tId");


--
-- Name: app1_tcp_tId_aa4a74dc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "app1_tcp_tId_aa4a74dc_like" ON public.app1_tcp USING btree ("tId" varchar_pattern_ops);


--
-- Name: app1_transactions_tId_6eedca27_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "app1_transactions_tId_6eedca27_like" ON public.app1_transactions USING btree ("tId" varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: app1_tcp app1_tcp_cId_90336395_fk_app1_company_cId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app1_tcp
    ADD CONSTRAINT "app1_tcp_cId_90336395_fk_app1_company_cId" FOREIGN KEY ("cId") REFERENCES public.app1_company("cId") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app1_tcp app1_tcp_pId_abadf620_fk_app1_products_pId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app1_tcp
    ADD CONSTRAINT "app1_tcp_pId_abadf620_fk_app1_products_pId" FOREIGN KEY ("pId") REFERENCES public.app1_products("pId") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app1_tcp app1_tcp_tId_aa4a74dc_fk_app1_transactions_tId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app1_tcp
    ADD CONSTRAINT "app1_tcp_tId_aa4a74dc_fk_app1_transactions_tId" FOREIGN KEY ("tId") REFERENCES public.app1_transactions("tId") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

