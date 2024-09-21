--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-09-21 10:58:06

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

--
-- TOC entry 6 (class 2615 OID 40961)
-- Name: cinema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA cinema;


ALTER SCHEMA cinema OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 40962)
-- Name: compra_direitos; Type: TABLE; Schema: cinema; Owner: postgres
--

CREATE TABLE cinema.compra_direitos (
    valor_compra integer NOT NULL,
    tempo_exibicao date NOT NULL,
    id_usuario integer NOT NULL,
    nome_filme character varying NOT NULL
);


ALTER TABLE cinema.compra_direitos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 40967)
-- Name: filme; Type: TABLE; Schema: cinema; Owner: postgres
--

CREATE TABLE cinema.filme (
    nome character varying NOT NULL,
    diretor character varying NOT NULL,
    duracao integer NOT NULL,
    "classificação_indicativa" integer NOT NULL,
    poster_imagem integer
);


ALTER TABLE cinema.filme OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 40972)
-- Name: filme_genero; Type: TABLE; Schema: cinema; Owner: postgres
--

CREATE TABLE cinema.filme_genero (
    filme_nome character varying NOT NULL,
    genero_id integer NOT NULL
);


ALTER TABLE cinema.filme_genero OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 40977)
-- Name: genero; Type: TABLE; Schema: cinema; Owner: postgres
--

CREATE TABLE cinema.genero (
    id integer NOT NULL,
    nome character varying(255) NOT NULL
);


ALTER TABLE cinema.genero OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 40980)
-- Name: generos_id_seq; Type: SEQUENCE; Schema: cinema; Owner: postgres
--

CREATE SEQUENCE cinema.generos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cinema.generos_id_seq OWNER TO postgres;

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 220
-- Name: generos_id_seq; Type: SEQUENCE OWNED BY; Schema: cinema; Owner: postgres
--

ALTER SEQUENCE cinema.generos_id_seq OWNED BY cinema.genero.id;


--
-- TOC entry 221 (class 1259 OID 40981)
-- Name: ingresso; Type: TABLE; Schema: cinema; Owner: postgres
--

CREATE TABLE cinema.ingresso (
    id integer NOT NULL,
    tipo character varying NOT NULL,
    valor integer NOT NULL,
    id_sessao integer,
    id_usuario integer
);


ALTER TABLE cinema.ingresso OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 40986)
-- Name: ingresso_id_seq; Type: SEQUENCE; Schema: cinema; Owner: postgres
--

CREATE SEQUENCE cinema.ingresso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cinema.ingresso_id_seq OWNER TO postgres;

--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 222
-- Name: ingresso_id_seq; Type: SEQUENCE OWNED BY; Schema: cinema; Owner: postgres
--

ALTER SEQUENCE cinema.ingresso_id_seq OWNED BY cinema.ingresso.id;


--
-- TOC entry 223 (class 1259 OID 40987)
-- Name: produto; Type: TABLE; Schema: cinema; Owner: postgres
--

CREATE TABLE cinema.produto (
    nome character varying NOT NULL,
    validade date NOT NULL,
    quantidade integer,
    id integer NOT NULL
);


ALTER TABLE cinema.produto OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 40992)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: cinema; Owner: postgres
--

CREATE SEQUENCE cinema.produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cinema.produto_id_seq OWNER TO postgres;

--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 224
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: cinema; Owner: postgres
--

ALTER SEQUENCE cinema.produto_id_seq OWNED BY cinema.produto.id;


--
-- TOC entry 225 (class 1259 OID 40993)
-- Name: sala_cinema; Type: TABLE; Schema: cinema; Owner: postgres
--

CREATE TABLE cinema.sala_cinema (
    nome character varying NOT NULL,
    qnt_assentos integer NOT NULL,
    tipo_tela character varying NOT NULL,
    "2D" boolean,
    "3D" boolean,
    imax boolean,
    tipo_oculos character varying,
    dolby_atmos boolean
);


ALTER TABLE cinema.sala_cinema OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 40998)
-- Name: sessao; Type: TABLE; Schema: cinema; Owner: postgres
--

CREATE TABLE cinema.sessao (
    id integer NOT NULL,
    horario timestamp without time zone NOT NULL,
    filme_nome character varying,
    sala_cinema_nome character varying
);


ALTER TABLE cinema.sessao OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 41003)
-- Name: sessao_id_seq; Type: SEQUENCE; Schema: cinema; Owner: postgres
--

CREATE SEQUENCE cinema.sessao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cinema.sessao_id_seq OWNER TO postgres;

--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 227
-- Name: sessao_id_seq; Type: SEQUENCE OWNED BY; Schema: cinema; Owner: postgres
--

ALTER SEQUENCE cinema.sessao_id_seq OWNED BY cinema.sessao.id;


--
-- TOC entry 228 (class 1259 OID 41004)
-- Name: usuario; Type: TABLE; Schema: cinema; Owner: postgres
--

CREATE TABLE cinema.usuario (
    id integer NOT NULL,
    nome character varying NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE cinema.usuario OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 41009)
-- Name: terminal_id_seq; Type: SEQUENCE; Schema: cinema; Owner: postgres
--

CREATE SEQUENCE cinema.terminal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE cinema.terminal_id_seq OWNER TO postgres;

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 229
-- Name: terminal_id_seq; Type: SEQUENCE OWNED BY; Schema: cinema; Owner: postgres
--

ALTER SEQUENCE cinema.terminal_id_seq OWNED BY cinema.usuario.id;


--
-- TOC entry 230 (class 1259 OID 41010)
-- Name: vende_produto; Type: TABLE; Schema: cinema; Owner: postgres
--

CREATE TABLE cinema.vende_produto (
    id_usuario integer,
    id_produto integer
);


ALTER TABLE cinema.vende_produto OWNER TO postgres;

--
-- TOC entry 4729 (class 2604 OID 41013)
-- Name: genero id; Type: DEFAULT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.genero ALTER COLUMN id SET DEFAULT nextval('cinema.generos_id_seq'::regclass);


--
-- TOC entry 4730 (class 2604 OID 41239)
-- Name: ingresso id; Type: DEFAULT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.ingresso ALTER COLUMN id SET DEFAULT nextval('cinema.ingresso_id_seq'::regclass);


--
-- TOC entry 4731 (class 2604 OID 41015)
-- Name: produto id; Type: DEFAULT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.produto ALTER COLUMN id SET DEFAULT nextval('cinema.produto_id_seq'::regclass);


--
-- TOC entry 4732 (class 2604 OID 41016)
-- Name: sessao id; Type: DEFAULT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.sessao ALTER COLUMN id SET DEFAULT nextval('cinema.sessao_id_seq'::regclass);


--
-- TOC entry 4733 (class 2604 OID 41017)
-- Name: usuario id; Type: DEFAULT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.usuario ALTER COLUMN id SET DEFAULT nextval('cinema.terminal_id_seq'::regclass);


--
-- TOC entry 4905 (class 0 OID 40962)
-- Dependencies: 216
-- Data for Name: compra_direitos; Type: TABLE DATA; Schema: cinema; Owner: postgres
--

COPY cinema.compra_direitos (valor_compra, tempo_exibicao, id_usuario, nome_filme) FROM stdin;
90000	2023-06-15	2	Ataque dos Titãs: Asas da Liberdade
20000	2022-03-22	2	Your Name
50000	2024-09-01	2	A Viagem de Chihiro
80000	2022-11-12	2	Dragon Ball Z: A Batalha dos Deuses
100000	2021-02-28	2	Fullmetal Alchemist: A Estrela Sagrada de Milos
40000	2023-08-20	2	One Piece: Estampida
30000	2023-01-05	2	Spirited Away
70000	2024-04-10	2	A Princesa Mononoke
50000	2022-07-25	2	My Hero Academia: Heroes Rising
60000	2024-12-31	2	Pokémon: The First Movie
75000	2023-05-14	2	Akira
85000	2022-10-10	2	Perfect Blue
90000	2024-07-20	2	Ghost in the Shell
95000	2023-04-18	2	Cowboy Bebop: The Movie
100000	2022-12-25	2	Neon Genesis Evangelion: The End of Evangelion
\.


--
-- TOC entry 4906 (class 0 OID 40967)
-- Dependencies: 217
-- Data for Name: filme; Type: TABLE DATA; Schema: cinema; Owner: postgres
--

COPY cinema.filme (nome, diretor, duracao, "classificação_indicativa", poster_imagem) FROM stdin;
A Viagem de Chihiro	Hayao Miyazaki	140	18	1
Spirited Away	Hayao Miyazaki	125	16	2
A Princesa Mononoke	Hayao Miyazaki	135	14	3
Your Name	Makoto Shinkai	110	12	4
Pokémon: The First Movie	Kunihiko Yuyama	85	10	5
Dragon Ball Z: A Batalha dos Deuses	Masahiro Hosoda	105	14	6
One Piece: Estampida	Takashi Otsuka	100	12	7
Ataque dos Titãs: Asas da Liberdade	Tetsuro Araki	120	16	8
Fullmetal Alchemist: A Estrela Sagrada de Milos	Kazuya Murata	110	14	9
My Hero Academia: Heroes Rising	Kenji Nagasaki	105	12	10
Akira	Katsuhiro Otomo	124	18	11
Perfect Blue	Satoshi Kon	81	18	12
Ghost in the Shell	Mamoru Oshii	83	16	13
Cowboy Bebop: The Movie	Shinichiro Watanabe	115	14	14
Neon Genesis Evangelion: The End of Evangelion	Hideaki Anno	87	16	15
\.


--
-- TOC entry 4907 (class 0 OID 40972)
-- Dependencies: 218
-- Data for Name: filme_genero; Type: TABLE DATA; Schema: cinema; Owner: postgres
--

COPY cinema.filme_genero (filme_nome, genero_id) FROM stdin;
A Viagem de Chihiro	7
Spirited Away	7
A Princesa Mononoke	8
Your Name	6
Pokémon: The First Movie	7
Dragon Ball Z: A Batalha dos Deuses	1
One Piece: Estampida	8
Ataque dos Titãs: Asas da Liberdade	1
Fullmetal Alchemist: A Estrela Sagrada de Milos	5
My Hero Academia: Heroes Rising	1
Akira	5
Perfect Blue	4
Ghost in the Shell	5
Cowboy Bebop: The Movie	8
Neon Genesis Evangelion: The End of Evangelion	5
A Viagem de Chihiro	3
\.


--
-- TOC entry 4908 (class 0 OID 40977)
-- Dependencies: 219
-- Data for Name: genero; Type: TABLE DATA; Schema: cinema; Owner: postgres
--

COPY cinema.genero (id, nome) FROM stdin;
1	Ação
2	Comédia
3	Drama
4	Terror
5	Ficção Científica
6	Romance
7	Animação
8	Aventura
9	Documentário
10	Fantasia
11	Musical
12	Biografia
13	Mistério
\.


--
-- TOC entry 4910 (class 0 OID 40981)
-- Dependencies: 221
-- Data for Name: ingresso; Type: TABLE DATA; Schema: cinema; Owner: postgres
--

COPY cinema.ingresso (id, tipo, valor, id_sessao, id_usuario) FROM stdin;
1	Inteira	50	4	1
3	VIP	100	4	3
4	Inteira	50	4	3
5	Meia	25	5	2
6	VIP	100	6	1
7	Inteira	50	7	2
8	Meia	25	8	3
9	Inteira	50	9	2
10	VIP	100	10	1
11	VIP	100	11	1
12	Inteira	50	12	2
14	VIP	100	12	2
15	VIP	60	12	1
16	VIP	32	12	1
18	VIP	50	4	\N
19	VIP	51	4	\N
20	inteira	12	5	\N
25	VIP	50	4	\N
26	Meia	10	4	\N
27	Meia	10	4	\N
17	VIP	10	13	2
13	Meia	10	10	3
28	VIP	30	8	\N
\.


--
-- TOC entry 4912 (class 0 OID 40987)
-- Dependencies: 223
-- Data for Name: produto; Type: TABLE DATA; Schema: cinema; Owner: postgres
--

COPY cinema.produto (nome, validade, quantidade, id) FROM stdin;
Pipoca	2024-12-31	100	1
Refrigerante	2024-12-31	200	2
Chocolate	2024-12-31	150	3
Balas	2024-12-31	250	4
Água	2024-12-31	300	5
Salgadinho	2024-12-31	120	6
Sorvete	2024-12-31	130	7
Amendoim	2024-12-31	110	8
Suco	2024-12-31	140	9
Sanduíche	2024-12-31	160	10
Café	2024-12-31	180	11
\.


--
-- TOC entry 4914 (class 0 OID 40993)
-- Dependencies: 225
-- Data for Name: sala_cinema; Type: TABLE DATA; Schema: cinema; Owner: postgres
--

COPY cinema.sala_cinema (nome, qnt_assentos, tipo_tela, "2D", "3D", imax, tipo_oculos, dolby_atmos) FROM stdin;
Sala 1	100	Normal	t	f	f	\N	f
Sala 2	150	3D	f	t	f	Normal	f
Sala 3	200	IMAX	f	f	t	Especial	t
Sala 4	120	Normal	t	f	f	\N	f
Sala 5	180	3D	f	t	f	Normal	f
Sala 6	160	IMAX	f	f	t	Especial	t
Sala 7	140	Normal	t	f	f	\N	f
Sala 8	130	3D	f	t	f	Normal	f
Sala 9	110	IMAX	f	f	t	Especial	t
Sala 10	170	Normal	t	f	f	\N	f
Sala 11	190	3D	f	t	f	Normal	f
Sala 12	210	IMAX	f	f	t	Especial	t
Sala 13	220	Normal	t	f	f	\N	f
Sala 14	230	3D	f	t	f	Normal	f
Sala 15	240	IMAX	f	f	t	Especial	t
\.


--
-- TOC entry 4915 (class 0 OID 40998)
-- Dependencies: 226
-- Data for Name: sessao; Type: TABLE DATA; Schema: cinema; Owner: postgres
--

COPY cinema.sessao (id, horario, filme_nome, sala_cinema_nome) FROM stdin;
4	2024-08-01 14:00:00	A Viagem de Chihiro	Sala 1
5	2024-08-01 16:00:00	Spirited Away	Sala 2
6	2024-08-01 18:00:00	A Princesa Mononoke	Sala 3
7	2024-08-01 20:00:00	Your Name	Sala 4
8	2024-08-02 14:00:00	Pokémon: The First Movie	Sala 5
9	2024-08-02 16:00:00	Dragon Ball Z: A Batalha dos Deuses	Sala 6
10	2024-08-02 18:00:00	One Piece: Estampida	Sala 7
11	2024-08-02 20:00:00	Ataque dos Titãs: Asas da Liberdade	Sala 8
12	2024-08-03 14:00:00	Fullmetal Alchemist: A Estrela Sagrada de Milos	Sala 9
13	2024-08-03 16:00:00	My Hero Academia: Heroes Rising	Sala 10
\.


--
-- TOC entry 4917 (class 0 OID 41004)
-- Dependencies: 228
-- Data for Name: usuario; Type: TABLE DATA; Schema: cinema; Owner: postgres
--

COPY cinema.usuario (id, nome, email) FROM stdin;
1	Sammy Ferreira	sammyfe2021@gmail.com
2	João Victor	jv@gmail.com
3	Carlos Souza	carlossz@gmail.com
4	Daniela Alves	d.alves@gmail.com
5	Eduardo Santos	dudu.sant@gmail.com
6	Fernanda Gomes	fegomes@gmail.com
7	Gustavo Rocha	gustar@gmail.com
8	Helena Costa	helena.costa@gmail.com
9	Igor Fernandes	igorfds@gmail.com
10	Juliana Ribeiro	juribeiro@gmail.com
11	Ana Silva	ana.silva@gmail.com
12	Bruno Lima	bruno.lima@gmail.com
13	Carla Mendes	carla.mendes@gmail.com
14	Diego Castro	diego.castro@gmail.com
15	Elena Martins	elena.martins@gmail.com
\.


--
-- TOC entry 4919 (class 0 OID 41010)
-- Dependencies: 230
-- Data for Name: vende_produto; Type: TABLE DATA; Schema: cinema; Owner: postgres
--

COPY cinema.vende_produto (id_usuario, id_produto) FROM stdin;
6	1
6	2
6	3
7	4
7	5
6	6
7	7
7	8
6	9
6	10
7	2
6	3
7	4
7	5
7	6
6	7
6	8
6	9
6	10
7	1
\.


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 220
-- Name: generos_id_seq; Type: SEQUENCE SET; Schema: cinema; Owner: postgres
--

SELECT pg_catalog.setval('cinema.generos_id_seq', 1, false);


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 222
-- Name: ingresso_id_seq; Type: SEQUENCE SET; Schema: cinema; Owner: postgres
--

SELECT pg_catalog.setval('cinema.ingresso_id_seq', 30, true);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 224
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: cinema; Owner: postgres
--

SELECT pg_catalog.setval('cinema.produto_id_seq', 11, true);


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 227
-- Name: sessao_id_seq; Type: SEQUENCE SET; Schema: cinema; Owner: postgres
--

SELECT pg_catalog.setval('cinema.sessao_id_seq', 13, true);


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 229
-- Name: terminal_id_seq; Type: SEQUENCE SET; Schema: cinema; Owner: postgres
--

SELECT pg_catalog.setval('cinema.terminal_id_seq', 2, true);


--
-- TOC entry 4737 (class 2606 OID 41019)
-- Name: filme_genero filme_genero_pkey; Type: CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.filme_genero
    ADD CONSTRAINT filme_genero_pkey PRIMARY KEY (filme_nome, genero_id);


--
-- TOC entry 4735 (class 2606 OID 41021)
-- Name: filme filme_pkey; Type: CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.filme
    ADD CONSTRAINT filme_pkey PRIMARY KEY (nome);


--
-- TOC entry 4739 (class 2606 OID 41023)
-- Name: genero generos_pkey; Type: CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.genero
    ADD CONSTRAINT generos_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 41025)
-- Name: produto id_produto; Type: CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.produto
    ADD CONSTRAINT id_produto PRIMARY KEY (id);


--
-- TOC entry 4741 (class 2606 OID 41027)
-- Name: ingresso ingresso_pkey; Type: CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.ingresso
    ADD CONSTRAINT ingresso_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 41029)
-- Name: sala_cinema sala_filme_pkey; Type: CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.sala_cinema
    ADD CONSTRAINT sala_filme_pkey PRIMARY KEY (nome);


--
-- TOC entry 4747 (class 2606 OID 41031)
-- Name: sessao sessao_pkey; Type: CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.sessao
    ADD CONSTRAINT sessao_pkey PRIMARY KEY (id);


--
-- TOC entry 4749 (class 2606 OID 41033)
-- Name: usuario terminal_pkey; Type: CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.usuario
    ADD CONSTRAINT terminal_pkey PRIMARY KEY (id);


--
-- TOC entry 4751 (class 2606 OID 41035)
-- Name: usuario unique_email; Type: CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.usuario
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- TOC entry 4752 (class 2606 OID 41036)
-- Name: compra_direitos compra_direitos_id_terminal_fkey; Type: FK CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.compra_direitos
    ADD CONSTRAINT compra_direitos_id_terminal_fkey FOREIGN KEY (id_usuario) REFERENCES cinema.usuario(id);


--
-- TOC entry 4753 (class 2606 OID 41041)
-- Name: compra_direitos compra_direitos_nome_filme_fkey; Type: FK CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.compra_direitos
    ADD CONSTRAINT compra_direitos_nome_filme_fkey FOREIGN KEY (nome_filme) REFERENCES cinema.filme(nome);


--
-- TOC entry 4754 (class 2606 OID 41046)
-- Name: filme_genero filme_genero_filme_nome_fkey; Type: FK CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.filme_genero
    ADD CONSTRAINT filme_genero_filme_nome_fkey FOREIGN KEY (filme_nome) REFERENCES cinema.filme(nome);


--
-- TOC entry 4755 (class 2606 OID 41051)
-- Name: filme_genero filme_genero_genero_id_fkey; Type: FK CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.filme_genero
    ADD CONSTRAINT filme_genero_genero_id_fkey FOREIGN KEY (genero_id) REFERENCES cinema.genero(id);


--
-- TOC entry 4758 (class 2606 OID 41056)
-- Name: sessao fk_filme; Type: FK CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.sessao
    ADD CONSTRAINT fk_filme FOREIGN KEY (filme_nome) REFERENCES cinema.filme(nome);


--
-- TOC entry 4759 (class 2606 OID 41061)
-- Name: sessao fk_salacinema; Type: FK CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.sessao
    ADD CONSTRAINT fk_salacinema FOREIGN KEY (sala_cinema_nome) REFERENCES cinema.sala_cinema(nome);


--
-- TOC entry 4756 (class 2606 OID 41066)
-- Name: ingresso fk_sessao; Type: FK CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.ingresso
    ADD CONSTRAINT fk_sessao FOREIGN KEY (id_sessao) REFERENCES cinema.sessao(id);


--
-- TOC entry 4757 (class 2606 OID 41071)
-- Name: ingresso fk_terminal; Type: FK CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.ingresso
    ADD CONSTRAINT fk_terminal FOREIGN KEY (id_usuario) REFERENCES cinema.usuario(id);


--
-- TOC entry 4760 (class 2606 OID 41081)
-- Name: vende_produto vende_produto_id_produto_fkey; Type: FK CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.vende_produto
    ADD CONSTRAINT vende_produto_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES cinema.produto(id);


--
-- TOC entry 4761 (class 2606 OID 41086)
-- Name: vende_produto vende_produto_id_usuario_fkey; Type: FK CONSTRAINT; Schema: cinema; Owner: postgres
--

ALTER TABLE ONLY cinema.vende_produto
    ADD CONSTRAINT vende_produto_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES cinema.usuario(id);


-- Completed on 2024-09-21 10:58:06

--
-- PostgreSQL database dump complete
--

