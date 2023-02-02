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
-- Name: alt_universes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.alt_universes (
    name character varying(45) NOT NULL,
    alt_universes_id integer NOT NULL,
    universe_type text,
    defining_attribute character varying(45),
    has_ironman boolean
);


ALTER TABLE public.alt_universes OWNER TO freecodecamp;

--
-- Name: alternate_universes_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.alternate_universes_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alternate_universes_universe_id_seq OWNER TO freecodecamp;

--
-- Name: alternate_universes_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.alternate_universes_universe_id_seq OWNED BY public.alt_universes.alt_universes_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    galaxy_type character varying(45),
    supports_life boolean,
    num_of_guardians integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(45),
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    nickname character varying(45),
    radius_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(45),
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    number_of_moons integer,
    radius_in_km numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(45) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer,
    distance_from_earth character varying(45),
    stellar_class character varying(45)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: alt_universes alt_universes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alt_universes ALTER COLUMN alt_universes_id SET DEFAULT nextval('public.alternate_universes_universe_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: alt_universes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.alt_universes VALUES ('DC', 1, 'Comic', 'Superman', false);
INSERT INTO public.alt_universes VALUES ('Marvel', 2, 'Comic', 'cinematography', true);
INSERT INTO public.alt_universes VALUES ('Mideaval', 3, 'Realistic', 'dragons', false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('milky way', 1, NULL, true, NULL);
INSERT INTO public.galaxy VALUES ('canis major', 2, NULL, false, NULL);
INSERT INTO public.galaxy VALUES ('SagDEG', 3, 'Dwarf', false, NULL);
INSERT INTO public.galaxy VALUES ('SMC', 4, NULL, false, NULL);
INSERT INTO public.galaxy VALUES ('LMC', 5, NULL, false, NULL);
INSERT INTO public.galaxy VALUES ('The Canis Major Dwarf', 6, NULL, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 1, NULL, NULL);
INSERT INTO public.moon VALUES ('Phobos', 2, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Deimos', 3, 4, NULL, NULL);
INSERT INTO public.moon VALUES ('Europa', 4, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Ganymede', 5, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Io', 6, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Callisto', 7, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Amalthea', 8, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Valetudo', 9, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Ersa', 10, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Adrastea', 11, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Carpo', 12, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Thebe', 13, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Himalia', 14, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Elara', 15, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Callirrhoe', 16, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Carme', 17, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Ananke', 18, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Eurydome', 19, 5, NULL, NULL);
INSERT INTO public.moon VALUES ('Dia', 20, 5, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('SWEEPS-11', 11, 3, NULL, NULL);
INSERT INTO public.planet VALUES ('SWEEPS-04', 12, 3, NULL, NULL);
INSERT INTO public.planet VALUES ('Promethea', 13, 6, NULL, NULL);
INSERT INTO public.planet VALUES ('Ganandorf', 14, 4, NULL, NULL);
INSERT INTO public.planet VALUES ('Earth', 1, 1, 1, 6371);
INSERT INTO public.planet VALUES ('Mercury', 2, 1, 0, 2440);
INSERT INTO public.planet VALUES ('Venus', 3, 1, 0, 6052);
INSERT INTO public.planet VALUES ('Mars', 4, 1, 2, 3390);
INSERT INTO public.planet VALUES ('Jupiter', 5, 1, 80, 69911);
INSERT INTO public.planet VALUES ('Saturn', 6, 1, 83, 58232);
INSERT INTO public.planet VALUES ('Uranus', 7, 1, 27, 25362);
INSERT INTO public.planet VALUES ('Neptune', 8, 1, 14, 24622);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sirius', 4, 1, '8.6 light years', 'a CMa');
INSERT INTO public.star VALUES ('The Sun', 1, 1, '8.3 light min', 'G2V');
INSERT INTO public.star VALUES ('Proximus Centauri', 3, 1, '4.2465 light years', 'M5.5Ve');
INSERT INTO public.star VALUES ('Toliman', 6, 1, '4.3441 light years', 'K1V');
INSERT INTO public.star VALUES ('Rigil Kentaurus', 5, 1, '4.3441 light years', 'G2V');
INSERT INTO public.star VALUES ('Barnards Star', 7, 1, '5.9629 light years', 'M4.0Ve');


--
-- Name: alternate_universes_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.alternate_universes_universe_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: alt_universes alternate_universes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alt_universes
    ADD CONSTRAINT alternate_universes_pkey PRIMARY KEY (alt_universes_id);


--
-- Name: alt_universes alternate_universes_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alt_universes
    ADD CONSTRAINT alternate_universes_unq UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unq UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unq UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unq UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

