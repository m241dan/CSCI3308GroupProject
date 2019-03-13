--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

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
-- Name: achievement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.achievement (
    achievement_id integer NOT NULL,
    achievement_name character varying(128) NOT NULL,
    points smallint NOT NULL,
    description character varying(128) NOT NULL
);


ALTER TABLE public.achievement OWNER TO postgres;

--
-- Name: achievement_achievement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.achievement_achievement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.achievement_achievement_id_seq OWNER TO postgres;

--
-- Name: achievement_achievement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.achievement_achievement_id_seq OWNED BY public.achievement.achievement_id;


--
-- Name: enjoyer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enjoyer (
    user_id integer NOT NULL,
    first_name character varying(128),
    last_name character varying(128),
    user_name character varying(128) NOT NULL,
    email character varying(128)
);


ALTER TABLE public.enjoyer OWNER TO postgres;

--
-- Name: enjoyer_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enjoyer_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enjoyer_user_id_seq OWNER TO postgres;

--
-- Name: enjoyer_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enjoyer_user_id_seq OWNED BY public.enjoyer.user_id;


--
-- Name: enjoyerachievement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enjoyerachievement (
    achievement_id integer NOT NULL,
    user_id integer NOT NULL,
    achieved_date date NOT NULL
);


ALTER TABLE public.enjoyerachievement OWNER TO postgres;

--
-- Name: enjoyerachievement_achievement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enjoyerachievement_achievement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enjoyerachievement_achievement_id_seq OWNER TO postgres;

--
-- Name: enjoyerachievement_achievement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enjoyerachievement_achievement_id_seq OWNED BY public.enjoyerachievement.achievement_id;


--
-- Name: enjoyerachievement_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enjoyerachievement_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enjoyerachievement_user_id_seq OWNER TO postgres;

--
-- Name: enjoyerachievement_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enjoyerachievement_user_id_seq OWNED BY public.enjoyerachievement.user_id;


--
-- Name: exercise; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercise (
    exercise_id integer NOT NULL,
    exercise_name character varying(128) NOT NULL,
    reps smallint,
    sets smallint,
    weight smallint,
    distance real
);


ALTER TABLE public.exercise OWNER TO postgres;

--
-- Name: exercise_exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exercise_exercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercise_exercise_id_seq OWNER TO postgres;

--
-- Name: exercise_exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exercise_exercise_id_seq OWNED BY public.exercise.exercise_id;


--
-- Name: exerciseactual; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exerciseactual (
    workout_actual_id integer NOT NULL,
    user_id integer NOT NULL,
    workout_date date NOT NULL,
    exercise_id integer NOT NULL
);


ALTER TABLE public.exerciseactual OWNER TO postgres;

--
-- Name: exerciseactual_exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exerciseactual_exercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exerciseactual_exercise_id_seq OWNER TO postgres;

--
-- Name: exerciseactual_exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exerciseactual_exercise_id_seq OWNED BY public.exerciseactual.exercise_id;


--
-- Name: exerciseactual_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exerciseactual_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exerciseactual_user_id_seq OWNER TO postgres;

--
-- Name: exerciseactual_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exerciseactual_user_id_seq OWNED BY public.exerciseactual.user_id;


--
-- Name: exerciseactual_workout_actual_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exerciseactual_workout_actual_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exerciseactual_workout_actual_id_seq OWNER TO postgres;

--
-- Name: exerciseactual_workout_actual_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exerciseactual_workout_actual_id_seq OWNED BY public.exerciseactual.workout_actual_id;


--
-- Name: exerciseintent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exerciseintent (
    workout_intent_id integer NOT NULL,
    user_id integer NOT NULL,
    workout_date date NOT NULL,
    exercise_id integer NOT NULL
);


ALTER TABLE public.exerciseintent OWNER TO postgres;

--
-- Name: exerciseintent_exercise_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exerciseintent_exercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exerciseintent_exercise_id_seq OWNER TO postgres;

--
-- Name: exerciseintent_exercise_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exerciseintent_exercise_id_seq OWNED BY public.exerciseintent.exercise_id;


--
-- Name: exerciseintent_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exerciseintent_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exerciseintent_user_id_seq OWNER TO postgres;

--
-- Name: exerciseintent_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exerciseintent_user_id_seq OWNED BY public.exerciseintent.user_id;


--
-- Name: exerciseintent_workout_intent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exerciseintent_workout_intent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exerciseintent_workout_intent_id_seq OWNER TO postgres;

--
-- Name: exerciseintent_workout_intent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exerciseintent_workout_intent_id_seq OWNED BY public.exerciseintent.workout_intent_id;


--
-- Name: achievement achievement_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievement ALTER COLUMN achievement_id SET DEFAULT nextval('public.achievement_achievement_id_seq'::regclass);


--
-- Name: enjoyer user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enjoyer ALTER COLUMN user_id SET DEFAULT nextval('public.enjoyer_user_id_seq'::regclass);


--
-- Name: enjoyerachievement achievement_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enjoyerachievement ALTER COLUMN achievement_id SET DEFAULT nextval('public.enjoyerachievement_achievement_id_seq'::regclass);


--
-- Name: enjoyerachievement user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enjoyerachievement ALTER COLUMN user_id SET DEFAULT nextval('public.enjoyerachievement_user_id_seq'::regclass);


--
-- Name: exercise exercise_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise ALTER COLUMN exercise_id SET DEFAULT nextval('public.exercise_exercise_id_seq'::regclass);


--
-- Name: exerciseactual workout_actual_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exerciseactual ALTER COLUMN workout_actual_id SET DEFAULT nextval('public.exerciseactual_workout_actual_id_seq'::regclass);


--
-- Name: exerciseactual user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exerciseactual ALTER COLUMN user_id SET DEFAULT nextval('public.exerciseactual_user_id_seq'::regclass);


--
-- Name: exerciseactual exercise_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exerciseactual ALTER COLUMN exercise_id SET DEFAULT nextval('public.exerciseactual_exercise_id_seq'::regclass);


--
-- Name: exerciseintent workout_intent_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exerciseintent ALTER COLUMN workout_intent_id SET DEFAULT nextval('public.exerciseintent_workout_intent_id_seq'::regclass);


--
-- Name: exerciseintent user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exerciseintent ALTER COLUMN user_id SET DEFAULT nextval('public.exerciseintent_user_id_seq'::regclass);


--
-- Name: exerciseintent exercise_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exerciseintent ALTER COLUMN exercise_id SET DEFAULT nextval('public.exerciseintent_exercise_id_seq'::regclass);


--
-- Data for Name: achievement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.achievement (achievement_id, achievement_name, points, description) FROM stdin;
1	Awesome	200	You are particularly amazing!
2	300	300	Lifted 300lbs
3	db	100	Wrote a database
\.


--
-- Data for Name: enjoyer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enjoyer (user_id, first_name, last_name, user_name, email) FROM stdin;
1	Dominic	\N	IronMan61693	\N
2	Amber	\N	IvoryDarling	\N
\.


--
-- Data for Name: enjoyerachievement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enjoyerachievement (achievement_id, user_id, achieved_date) FROM stdin;
3	1	2019-03-12
1	2	2019-03-12
2	1	2019-03-12
\.


--
-- Data for Name: exercise; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercise (exercise_id, exercise_name, reps, sets, weight, distance) FROM stdin;
1	squat	6	4	135	\N
2	squat	2	2	225	\N
3	squat	1	1	335	\N
4	deadlift	4	1	450	\N
5	deadlift	3	2	385	\N
6	bench	10	1	800	\N
7	bench	8	1	225	\N
8	run	\N	\N	\N	5.19999981
\.


--
-- Data for Name: exerciseactual; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exerciseactual (workout_actual_id, user_id, workout_date, exercise_id) FROM stdin;
1	1	2019-03-12	2
2	1	2019-03-12	1
3	1	2019-03-12	5
4	1	2019-03-12	7
\.


--
-- Data for Name: exerciseintent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exerciseintent (workout_intent_id, user_id, workout_date, exercise_id) FROM stdin;
1	1	2019-03-12	8
2	1	2019-03-12	3
3	1	2019-03-12	2
4	1	2019-03-12	4
5	1	2019-03-12	6
\.


--
-- Name: achievement_achievement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.achievement_achievement_id_seq', 3, true);


--
-- Name: enjoyer_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enjoyer_user_id_seq', 2, true);


--
-- Name: enjoyerachievement_achievement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enjoyerachievement_achievement_id_seq', 1, false);


--
-- Name: enjoyerachievement_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enjoyerachievement_user_id_seq', 1, false);


--
-- Name: exercise_exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercise_exercise_id_seq', 8, true);


--
-- Name: exerciseactual_exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exerciseactual_exercise_id_seq', 1, false);


--
-- Name: exerciseactual_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exerciseactual_user_id_seq', 1, false);


--
-- Name: exerciseactual_workout_actual_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exerciseactual_workout_actual_id_seq', 4, true);


--
-- Name: exerciseintent_exercise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exerciseintent_exercise_id_seq', 1, false);


--
-- Name: exerciseintent_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exerciseintent_user_id_seq', 1, false);


--
-- Name: exerciseintent_workout_intent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exerciseintent_workout_intent_id_seq', 5, true);


--
-- Name: achievement achievement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.achievement
    ADD CONSTRAINT achievement_pkey PRIMARY KEY (achievement_id);


--
-- Name: enjoyer enjoyer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enjoyer
    ADD CONSTRAINT enjoyer_pkey PRIMARY KEY (user_id);


--
-- Name: enjoyerachievement enjoyerachievement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enjoyerachievement
    ADD CONSTRAINT enjoyerachievement_pkey PRIMARY KEY (achievement_id, user_id);


--
-- Name: exercise exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercise
    ADD CONSTRAINT exercise_pkey PRIMARY KEY (exercise_id);


--
-- Name: exerciseactual exerciseactual_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exerciseactual
    ADD CONSTRAINT exerciseactual_pkey PRIMARY KEY (workout_actual_id);


--
-- Name: exerciseintent exerciseintent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exerciseintent
    ADD CONSTRAINT exerciseintent_pkey PRIMARY KEY (workout_intent_id);


--
-- Name: enjoyerachievement enjoyerachievement_achievement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enjoyerachievement
    ADD CONSTRAINT enjoyerachievement_achievement_id_fkey FOREIGN KEY (achievement_id) REFERENCES public.achievement(achievement_id);


--
-- Name: enjoyerachievement enjoyerachievement_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enjoyerachievement
    ADD CONSTRAINT enjoyerachievement_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.enjoyer(user_id);


--
-- Name: exerciseactual exerciseactual_exercise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exerciseactual
    ADD CONSTRAINT exerciseactual_exercise_id_fkey FOREIGN KEY (exercise_id) REFERENCES public.exercise(exercise_id);


--
-- Name: exerciseactual exerciseactual_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exerciseactual
    ADD CONSTRAINT exerciseactual_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.enjoyer(user_id);


--
-- Name: exerciseintent exerciseintent_exercise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exerciseintent
    ADD CONSTRAINT exerciseintent_exercise_id_fkey FOREIGN KEY (exercise_id) REFERENCES public.exercise(exercise_id);


--
-- Name: exerciseintent exerciseintent_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exerciseintent
    ADD CONSTRAINT exerciseintent_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.enjoyer(user_id);


--
-- PostgreSQL database dump complete
--

