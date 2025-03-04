--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.0

-- Started on 2025-03-04 11:41:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 894 (class 1247 OID 49227)
-- Name: status_acompanhamento; Type: TYPE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TYPE public.status_acompanhamento AS ENUM (
    'Aprovado',
    'Pendente',
    'Finalizado'
);


ALTER TYPE public.status_acompanhamento OWNER TO consultas_basicas_owner;

--
-- TOC entry 903 (class 1247 OID 57363)
-- Name: status_usuario; Type: TYPE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TYPE public.status_usuario AS ENUM (
    'ativo',
    'inativo'
);


ALTER TYPE public.status_usuario OWNER TO consultas_basicas_owner;

--
-- TOC entry 897 (class 1247 OID 49246)
-- Name: tipo_usuario; Type: TYPE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TYPE public.tipo_usuario AS ENUM (
    'admin',
    'funcionário',
    'cliente'
);


ALTER TYPE public.tipo_usuario OWNER TO consultas_basicas_owner;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 238 (class 1259 OID 57368)
-- Name: acesso; Type: TABLE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TABLE public.acesso (
    idacesso integer NOT NULL,
    login character varying(10) NOT NULL,
    senha character varying(255) NOT NULL,
    email character varying(100) NOT NULL,
    tipousuario public.tipo_usuario DEFAULT 'admin'::public.tipo_usuario NOT NULL,
    status public.status_usuario DEFAULT 'ativo'::public.status_usuario NOT NULL
);


ALTER TABLE public.acesso OWNER TO consultas_basicas_owner;

--
-- TOC entry 237 (class 1259 OID 57367)
-- Name: acesso_idacesso_seq; Type: SEQUENCE; Schema: public; Owner: consultas_basicas_owner
--

CREATE SEQUENCE public.acesso_idacesso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.acesso_idacesso_seq OWNER TO consultas_basicas_owner;

--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 237
-- Name: acesso_idacesso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: consultas_basicas_owner
--

ALTER SEQUENCE public.acesso_idacesso_seq OWNED BY public.acesso.idacesso;


--
-- TOC entry 236 (class 1259 OID 57350)
-- Name: acompanhamento; Type: TABLE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TABLE public.acompanhamento (
    idacompanhamento integer NOT NULL,
    status public.status_acompanhamento DEFAULT 'Pendente'::public.status_acompanhamento NOT NULL,
    vendas_idvendas integer NOT NULL
);


ALTER TABLE public.acompanhamento OWNER TO consultas_basicas_owner;

--
-- TOC entry 235 (class 1259 OID 57349)
-- Name: acompanhamento_idacompanhamento_seq; Type: SEQUENCE; Schema: public; Owner: consultas_basicas_owner
--

CREATE SEQUENCE public.acompanhamento_idacompanhamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.acompanhamento_idacompanhamento_seq OWNER TO consultas_basicas_owner;

--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 235
-- Name: acompanhamento_idacompanhamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: consultas_basicas_owner
--

ALTER SEQUENCE public.acompanhamento_idacompanhamento_seq OWNED BY public.acompanhamento.idacompanhamento;


--
-- TOC entry 220 (class 1259 OID 40968)
-- Name: cidade; Type: TABLE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TABLE public.cidade (
    idcidade integer NOT NULL,
    estado integer NOT NULL,
    uf character varying(4) NOT NULL
);


ALTER TABLE public.cidade OWNER TO consultas_basicas_owner;

--
-- TOC entry 219 (class 1259 OID 40967)
-- Name: cidade_idcidade_seq; Type: SEQUENCE; Schema: public; Owner: consultas_basicas_owner
--

CREATE SEQUENCE public.cidade_idcidade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cidade_idcidade_seq OWNER TO consultas_basicas_owner;

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 219
-- Name: cidade_idcidade_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: consultas_basicas_owner
--

ALTER SEQUENCE public.cidade_idcidade_seq OWNED BY public.cidade.idcidade;


--
-- TOC entry 222 (class 1259 OID 40980)
-- Name: cliente; Type: TABLE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TABLE public.cliente (
    idcliente integer NOT NULL,
    nome character varying(100) NOT NULL,
    cpf character(11) NOT NULL,
    dtnasc date NOT NULL,
    logradouro character varying(150) NOT NULL,
    idcidade integer NOT NULL
);


ALTER TABLE public.cliente OWNER TO consultas_basicas_owner;

--
-- TOC entry 221 (class 1259 OID 40979)
-- Name: cliente_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: consultas_basicas_owner
--

CREATE SEQUENCE public.cliente_idcliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_idcliente_seq OWNER TO consultas_basicas_owner;

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 221
-- Name: cliente_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: consultas_basicas_owner
--

ALTER SEQUENCE public.cliente_idcliente_seq OWNED BY public.cliente.idcliente;


--
-- TOC entry 218 (class 1259 OID 40961)
-- Name: estado; Type: TABLE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TABLE public.estado (
    idestado integer NOT NULL,
    uf character varying(4) NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.estado OWNER TO consultas_basicas_owner;

--
-- TOC entry 217 (class 1259 OID 40960)
-- Name: estado_idestado_seq; Type: SEQUENCE; Schema: public; Owner: consultas_basicas_owner
--

CREATE SEQUENCE public.estado_idestado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_idestado_seq OWNER TO consultas_basicas_owner;

--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 217
-- Name: estado_idestado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: consultas_basicas_owner
--

ALTER SEQUENCE public.estado_idestado_seq OWNED BY public.estado.idestado;


--
-- TOC entry 226 (class 1259 OID 49167)
-- Name: formapagamento; Type: TABLE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TABLE public.formapagamento (
    idformapagamento integer NOT NULL,
    nomeformapagamento character varying(45) NOT NULL
);


ALTER TABLE public.formapagamento OWNER TO consultas_basicas_owner;

--
-- TOC entry 225 (class 1259 OID 49166)
-- Name: formapagamento_idformapagamento_seq; Type: SEQUENCE; Schema: public; Owner: consultas_basicas_owner
--

CREATE SEQUENCE public.formapagamento_idformapagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.formapagamento_idformapagamento_seq OWNER TO consultas_basicas_owner;

--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 225
-- Name: formapagamento_idformapagamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: consultas_basicas_owner
--

ALTER SEQUENCE public.formapagamento_idformapagamento_seq OWNED BY public.formapagamento.idformapagamento;


--
-- TOC entry 234 (class 1259 OID 49205)
-- Name: itensvendas; Type: TABLE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TABLE public.itensvendas (
    iditensvendas integer NOT NULL,
    produto_idproduto integer,
    servico_idservico integer,
    vendas_idvendas integer NOT NULL
);


ALTER TABLE public.itensvendas OWNER TO consultas_basicas_owner;

--
-- TOC entry 233 (class 1259 OID 49204)
-- Name: itensvendas_iditensvendas_seq; Type: SEQUENCE; Schema: public; Owner: consultas_basicas_owner
--

CREATE SEQUENCE public.itensvendas_iditensvendas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.itensvendas_iditensvendas_seq OWNER TO consultas_basicas_owner;

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 233
-- Name: itensvendas_iditensvendas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: consultas_basicas_owner
--

ALTER SEQUENCE public.itensvendas_iditensvendas_seq OWNED BY public.itensvendas.iditensvendas;


--
-- TOC entry 230 (class 1259 OID 49191)
-- Name: produto; Type: TABLE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TABLE public.produto (
    idproduto integer NOT NULL,
    nomeproduto character varying(100) NOT NULL,
    valorproduto numeric(10,2) NOT NULL
);


ALTER TABLE public.produto OWNER TO consultas_basicas_owner;

--
-- TOC entry 229 (class 1259 OID 49190)
-- Name: produto_idproduto_seq; Type: SEQUENCE; Schema: public; Owner: consultas_basicas_owner
--

CREATE SEQUENCE public.produto_idproduto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produto_idproduto_seq OWNER TO consultas_basicas_owner;

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 229
-- Name: produto_idproduto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: consultas_basicas_owner
--

ALTER SEQUENCE public.produto_idproduto_seq OWNED BY public.produto.idproduto;


--
-- TOC entry 232 (class 1259 OID 49198)
-- Name: servico; Type: TABLE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TABLE public.servico (
    idservico integer NOT NULL,
    nomeservico character varying(50) NOT NULL,
    valorservico numeric(10,2) NOT NULL
);


ALTER TABLE public.servico OWNER TO consultas_basicas_owner;

--
-- TOC entry 231 (class 1259 OID 49197)
-- Name: servico_idservico_seq; Type: SEQUENCE; Schema: public; Owner: consultas_basicas_owner
--

CREATE SEQUENCE public.servico_idservico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servico_idservico_seq OWNER TO consultas_basicas_owner;

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 231
-- Name: servico_idservico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: consultas_basicas_owner
--

ALTER SEQUENCE public.servico_idservico_seq OWNED BY public.servico.idservico;


--
-- TOC entry 224 (class 1259 OID 49153)
-- Name: veiculo; Type: TABLE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TABLE public.veiculo (
    idveiculo integer NOT NULL,
    modeloveiculo character varying(50) NOT NULL,
    anoveiculo date NOT NULL,
    placa character varying(10) NOT NULL,
    user_iduser integer NOT NULL
);


ALTER TABLE public.veiculo OWNER TO consultas_basicas_owner;

--
-- TOC entry 223 (class 1259 OID 49152)
-- Name: veiculo_idveiculo_seq; Type: SEQUENCE; Schema: public; Owner: consultas_basicas_owner
--

CREATE SEQUENCE public.veiculo_idveiculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.veiculo_idveiculo_seq OWNER TO consultas_basicas_owner;

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 223
-- Name: veiculo_idveiculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: consultas_basicas_owner
--

ALTER SEQUENCE public.veiculo_idveiculo_seq OWNED BY public.veiculo.idveiculo;


--
-- TOC entry 228 (class 1259 OID 49174)
-- Name: vendas; Type: TABLE; Schema: public; Owner: consultas_basicas_owner
--

CREATE TABLE public.vendas (
    idvendas integer NOT NULL,
    idformapagamento integer NOT NULL,
    idcliente integer NOT NULL,
    datvenda date NOT NULL,
    valortotal numeric(10,2) NOT NULL
);


ALTER TABLE public.vendas OWNER TO consultas_basicas_owner;

--
-- TOC entry 227 (class 1259 OID 49173)
-- Name: vendas_idvendas_seq; Type: SEQUENCE; Schema: public; Owner: consultas_basicas_owner
--

CREATE SEQUENCE public.vendas_idvendas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendas_idvendas_seq OWNER TO consultas_basicas_owner;

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 227
-- Name: vendas_idvendas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: consultas_basicas_owner
--

ALTER SEQUENCE public.vendas_idvendas_seq OWNED BY public.vendas.idvendas;


--
-- TOC entry 3257 (class 2604 OID 57371)
-- Name: acesso idacesso; Type: DEFAULT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.acesso ALTER COLUMN idacesso SET DEFAULT nextval('public.acesso_idacesso_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 57353)
-- Name: acompanhamento idacompanhamento; Type: DEFAULT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.acompanhamento ALTER COLUMN idacompanhamento SET DEFAULT nextval('public.acompanhamento_idacompanhamento_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 40971)
-- Name: cidade idcidade; Type: DEFAULT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.cidade ALTER COLUMN idcidade SET DEFAULT nextval('public.cidade_idcidade_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 40983)
-- Name: cliente idcliente; Type: DEFAULT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.cliente ALTER COLUMN idcliente SET DEFAULT nextval('public.cliente_idcliente_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 40964)
-- Name: estado idestado; Type: DEFAULT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.estado ALTER COLUMN idestado SET DEFAULT nextval('public.estado_idestado_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 49170)
-- Name: formapagamento idformapagamento; Type: DEFAULT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.formapagamento ALTER COLUMN idformapagamento SET DEFAULT nextval('public.formapagamento_idformapagamento_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 49208)
-- Name: itensvendas iditensvendas; Type: DEFAULT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.itensvendas ALTER COLUMN iditensvendas SET DEFAULT nextval('public.itensvendas_iditensvendas_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 49194)
-- Name: produto idproduto; Type: DEFAULT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.produto ALTER COLUMN idproduto SET DEFAULT nextval('public.produto_idproduto_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 49201)
-- Name: servico idservico; Type: DEFAULT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.servico ALTER COLUMN idservico SET DEFAULT nextval('public.servico_idservico_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 49156)
-- Name: veiculo idveiculo; Type: DEFAULT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.veiculo ALTER COLUMN idveiculo SET DEFAULT nextval('public.veiculo_idveiculo_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 49177)
-- Name: vendas idvendas; Type: DEFAULT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.vendas ALTER COLUMN idvendas SET DEFAULT nextval('public.vendas_idvendas_seq'::regclass);


--
-- TOC entry 3465 (class 0 OID 57368)
-- Dependencies: 238
-- Data for Name: acesso; Type: TABLE DATA; Schema: public; Owner: consultas_basicas_owner
--

INSERT INTO public.acesso VALUES (1, 'admin', '123456', 'admin@example.com', 'admin', 'ativo');
INSERT INTO public.acesso VALUES (2, 'usuario1', 'abc123', 'usuario@example.com', 'funcionário', 'ativo');
INSERT INTO public.acesso VALUES (3, 'cliente1', 'senha123', 'cliente@example.com', 'cliente', 'inativo');


--
-- TOC entry 3463 (class 0 OID 57350)
-- Dependencies: 236
-- Data for Name: acompanhamento; Type: TABLE DATA; Schema: public; Owner: consultas_basicas_owner
--

INSERT INTO public.acompanhamento VALUES (1, 'Aprovado', 1);
INSERT INTO public.acompanhamento VALUES (2, 'Pendente', 2);
INSERT INTO public.acompanhamento VALUES (3, 'Finalizado', 1);
INSERT INTO public.acompanhamento VALUES (4, 'Aprovado', 1);
INSERT INTO public.acompanhamento VALUES (5, 'Pendente', 2);
INSERT INTO public.acompanhamento VALUES (6, 'Finalizado', 1);


--
-- TOC entry 3447 (class 0 OID 40968)
-- Dependencies: 220
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: consultas_basicas_owner
--

INSERT INTO public.cidade VALUES (1, 1, 'RS');
INSERT INTO public.cidade VALUES (2, 2, 'SC');


--
-- TOC entry 3449 (class 0 OID 40980)
-- Dependencies: 222
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: consultas_basicas_owner
--

INSERT INTO public.cliente VALUES (1, 'João Silva', '12345678901', '1990-05-10', 'Rua das Flores, 123', 1);
INSERT INTO public.cliente VALUES (2, 'Maria Oliveira', '98765432100', '1985-08-22', 'Av. Brasil, 456', 2);


--
-- TOC entry 3445 (class 0 OID 40961)
-- Dependencies: 218
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: consultas_basicas_owner
--

INSERT INTO public.estado VALUES (1, 'RS', 'Rio Grande do Sul');
INSERT INTO public.estado VALUES (2, 'SC', 'Santa Catarina');


--
-- TOC entry 3453 (class 0 OID 49167)
-- Dependencies: 226
-- Data for Name: formapagamento; Type: TABLE DATA; Schema: public; Owner: consultas_basicas_owner
--

INSERT INTO public.formapagamento VALUES (1, 'Cartão de Crédito');
INSERT INTO public.formapagamento VALUES (2, 'Boleto Bancário');
INSERT INTO public.formapagamento VALUES (3, 'Cartão de Crédito');
INSERT INTO public.formapagamento VALUES (4, 'Boleto Bancário');


--
-- TOC entry 3461 (class 0 OID 49205)
-- Dependencies: 234
-- Data for Name: itensvendas; Type: TABLE DATA; Schema: public; Owner: consultas_basicas_owner
--

INSERT INTO public.itensvendas VALUES (1, 1, 1, 1);
INSERT INTO public.itensvendas VALUES (2, 2, 2, 2);
INSERT INTO public.itensvendas VALUES (3, 1, 1, 1);
INSERT INTO public.itensvendas VALUES (4, 2, 2, 2);


--
-- TOC entry 3457 (class 0 OID 49191)
-- Dependencies: 230
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: consultas_basicas_owner
--

INSERT INTO public.produto VALUES (1, 'Óleo de motor', 50.00);
INSERT INTO public.produto VALUES (2, 'Filtro de ar', 30.00);
INSERT INTO public.produto VALUES (3, 'Óleo de motor', 50.00);
INSERT INTO public.produto VALUES (4, 'Filtro de ar', 30.00);


--
-- TOC entry 3459 (class 0 OID 49198)
-- Dependencies: 232
-- Data for Name: servico; Type: TABLE DATA; Schema: public; Owner: consultas_basicas_owner
--

INSERT INTO public.servico VALUES (1, 'Troca de óleo', 80.00);
INSERT INTO public.servico VALUES (2, 'Revisão geral', 200.00);
INSERT INTO public.servico VALUES (3, 'Troca de óleo', 80.00);
INSERT INTO public.servico VALUES (4, 'Revisão geral', 200.00);


--
-- TOC entry 3451 (class 0 OID 49153)
-- Dependencies: 224
-- Data for Name: veiculo; Type: TABLE DATA; Schema: public; Owner: consultas_basicas_owner
--

INSERT INTO public.veiculo VALUES (1, 'Fiat Uno', '2015-01-01', 'ABC1234', 1);
INSERT INTO public.veiculo VALUES (2, 'Honda Civic', '2020-01-01', 'XYZ5678', 2);


--
-- TOC entry 3455 (class 0 OID 49174)
-- Dependencies: 228
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: consultas_basicas_owner
--

INSERT INTO public.vendas VALUES (1, 1, 1, '2025-03-04', 130.00);
INSERT INTO public.vendas VALUES (2, 2, 2, '2025-03-04', 230.00);
INSERT INTO public.vendas VALUES (3, 1, 1, '2025-03-04', 130.00);
INSERT INTO public.vendas VALUES (4, 2, 2, '2025-03-04', 230.00);


--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 237
-- Name: acesso_idacesso_seq; Type: SEQUENCE SET; Schema: public; Owner: consultas_basicas_owner
--

SELECT pg_catalog.setval('public.acesso_idacesso_seq', 5, true);


--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 235
-- Name: acompanhamento_idacompanhamento_seq; Type: SEQUENCE SET; Schema: public; Owner: consultas_basicas_owner
--

SELECT pg_catalog.setval('public.acompanhamento_idacompanhamento_seq', 6, true);


--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 219
-- Name: cidade_idcidade_seq; Type: SEQUENCE SET; Schema: public; Owner: consultas_basicas_owner
--

SELECT pg_catalog.setval('public.cidade_idcidade_seq', 2, true);


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 221
-- Name: cliente_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: consultas_basicas_owner
--

SELECT pg_catalog.setval('public.cliente_idcliente_seq', 2, true);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 217
-- Name: estado_idestado_seq; Type: SEQUENCE SET; Schema: public; Owner: consultas_basicas_owner
--

SELECT pg_catalog.setval('public.estado_idestado_seq', 2, true);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 225
-- Name: formapagamento_idformapagamento_seq; Type: SEQUENCE SET; Schema: public; Owner: consultas_basicas_owner
--

SELECT pg_catalog.setval('public.formapagamento_idformapagamento_seq', 4, true);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 233
-- Name: itensvendas_iditensvendas_seq; Type: SEQUENCE SET; Schema: public; Owner: consultas_basicas_owner
--

SELECT pg_catalog.setval('public.itensvendas_iditensvendas_seq', 4, true);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 229
-- Name: produto_idproduto_seq; Type: SEQUENCE SET; Schema: public; Owner: consultas_basicas_owner
--

SELECT pg_catalog.setval('public.produto_idproduto_seq', 4, true);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 231
-- Name: servico_idservico_seq; Type: SEQUENCE SET; Schema: public; Owner: consultas_basicas_owner
--

SELECT pg_catalog.setval('public.servico_idservico_seq', 4, true);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 223
-- Name: veiculo_idveiculo_seq; Type: SEQUENCE SET; Schema: public; Owner: consultas_basicas_owner
--

SELECT pg_catalog.setval('public.veiculo_idveiculo_seq', 3, true);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 227
-- Name: vendas_idvendas_seq; Type: SEQUENCE SET; Schema: public; Owner: consultas_basicas_owner
--

SELECT pg_catalog.setval('public.vendas_idvendas_seq', 4, true);


--
-- TOC entry 3285 (class 2606 OID 57379)
-- Name: acesso acesso_email_key; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.acesso
    ADD CONSTRAINT acesso_email_key UNIQUE (email);


--
-- TOC entry 3287 (class 2606 OID 57377)
-- Name: acesso acesso_login_key; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.acesso
    ADD CONSTRAINT acesso_login_key UNIQUE (login);


--
-- TOC entry 3289 (class 2606 OID 57375)
-- Name: acesso acesso_pkey; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.acesso
    ADD CONSTRAINT acesso_pkey PRIMARY KEY (idacesso);


--
-- TOC entry 3283 (class 2606 OID 57356)
-- Name: acompanhamento acompanhamento_pkey; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.acompanhamento
    ADD CONSTRAINT acompanhamento_pkey PRIMARY KEY (idacompanhamento);


--
-- TOC entry 3263 (class 2606 OID 40973)
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (idcidade);


--
-- TOC entry 3265 (class 2606 OID 40987)
-- Name: cliente cliente_cpf_key; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cpf_key UNIQUE (cpf);


--
-- TOC entry 3267 (class 2606 OID 40985)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);


--
-- TOC entry 3261 (class 2606 OID 40966)
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (idestado);


--
-- TOC entry 3273 (class 2606 OID 49172)
-- Name: formapagamento formapagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.formapagamento
    ADD CONSTRAINT formapagamento_pkey PRIMARY KEY (idformapagamento);


--
-- TOC entry 3281 (class 2606 OID 49210)
-- Name: itensvendas itensvendas_pkey; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.itensvendas
    ADD CONSTRAINT itensvendas_pkey PRIMARY KEY (iditensvendas);


--
-- TOC entry 3277 (class 2606 OID 49196)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (idproduto);


--
-- TOC entry 3279 (class 2606 OID 49203)
-- Name: servico servico_pkey; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.servico
    ADD CONSTRAINT servico_pkey PRIMARY KEY (idservico);


--
-- TOC entry 3269 (class 2606 OID 49158)
-- Name: veiculo veiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (idveiculo);


--
-- TOC entry 3271 (class 2606 OID 49160)
-- Name: veiculo veiculo_placa_key; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_placa_key UNIQUE (placa);


--
-- TOC entry 3275 (class 2606 OID 49179)
-- Name: vendas vendas_pkey; Type: CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (idvendas);


--
-- TOC entry 3298 (class 2606 OID 57357)
-- Name: acompanhamento acompanhamento_vendas_idvendas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.acompanhamento
    ADD CONSTRAINT acompanhamento_vendas_idvendas_fkey FOREIGN KEY (vendas_idvendas) REFERENCES public.vendas(idvendas) ON DELETE CASCADE;


--
-- TOC entry 3290 (class 2606 OID 40974)
-- Name: cidade cidade_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_estado_fkey FOREIGN KEY (estado) REFERENCES public.estado(idestado) ON DELETE CASCADE;


--
-- TOC entry 3291 (class 2606 OID 40988)
-- Name: cliente cliente_idcidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_idcidade_fkey FOREIGN KEY (idcidade) REFERENCES public.cidade(idcidade) ON DELETE CASCADE;


--
-- TOC entry 3295 (class 2606 OID 49211)
-- Name: itensvendas itensvendas_produto_idproduto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.itensvendas
    ADD CONSTRAINT itensvendas_produto_idproduto_fkey FOREIGN KEY (produto_idproduto) REFERENCES public.produto(idproduto) ON DELETE CASCADE;


--
-- TOC entry 3296 (class 2606 OID 49216)
-- Name: itensvendas itensvendas_servico_idservico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.itensvendas
    ADD CONSTRAINT itensvendas_servico_idservico_fkey FOREIGN KEY (servico_idservico) REFERENCES public.servico(idservico) ON DELETE CASCADE;


--
-- TOC entry 3297 (class 2606 OID 49221)
-- Name: itensvendas itensvendas_vendas_idvendas_fkey; Type: FK CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.itensvendas
    ADD CONSTRAINT itensvendas_vendas_idvendas_fkey FOREIGN KEY (vendas_idvendas) REFERENCES public.vendas(idvendas) ON DELETE CASCADE;


--
-- TOC entry 3292 (class 2606 OID 49161)
-- Name: veiculo veiculo_user_iduser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.veiculo
    ADD CONSTRAINT veiculo_user_iduser_fkey FOREIGN KEY (user_iduser) REFERENCES public.cliente(idcliente) ON DELETE CASCADE;


--
-- TOC entry 3293 (class 2606 OID 49185)
-- Name: vendas vendas_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente) ON DELETE CASCADE;


--
-- TOC entry 3294 (class 2606 OID 49180)
-- Name: vendas vendas_idformapagamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: consultas_basicas_owner
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_idformapagamento_fkey FOREIGN KEY (idformapagamento) REFERENCES public.formapagamento(idformapagamento) ON DELETE CASCADE;


--
-- TOC entry 2104 (class 826 OID 32770)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- TOC entry 2103 (class 826 OID 32769)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


-- Completed on 2025-03-04 11:41:57

--
-- PostgreSQL database dump complete
--

