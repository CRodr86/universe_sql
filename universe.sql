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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_type character varying(30),
    number_of_stars_in_billions integer
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
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    diameter_in_km numeric(8,2),
    has_atmosphere boolean
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_in_tons integer,
    radius_in_km numeric(6,2),
    has_life boolean,
    has_moons boolean,
    star_id integer
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_in_tons integer,
    galaxy_id integer,
    description text,
    age_in_millions_of_years integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 'A well-known short-period comet that appears every 75-76 years');
INSERT INTO public.comet VALUES (2, 'Comet Hale-Bopp', 'A bright comet that was visible to the naked eye in 1997');
INSERT INTO public.comet VALUES (3, 'Comet Hyakutake', 'A comet that passed close to Earth in 1996');
INSERT INTO public.comet VALUES (4, 'Comet ISON', 'A sungrazing comet that disintegrated in 2013');
INSERT INTO public.comet VALUES (5, 'Comet Lovejoy', 'A comet discovered in 2011 that survived a close approach to the Sun');
INSERT INTO public.comet VALUES (6, 'Comet PanSTARRS', 'A comet that was visible in the Northern Hemisphere in 2013');
INSERT INTO public.comet VALUES (7, 'Comet Shoemaker-Levy 9', 'A comet that broke apart and collided with Jupiter in 1994');
INSERT INTO public.comet VALUES (8, 'Comet West', 'A comet that became one of the brightest in the 20th century in 1976');
INSERT INTO public.comet VALUES (9, 'Comet McNaught', 'A bright comet visible to the naked eye in 2007');
INSERT INTO public.comet VALUES (10, 'Comet Swift–Tuttle', 'The parent body of the Perseid meteor shower, which has a 133-year orbit');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'Our galaxy', 13610, 'Spiral', 250);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest spiral galaxy to the Milky Way', 10500, 'Spiral', 100);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 'A grand-design spiral galaxy', 11700, 'Spiral', 50);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'A peculiar galaxy', 12000, 'Elliptical', 200);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 'A giant elliptical galaxy in the Virgo Cluster', 13000, 'Elliptical', 80);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'The third-largest member of the Local Group', 13000, 'Spiral', 40);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474.20, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.20, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 22.20, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 1821.60, false);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 1821.60, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 1821.60, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 1821.60, false);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 2575.00, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 2575.00, false);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 2575.00, false);
INSERT INTO public.moon VALUES (11, 'Triton', 7, 1353.00, false);
INSERT INTO public.moon VALUES (12, 'Nereid', 7, 1353.00, false);
INSERT INTO public.moon VALUES (13, 'Larissa', 8, 471.60, false);
INSERT INTO public.moon VALUES (14, 'Umbriel', 8, 471.60, false);
INSERT INTO public.moon VALUES (15, 'Titania', 8, 471.60, false);
INSERT INTO public.moon VALUES (16, 'Miranda', 8, 471.60, false);
INSERT INTO public.moon VALUES (17, 'Charon', 9, 1212.00, false);
INSERT INTO public.moon VALUES (18, 'Promixa b Moon 1', 10, NULL, false);
INSERT INTO public.moon VALUES (19, 'Kepler-452b Moon 1', 11, NULL, false);
INSERT INTO public.moon VALUES (20, 'Gliese 581 c Moon 1', 14, NULL, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 5972000, 637.00, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 641710, 338.50, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1898000, 6991.00, false, true, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 5683400, 5823.00, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 486800, 605.80, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', 330110, 243.70, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 1024100, 2462.00, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 868100, 2536.00, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 13000, 118.30, false, true, 1);
INSERT INTO public.planet VALUES (10, 'Proxima b', 3500, 700.00, false, true, 2);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 8200, 1460.00, true, true, 3);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 22000, 1221.00, false, false, 4);
INSERT INTO public.planet VALUES (13, 'PSR B1620-26 b', 23000, 1000.00, false, false, 5);
INSERT INTO public.planet VALUES (14, 'Gliese 581 c', 64000, 700.00, true, false, 6);
INSERT INTO public.planet VALUES (15, 'KELT-9b', 8700, 2080.00, false, false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1989000, 1, 'The star at the center of the Solar System', 4600);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4, 'The closest star to the Solar System', 4100);
INSERT INTO public.star VALUES (3, 'Sirius', 5, 2, 'The brightest star in the night sky', 240);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 4, 'A component of the Alpha Centauri system', 6000);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 1, 4, 'A component of the Alpha Centauri system', 6000);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 17, 2, 'A red supergiant in the constellation of Orion', 8000);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 10, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet unique_comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_comet_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

