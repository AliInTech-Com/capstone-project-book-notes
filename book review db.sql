--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2024-07-04 15:43:59

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
-- TOC entry 215 (class 1259 OID 24655)
-- Name: notes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    read_date date,
    book_review text,
    book_name character varying(500),
    isbn_no character varying(15),
    rating double precision
);


ALTER TABLE public.notes OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24654)
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO postgres;

--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 214
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- TOC entry 3173 (class 2604 OID 24658)
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- TOC entry 3319 (class 0 OID 24655)
-- Dependencies: 215
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notes (id, read_date, book_review, book_name, isbn_no, rating) FROM stdin;
3	2024-06-14	The concept of "7 Habits of Highly Active People" can be inspired by Stephen Covey's "7 Habits of Highly Effective People," but tailored to focus on physical activity and a healthy lifestyle. Here are seven habits that highly active people often embody:\r\n\r\nSet Clear Goals:\r\n\r\nThey establish specific, measurable, achievable, relevant, and time-bound (SMART) fitness goals.\r\nExamples include running a certain distance, lifting a particular weight, or attending a set number of workout classes each week.\r\nPlan and Prioritize:\r\n\r\nThey create a workout schedule and stick to it, prioritizing their fitness routine as they would any important task.\r\nPlanning meals and rest days is also part of their routine to ensure a balanced lifestyle.\r\nStay Consistent:\r\n\r\nConsistency is key. They exercise regularly, even if it's just a short workout on busy days.\r\nThey understand that small, consistent efforts over time yield significant results.\r\nFind Activities They Enjoy:\r\n\r\nThey engage in physical activities they love, making exercise enjoyable rather than a chore.\r\nWhether it's running, dancing, swimming, or hiking, they find what works for them and stick to it.\r\nMix It Up:\r\n\r\nThey incorporate variety into their workouts to keep things interesting and to challenge different muscle groups.\r\nThis could include mixing cardio, strength training, flexibility exercises, and different sports or activities.\r\nListen to Their Body:\r\n\r\nThey pay attention to their body's signals, avoiding overtraining and allowing for proper rest and recovery.\r\nThey understand the importance of sleep, nutrition, and hydration in supporting their active lifestyle.\r\nStay Motivated and Positive:\r\n\r\nThey maintain a positive mindset and stay motivated by tracking their progress, celebrating small victories, and staying connected with a community of like-minded individuals.\r\nSetting new challenges and varying routines keeps them engaged and excited about their fitness journey.\r\nAdopting these habits can help individuals lead a more active and healthy lifestyle, fostering both physical and mental well-being.	7 Habits 123 of Highly Active People	9780743269513	4.5
5	2024-06-07	"The Power of Now" encourages readers to awaken to their true nature by transcending the limitations of the mind and ego. By living fully in the present moment and embracing the power of now, individuals can experience profound peace, joy, and spiritual enlightenment. The book is filled with practical exercises and insights to help readers integrate these teachings into their daily lives.	The Power of Now: A Guide to Spiritual Enlightenment	9781577314806	4.2
\.


--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 214
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notes_id_seq', 10, true);


--
-- TOC entry 3175 (class 2606 OID 24662)
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


-- Completed on 2024-07-04 15:43:59

--
-- PostgreSQL database dump complete
--

