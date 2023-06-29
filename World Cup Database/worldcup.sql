--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (185, 2018, 'Final', 99, 100, 4, 2);
INSERT INTO public.games VALUES (186, 2018, 'Third Place', 101, 102, 2, 0);
INSERT INTO public.games VALUES (187, 2018, 'Semi-Final', 100, 102, 2, 1);
INSERT INTO public.games VALUES (188, 2018, 'Semi-Final', 99, 101, 1, 0);
INSERT INTO public.games VALUES (189, 2018, 'Quarter-Final', 100, 103, 3, 2);
INSERT INTO public.games VALUES (190, 2018, 'Quarter-Final', 102, 104, 2, 0);
INSERT INTO public.games VALUES (191, 2018, 'Quarter-Final', 101, 105, 2, 1);
INSERT INTO public.games VALUES (192, 2018, 'Quarter-Final', 99, 106, 2, 0);
INSERT INTO public.games VALUES (193, 2018, 'Eighth-Final', 102, 107, 2, 1);
INSERT INTO public.games VALUES (194, 2018, 'Eighth-Final', 104, 108, 1, 0);
INSERT INTO public.games VALUES (195, 2018, 'Eighth-Final', 101, 109, 3, 2);
INSERT INTO public.games VALUES (196, 2018, 'Eighth-Final', 105, 110, 2, 0);
INSERT INTO public.games VALUES (197, 2018, 'Eighth-Final', 100, 111, 2, 1);
INSERT INTO public.games VALUES (198, 2018, 'Eighth-Final', 103, 112, 2, 1);
INSERT INTO public.games VALUES (199, 2018, 'Eighth-Final', 106, 113, 2, 1);
INSERT INTO public.games VALUES (200, 2018, 'Eighth-Final', 99, 114, 4, 3);
INSERT INTO public.games VALUES (201, 2014, 'Final', 115, 114, 1, 0);
INSERT INTO public.games VALUES (202, 2014, 'Third Place', 116, 105, 3, 0);
INSERT INTO public.games VALUES (203, 2014, 'Semi-Final', 114, 116, 1, 0);
INSERT INTO public.games VALUES (204, 2014, 'Semi-Final', 115, 105, 7, 1);
INSERT INTO public.games VALUES (205, 2014, 'Quarter-Final', 116, 117, 1, 0);
INSERT INTO public.games VALUES (206, 2014, 'Quarter-Final', 114, 101, 1, 0);
INSERT INTO public.games VALUES (207, 2014, 'Quarter-Final', 105, 107, 2, 1);
INSERT INTO public.games VALUES (208, 2014, 'Quarter-Final', 115, 99, 1, 0);
INSERT INTO public.games VALUES (209, 2014, 'Eighth-Final', 105, 118, 2, 1);
INSERT INTO public.games VALUES (210, 2014, 'Eighth-Final', 107, 106, 2, 0);
INSERT INTO public.games VALUES (211, 2014, 'Eighth-Final', 99, 119, 2, 0);
INSERT INTO public.games VALUES (212, 2014, 'Eighth-Final', 115, 120, 2, 1);
INSERT INTO public.games VALUES (213, 2014, 'Eighth-Final', 116, 110, 2, 1);
INSERT INTO public.games VALUES (214, 2014, 'Eighth-Final', 117, 121, 2, 1);
INSERT INTO public.games VALUES (215, 2014, 'Eighth-Final', 114, 108, 1, 0);
INSERT INTO public.games VALUES (216, 2014, 'Eighth-Final', 101, 122, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (99, 'France');
INSERT INTO public.teams VALUES (100, 'Croatia');
INSERT INTO public.teams VALUES (101, 'Belgium');
INSERT INTO public.teams VALUES (102, 'England');
INSERT INTO public.teams VALUES (103, 'Russia');
INSERT INTO public.teams VALUES (104, 'Sweden');
INSERT INTO public.teams VALUES (105, 'Brazil');
INSERT INTO public.teams VALUES (106, 'Uruguay');
INSERT INTO public.teams VALUES (107, 'Colombia');
INSERT INTO public.teams VALUES (108, 'Switzerland');
INSERT INTO public.teams VALUES (109, 'Japan');
INSERT INTO public.teams VALUES (110, 'Mexico');
INSERT INTO public.teams VALUES (111, 'Denmark');
INSERT INTO public.teams VALUES (112, 'Spain');
INSERT INTO public.teams VALUES (113, 'Portugal');
INSERT INTO public.teams VALUES (114, 'Argentina');
INSERT INTO public.teams VALUES (115, 'Germany');
INSERT INTO public.teams VALUES (116, 'Netherlands');
INSERT INTO public.teams VALUES (117, 'Costa Rica');
INSERT INTO public.teams VALUES (118, 'Chile');
INSERT INTO public.teams VALUES (119, 'Nigeria');
INSERT INTO public.teams VALUES (120, 'Algeria');
INSERT INTO public.teams VALUES (121, 'Greece');
INSERT INTO public.teams VALUES (122, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 216, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 122, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

