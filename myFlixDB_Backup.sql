--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2022-11-20 23:56:59 CET

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
-- TOC entry 217 (class 1259 OID 16688)
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    directorid integer NOT NULL,
    name character varying(50) NOT NULL,
    bio character varying(1000),
    birthyear date,
    deathyear date
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16687)
-- Name: directors_directorid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_directorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_directorid_seq OWNER TO postgres;

--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 216
-- Name: directors_directorid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_directorid_seq OWNED BY public.directors.directorid;


--
-- TOC entry 215 (class 1259 OID 16679)
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    genreid bigint NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(1000)
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16678)
-- Name: genres_genreid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_genreid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_genreid_seq OWNER TO postgres;

--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 214
-- Name: genres_genreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_genreid_seq OWNED BY public.genres.genreid;


--
-- TOC entry 219 (class 1259 OID 16700)
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    movieid integer NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(1000),
    directorid integer NOT NULL,
    genreid integer NOT NULL,
    imageurl character varying(300),
    featured boolean
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16699)
-- Name: movies_movieid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_movieid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_movieid_seq OWNER TO postgres;

--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 218
-- Name: movies_movieid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_movieid_seq OWNED BY public.movies.movieid;


--
-- TOC entry 223 (class 1259 OID 16728)
-- Name: user_movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_movies (
    usermovieid integer NOT NULL,
    userid integer,
    movieid integer
);


ALTER TABLE public.user_movies OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16727)
-- Name: user_movies_usermovieid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_movies_usermovieid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_movies_usermovieid_seq OWNER TO postgres;

--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 222
-- Name: user_movies_usermovieid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_movies_usermovieid_seq OWNED BY public.user_movies.usermovieid;


--
-- TOC entry 221 (class 1259 OID 16720)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    birth_date date
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16719)
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userid_seq OWNER TO postgres;

--
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- TOC entry 3460 (class 2604 OID 16691)
-- Name: directors directorid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN directorid SET DEFAULT nextval('public.directors_directorid_seq'::regclass);


--
-- TOC entry 3459 (class 2604 OID 16682)
-- Name: genres genreid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN genreid SET DEFAULT nextval('public.genres_genreid_seq'::regclass);


--
-- TOC entry 3461 (class 2604 OID 16703)
-- Name: movies movieid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN movieid SET DEFAULT nextval('public.movies_movieid_seq'::regclass);


--
-- TOC entry 3463 (class 2604 OID 16731)
-- Name: user_movies usermovieid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_movies ALTER COLUMN usermovieid SET DEFAULT nextval('public.user_movies_usermovieid_seq'::regclass);


--
-- TOC entry 3462 (class 2604 OID 16723)
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- TOC entry 3623 (class 0 OID 16688)
-- Dependencies: 217
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directors (directorid, name, bio, birthyear, deathyear) VALUES (1, 'Jonathan Demme', 'Robert Jonathan Demme was an American director, producer, and screenwriter.', '1944-01-01', '2017-01-01');
INSERT INTO public.directors (directorid, name, bio, birthyear, deathyear) VALUES (2, 'Judd Apatow', 'Judd Apatow is an American producer, writer, director, actor and stand-up comedian.', '1967-01-01', NULL);
INSERT INTO public.directors (directorid, name, bio, birthyear, deathyear) VALUES (3, 'Jim sung', 'Jim sung is an Korean director, actor and father.', '1984-05-09', NULL);


--
-- TOC entry 3621 (class 0 OID 16679)
-- Dependencies: 215
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genres (genreid, name, description) VALUES (1, 'Thriller', 'Thriller film, also known as suspense film or suspense thriller, is a broad film genre that involves excitement and suspense in the audience.');
INSERT INTO public.genres (genreid, name, description) VALUES (2, 'Animated', 'Animation is a method in which pictures are manipulated to appear as moving images. In traditional animation, images are drawn or painted by hand on transparent celluloid sheets to be photographed and exhibited on film.');
INSERT INTO public.genres (genreid, name, description) VALUES (3, 'Comedy', 'Comedy is a genre of film in which the main emphasis is on humor. These films are designed to make the audience laugh through amusement and most often work by exaggerating characteristics for humorous effect.');


--
-- TOC entry 3625 (class 0 OID 16700)
-- Dependencies: 219
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (1, 'Silence of the Lambs', 'A young FBI cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer.', 1, 1, 'silenceofthelambs.png', true);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (2, 'Matrix', 'A young serial killer.', 3, 2, 'Matrix.png', true);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (3, 'sunflower', NULL, 1, 3, 'sunflower.png', true);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (4, 'Tokyo', NULL, 1, 3, NULL, false);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (5, 'Cairo film', NULL, 3, 2, NULL, true);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (7, 'the bug', NULL, 1, 3, NULL, false);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (8, 'help me', 'A young serial killer.', 1, 1, NULL, true);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (9, 'Mac user', NULL, 1, 3, NULL, false);
INSERT INTO public.movies (movieid, title, description, directorid, genreid, imageurl, featured) VALUES (10, 'Mega city', NULL, 3, 1, NULL, true);


--
-- TOC entry 3629 (class 0 OID 16728)
-- Dependencies: 223
-- Data for Name: user_movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_movies (usermovieid, userid, movieid) VALUES (1, 1, 3);
INSERT INTO public.user_movies (usermovieid, userid, movieid) VALUES (2, 2, 1);
INSERT INTO public.user_movies (usermovieid, userid, movieid) VALUES (3, 3, 2);


--
-- TOC entry 3627 (class 0 OID 16720)
-- Dependencies: 221
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (userid, username, password, email, birth_date) VALUES (1, 'mahfouz', 'passphrase', 'mahmoud@yahoo.com', '2007-01-01');
INSERT INTO public.users (userid, username, password, email, birth_date) VALUES (3, 'john', 'passway', 'john@yahoo.com', '2005-01-01');
INSERT INTO public.users (userid, username, password, email, birth_date) VALUES (2, 'yun', 'pass', 'mahmoudBasha@gmail.com', '2006-01-01');


--
-- TOC entry 3640 (class 0 OID 0)
-- Dependencies: 216
-- Name: directors_directorid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_directorid_seq', 3, true);


--
-- TOC entry 3641 (class 0 OID 0)
-- Dependencies: 214
-- Name: genres_genreid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_genreid_seq', 9, true);


--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 218
-- Name: movies_movieid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_movieid_seq', 10, true);


--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 222
-- Name: user_movies_usermovieid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_movies_usermovieid_seq', 3, true);


--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 3, true);


--
-- TOC entry 3467 (class 2606 OID 16695)
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (directorid);


--
-- TOC entry 3465 (class 2606 OID 16686)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genreid);


--
-- TOC entry 3469 (class 2606 OID 16707)
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movieid);


--
-- TOC entry 3473 (class 2606 OID 16733)
-- Name: user_movies user_movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_movies
    ADD CONSTRAINT user_movies_pkey PRIMARY KEY (usermovieid);


--
-- TOC entry 3471 (class 2606 OID 16725)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 3474 (class 2606 OID 16713)
-- Name: movies directorkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT directorkey FOREIGN KEY (directorid) REFERENCES public.directors(directorid);


--
-- TOC entry 3475 (class 2606 OID 16708)
-- Name: movies genrekey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT genrekey FOREIGN KEY (genreid) REFERENCES public.genres(genreid);


--
-- TOC entry 3476 (class 2606 OID 16739)
-- Name: user_movies moviekey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_movies
    ADD CONSTRAINT moviekey FOREIGN KEY (movieid) REFERENCES public.movies(movieid);


--
-- TOC entry 3477 (class 2606 OID 16734)
-- Name: user_movies userkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_movies
    ADD CONSTRAINT userkey FOREIGN KEY (userid) REFERENCES public.users(userid);


-- Completed on 2022-11-20 23:57:00 CET

--
-- PostgreSQL database dump complete
--

