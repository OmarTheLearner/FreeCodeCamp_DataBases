--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: civilization; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.civilization (
    civilization_id integer NOT NULL,
    planet_id integer NOT NULL,
    population integer,
    civilization_level integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.civilization OWNER TO freecodecamp;

--
-- Name: civilization_civil_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.civilization_civil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.civilization_civil_id_seq OWNER TO freecodecamp;

--
-- Name: civilization_civil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.civilization_civil_id_seq OWNED BY public.civilization.civilization_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_million_years numeric(10,4),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_is_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_is_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_is_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_is_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_is_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_million_years numeric(10,4),
    description text,
    has_life boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_is_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_is_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_is_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_is_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_is_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_million_years numeric(10,4),
    description text,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_is_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_is_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_is_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_is_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_is_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_million_years numeric(10,4),
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_is_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_is_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_is_seq OWNER TO freecodecamp;

--
-- Name: star_star_is_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_is_seq OWNED BY public.star.star_id;


--
-- Name: civilization civilization_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization ALTER COLUMN civilization_id SET DEFAULT nextval('public.civilization_civil_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_is_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_is_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_is_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_is_seq'::regclass);


--
-- Data for Name: civilization; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.civilization VALUES (1, 1, 20000, 2, NULL);
INSERT INTO public.civilization VALUES (2, 2, 203333, 3, NULL);
INSERT INTO public.civilization VALUES (3, 4, 2000, 4, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Anciant Galaxy', 1000, 100000.0000, 'First Galaxy to bear Civilization and have life, but also gave birth to the most terifying civilization.');
INSERT INTO public.galaxy VALUES (2, 'The Young GALAXY', 1, 10.0000, 'Live only came to be in the last 1000 years rapidly evolved due to oustside interferance');
INSERT INTO public.galaxy VALUES (3, 'AK-1', 10, 1000.0000, 'Life is almost wiped out due to tyranids invasion');
INSERT INTO public.galaxy VALUES (4, 'The Mmilky Way', 100, NULL, 'Conquered in its fullest by human relentless will');
INSERT INTO public.galaxy VALUES (9, 'The Hell Domaine', 2000, 200000.0000, 'Origin of Xenos Gods and terror and evil factions.');
INSERT INTO public.galaxy VALUES (10, 'The Uknown galaxy', 42000, 40000.0000, 'Nothing is known about this galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'A', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'B', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (3, 'C', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (4, 'D', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (5, 'E', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'F', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (7, 'G', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (8, 'I', NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (9, 'J', NULL, NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (10, 'K', NULL, NULL, NULL, NULL, 10);
INSERT INTO public.moon VALUES (11, 'L', NULL, NULL, NULL, NULL, 11);
INSERT INTO public.moon VALUES (12, 'M', NULL, NULL, NULL, NULL, 12);
INSERT INTO public.moon VALUES (13, 'N', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.moon VALUES (14, 'FF', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES (15, 'FFGS', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (16, 'AA', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (17, 'AAVD', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (18, 'GGD', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (19, 'BB', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (20, 'BBCD', NULL, NULL, NULL, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'A', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'B', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (3, 'C', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (4, 'D', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (5, 'E', NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (6, 'F', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (7, 'G', NULL, NULL, NULL, NULL, 7);
INSERT INTO public.planet VALUES (8, 'I', NULL, NULL, NULL, NULL, 8);
INSERT INTO public.planet VALUES (9, 'J', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'K', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'L', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (12, 'R', NULL, NULL, NULL, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Earth', NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (2, 'Tomb World', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Tau  Sacred Plane', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (4, 'Arcetri', NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (5, 'Mars', NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (6, 'Eye of terror', NULL, NULL, NULL, 9);
INSERT INTO public.star VALUES (7, 'Jupyter', NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (8, 'Venus', NULL, NULL, NULL, 4);


--
-- Name: civilization_civil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.civilization_civil_id_seq', 3, true);


--
-- Name: galaxy_galaxy_is_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_is_seq', 10, true);


--
-- Name: moon_moon_is_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_is_seq', 20, true);


--
-- Name: planet_planet_is_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_is_seq', 12, true);


--
-- Name: star_star_is_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_is_seq', 8, true);


--
-- Name: civilization civilization_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_pkey PRIMARY KEY (civilization_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_distance_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_distance_galaxy UNIQUE (distance_from_earth_million_years);


--
-- Name: moon unique_distance_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_distance_moon UNIQUE (distance_from_earth_million_years);


--
-- Name: planet unique_distance_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_distance_planet UNIQUE (distance_from_earth_million_years);


--
-- Name: star unique_distance_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_distance_star UNIQUE (distance_from_earth_million_years);


--
-- Name: civilization unique_population; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT unique_population UNIQUE (population);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: civilization fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

