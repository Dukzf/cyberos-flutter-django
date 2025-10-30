--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Ubuntu 17.4-1.pgdg24.04+2)
-- Dumped by pg_dump version 17.4 (Ubuntu 17.4-1.pgdg24.04+2)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id bigint NOT NULL,
    name text
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id bigint,
    permission_id bigint
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id bigint NOT NULL,
    content_type_id bigint,
    codename text,
    name text
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id bigint NOT NULL,
    password text,
    last_login timestamp with time zone,
    is_superuser boolean,
    username text,
    last_name text,
    email text,
    is_staff boolean,
    is_active boolean,
    date_joined timestamp with time zone,
    first_name text
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id bigint,
    group_id bigint
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint,
    permission_id bigint
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: clientes_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes_cliente (
    id bigint NOT NULL,
    nome text,
    tipo text,
    cpf_cnpj text,
    email text,
    telefone text,
    celular text,
    data_nascimento date,
    endereco text,
    numero text,
    complemento text,
    bairro text,
    cidade text,
    estado text,
    cep text,
    observacoes text,
    ativo boolean,
    ultima_atualizacao timestamp with time zone,
    slug text,
    empresa_id bigint,
    data_criacao timestamp with time zone,
    rg_ie text,
    codigo text
);


ALTER TABLE public.clientes_cliente OWNER TO postgres;

--
-- Name: clientes_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_cliente_id_seq OWNER TO postgres;

--
-- Name: clientes_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_cliente_id_seq OWNED BY public.clientes_cliente.id;


--
-- Name: clientes_contratocliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes_contratocliente (
    id bigint NOT NULL,
    arquivo text,
    descricao text,
    data_upload timestamp with time zone,
    cliente_id bigint
);


ALTER TABLE public.clientes_contratocliente OWNER TO postgres;

--
-- Name: clientes_contratocliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_contratocliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_contratocliente_id_seq OWNER TO postgres;

--
-- Name: clientes_contratocliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_contratocliente_id_seq OWNED BY public.clientes_contratocliente.id;


--
-- Name: clientes_contratoempresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes_contratoempresa (
    id bigint NOT NULL,
    descricao text,
    data_inicio date,
    data_fim date,
    valor_mensal numeric,
    observacoes text,
    ativo boolean,
    data_criacao timestamp with time zone,
    ultima_atualizacao timestamp with time zone,
    empresa_id bigint
);


ALTER TABLE public.clientes_contratoempresa OWNER TO postgres;

--
-- Name: clientes_contratoempresa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_contratoempresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_contratoempresa_id_seq OWNER TO postgres;

--
-- Name: clientes_contratoempresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_contratoempresa_id_seq OWNED BY public.clientes_contratoempresa.id;


--
-- Name: clientes_empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes_empresa (
    id bigint NOT NULL,
    nome text,
    cnpj text,
    inscricao_estadual text,
    email text,
    telefone text,
    endereco text,
    numero text,
    complemento text,
    bairro text,
    cidade text,
    estado text,
    cep text,
    ativo boolean,
    logo text,
    slug text,
    data_criacao timestamp with time zone,
    inscricao_municipal text,
    nome_fantasia text,
    site text,
    ultima_atualizacao timestamp with time zone
);


ALTER TABLE public.clientes_empresa OWNER TO postgres;

--
-- Name: clientes_empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_empresa_id_seq OWNER TO postgres;

--
-- Name: clientes_empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_empresa_id_seq OWNED BY public.clientes_empresa.id;


--
-- Name: dashboard_metricadiaria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_metricadiaria (
    id bigint NOT NULL,
    data date,
    total_ordens bigint,
    ordens_abertas bigint,
    ordens_andamento bigint,
    ordens_aguardando bigint,
    ordens_concluidas bigint,
    ordens_canceladas bigint,
    satisfacao_media numeric,
    faturamento_dia numeric,
    tempo_medio_atendimento interval
);


ALTER TABLE public.dashboard_metricadiaria OWNER TO postgres;

--
-- Name: dashboard_metricadiaria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_metricadiaria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dashboard_metricadiaria_id_seq OWNER TO postgres;

--
-- Name: dashboard_metricadiaria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_metricadiaria_id_seq OWNED BY public.dashboard_metricadiaria.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id bigint NOT NULL,
    object_id text,
    object_repr text,
    action_flag smallint,
    change_message text,
    content_type_id bigint,
    user_id bigint,
    action_time timestamp with time zone
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id bigint NOT NULL,
    app_label text,
    model text
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app text,
    name text,
    applied timestamp with time zone
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key text,
    session_data text,
    expire_date timestamp with time zone
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: equipamentos_categoriaequipamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipamentos_categoriaequipamento (
    id bigint NOT NULL,
    nome text,
    descricao text,
    slug text
);


ALTER TABLE public.equipamentos_categoriaequipamento OWNER TO postgres;

--
-- Name: equipamentos_categoriaequipamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipamentos_categoriaequipamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.equipamentos_categoriaequipamento_id_seq OWNER TO postgres;

--
-- Name: equipamentos_categoriaequipamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipamentos_categoriaequipamento_id_seq OWNED BY public.equipamentos_categoriaequipamento.id;


--
-- Name: equipamentos_equipamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipamentos_equipamento (
    id bigint NOT NULL,
    codigo text,
    nome text,
    marca text,
    modelo text,
    numero_serie text,
    data_aquisicao date,
    data_instalacao date,
    data_garantia_fim date,
    status text,
    descricao text,
    observacoes text,
    local_instalacao text,
    especificacoes_tecnicas text,
    data_cadastro timestamp with time zone,
    ultima_atualizacao timestamp with time zone,
    foto text,
    manual text,
    slug text,
    categoria_id bigint,
    cliente_id bigint
);


ALTER TABLE public.equipamentos_equipamento OWNER TO postgres;

--
-- Name: equipamentos_equipamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipamentos_equipamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.equipamentos_equipamento_id_seq OWNER TO postgres;

--
-- Name: equipamentos_equipamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipamentos_equipamento_id_seq OWNED BY public.equipamentos_equipamento.id;


--
-- Name: equipamentos_manutencaoequipamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipamentos_manutencaoequipamento (
    id bigint NOT NULL,
    tipo text,
    data timestamp with time zone,
    descricao text,
    solucao text,
    responsavel text,
    custo numeric,
    equipamento_id bigint,
    ordem_servico_id bigint
);


ALTER TABLE public.equipamentos_manutencaoequipamento OWNER TO postgres;

--
-- Name: equipamentos_manutencaoequipamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipamentos_manutencaoequipamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.equipamentos_manutencaoequipamento_id_seq OWNER TO postgres;

--
-- Name: equipamentos_manutencaoequipamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipamentos_manutencaoequipamento_id_seq OWNED BY public.equipamentos_manutencaoequipamento.id;


--
-- Name: ordens_anexo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordens_anexo (
    id bigint NOT NULL,
    titulo text,
    arquivo text,
    data_upload timestamp with time zone,
    ordem_id bigint
);


ALTER TABLE public.ordens_anexo OWNER TO postgres;

--
-- Name: ordens_anexo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ordens_anexo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ordens_anexo_id_seq OWNER TO postgres;

--
-- Name: ordens_anexo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ordens_anexo_id_seq OWNED BY public.ordens_anexo.id;


--
-- Name: ordens_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordens_categoria (
    id bigint NOT NULL,
    nome text,
    descricao text,
    slug text,
    data_criacao timestamp with time zone
);


ALTER TABLE public.ordens_categoria OWNER TO postgres;

--
-- Name: ordens_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ordens_categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ordens_categoria_id_seq OWNER TO postgres;

--
-- Name: ordens_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ordens_categoria_id_seq OWNED BY public.ordens_categoria.id;


--
-- Name: ordens_comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordens_comentario (
    id bigint NOT NULL,
    autor text,
    texto text,
    data_criacao timestamp with time zone,
    interno boolean,
    ordem_id bigint,
    data_resolucao timestamp with time zone,
    reportando_problema boolean,
    resolvido boolean,
    tipo_autor text,
    tipo_problema text
);


ALTER TABLE public.ordens_comentario OWNER TO postgres;

--
-- Name: ordens_comentario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ordens_comentario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ordens_comentario_id_seq OWNER TO postgres;

--
-- Name: ordens_comentario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ordens_comentario_id_seq OWNED BY public.ordens_comentario.id;


--
-- Name: ordens_ordemservico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordens_ordemservico (
    id bigint NOT NULL,
    numero text,
    descricao text,
    solucao text,
    data_abertura timestamp with time zone,
    data_agendamento timestamp with time zone,
    data_inicio timestamp with time zone,
    data_conclusao timestamp with time zone,
    status text,
    prioridade text,
    endereco text,
    numero_endereco text,
    complemento text,
    bairro text,
    cidade text,
    estado text,
    cep text,
    valor_servico numeric,
    valor_pecas numeric,
    valor_deslocamento numeric,
    desconto numeric,
    valor_total numeric,
    slug text,
    categoria_id bigint,
    cliente_id bigint,
    tecnico_id bigint,
    ativa boolean,
    atualizado_por text,
    avaliacao_cliente smallint,
    comentario_cliente text,
    criado_por text,
    latitude_fim real,
    latitude_inicio real,
    link_pagamento text,
    longitude_fim real,
    longitude_inicio real,
    observacoes_internas text,
    precisao_fim real,
    precisao_inicio real,
    preferencia_contato text,
    id_tecnico bigint,
    nome_tecnico text,
    equipamento_id bigint,
    assinatura_cliente text
);


ALTER TABLE public.ordens_ordemservico OWNER TO postgres;

--
-- Name: ordens_ordemservico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ordens_ordemservico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ordens_ordemservico_id_seq OWNER TO postgres;

--
-- Name: ordens_ordemservico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ordens_ordemservico_id_seq OWNED BY public.ordens_ordemservico.id;


--
-- Name: ordens_produtoutilizado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ordens_produtoutilizado (
    id bigint NOT NULL,
    quantidade numeric,
    preco_unitario numeric,
    ordem_servico_id bigint,
    produto_id bigint
);


ALTER TABLE public.ordens_produtoutilizado OWNER TO postgres;

--
-- Name: ordens_produtoutilizado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ordens_produtoutilizado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ordens_produtoutilizado_id_seq OWNER TO postgres;

--
-- Name: ordens_produtoutilizado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ordens_produtoutilizado_id_seq OWNED BY public.ordens_produtoutilizado.id;


--
-- Name: produtos_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos_categoria (
    id bigint NOT NULL,
    nome text,
    descricao text,
    slug text
);


ALTER TABLE public.produtos_categoria OWNER TO postgres;

--
-- Name: produtos_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produtos_categoria_id_seq OWNER TO postgres;

--
-- Name: produtos_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_categoria_id_seq OWNED BY public.produtos_categoria.id;


--
-- Name: produtos_movimentacaoestoque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos_movimentacaoestoque (
    id bigint NOT NULL,
    tipo text,
    quantidade integer,
    data timestamp with time zone,
    observacao text,
    ordem_servico_id bigint,
    usuario_id bigint,
    produto_id bigint
);


ALTER TABLE public.produtos_movimentacaoestoque OWNER TO postgres;

--
-- Name: produtos_movimentacaoestoque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_movimentacaoestoque_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produtos_movimentacaoestoque_id_seq OWNER TO postgres;

--
-- Name: produtos_movimentacaoestoque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_movimentacaoestoque_id_seq OWNED BY public.produtos_movimentacaoestoque.id;


--
-- Name: produtos_produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos_produto (
    id bigint NOT NULL,
    codigo text,
    nome text,
    descricao text,
    preco_custo numeric,
    preco_venda numeric,
    estoque_atual integer,
    estoque_minimo integer,
    imagem text,
    observacoes text,
    ativo boolean,
    data_cadastro timestamp with time zone,
    ultima_atualizacao timestamp with time zone,
    slug text,
    categoria_id bigint,
    unidade_id bigint
);


ALTER TABLE public.produtos_produto OWNER TO postgres;

--
-- Name: produtos_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produtos_produto_id_seq OWNER TO postgres;

--
-- Name: produtos_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_produto_id_seq OWNED BY public.produtos_produto.id;


--
-- Name: produtos_unidademedida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos_unidademedida (
    id bigint NOT NULL,
    sigla text,
    nome text
);


ALTER TABLE public.produtos_unidademedida OWNER TO postgres;

--
-- Name: produtos_unidademedida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_unidademedida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produtos_unidademedida_id_seq OWNER TO postgres;

--
-- Name: produtos_unidademedida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_unidademedida_id_seq OWNED BY public.produtos_unidademedida.id;


--
-- Name: tecnicos_localizacaoatendimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tecnicos_localizacaoatendimento (
    id bigint NOT NULL,
    latitude real,
    longitude real,
    data_hora timestamp with time zone,
    tipo text,
    precisao real,
    ordem_servico_id bigint,
    tecnico_id bigint
);


ALTER TABLE public.tecnicos_localizacaoatendimento OWNER TO postgres;

--
-- Name: tecnicos_localizacaoatendimento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tecnicos_localizacaoatendimento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tecnicos_localizacaoatendimento_id_seq OWNER TO postgres;

--
-- Name: tecnicos_localizacaoatendimento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tecnicos_localizacaoatendimento_id_seq OWNED BY public.tecnicos_localizacaoatendimento.id;


--
-- Name: tecnicos_registroponto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tecnicos_registroponto (
    id bigint NOT NULL,
    tipo text,
    data_hora timestamp with time zone,
    latitude real,
    longitude real,
    precisao real,
    observacao text,
    ip text,
    tecnico_id bigint
);


ALTER TABLE public.tecnicos_registroponto OWNER TO postgres;

--
-- Name: tecnicos_registroponto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tecnicos_registroponto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tecnicos_registroponto_id_seq OWNER TO postgres;

--
-- Name: tecnicos_registroponto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tecnicos_registroponto_id_seq OWNED BY public.tecnicos_registroponto.id;


--
-- Name: tecnicos_tecnico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tecnicos_tecnico (
    id bigint NOT NULL,
    codigo text,
    nome_completo text,
    cpf text,
    rg text,
    data_nascimento date,
    telefone text,
    celular text,
    email text,
    endereco text,
    numero text,
    complemento text,
    bairro text,
    cidade text,
    estado text,
    cep text,
    latitude real,
    longitude real,
    ultima_atualizacao_local timestamp with time zone,
    nivel text,
    especialidade text,
    status text,
    data_admissao date,
    data_demissao date,
    certificacoes text,
    habilidades text,
    foto text,
    observacoes text,
    ativo boolean,
    slug text,
    usuario_id bigint,
    data_criacao timestamp with time zone,
    data_atualizacao timestamp with time zone
);


ALTER TABLE public.tecnicos_tecnico OWNER TO postgres;

--
-- Name: tecnicos_tecnico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tecnicos_tecnico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tecnicos_tecnico_id_seq OWNER TO postgres;

--
-- Name: tecnicos_tecnico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tecnicos_tecnico_id_seq OWNED BY public.tecnicos_tecnico.id;


--
-- Name: usuarios_grupopermissao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_grupopermissao (
    id bigint NOT NULL,
    nome text,
    descricao text,
    data_criacao timestamp with time zone,
    ultima_atualizacao timestamp with time zone
);


ALTER TABLE public.usuarios_grupopermissao OWNER TO postgres;

--
-- Name: usuarios_grupopermissao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_grupopermissao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_grupopermissao_id_seq OWNER TO postgres;

--
-- Name: usuarios_grupopermissao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_grupopermissao_id_seq OWNED BY public.usuarios_grupopermissao.id;


--
-- Name: usuarios_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_menu (
    id bigint NOT NULL,
    nome text,
    descricao text,
    url text,
    icone text,
    ordem bigint,
    ativo boolean,
    data_criacao timestamp with time zone,
    ultima_atualizacao timestamp with time zone,
    codigo text,
    menu_pai_id bigint
);


ALTER TABLE public.usuarios_menu OWNER TO postgres;

--
-- Name: usuarios_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_menu_id_seq OWNER TO postgres;

--
-- Name: usuarios_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_menu_id_seq OWNED BY public.usuarios_menu.id;


--
-- Name: usuarios_perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_perfil (
    id bigint NOT NULL,
    tipo text,
    telefone text,
    cargo text,
    foto text,
    bio text,
    ultimo_acesso timestamp with time zone,
    data_criacao timestamp with time zone,
    ultima_atualizacao timestamp with time zone,
    user_id bigint
);


ALTER TABLE public.usuarios_perfil OWNER TO postgres;

--
-- Name: usuarios_perfil_grupos_permissao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_perfil_grupos_permissao (
    id bigint NOT NULL,
    perfil_id bigint,
    grupopermissao_id bigint
);


ALTER TABLE public.usuarios_perfil_grupos_permissao OWNER TO postgres;

--
-- Name: usuarios_perfil_grupos_permissao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_perfil_grupos_permissao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_perfil_grupos_permissao_id_seq OWNER TO postgres;

--
-- Name: usuarios_perfil_grupos_permissao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_perfil_grupos_permissao_id_seq OWNED BY public.usuarios_perfil_grupos_permissao.id;


--
-- Name: usuarios_perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_perfil_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_perfil_id_seq OWNER TO postgres;

--
-- Name: usuarios_perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_perfil_id_seq OWNED BY public.usuarios_perfil.id;


--
-- Name: usuarios_perfil_permissoes_customizadas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_perfil_permissoes_customizadas (
    id bigint NOT NULL,
    perfil_id bigint,
    permissao_id bigint
);


ALTER TABLE public.usuarios_perfil_permissoes_customizadas OWNER TO postgres;

--
-- Name: usuarios_perfil_permissoes_customizadas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_perfil_permissoes_customizadas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_perfil_permissoes_customizadas_id_seq OWNER TO postgres;

--
-- Name: usuarios_perfil_permissoes_customizadas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_perfil_permissoes_customizadas_id_seq OWNED BY public.usuarios_perfil_permissoes_customizadas.id;


--
-- Name: usuarios_permissao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_permissao (
    id bigint NOT NULL,
    acoes text,
    data_criacao timestamp with time zone,
    ultima_atualizacao timestamp with time zone,
    grupo_id bigint,
    menu_id bigint,
    perfil_id bigint
);


ALTER TABLE public.usuarios_permissao OWNER TO postgres;

--
-- Name: usuarios_permissao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_permissao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_permissao_id_seq OWNER TO postgres;

--
-- Name: usuarios_permissao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_permissao_id_seq OWNED BY public.usuarios_permissao.id;


--
-- Name: usuarios_permissaomenu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_permissaomenu (
    id bigint NOT NULL,
    nivel_acesso text,
    menu_id bigint,
    perfil_id bigint
);


ALTER TABLE public.usuarios_permissaomenu OWNER TO postgres;

--
-- Name: usuarios_permissaomenu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_permissaomenu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_permissaomenu_id_seq OWNER TO postgres;

--
-- Name: usuarios_permissaomenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_permissaomenu_id_seq OWNED BY public.usuarios_permissaomenu.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: clientes_cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes_cliente ALTER COLUMN id SET DEFAULT nextval('public.clientes_cliente_id_seq'::regclass);


--
-- Name: clientes_contratocliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes_contratocliente ALTER COLUMN id SET DEFAULT nextval('public.clientes_contratocliente_id_seq'::regclass);


--
-- Name: clientes_contratoempresa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes_contratoempresa ALTER COLUMN id SET DEFAULT nextval('public.clientes_contratoempresa_id_seq'::regclass);


--
-- Name: clientes_empresa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes_empresa ALTER COLUMN id SET DEFAULT nextval('public.clientes_empresa_id_seq'::regclass);


--
-- Name: dashboard_metricadiaria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_metricadiaria ALTER COLUMN id SET DEFAULT nextval('public.dashboard_metricadiaria_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: equipamentos_categoriaequipamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamentos_categoriaequipamento ALTER COLUMN id SET DEFAULT nextval('public.equipamentos_categoriaequipamento_id_seq'::regclass);


--
-- Name: equipamentos_equipamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamentos_equipamento ALTER COLUMN id SET DEFAULT nextval('public.equipamentos_equipamento_id_seq'::regclass);


--
-- Name: equipamentos_manutencaoequipamento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamentos_manutencaoequipamento ALTER COLUMN id SET DEFAULT nextval('public.equipamentos_manutencaoequipamento_id_seq'::regclass);


--
-- Name: ordens_anexo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordens_anexo ALTER COLUMN id SET DEFAULT nextval('public.ordens_anexo_id_seq'::regclass);


--
-- Name: ordens_categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordens_categoria ALTER COLUMN id SET DEFAULT nextval('public.ordens_categoria_id_seq'::regclass);


--
-- Name: ordens_comentario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordens_comentario ALTER COLUMN id SET DEFAULT nextval('public.ordens_comentario_id_seq'::regclass);


--
-- Name: ordens_ordemservico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordens_ordemservico ALTER COLUMN id SET DEFAULT nextval('public.ordens_ordemservico_id_seq'::regclass);


--
-- Name: ordens_produtoutilizado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ordens_produtoutilizado ALTER COLUMN id SET DEFAULT nextval('public.ordens_produtoutilizado_id_seq'::regclass);


--
-- Name: produtos_categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_categoria ALTER COLUMN id SET DEFAULT nextval('public.produtos_categoria_id_seq'::regclass);


--
-- Name: produtos_movimentacaoestoque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_movimentacaoestoque ALTER COLUMN id SET DEFAULT nextval('public.produtos_movimentacaoestoque_id_seq'::regclass);


--
-- Name: produtos_produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_produto ALTER COLUMN id SET DEFAULT nextval('public.produtos_produto_id_seq'::regclass);


--
-- Name: produtos_unidademedida id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos_unidademedida ALTER COLUMN id SET DEFAULT nextval('public.produtos_unidademedida_id_seq'::regclass);


--
-- Name: tecnicos_localizacaoatendimento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tecnicos_localizacaoatendimento ALTER COLUMN id SET DEFAULT nextval('public.tecnicos_localizacaoatendimento_id_seq'::regclass);


--
-- Name: tecnicos_registroponto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tecnicos_registroponto ALTER COLUMN id SET DEFAULT nextval('public.tecnicos_registroponto_id_seq'::regclass);


--
-- Name: tecnicos_tecnico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tecnicos_tecnico ALTER COLUMN id SET DEFAULT nextval('public.tecnicos_tecnico_id_seq'::regclass);


--
-- Name: usuarios_grupopermissao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_grupopermissao ALTER COLUMN id SET DEFAULT nextval('public.usuarios_grupopermissao_id_seq'::regclass);


--
-- Name: usuarios_menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_menu ALTER COLUMN id SET DEFAULT nextval('public.usuarios_menu_id_seq'::regclass);


--
-- Name: usuarios_perfil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_perfil ALTER COLUMN id SET DEFAULT nextval('public.usuarios_perfil_id_seq'::regclass);


--
-- Name: usuarios_perfil_grupos_permissao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_perfil_grupos_permissao ALTER COLUMN id SET DEFAULT nextval('public.usuarios_perfil_grupos_permissao_id_seq'::regclass);


--
-- Name: usuarios_perfil_permissoes_customizadas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_perfil_permissoes_customizadas ALTER COLUMN id SET DEFAULT nextval('public.usuarios_perfil_permissoes_customizadas_id_seq'::regclass);


--
-- Name: usuarios_permissao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_permissao ALTER COLUMN id SET DEFAULT nextval('public.usuarios_permissao_id_seq'::regclass);


--
-- Name: usuarios_permissaomenu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_permissaomenu ALTER COLUMN id SET DEFAULT nextval('public.usuarios_permissaomenu_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, content_type_id, codename, name) FROM stdin;
1	1	add_logentry	Can add log entry
2	1	change_logentry	Can change log entry
3	1	delete_logentry	Can delete log entry
4	1	view_logentry	Can view log entry
5	2	add_permission	Can add permission
6	2	change_permission	Can change permission
7	2	delete_permission	Can delete permission
8	2	view_permission	Can view permission
9	3	add_group	Can add group
10	3	change_group	Can change group
11	3	delete_group	Can delete group
12	3	view_group	Can view group
13	4	add_user	Can add user
14	4	change_user	Can change user
15	4	delete_user	Can delete user
16	4	view_user	Can view user
17	5	add_contenttype	Can add content type
18	5	change_contenttype	Can change content type
19	5	delete_contenttype	Can delete content type
20	5	view_contenttype	Can view content type
21	6	add_session	Can add session
22	6	change_session	Can change session
23	6	delete_session	Can delete session
24	6	view_session	Can view session
25	7	add_metricadiaria	Can add Métrica Diária
26	7	change_metricadiaria	Can change Métrica Diária
27	7	delete_metricadiaria	Can delete Métrica Diária
28	7	view_metricadiaria	Can view Métrica Diária
29	8	add_categoria	Can add Categoria
30	8	change_categoria	Can change Categoria
31	8	delete_categoria	Can delete Categoria
32	8	view_categoria	Can view Categoria
33	9	add_ordemservico	Can add Ordem de Serviço
34	9	change_ordemservico	Can change Ordem de Serviço
35	9	delete_ordemservico	Can delete Ordem de Serviço
36	9	view_ordemservico	Can view Ordem de Serviço
37	10	add_comentario	Can add Comentário
38	10	change_comentario	Can change Comentário
39	10	delete_comentario	Can delete Comentário
40	10	view_comentario	Can view Comentário
41	11	add_anexo	Can add Anexo
42	11	change_anexo	Can change Anexo
43	11	delete_anexo	Can delete Anexo
44	11	view_anexo	Can view Anexo
45	12	add_produtoutilizado	Can add Produto Utilizado na OS
46	12	change_produtoutilizado	Can change Produto Utilizado na OS
47	12	delete_produtoutilizado	Can delete Produto Utilizado na OS
48	12	view_produtoutilizado	Can view Produto Utilizado na OS
49	13	add_cliente	Can add Cliente
50	13	change_cliente	Can change Cliente
51	13	delete_cliente	Can delete Cliente
52	13	view_cliente	Can view Cliente
53	14	add_contratocliente	Can add Contrato de Cliente
54	14	change_contratocliente	Can change Contrato de Cliente
55	14	delete_contratocliente	Can delete Contrato de Cliente
56	14	view_contratocliente	Can view Contrato de Cliente
57	15	add_empresa	Can add Empresa
58	15	change_empresa	Can change Empresa
59	15	delete_empresa	Can delete Empresa
60	15	view_empresa	Can view Empresa
61	16	add_contratoempresa	Can add Contrato
62	16	change_contratoempresa	Can change Contrato
63	16	delete_contratoempresa	Can delete Contrato
64	16	view_contratoempresa	Can view Contrato
65	17	add_tecnico	Can add Técnico
66	17	change_tecnico	Can change Técnico
67	17	delete_tecnico	Can delete Técnico
68	17	view_tecnico	Can view Técnico
69	18	add_localizacaoatendimento	Can add Localização de Atendimento
70	18	change_localizacaoatendimento	Can change Localização de Atendimento
71	18	delete_localizacaoatendimento	Can delete Localização de Atendimento
72	18	view_localizacaoatendimento	Can view Localização de Atendimento
73	19	add_registroponto	Can add Registro de Ponto
74	19	change_registroponto	Can change Registro de Ponto
75	19	delete_registroponto	Can delete Registro de Ponto
76	19	view_registroponto	Can view Registro de Ponto
77	20	add_categoria	Can add Categoria
78	20	change_categoria	Can change Categoria
79	20	delete_categoria	Can delete Categoria
80	20	view_categoria	Can view Categoria
81	21	add_produto	Can add Produto
82	21	change_produto	Can change Produto
83	21	delete_produto	Can delete Produto
84	21	view_produto	Can view Produto
85	22	add_movimentacaoestoque	Can add Movimentação de Estoque
86	22	change_movimentacaoestoque	Can change Movimentação de Estoque
87	22	delete_movimentacaoestoque	Can delete Movimentação de Estoque
88	22	view_movimentacaoestoque	Can view Movimentação de Estoque
89	23	add_unidademedida	Can add Unidade de Medida
90	23	change_unidademedida	Can change Unidade de Medida
91	23	delete_unidademedida	Can delete Unidade de Medida
92	23	view_unidademedida	Can view Unidade de Medida
93	24	add_categoriaequipamento	Can add Categoria de Equipamento
94	24	change_categoriaequipamento	Can change Categoria de Equipamento
95	24	delete_categoriaequipamento	Can delete Categoria de Equipamento
96	24	view_categoriaequipamento	Can view Categoria de Equipamento
97	25	add_equipamento	Can add Equipamento
98	25	change_equipamento	Can change Equipamento
99	25	delete_equipamento	Can delete Equipamento
100	25	view_equipamento	Can view Equipamento
101	26	add_manutencaoequipamento	Can add Manutenção de Equipamento
102	26	change_manutencaoequipamento	Can change Manutenção de Equipamento
103	26	delete_manutencaoequipamento	Can delete Manutenção de Equipamento
104	26	view_manutencaoequipamento	Can view Manutenção de Equipamento
105	27	add_grupopermissao	Can add Grupo de Permissão
106	27	change_grupopermissao	Can change Grupo de Permissão
107	27	delete_grupopermissao	Can delete Grupo de Permissão
108	27	view_grupopermissao	Can view Grupo de Permissão
109	28	add_menu	Can add menu
110	28	change_menu	Can change menu
111	28	delete_menu	Can delete menu
112	28	view_menu	Can view menu
113	29	add_permissao	Can add permissao
114	29	change_permissao	Can change permissao
115	29	delete_permissao	Can delete permissao
116	29	view_permissao	Can view permissao
117	30	add_perfil	Can add Perfil
118	30	change_perfil	Can change Perfil
119	30	delete_perfil	Can delete Perfil
120	30	view_perfil	Can view Perfil
121	31	add_permissaomenu	Can add Permissão de Menu
122	31	change_permissaomenu	Can change Permissão de Menu
123	31	delete_permissaomenu	Can delete Permissão de Menu
124	31	view_permissaomenu	Can view Permissão de Menu
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, last_name, email, is_staff, is_active, date_joined, first_name) FROM stdin;
3	pbkdf2_sha256$1000000$6TczaY3tPYpzXeAMx5Qt4N$qAlNeVO5DEG/xLVQH30PBuCQjv80qq4oEiVoNM9bY0o=	2025-04-23 20:28:28.366447-03	f	igor.queiroz	igor	igor@hotmail.com	f	t	2025-04-23 20:21:23.837732-03	igor
5	pbkdf2_sha256$1000000$H4AIoD1gMt402DXkgbxOJ5$dpXhx8aawLiFKoabJ9rEnMSX/aghH8NGrMAFmhxOBHU=	2025-04-25 10:56:07.403832-03	f	eduardo	felix	eduardo@gmail.com	f	t	2025-04-24 21:04:03.752074-03	eduardo
6	pbkdf2_sha256$1000000$8bKvqcB65715p63OThvL6O$2Sfb/kAvpirxH8t4ZZohHIwmmbI1bd5jvAqWqFYaAIk=	\N	f	mauricio.moraes	ALENCAR	mauriciom.alencar@gmail.com	f	t	2025-04-25 12:36:07.271479-03	MAURICIO
1	pbkdf2_sha256$1000000$Tkz48yaHXNUz1rGnvXwPzy$TN0+HfvMt+Ln3doFoBdZKmfOfixkAhLDJ9NUv2Vm7KY=	2025-04-30 10:29:43.941107-03	t	admin		admin@admin.com	t	t	2025-04-23 19:38:45.282523-03	
7	pbkdf2_sha256$1000000$t3rynYhWSHLwgeMBJhEQb9$88J+sLuLyrQmW5FoLJN/T2mpQ4QqunUQAPcnfjSqdPE=	\N	f	marcelo	DE ALENCAR	teste@gmail.com	f	t	2025-04-30 10:38:13.566635-03	MARCELO
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: clientes_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes_cliente (id, nome, tipo, cpf_cnpj, email, telefone, celular, data_nascimento, endereco, numero, complemento, bairro, cidade, estado, cep, observacoes, ativo, ultima_atualizacao, slug, empresa_id, data_criacao, rg_ie, codigo) FROM stdin;
1	MAURICIO ALENCAR	PF	229.419.418-78	mauriciom.alencar@gmail.com	(11) 9838-7456	(11) 97389-7387	\N	Avenida Riviera	153		Flamingo	Embu-Guaçu	SP	06910-690		t	2025-04-24 14:52:10.629444-03	mauricio-alencar	\N	2025-04-24 14:52:10.629053-03	\N	\N
4	bps	PJ	11.685.612/0001-81	mauriciom.alencar@gmail.com	(11) 9838-7456	(11) 97389-7387	\N	Avenida Riviera	153		Flamingo	Embu-Guaçu	SP	06910-690		t	2025-04-24 15:37:53.499251-03	bps	\N	2025-04-24 15:37:53.498428-03	\N	CLI20250001
5	Marcelo Alencar	PJ	58.514.030/0001-04	teste@gmail.com	(11) 9957-9630	(11) 99579-6300	\N	Avenida Riviera	153		Flamingo	Embu-Guaçu	SP	06910-690		t	2025-04-30 10:25:10.464653-03	marcelo-moraes-de-alencar	\N	2025-04-30 09:04:13.025573-03	\N	CLI20250002
\.


--
-- Data for Name: clientes_contratocliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes_contratocliente (id, arquivo, descricao, data_upload, cliente_id) FROM stdin;
\.


--
-- Data for Name: clientes_contratoempresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes_contratoempresa (id, descricao, data_inicio, data_fim, valor_mensal, observacoes, ativo, data_criacao, ultima_atualizacao, empresa_id) FROM stdin;
\.


--
-- Data for Name: clientes_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes_empresa (id, nome, cnpj, inscricao_estadual, email, telefone, endereco, numero, complemento, bairro, cidade, estado, cep, ativo, logo, slug, data_criacao, inscricao_municipal, nome_fantasia, site, ultima_atualizacao) FROM stdin;
\.


--
-- Data for Name: dashboard_metricadiaria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard_metricadiaria (id, data, total_ordens, ordens_abertas, ordens_andamento, ordens_aguardando, ordens_concluidas, ordens_canceladas, satisfacao_media, faturamento_dia, tempo_medio_atendimento) FROM stdin;
1	2025-04-23	0	0	0	0	0	0	0	0	00:00:00
2	2025-04-24	2	2	0	0	0	0	0	0	00:00:00
3	2025-04-25	2	2	0	0	0	0	0	0	00:00:00
4	2025-04-30	2	2	0	0	0	0	0	0	00:00:00
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, object_id, object_repr, action_flag, change_message, content_type_id, user_id, action_time) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	dashboard	metricadiaria
8	ordens	categoria
9	ordens	ordemservico
10	ordens	comentario
11	ordens	anexo
12	ordens	produtoutilizado
13	clientes	cliente
14	clientes	contratocliente
15	clientes	empresa
16	clientes	contratoempresa
17	tecnicos	tecnico
18	tecnicos	localizacaoatendimento
19	tecnicos	registroponto
20	produtos	categoria
21	produtos	produto
22	produtos	movimentacaoestoque
23	produtos	unidademedida
24	equipamentos	categoriaequipamento
25	equipamentos	equipamento
26	equipamentos	manutencaoequipamento
27	usuarios	grupopermissao
28	usuarios	menu
29	usuarios	permissao
30	usuarios	perfil
31	usuarios	permissaomenu
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-04-23 19:32:50.123191-03
2	auth	0001_initial	2025-04-23 19:32:50.142138-03
3	admin	0001_initial	2025-04-23 19:32:50.157112-03
4	admin	0002_logentry_remove_auto_add	2025-04-23 19:32:50.170662-03
5	admin	0003_logentry_add_action_flag_choices	2025-04-23 19:32:50.180155-03
6	contenttypes	0002_remove_content_type_name	2025-04-23 19:32:50.20076-03
7	auth	0002_alter_permission_name_max_length	2025-04-23 19:32:50.214567-03
8	auth	0003_alter_user_email_max_length	2025-04-23 19:32:50.227081-03
9	auth	0004_alter_user_username_opts	2025-04-23 19:32:50.236141-03
10	auth	0005_alter_user_last_login_null	2025-04-23 19:32:50.249275-03
11	auth	0006_require_contenttypes_0002	2025-04-23 19:32:50.252838-03
12	auth	0007_alter_validators_add_error_messages	2025-04-23 19:32:50.263049-03
13	auth	0008_alter_user_username_max_length	2025-04-23 19:32:50.282262-03
14	auth	0009_alter_user_last_name_max_length	2025-04-23 19:32:50.294302-03
15	auth	0010_alter_group_name_max_length	2025-04-23 19:32:50.309654-03
16	auth	0011_update_proxy_permissions	2025-04-23 19:32:50.318344-03
17	auth	0012_alter_user_first_name_max_length	2025-04-23 19:32:50.332331-03
18	clientes	0001_initial	2025-04-23 19:32:50.339259-03
19	clientes	0002_cliente_codigo	2025-04-23 19:32:50.349786-03
20	clientes	0003_contratocliente	2025-04-23 19:32:50.360773-03
21	clientes	0004_empresa	2025-04-23 19:32:50.368293-03
22	clientes	0005_clienteusuario_delete_empresa	2025-04-23 19:32:50.387253-03
23	clientes	0006_empresa_alter_cliente_bairro_alter_cliente_celular_and_more	2025-04-23 19:32:50.553247-03
24	clientes	0007_alter_clienteusuario_empresa	2025-04-23 19:32:50.571373-03
25	clientes	0008_auto_20250423_1143	2025-04-23 19:32:50.576071-03
26	clientes	0009_remove_cliente_codigo_remove_cliente_data_cadastro_and_more	2025-04-23 19:32:50.936959-03
27	dashboard	0001_initial	2025-04-23 19:32:50.942061-03
28	tecnicos	0001_initial	2025-04-23 19:32:50.954179-03
29	ordens	0001_initial	2025-04-23 19:32:51.004094-03
30	ordens	0002_categoria_slug	2025-04-23 19:32:51.012556-03
31	ordens	0003_remove_ordemservico_avaliacao_and_more	2025-04-23 19:32:51.392021-03
32	ordens	0004_ordemservico_id_tecnico_ordemservico_nome_tecnico	2025-04-23 19:32:51.424486-03
33	ordens	0005_comentario_data_resolucao_and_more	2025-04-23 19:32:51.490231-03
34	produtos	0001_initial	2025-04-23 19:32:51.524015-03
35	produtos	0002_unidademedida_and_more	2025-04-23 19:32:51.616031-03
36	ordens	0006_produtoutilizado_ordemservico_produtos	2025-04-23 19:32:51.663564-03
37	equipamentos	0001_initial	2025-04-23 19:32:51.719311-03
38	ordens	0007_ordemservico_equipamento	2025-04-23 19:32:51.757613-03
39	ordens	0008_categoria_data_criacao	2025-04-23 19:32:51.768429-03
40	sessions	0001_initial	2025-04-23 19:32:51.777021-03
41	tecnicos	0002_localizacaoatendimento	2025-04-23 19:32:51.806833-03
42	tecnicos	0003_registroponto	2025-04-23 19:32:51.837415-03
43	usuarios	0001_initial	2025-04-23 19:32:51.914808-03
44	usuarios	0002_menu_codigo	2025-04-23 19:52:06.138207-03
45	usuarios	0003_alter_permissao_unique_together_permissao_perfil_and_more	2025-04-23 20:17:12.070314-03
46	clientes	0010_cliente_codigo	2025-04-24 15:35:48.332691-03
51	tecnicos	0004_tecnico_data_campos	2025-04-24 15:30:02-03
52	tecnicos	0005_remove_tecnico_data_cadastro_and_more	2025-04-24 18:34:11.454226-03
53	ordens	0009_ordemservico_assinatura_cliente	2025-04-30 10:18:53.573148-03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
moqgkcx3cflx48bkvi3twde06dlkfo9l	.eJxVjEEOwiAQRe_C2hCgwIBL956BDMxUqoYmpV0Z765NutDtf-_9l0i4rTVtnZc0kTgLLU6_W8by4LYDumO7zbLMbV2mLHdFHrTL60z8vBzu30HFXr-1B-XtGOPgjGMcA1untYKIoEFFn61m9EMokVwMlpQxCoFsActICCjeH7EmNx8:1u8I2D:W1Lp4n-BrDVj18kgnq5nVso2s23_j4aR7oJSCDDScwg	2025-05-09 12:20:01.727356-03
j195mof4ibblhz0vek0nbxljc6kiionb	.eJxVjEEOwiAQRe_C2hCgwIBL956BDMxUqoYmpV0Z765NutDtf-_9l0i4rTVtnZc0kTgLLU6_W8by4LYDumO7zbLMbV2mLHdFHrTL60z8vBzu30HFXr-1B-XtGOPgjGMcA1untYKIoEFFn61m9EMokVwMlpQxCoFsActICCjeH7EmNx8:1uA5yP:RIxCoNEzUd6Fol1hBqZB9ZhYxuBzeyvm1DpsHD839Es	2025-05-14 08:51:33.750325-03
gwgouzayz640ts36nmyvz6w0h16n5amm	.eJxVjEEOwiAQRe_C2hCgwIBL956BDMxUqoYmpV0Z765NutDtf-_9l0i4rTVtnZc0kTgLLU6_W8by4LYDumO7zbLMbV2mLHdFHrTL60z8vBzu30HFXr-1B-XtGOPgjGMcA1untYKIoEFFn61m9EMokVwMlpQxCoFsActICCjeH7EmNx8:1uA7VP:Pz5Giu71MvhgkkHHf0w3NPWiwAdOTsPNP1YwUBsQYOs	2025-05-14 10:29:43.943871-03
\.


--
-- Data for Name: equipamentos_categoriaequipamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipamentos_categoriaequipamento (id, nome, descricao, slug) FROM stdin;
1	HARDWARE	TESTE	hardware
\.


--
-- Data for Name: equipamentos_equipamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipamentos_equipamento (id, codigo, nome, marca, modelo, numero_serie, data_aquisicao, data_instalacao, data_garantia_fim, status, descricao, observacoes, local_instalacao, especificacoes_tecnicas, data_cadastro, ultima_atualizacao, foto, manual, slug, categoria_id, cliente_id) FROM stdin;
1	EQP2025040001	FONTE				\N	\N	\N	ativo					2025-04-24 14:55:43.788068-03	2025-04-24 20:26:12.420395-03	equipamentos/FONTE_zshMG73.jpg	equipamentos/manuais/computador_IJl44XI.png	mauricio-alencar-fonte-eqp2025040001	1	1
2	EQP2025040002	FONTE atx				\N	\N	\N	ativo					2025-04-24 15:48:36.499575-03	2025-04-24 20:28:33.539571-03	equipamentos/hydro.jpg	equipamentos/manuais/FONTE.jpg	bps-fonte-atx-eqp2025040002	1	4
3	EQP2025040003	Computador	DELL		13181981981981N	\N	\N	\N	ativo					2025-04-24 20:11:51.030376-03	2025-04-24 20:26:26.402751-03	equipamentos/computador.png	equipamentos/manuais/computador_IdsB4rC.png	bps-computador-eqp2025040003	1	4
\.


--
-- Data for Name: equipamentos_manutencaoequipamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipamentos_manutencaoequipamento (id, tipo, data, descricao, solucao, responsavel, custo, equipamento_id, ordem_servico_id) FROM stdin;
\.


--
-- Data for Name: ordens_anexo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ordens_anexo (id, titulo, arquivo, data_upload, ordem_id) FROM stdin;
\.


--
-- Data for Name: ordens_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ordens_categoria (id, nome, descricao, slug, data_criacao) FROM stdin;
1	HARDWARE	TESTE	hardware	2025-04-23 19:43:31.948303-03
\.


--
-- Data for Name: ordens_comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ordens_comentario (id, autor, texto, data_criacao, interno, ordem_id, data_resolucao, reportando_problema, resolvido, tipo_autor, tipo_problema) FROM stdin;
\.


--
-- Data for Name: ordens_ordemservico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ordens_ordemservico (id, numero, descricao, solucao, data_abertura, data_agendamento, data_inicio, data_conclusao, status, prioridade, endereco, numero_endereco, complemento, bairro, cidade, estado, cep, valor_servico, valor_pecas, valor_deslocamento, desconto, valor_total, slug, categoria_id, cliente_id, tecnico_id, ativa, atualizado_por, avaliacao_cliente, comentario_cliente, criado_por, latitude_fim, latitude_inicio, link_pagamento, longitude_fim, longitude_inicio, observacoes_internas, precisao_fim, precisao_inicio, preferencia_contato, id_tecnico, nome_tecnico, equipamento_id, assinatura_cliente) FROM stdin;
3	OS2025040002	teste		2025-04-24 21:08:01.846464-03	\N	\N	\N	aberta	media	Avenida Riviera	153	\N	Flamingo	Embu-Guaçu	SP	06910-690	0	80	0	0	80	os-os2025040002	1	4	3	f	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	3	eduardo felix	\N	\N
4	OS2025040003	Substituição de peças		2025-04-25 12:47:43.08649-03	2025-04-26 16:48:00-03	\N	\N	aberta	media	Avenida Riviera	153	\N	Flamingo	Embu-Guaçu	SP	06910-690	0	0	0	0	0	os-os2025040003	1	4	4	f	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	4	MAURICIO ALENCAR	2	\N
\.


--
-- Data for Name: ordens_produtoutilizado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ordens_produtoutilizado (id, quantidade, preco_unitario, ordem_servico_id, produto_id) FROM stdin;
3	1	80	3	1
\.


--
-- Data for Name: produtos_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos_categoria (id, nome, descricao, slug) FROM stdin;
1	HARDWARE		hardware
\.


--
-- Data for Name: produtos_movimentacaoestoque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos_movimentacaoestoque (id, tipo, quantidade, data, observacao, ordem_servico_id, usuario_id, produto_id) FROM stdin;
1	entrada	3	2025-04-24 15:40:53.620703-03	Estoque inicial	\N	1	1
2	saida	1	2025-04-24 15:49:43.463517-03	Utilizado na OS #OS2025040001	\N	1	1
3	saida	1	2025-04-24 20:04:51.895383-03	Utilizado na OS #OS2025040002	\N	1	1
4	saida	1	2025-04-25 12:33:53.097855-03	Utilizado na OS #OS2025040002	3	1	1
5	entrada	5	2025-04-25 12:39:20.99812-03		\N	1	1
\.


--
-- Data for Name: produtos_produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos_produto (id, codigo, nome, descricao, preco_custo, preco_venda, estoque_atual, estoque_minimo, imagem, observacoes, ativo, data_cadastro, ultima_atualizacao, slug, categoria_id, unidade_id) FROM stdin;
1	001	FONTE EXTERNA		50	80	5	1	produtos/FONTE_wOS6jR0.jpg	fonte externa	t	2025-04-24 15:40:53.616603-03	2025-04-25 12:39:20.989134-03	001-fonte-externa	1	1
\.


--
-- Data for Name: produtos_unidademedida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos_unidademedida (id, sigla, nome) FROM stdin;
1	UND	UNIDADE
\.


--
-- Data for Name: tecnicos_localizacaoatendimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tecnicos_localizacaoatendimento (id, latitude, longitude, data_hora, tipo, precisao, ordem_servico_id, tecnico_id) FROM stdin;
\.


--
-- Data for Name: tecnicos_registroponto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tecnicos_registroponto (id, tipo, data_hora, latitude, longitude, precisao, observacao, ip, tecnico_id) FROM stdin;
\.


--
-- Data for Name: tecnicos_tecnico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tecnicos_tecnico (id, codigo, nome_completo, cpf, rg, data_nascimento, telefone, celular, email, endereco, numero, complemento, bairro, cidade, estado, cep, latitude, longitude, ultima_atualizacao_local, nivel, especialidade, status, data_admissao, data_demissao, certificacoes, habilidades, foto, observacoes, ativo, slug, usuario_id, data_criacao, data_atualizacao) FROM stdin;
3	TEC0005	eduardo felix	000.000.000-00		2002-01-24		(11) 99700-0675	eduardo@gmail.com	Endereço não informado	S/N		Bairro não informado	Cidade não informada	SP	00000-000	\N	\N	\N	junior		disponivel	2025-04-24	\N			tecnicos/edu.jpg		t	eduardo-felix-b0cb7c3e	5	2025-04-24 21:04:04.488639-03	2025-04-25 12:36:26.652729-03
4	TEC2025040001	MAURICIO ALENCAR	229.418.429-78		1987-04-09	11983874568	(11) 97389-7387	mauriciom.alencar@gmail.com	Avenida Riviera	153		Flamingo	Embu-Guaçu	SP	06910-690	\N	\N	\N	especialista		disponivel	2025-04-25	\N			tecnicos/WIN_20250224_09_04_46_Pro_9DHw6Yj.jpg		t	mauricio-alencar-445568a2	6	2025-04-25 12:36:08.451944-03	2025-04-25 12:36:08.451976-03
\.


--
-- Data for Name: usuarios_grupopermissao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_grupopermissao (id, nome, descricao, data_criacao, ultima_atualizacao) FROM stdin;
5	Administradores	Grupo com todas as permissões do sistema	2025-04-23 19:55:56.68078-03	2025-04-23 19:55:56.680798-03
6	Técnico		2025-04-23 20:04:07.161453-03	2025-04-23 20:18:57.358278-03
7	Gerencial		2025-04-23 20:19:08.517157-03	2025-04-23 20:19:08.517171-03
\.


--
-- Data for Name: usuarios_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_menu (id, nome, descricao, url, icone, ordem, ativo, data_criacao, ultima_atualizacao, codigo, menu_pai_id) FROM stdin;
4	Dashboard	Página inicial do sistema	/	fas fa-tachometer-alt	1	t	2025-04-23 19:55:56.649257-03	2025-04-23 19:55:56.649291-03	dashboard	\N
5	Clientes	Gestão de clientes	/clientes/	fas fa-users	2	t	2025-04-23 19:55:56.653715-03	2025-04-23 19:55:56.65374-03	clientes	\N
6	Ordens de Serviço	Gestão de ordens de serviço	/ordens/	fas fa-clipboard-list	3	t	2025-04-23 19:55:56.65795-03	2025-04-23 19:55:56.657978-03	ordens	\N
7	Técnicos	Gestão de técnicos	/tecnicos/	fas fa-user-cog	4	t	2025-04-23 19:55:56.66195-03	2025-04-23 19:55:56.661971-03	tecnicos	\N
8	Produtos	Gestão de produtos	/produtos/	fas fa-box	5	t	2025-04-23 19:55:56.665904-03	2025-04-23 19:55:56.665939-03	produtos	\N
9	Relatórios	Relatórios do sistema	/relatorios/	fas fa-chart-bar	6	t	2025-04-23 19:55:56.66967-03	2025-04-23 19:55:56.669692-03	relatorios	\N
10	Usuários	Gestão de usuários	/usuarios/	fas fa-users-cog	7	t	2025-04-23 19:55:56.673438-03	2025-04-23 19:55:56.673472-03	usuarios	\N
11	Configurações	Configurações do sistema	/configuracoes/	fas fa-cog	8	t	2025-04-23 19:55:56.677472-03	2025-04-23 19:55:56.677492-03	configuracoes	\N
\.


--
-- Data for Name: usuarios_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_perfil (id, tipo, telefone, cargo, foto, bio, ultimo_acesso, data_criacao, ultima_atualizacao, user_id) FROM stdin;
1	administrador	\N	\N		\N	\N	2025-04-23 19:38:57.535337-03	2025-04-23 19:39:32.134882-03	1
3	gerente	\N	\N		\N	\N	2025-04-23 20:21:24.578639-03	2025-04-23 20:21:24.578657-03	3
5	tecnico	\N	\N		\N	\N	2025-04-24 21:04:04.487237-03	2025-04-24 21:04:04.487255-03	5
6	administrador	\N	\N		\N	\N	2025-04-30 10:38:13.814789-03	2025-04-30 10:38:13.814796-03	7
\.


--
-- Data for Name: usuarios_perfil_grupos_permissao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_perfil_grupos_permissao (id, perfil_id, grupopermissao_id) FROM stdin;
1	1	5
3	3	7
4	5	6
\.


--
-- Data for Name: usuarios_perfil_permissoes_customizadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_perfil_permissoes_customizadas (id, perfil_id, permissao_id) FROM stdin;
\.


--
-- Data for Name: usuarios_permissao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_permissao (id, acoes, data_criacao, ultima_atualizacao, grupo_id, menu_id, perfil_id) FROM stdin;
1	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 19:55:56.684841-03	2025-04-23 19:55:56.684861-03	5	4	\N
2	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 19:55:56.689433-03	2025-04-23 19:55:56.689537-03	5	5	\N
3	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 19:55:56.694147-03	2025-04-23 19:55:56.694167-03	5	6	\N
4	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 19:55:56.697986-03	2025-04-23 19:55:56.698012-03	5	7	\N
5	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 19:55:56.702373-03	2025-04-23 19:55:56.702398-03	5	8	\N
6	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 19:55:56.705886-03	2025-04-23 19:55:56.705909-03	5	9	\N
7	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 19:55:56.709727-03	2025-04-23 19:55:56.709746-03	5	10	\N
8	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 19:55:56.713096-03	2025-04-23 19:55:56.713117-03	5	11	\N
33	{"visualizar": true, "criar": false, "editar": false, "excluir": false}	2025-04-23 20:19:08.53081-03	2025-04-23 20:19:56.656016-03	7	4	\N
34	{"visualizar": true, "criar": false, "editar": true, "excluir": false}	2025-04-23 20:19:08.534959-03	2025-04-23 20:19:56.660069-03	7	5	\N
35	{"visualizar": true, "criar": false, "editar": false, "excluir": false}	2025-04-23 20:19:08.539563-03	2025-04-23 20:19:56.664315-03	7	6	\N
36	{"visualizar": true, "criar": false, "editar": false, "excluir": false}	2025-04-23 20:19:08.544057-03	2025-04-23 20:19:56.667805-03	7	7	\N
37	{"visualizar": true, "criar": false, "editar": false, "excluir": false}	2025-04-23 20:19:08.548-03	2025-04-23 20:19:56.671434-03	7	8	\N
38	{"visualizar": true, "criar": false, "editar": false, "excluir": false}	2025-04-23 20:19:08.55202-03	2025-04-23 20:19:56.675276-03	7	9	\N
41	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 20:21:24.581434-03	2025-04-23 20:21:24.585309-03	\N	4	3
42	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 20:21:24.581879-03	2025-04-23 20:21:24.586925-03	\N	5	3
43	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 20:21:24.582128-03	2025-04-23 20:21:24.588162-03	\N	6	3
44	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 20:21:24.582365-03	2025-04-23 20:21:24.589258-03	\N	7	3
45	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 20:21:24.582586-03	2025-04-23 20:21:24.59045-03	\N	8	3
46	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 20:21:24.582818-03	2025-04-23 20:21:24.591539-03	\N	9	3
47	{"visualizar": false, "criar": false, "editar": false, "excluir": false}	2025-04-23 20:21:24.583047-03	2025-04-23 20:21:24.583057-03	\N	10	3
48	{"visualizar": true, "criar": true, "editar": true, "excluir": true}	2025-04-23 20:21:24.583279-03	2025-04-23 20:21:24.583295-03	\N	11	3
49	{"visualizar": true, "criar": false, "editar": false, "excluir": false, "alterar_senha": false}	2025-04-24 21:04:04.491617-03	2025-04-24 21:04:04.497654-03	\N	4	5
50	{"visualizar": false, "criar": false, "editar": false, "excluir": false, "alterar_senha": false}	2025-04-24 21:04:04.493883-03	2025-04-24 21:04:04.498773-03	\N	5	5
51	{"visualizar": true, "criar": false, "editar": false, "excluir": false, "alterar_senha": false}	2025-04-24 21:04:04.494113-03	2025-04-24 21:04:04.499785-03	\N	6	5
52	{"visualizar": false, "criar": false, "editar": false, "excluir": false, "alterar_senha": false}	2025-04-24 21:04:04.494374-03	2025-04-24 21:04:04.500814-03	\N	7	5
53	{"visualizar": false, "criar": false, "editar": false, "excluir": false, "alterar_senha": false}	2025-04-24 21:04:04.494615-03	2025-04-24 21:04:04.501795-03	\N	8	5
54	{"visualizar": false, "criar": false, "editar": false, "excluir": false, "alterar_senha": false}	2025-04-24 21:04:04.494861-03	2025-04-24 21:04:04.502791-03	\N	9	5
55	{"visualizar": true, "criar": false, "editar": false, "excluir": false, "alterar_senha": true}	2025-04-24 21:04:04.495078-03	2025-04-24 21:04:04.503775-03	\N	10	5
56	{"visualizar": false, "criar": false, "editar": false, "excluir": false, "alterar_senha": false}	2025-04-24 21:04:04.495606-03	2025-04-24 21:04:04.504767-03	\N	11	5
57	{"visualizar": false, "criar": false, "editar": false, "excluir": false}	2025-04-25 10:52:10.319368-03	2025-04-25 10:52:10.319384-03	7	10	\N
58	{"visualizar": false, "criar": false, "editar": false, "excluir": false}	2025-04-25 10:52:10.325263-03	2025-04-25 10:52:10.325289-03	7	11	\N
59	{"criar": true, "editar": true, "excluir": true, "visualizar": true, "alterar_senha": true}	2025-04-30 10:38:13.82037-03	2025-04-30 10:38:13.820384-03	\N	4	6
60	{"criar": true, "editar": true, "excluir": true, "visualizar": true, "alterar_senha": true}	2025-04-30 10:38:13.830021-03	2025-04-30 10:38:13.83003-03	\N	5	6
61	{"criar": true, "editar": true, "excluir": true, "visualizar": true, "alterar_senha": true}	2025-04-30 10:38:13.830532-03	2025-04-30 10:38:13.83054-03	\N	6	6
62	{"criar": true, "editar": true, "excluir": true, "visualizar": true, "alterar_senha": true}	2025-04-30 10:38:13.831047-03	2025-04-30 10:38:13.831055-03	\N	7	6
63	{"criar": true, "editar": true, "excluir": true, "visualizar": true, "alterar_senha": true}	2025-04-30 10:38:13.831521-03	2025-04-30 10:38:13.831529-03	\N	8	6
64	{"criar": true, "editar": true, "excluir": true, "visualizar": true, "alterar_senha": true}	2025-04-30 10:38:13.832034-03	2025-04-30 10:38:13.832042-03	\N	9	6
65	{"criar": true, "editar": true, "excluir": true, "visualizar": true, "alterar_senha": true}	2025-04-30 10:38:13.832512-03	2025-04-30 10:38:13.832525-03	\N	10	6
66	{"criar": true, "editar": true, "excluir": true, "visualizar": true, "alterar_senha": true}	2025-04-30 10:38:13.833054-03	2025-04-30 10:38:13.833062-03	\N	11	6
\.


--
-- Data for Name: usuarios_permissaomenu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_permissaomenu (id, nivel_acesso, menu_id, perfil_id) FROM stdin;
1	total	4	1
2	total	5	1
3	total	6	1
4	total	7	1
5	total	8	1
6	total	9	1
7	total	10	1
8	total	11	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 124, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 7, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, true);


--
-- Name: clientes_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_cliente_id_seq', 5, true);


--
-- Name: clientes_contratocliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_contratocliente_id_seq', 2, true);


--
-- Name: clientes_contratoempresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_contratoempresa_id_seq', 1, true);


--
-- Name: clientes_empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_empresa_id_seq', 1, true);


--
-- Name: dashboard_metricadiaria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_metricadiaria_id_seq', 4, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 31, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 53, true);


--
-- Name: equipamentos_categoriaequipamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipamentos_categoriaequipamento_id_seq', 1, true);


--
-- Name: equipamentos_equipamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipamentos_equipamento_id_seq', 3, true);


--
-- Name: equipamentos_manutencaoequipamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipamentos_manutencaoequipamento_id_seq', 1, true);


--
-- Name: ordens_anexo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ordens_anexo_id_seq', 1, true);


--
-- Name: ordens_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ordens_categoria_id_seq', 1, true);


--
-- Name: ordens_comentario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ordens_comentario_id_seq', 1, true);


--
-- Name: ordens_ordemservico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ordens_ordemservico_id_seq', 4, true);


--
-- Name: ordens_produtoutilizado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ordens_produtoutilizado_id_seq', 3, true);


--
-- Name: produtos_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_categoria_id_seq', 1, true);


--
-- Name: produtos_movimentacaoestoque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_movimentacaoestoque_id_seq', 5, true);


--
-- Name: produtos_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_produto_id_seq', 1, true);


--
-- Name: produtos_unidademedida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_unidademedida_id_seq', 1, true);


--
-- Name: tecnicos_localizacaoatendimento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tecnicos_localizacaoatendimento_id_seq', 1, true);


--
-- Name: tecnicos_registroponto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tecnicos_registroponto_id_seq', 1, true);


--
-- Name: tecnicos_tecnico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tecnicos_tecnico_id_seq', 4, true);


--
-- Name: usuarios_grupopermissao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_grupopermissao_id_seq', 7, true);


--
-- Name: usuarios_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_menu_id_seq', 11, true);


--
-- Name: usuarios_perfil_grupos_permissao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_perfil_grupos_permissao_id_seq', 4, true);


--
-- Name: usuarios_perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_perfil_id_seq', 6, true);


--
-- Name: usuarios_perfil_permissoes_customizadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_perfil_permissoes_customizadas_id_seq', 1, true);


--
-- Name: usuarios_permissao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_permissao_id_seq', 66, true);


--
-- Name: usuarios_permissaomenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_permissaomenu_id_seq', 8, true);


--
-- PostgreSQL database dump complete
--

