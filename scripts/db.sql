--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-04-11 02:39:39

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16442)
-- Name: appointments; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    date date,
    clinic_id integer,
    doc_id integer,
    patient_id integer
);


ALTER TABLE public.appointments OWNER TO root;

--
-- TOC entry 224 (class 1259 OID 16481)
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

ALTER TABLE public.appointments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.appointments_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 16691)
-- Name: cities; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cities (
    id smallint NOT NULL,
    name character varying
);


ALTER TABLE public.cities OWNER TO root;

--
-- TOC entry 229 (class 1259 OID 16697)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

ALTER TABLE public.cities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16439)
-- Name: clinics; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.clinics (
    id integer NOT NULL,
    doc_id integer,
    patient_id integer,
    name character varying(50),
    appointment_id integer
);


ALTER TABLE public.clinics OWNER TO root;

--
-- TOC entry 223 (class 1259 OID 16477)
-- Name: clinics_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

ALTER TABLE public.clinics ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.clinics_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16694)
-- Name: districts; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.districts (
    id smallint NOT NULL,
    name character varying,
    city_id smallint
);


ALTER TABLE public.districts OWNER TO root;

--
-- TOC entry 230 (class 1259 OID 16703)
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

ALTER TABLE public.districts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.districts_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 16394)
-- Name: doctors; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.doctors (
    user_id integer NOT NULL,
    specialty character varying(50),
    fullname character varying(50),
    sex character varying(6),
    birth_date date,
    city character varying(50),
    phone character varying(11),
    district character varying(25)
);


ALTER TABLE public.doctors OWNER TO root;

--
-- TOC entry 214 (class 1259 OID 16411)
-- Name: files; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.files (
    id smallint NOT NULL,
    path character varying(100)
);


ALTER TABLE public.files OWNER TO root;

--
-- TOC entry 215 (class 1259 OID 16426)
-- Name: file_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

ALTER TABLE public.files ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.file_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16433)
-- Name: labs; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.labs (
    id integer NOT NULL,
    lab_result character varying(100),
    result_date date,
    patient_id integer,
    doc_id integer
);


ALTER TABLE public.labs OWNER TO root;

--
-- TOC entry 222 (class 1259 OID 16463)
-- Name: labs_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

ALTER TABLE public.labs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.labs_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16436)
-- Name: patients; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.patients (
    user_id integer,
    room character varying(4),
    bed_no character varying(3),
    sex character varying(6),
    age smallint,
    address character varying(50),
    weight smallint,
    phone character varying(11),
    fullname character varying(50),
    blood_type character varying(5),
    identity_no character varying(11),
    insurance_type character varying(10),
    birth_date date,
    birth_place character varying(25),
    father character varying(50),
    mother character varying(25),
    district character varying(25),
    city character varying
);


ALTER TABLE public.patients OWNER TO root;

--
-- TOC entry 216 (class 1259 OID 16430)
-- Name: prescriptions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.prescriptions (
    id integer NOT NULL,
    doc_id integer,
    patient_id integer,
    description character varying(100) NOT NULL,
    date date
);


ALTER TABLE public.prescriptions OWNER TO root;

--
-- TOC entry 221 (class 1259 OID 16445)
-- Name: prescriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

ALTER TABLE public.prescriptions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.prescriptions_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 213 (class 1259 OID 16408)
-- Name: privileges; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.privileges (
    role character varying(25),
    id smallint NOT NULL
);


ALTER TABLE public.privileges OWNER TO root;

--
-- TOC entry 225 (class 1259 OID 16533)
-- Name: privileges_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

ALTER TABLE public.privileges ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.privileges_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 16716)
-- Name: role_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.role_user (
    role_id smallint,
    user_id integer
);


ALTER TABLE public.role_user OWNER TO root;

--
-- TOC entry 226 (class 1259 OID 16544)
-- Name: supervisors; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.supervisors (
    fullname character varying,
    user_id integer NOT NULL,
    is_confirmed boolean DEFAULT false
);


ALTER TABLE public.supervisors OWNER TO root;

--
-- TOC entry 211 (class 1259 OID 16401)
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
    id integer NOT NULL,
    password character varying(50),
    email character varying(50)
);


ALTER TABLE public.users OWNER TO root;

--
-- TOC entry 212 (class 1259 OID 16404)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3402 (class 0 OID 16442)
-- Dependencies: 220
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3409 (class 0 OID 16691)
-- Dependencies: 227
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (0, 'Adana');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (1, 'Adıyaman');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (2, 'Afyon');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (3, 'Ağrı');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (4, 'Amasya');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (5, 'Ankara');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (6, 'Antalya');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (7, 'Artvin');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (8, 'Aydın');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (9, 'Balıkesir');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (10, 'Bilecik');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (11, 'Bingöl');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (12, 'Bitlis');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (13, 'Bolu');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (14, 'Burdur');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (15, 'Bursa');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (16, 'Çanakkale');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (17, 'Çankırı');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (18, 'Çorum');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (19, 'Denizli');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (20, 'Diyarbakır');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (21, 'Edirne');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (22, 'Elazığ');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (23, 'Erzincan');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (24, 'Erzurum');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (25, 'Eskişehir');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (26, 'Gaziantep');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (27, 'Giresun');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (28, 'Gümüşhane');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (29, 'Hakkari');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (30, 'Hatay');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (31, 'Isparta');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (32, 'Mersin');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (33, 'İstanbul');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (34, 'İzmir');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (35, 'Kars');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (36, 'Kastamonu');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (37, 'Kayseri');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (38, 'Kırklareli');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (39, 'Kırşehir');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (40, 'Kocaeli');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (41, 'Konya');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (42, 'Kütahya');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (43, 'Malatya');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (44, 'Manisa');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (45, 'K.Maraş');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (46, 'Mardin');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (47, 'Muğla');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (48, 'Muş');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (49, 'Nevşehir');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (50, 'Niğde');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (51, 'Ordu');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (52, 'Rize');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (53, 'Sakarya');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (54, 'Samsun');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (55, 'Siirt');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (56, 'Sinop');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (57, 'Sivas');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (58, 'Tekirdağ');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (59, 'Tokat');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (60, 'Trabzon');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (61, 'Tunceli');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (62, 'Şanlıurfa');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (63, 'Uşak');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (64, 'Van');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (65, 'Yozgat');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (66, 'Zonguldak');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (67, 'Aksaray');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (68, 'Bayburt');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (69, 'Karaman');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (70, 'Kırıkkale');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (71, 'Batman');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (72, 'Şırnak');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (73, 'Bartın');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (74, 'Ardahan');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (75, 'Iğdır');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (76, 'Yalova');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (77, 'Karabük');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (78, 'Kilis');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (79, 'Osmaniye');
INSERT INTO public.cities (id, name) OVERRIDING SYSTEM VALUE VALUES (80, 'Düzce');


--
-- TOC entry 3401 (class 0 OID 16439)
-- Dependencies: 219
-- Data for Name: clinics; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3410 (class 0 OID 16694)
-- Dependencies: 228
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3392 (class 0 OID 16394)
-- Dependencies: 210
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.doctors (user_id, specialty, fullname, sex, birth_date, city, phone, district) VALUES (320, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.doctors (user_id, specialty, fullname, sex, birth_date, city, phone, district) VALUES (321, NULL, 'gdbgdb', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.doctors (user_id, specialty, fullname, sex, birth_date, city, phone, district) VALUES (323, '', 'adc', 'Kadın', '2022-03-12', '', '', '');


--
-- TOC entry 3396 (class 0 OID 16411)
-- Dependencies: 214
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3399 (class 0 OID 16433)
-- Dependencies: 217
-- Data for Name: labs; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3400 (class 0 OID 16436)
-- Dependencies: 218
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, district, city) VALUES (284, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'adfdddddddd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, district, city) VALUES (286, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'adfddd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, district, city) VALUES (300, NULL, NULL, 'Erkek', 0, NULL, 0, '', 'zczczz', NULL, NULL, NULL, '2022-03-26', NULL, NULL, NULL, '', '');
INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, district, city) VALUES (319, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, district, city) VALUES (316, NULL, NULL, NULL, 0, NULL, 0, NULL, 'sfgsf11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, district, city) VALUES (324, NULL, NULL, 'Erkek', 0, NULL, 0, '', 'asc', NULL, NULL, NULL, '2022-03-12', NULL, NULL, NULL, '', '');


--
-- TOC entry 3398 (class 0 OID 16430)
-- Dependencies: 216
-- Data for Name: prescriptions; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3395 (class 0 OID 16408)
-- Dependencies: 213
-- Data for Name: privileges; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.privileges (role, id) OVERRIDING SYSTEM VALUE VALUES ('Yönetici', 1);
INSERT INTO public.privileges (role, id) OVERRIDING SYSTEM VALUE VALUES ('Doktor', 2);
INSERT INTO public.privileges (role, id) OVERRIDING SYSTEM VALUE VALUES ('Hasta', 3);


--
-- TOC entry 3413 (class 0 OID 16716)
-- Dependencies: 231
-- Data for Name: role_user; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3408 (class 0 OID 16544)
-- Dependencies: 226
-- Data for Name: supervisors; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('', 261, true);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('daf', 277, false);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('daf', 278, false);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('bfsdbdgb', 295, false);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('daf', 280, true);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('daf', 281, true);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('fsg', 282, true);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('kjgkg', 287, true);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('gfdgd', 288, true);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('dgb123', 272, true);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('gd', 296, false);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES (NULL, 322, false);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('daf', 275, true);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('', 292, true);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('daf', 279, true);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('adf', 273, false);


--
-- TOC entry 3393 (class 0 OID 16401)
-- Dependencies: 211
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (319, NULL, NULL);
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (320, NULL, NULL);
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (321, 'dgb', 'dgbdg');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (322, NULL, NULL);
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (323, '123456', 'xx@gmail.com');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (324, '123456', 'cc@gmail.com');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (261, '123456', 'hatitech.app@gmail.com');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (272, 'dgb', 'dgb');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (273, 'adf', 'adf');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (275, 'adf', 'adfdd');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (277, 'adf', 'adfdddd');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (278, 'adf', 'adfddddd');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (279, 'adf', 'adfdddddd');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (280, 'adf', 'adfddddddd');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (281, 'adf', 'adfdddddddd');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (282, 'sfg', 'sfgs');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (283, NULL, 'kk');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (284, '123456', 'dgbdgbergerg');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (286, '123456', 'dgbdgbergergr');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (287, 'gkgjk', 'gjk');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (288, 'gdhgd', 'gdghd');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (292, 'sfgfdgdfg', 'a@a.com');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (295, '123456', 'hatitech.app@gmail.com1');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (296, 'adfgdafg', 'safgdag');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (300, '123456', 'c@c.com');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (303, '123456', 'c@a.comm');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (304, '123456', 'c@a.com');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (305, '123456', 'x@x.com');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (310, 'şsfvsşl', 'sşvfsşlv');
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (313, NULL, NULL);
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (315, NULL, NULL);
INSERT INTO public.users (id, password, email) OVERRIDING SYSTEM VALUE VALUES (316, 'sfg', 'gsfg');


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 224
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.appointments_id_seq', 0, false);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 229
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.cities_id_seq', 80, true);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 223
-- Name: clinics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.clinics_id_seq', 0, false);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 230
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.districts_id_seq', 0, false);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 215
-- Name: file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.file_id_seq', 0, false);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 222
-- Name: labs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.labs_id_seq', 0, false);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 221
-- Name: prescriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.prescriptions_id_seq', 0, false);


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 225
-- Name: privileges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.privileges_id_seq', 12, true);


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 212
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_id_seq', 324, true);


--
-- TOC entry 3235 (class 2606 OID 16488)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 16710)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 16486)
-- Name: clinics clinics_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.clinics
    ADD CONSTRAINT clinics_pkey PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 16450)
-- Name: doctors doctors_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_user_id_key UNIQUE (user_id);


--
-- TOC entry 3231 (class 2606 OID 16457)
-- Name: patients patients_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_user_id_key UNIQUE (user_id);


--
-- TOC entry 3229 (class 2606 OID 16538)
-- Name: privileges privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.privileges
    ADD CONSTRAINT privileges_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 16562)
-- Name: supervisors supervisors_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.supervisors
    ADD CONSTRAINT supervisors_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3225 (class 2606 OID 16415)
-- Name: users user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 16532)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3248 (class 2606 OID 16489)
-- Name: appointments appointments_clinic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_clinic_id_fkey FOREIGN KEY (clinic_id) REFERENCES public.clinics(id) NOT VALID;


--
-- TOC entry 3249 (class 2606 OID 16494)
-- Name: appointments appointments_dr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_dr_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(user_id) NOT VALID;


--
-- TOC entry 3250 (class 2606 OID 16499)
-- Name: appointments appointments_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(user_id) NOT VALID;


--
-- TOC entry 3247 (class 2606 OID 16509)
-- Name: clinics clinics_appointment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.clinics
    ADD CONSTRAINT clinics_appointment_id_fkey FOREIGN KEY (appointment_id) REFERENCES public.appointments(id) NOT VALID;


--
-- TOC entry 3246 (class 2606 OID 16504)
-- Name: clinics clinics_dr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.clinics
    ADD CONSTRAINT clinics_dr_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(user_id) NOT VALID;


--
-- TOC entry 3252 (class 2606 OID 16711)
-- Name: districts districts_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id) NOT VALID;


--
-- TOC entry 3240 (class 2606 OID 16421)
-- Name: doctors doctor_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctor_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3244 (class 2606 OID 16472)
-- Name: labs labs_dr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.labs
    ADD CONSTRAINT labs_dr_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(user_id) NOT VALID;


--
-- TOC entry 3243 (class 2606 OID 16467)
-- Name: labs labs_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.labs
    ADD CONSTRAINT labs_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(user_id) NOT VALID;


--
-- TOC entry 3245 (class 2606 OID 16514)
-- Name: patients patients_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3241 (class 2606 OID 16451)
-- Name: prescriptions prescriptions_dr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_dr_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(user_id) NOT VALID;


--
-- TOC entry 3242 (class 2606 OID 16458)
-- Name: prescriptions prescriptions_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(user_id) NOT VALID;


--
-- TOC entry 3251 (class 2606 OID 16549)
-- Name: supervisors supervisors_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.supervisors
    ADD CONSTRAINT supervisors_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE appointments; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.appointments FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.appointments TO root;


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE clinics; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.clinics FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.clinics TO root;


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE doctors; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.doctors FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.doctors TO root;


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE files; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.files FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.files TO root;


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE labs; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.labs FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.labs TO root;


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE patients; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.patients FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.patients TO root;


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE prescriptions; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.prescriptions FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.prescriptions TO root;


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE privileges; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.privileges FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.privileges TO root;


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE supervisors; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.supervisors FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.supervisors TO root;


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE users; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.users FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.users TO root;


-- Completed on 2022-04-11 02:39:39

--
-- PostgreSQL database dump complete
--

