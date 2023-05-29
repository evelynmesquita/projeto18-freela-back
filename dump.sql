--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: cidades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cidades (
    id integer NOT NULL,
    nome character varying(100) NOT NULL
);


--
-- Name: cidades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cidades_id_seq OWNED BY public.cidades.id;


--
-- Name: comodidades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comodidades (
    id integer NOT NULL,
    nome character varying(100) NOT NULL
);


--
-- Name: comodidades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comodidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comodidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comodidades_id_seq OWNED BY public.comodidades.id;


--
-- Name: companhias_aereas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.companhias_aereas (
    id integer NOT NULL,
    nome character varying(100) NOT NULL
);


--
-- Name: companhias_aereas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.companhias_aereas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companhias_aereas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.companhias_aereas_id_seq OWNED BY public.companhias_aereas.id;


--
-- Name: hoteis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hoteis (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    foto text NOT NULL,
    descricao text,
    cidade_id integer NOT NULL,
    preco_diaria numeric(10,2) NOT NULL
);


--
-- Name: hoteis_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hoteis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hoteis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hoteis_id_seq OWNED BY public.hoteis.id;


--
-- Name: hotel_comodidades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hotel_comodidades (
    hotel_id integer NOT NULL,
    comodidade_id integer NOT NULL
);


--
-- Name: passagens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.passagens (
    id integer NOT NULL,
    voo_id integer NOT NULL,
    cidade_origem_id integer NOT NULL,
    cidade_destino_id integer NOT NULL,
    horario_partida timestamp without time zone NOT NULL,
    horario_chegada timestamp without time zone NOT NULL,
    nome_passageiro character varying(100) NOT NULL,
    assento character varying(10) NOT NULL
);


--
-- Name: passagens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.passagens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: passagens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.passagens_id_seq OWNED BY public.passagens.id;


--
-- Name: voos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voos (
    id integer NOT NULL,
    companhia_aerea_id integer NOT NULL,
    cidade_origem_id integer NOT NULL,
    cidade_destino_id integer NOT NULL,
    horario_partida timestamp without time zone NOT NULL,
    horario_chegada timestamp without time zone NOT NULL,
    preco numeric(10,2) NOT NULL
);


--
-- Name: voos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: voos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voos_id_seq OWNED BY public.voos.id;


--
-- Name: cidades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cidades ALTER COLUMN id SET DEFAULT nextval('public.cidades_id_seq'::regclass);


--
-- Name: comodidades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comodidades ALTER COLUMN id SET DEFAULT nextval('public.comodidades_id_seq'::regclass);


--
-- Name: companhias_aereas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companhias_aereas ALTER COLUMN id SET DEFAULT nextval('public.companhias_aereas_id_seq'::regclass);


--
-- Name: hoteis id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hoteis ALTER COLUMN id SET DEFAULT nextval('public.hoteis_id_seq'::regclass);


--
-- Name: passagens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.passagens ALTER COLUMN id SET DEFAULT nextval('public.passagens_id_seq'::regclass);


--
-- Name: voos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voos ALTER COLUMN id SET DEFAULT nextval('public.voos_id_seq'::regclass);


--
-- Data for Name: cidades; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cidades VALUES (1, 'São Paulo');
INSERT INTO public.cidades VALUES (2, 'Rio de Janeiro');
INSERT INTO public.cidades VALUES (3, 'Belo Horizonte');


--
-- Data for Name: comodidades; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.comodidades VALUES (1, 'Wi-Fi');
INSERT INTO public.comodidades VALUES (2, 'Piscina');
INSERT INTO public.comodidades VALUES (3, 'Academia');


--
-- Data for Name: companhias_aereas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.companhias_aereas VALUES (1, 'LATAM');
INSERT INTO public.companhias_aereas VALUES (2, 'GOL');
INSERT INTO public.companhias_aereas VALUES (3, 'Azul');


--
-- Data for Name: hoteis; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hoteis VALUES (1, 'Hotel Unique', 'foto1.jpg', 'O Hotel Unique é um hotel de luxo localizado em São Paulo.', 1, 150.00);
INSERT INTO public.hoteis VALUES (2, 'Copacabana Palace', 'foto2.jpg', 'O Copacabana Palace é um famoso hotel de luxo localizado no Rio de Janeiro.', 2, 120.00);
INSERT INTO public.hoteis VALUES (3, 'Hotel Ouro Minas', 'foto3.jpg', 'O Hotel Ouro Minas é um hotel de luxo localizado em Belo Horizonte.', 3, 180.00);


--
-- Data for Name: hotel_comodidades; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.hotel_comodidades VALUES (1, 1);
INSERT INTO public.hotel_comodidades VALUES (1, 2);
INSERT INTO public.hotel_comodidades VALUES (2, 1);
INSERT INTO public.hotel_comodidades VALUES (3, 2);
INSERT INTO public.hotel_comodidades VALUES (3, 3);


--
-- Data for Name: passagens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.passagens VALUES (1, 1, 1, 2, '2023-05-25 10:00:00', '2023-05-25 12:00:00', 'João Silva', 'A12');
INSERT INTO public.passagens VALUES (2, 1, 1, 2, '2023-05-25 10:00:00', '2023-05-25 12:00:00', 'Maria Silva', 'A13');


--
-- Data for Name: voos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.voos VALUES (1, 1, 1, 2, '2023-06-24 08:00:00', '2023-05-24 10:00:00', 250.00);
INSERT INTO public.voos VALUES (2, 2, 1, 3, '2023-06-25 14:00:00', '2023-05-25 16:00:00', 180.00);
INSERT INTO public.voos VALUES (3, 3, 2, 1, '2023-06-26 10:30:00', '2023-05-26 12:30:00', 200.00);
INSERT INTO public.voos VALUES (4, 1, 1, 2, '2023-05-25 10:00:00', '2023-05-25 12:00:00', 250.00);


--
-- Name: cidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cidades_id_seq', 3, true);


--
-- Name: comodidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comodidades_id_seq', 3, true);


--
-- Name: companhias_aereas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.companhias_aereas_id_seq', 3, true);


--
-- Name: hoteis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hoteis_id_seq', 3, true);


--
-- Name: passagens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.passagens_id_seq', 2, true);


--
-- Name: voos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.voos_id_seq', 4, true);


--
-- Name: cidades cidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (id);


--
-- Name: comodidades comodidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comodidades
    ADD CONSTRAINT comodidades_pkey PRIMARY KEY (id);


--
-- Name: companhias_aereas companhias_aereas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companhias_aereas
    ADD CONSTRAINT companhias_aereas_pkey PRIMARY KEY (id);


--
-- Name: hoteis hoteis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hoteis
    ADD CONSTRAINT hoteis_pkey PRIMARY KEY (id);


--
-- Name: hotel_comodidades hotel_comodidades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_comodidades
    ADD CONSTRAINT hotel_comodidades_pkey PRIMARY KEY (hotel_id, comodidade_id);


--
-- Name: passagens passagens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.passagens
    ADD CONSTRAINT passagens_pkey PRIMARY KEY (id);


--
-- Name: voos voos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voos
    ADD CONSTRAINT voos_pkey PRIMARY KEY (id);


--
-- Name: hoteis hoteis_cidade_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hoteis
    ADD CONSTRAINT hoteis_cidade_id_fkey FOREIGN KEY (cidade_id) REFERENCES public.cidades(id);


--
-- Name: hotel_comodidades hotel_comodidades_comodidade_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_comodidades
    ADD CONSTRAINT hotel_comodidades_comodidade_id_fkey FOREIGN KEY (comodidade_id) REFERENCES public.comodidades(id);


--
-- Name: hotel_comodidades hotel_comodidades_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hotel_comodidades
    ADD CONSTRAINT hotel_comodidades_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hoteis(id);


--
-- Name: passagens passagens_cidade_destino_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.passagens
    ADD CONSTRAINT passagens_cidade_destino_id_fkey FOREIGN KEY (cidade_destino_id) REFERENCES public.cidades(id);


--
-- Name: passagens passagens_cidade_origem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.passagens
    ADD CONSTRAINT passagens_cidade_origem_id_fkey FOREIGN KEY (cidade_origem_id) REFERENCES public.cidades(id);


--
-- Name: passagens passagens_voo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.passagens
    ADD CONSTRAINT passagens_voo_id_fkey FOREIGN KEY (voo_id) REFERENCES public.voos(id);


--
-- Name: voos voos_cidade_destino_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voos
    ADD CONSTRAINT voos_cidade_destino_id_fkey FOREIGN KEY (cidade_destino_id) REFERENCES public.cidades(id);


--
-- Name: voos voos_cidade_origem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voos
    ADD CONSTRAINT voos_cidade_origem_id_fkey FOREIGN KEY (cidade_origem_id) REFERENCES public.cidades(id);


--
-- Name: voos voos_companhia_aerea_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voos
    ADD CONSTRAINT voos_companhia_aerea_id_fkey FOREIGN KEY (companhia_aerea_id) REFERENCES public.companhias_aereas(id);


--
-- PostgreSQL database dump complete
--

