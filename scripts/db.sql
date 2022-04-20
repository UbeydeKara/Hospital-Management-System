--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-04-11 17:54:24

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
-- TOC entry 3418 (class 0 OID 0)
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
-- TOC entry 229 (class 1259 OID 16703)
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
    phone character varying(11),
    city_id smallint,
    district_id smallint
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
    city_id smallint,
    district_id smallint
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
    email character varying(50),
    role_id smallint
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
-- TOC entry 3403 (class 0 OID 16442)
-- Dependencies: 220
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3410 (class 0 OID 16691)
-- Dependencies: 227
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.cities (id, name) VALUES (1, 'ADANA');
INSERT INTO public.cities (id, name) VALUES (4, 'AĞRI');
INSERT INTO public.cities (id, name) VALUES (5, 'AMASYA');
INSERT INTO public.cities (id, name) VALUES (6, 'ANKARA');
INSERT INTO public.cities (id, name) VALUES (7, 'ANTALYA');
INSERT INTO public.cities (id, name) VALUES (10, 'BALIKESİR');
INSERT INTO public.cities (id, name) VALUES (11, 'BİLECİK');
INSERT INTO public.cities (id, name) VALUES (12, 'BİNGÖL');
INSERT INTO public.cities (id, name) VALUES (13, 'BİTLİS');
INSERT INTO public.cities (id, name) VALUES (14, 'BOLU');
INSERT INTO public.cities (id, name) VALUES (15, 'BURDUR');
INSERT INTO public.cities (id, name) VALUES (16, 'BURSA');
INSERT INTO public.cities (id, name) VALUES (17, 'ÇANAKKALE');
INSERT INTO public.cities (id, name) VALUES (18, 'ÇANKIRI');
INSERT INTO public.cities (id, name) VALUES (19, 'ÇORUM');
INSERT INTO public.cities (id, name) VALUES (20, 'DENİZLİ');
INSERT INTO public.cities (id, name) VALUES (21, 'DİYARBAKIR');
INSERT INTO public.cities (id, name) VALUES (22, 'EDİRNE');
INSERT INTO public.cities (id, name) VALUES (23, 'ELAZIĞ');
INSERT INTO public.cities (id, name) VALUES (25, 'ERZURUM');
INSERT INTO public.cities (id, name) VALUES (26, 'ESKİŞEHİR');
INSERT INTO public.cities (id, name) VALUES (27, 'GAZİANTEP');
INSERT INTO public.cities (id, name) VALUES (29, 'GÜMÜŞHANE');
INSERT INTO public.cities (id, name) VALUES (30, 'HAKKARİ');
INSERT INTO public.cities (id, name) VALUES (31, 'HATAY');
INSERT INTO public.cities (id, name) VALUES (32, 'ISPARTA');
INSERT INTO public.cities (id, name) VALUES (33, 'İÇEL');
INSERT INTO public.cities (id, name) VALUES (34, 'İSTANBUL');
INSERT INTO public.cities (id, name) VALUES (35, 'İZMİR');
INSERT INTO public.cities (id, name) VALUES (36, 'KARS');
INSERT INTO public.cities (id, name) VALUES (37, 'KASTAMONU');
INSERT INTO public.cities (id, name) VALUES (38, 'KAYSERİ');
INSERT INTO public.cities (id, name) VALUES (39, 'KIRKLARELİ');
INSERT INTO public.cities (id, name) VALUES (40, 'KIRŞEHİR');
INSERT INTO public.cities (id, name) VALUES (41, 'KOCAELİ');
INSERT INTO public.cities (id, name) VALUES (42, 'KONYA');
INSERT INTO public.cities (id, name) VALUES (43, 'KÜTAHYA');
INSERT INTO public.cities (id, name) VALUES (44, 'MALATYA');
INSERT INTO public.cities (id, name) VALUES (45, 'MANİSA');
INSERT INTO public.cities (id, name) VALUES (46, 'KAHRAMANMARAŞ');
INSERT INTO public.cities (id, name) VALUES (48, 'MUĞLA');
INSERT INTO public.cities (id, name) VALUES (49, 'MUŞ');
INSERT INTO public.cities (id, name) VALUES (50, 'NEVŞEHİR');
INSERT INTO public.cities (id, name) VALUES (51, 'NİĞDE');
INSERT INTO public.cities (id, name) VALUES (52, 'ORDU');
INSERT INTO public.cities (id, name) VALUES (53, 'RİZE');
INSERT INTO public.cities (id, name) VALUES (54, 'SAKARYA');
INSERT INTO public.cities (id, name) VALUES (56, 'SİİRT');
INSERT INTO public.cities (id, name) VALUES (57, 'SİNOP');
INSERT INTO public.cities (id, name) VALUES (58, 'SİVAS');
INSERT INTO public.cities (id, name) VALUES (59, 'TEKİRDAĞ');
INSERT INTO public.cities (id, name) VALUES (60, 'TOKAT');
INSERT INTO public.cities (id, name) VALUES (62, 'TUNCELİ');
INSERT INTO public.cities (id, name) VALUES (63, 'ŞANLIURFA');
INSERT INTO public.cities (id, name) VALUES (64, 'UŞAK');
INSERT INTO public.cities (id, name) VALUES (66, 'YOZGAT');
INSERT INTO public.cities (id, name) VALUES (67, 'ZONGULDAK');
INSERT INTO public.cities (id, name) VALUES (68, 'AKSARAY');
INSERT INTO public.cities (id, name) VALUES (69, 'BAYBURT');
INSERT INTO public.cities (id, name) VALUES (71, 'KIRIKKALE');
INSERT INTO public.cities (id, name) VALUES (73, 'ŞIRNAK');
INSERT INTO public.cities (id, name) VALUES (76, 'IĞDIR');
INSERT INTO public.cities (id, name) VALUES (77, 'YALOVA');
INSERT INTO public.cities (id, name) VALUES (78, 'KARABÜK');
INSERT INTO public.cities (id, name) VALUES (79, 'KİLİS');
INSERT INTO public.cities (id, name) VALUES (80, 'OSMANİYE');
INSERT INTO public.cities (id, name) VALUES (81, 'DÜZCE');
INSERT INTO public.cities (id, name) VALUES (2, 'ADIYAMAN');
INSERT INTO public.cities (id, name) VALUES (3, 'AFYON');
INSERT INTO public.cities (id, name) VALUES (8, 'ARTVİN');
INSERT INTO public.cities (id, name) VALUES (9, 'AYDIN');
INSERT INTO public.cities (id, name) VALUES (24, 'ERZİNCAN');
INSERT INTO public.cities (id, name) VALUES (28, 'GİRESUN');
INSERT INTO public.cities (id, name) VALUES (47, 'MARDİN');
INSERT INTO public.cities (id, name) VALUES (55, 'SAMSUN');
INSERT INTO public.cities (id, name) VALUES (61, 'TRABZON');
INSERT INTO public.cities (id, name) VALUES (65, 'VAN');
INSERT INTO public.cities (id, name) VALUES (70, 'KARAMAN');
INSERT INTO public.cities (id, name) VALUES (72, 'BATMAN');
INSERT INTO public.cities (id, name) VALUES (74, 'BARTIN');
INSERT INTO public.cities (id, name) VALUES (75, 'ARDAHAN');


--
-- TOC entry 3402 (class 0 OID 16439)
-- Dependencies: 219
-- Data for Name: clinics; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3411 (class 0 OID 16694)
-- Dependencies: 228
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (2, 'ALADAĞ', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (3, 'CEYHAN', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (4, 'ÇUKUROVA', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (5, 'FEKE', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (6, 'İMAMOĞLU', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (7, 'KARAİSALI', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (8, 'KARATAŞ', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (9, 'KOZAN', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (10, 'POZANTI', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (11, 'SAİMBEYLİ', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (12, 'SARIÇAM', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (13, 'SEYHAN', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (14, 'TUFANBEYLİ', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (15, 'YUMURTALIK', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (16, 'YÜREĞİR', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (17, 'BESNİ', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (18, 'ÇELİKHAN', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (19, 'GERGER', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (20, 'GÖLBAŞI', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (21, 'KAHTA', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (22, 'MERKEZ', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (23, 'SAMSAT', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (24, 'SİNCİK', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (25, 'TUT', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (26, 'BAŞMAKÇI', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (27, 'BAYAT', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (28, 'BOLVADİN', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (29, 'ÇAY', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (30, 'ÇOBANLAR', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (31, 'DAZKIRI', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (32, 'DİNAR', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (33, 'EMİRDAĞ', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (34, 'EVCİLER', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (35, 'HOCALAR', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (36, 'İHSANİYE', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (37, 'İSCEHİSAR', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (38, 'KIZILÖREN', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (39, 'MERKEZ', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (40, 'SANDIKLI', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (41, 'SİNANPAŞA', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (42, 'SULTANDAĞI', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (43, 'ŞUHUT', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (44, 'DİYADİN', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (45, 'DOĞUBAYAZIT', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (46, 'ELEŞKİRT', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (47, 'HAMUR', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (48, 'MERKEZ', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (49, 'PATNOS', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (50, 'TAŞLIÇAY', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (51, 'TUTAK', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (52, 'AĞAÇÖREN', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (53, 'ESKİL', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (54, 'GÜLAĞAÇ', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (55, 'GÜZELYURT', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (56, 'MERKEZ', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (57, 'ORTAKÖY', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (58, 'SARIYAHŞİ', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (59, 'SULTANHANI', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (60, 'GÖYNÜCEK', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (61, 'GÜMÜŞHACIKÖY', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (62, 'HAMAMÖZÜ', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (63, 'MERKEZ', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (64, 'MERZİFON', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (65, 'SULUOVA', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (66, 'TAŞOVA', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (67, 'AKYURT', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (68, 'ALTINDAĞ', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (69, 'AYAŞ', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (70, 'BALA', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (71, 'BEYPAZARI', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (72, 'ÇAMLIDERE', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (73, 'ÇANKAYA', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (74, 'ÇUBUK', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (75, 'ELMADAĞ', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (76, 'ETİMESGUT', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (77, 'EVREN', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (78, 'GÖLBAŞI', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (79, 'GÜDÜL', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (80, 'HAYMANA', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (81, 'KAHRAMANKAZAN', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (82, 'KALECİK', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (83, 'KEÇİÖREN', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (84, 'KIZILCAHAMAM', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (85, 'MAMAK', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (86, 'NALLIHAN', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (87, 'POLATLI', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (88, 'PURSAKLAR', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (89, 'SİNCAN', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (90, 'ŞEREFLİKOÇHİSAR', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (91, 'YENİMAHALLE', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (92, 'AKSEKİ', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (93, 'AKSU', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (94, 'ALANYA', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (95, 'DEMRE', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (96, 'DÖŞEMEALTI', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (97, 'ELMALI', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (98, 'FİNİKE', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (99, 'GAZİPAŞA', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (100, 'GÜNDOĞMUŞ', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (101, 'İBRADI', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (102, 'KAŞ', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (103, 'KEMER', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (104, 'KEPEZ', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (105, 'KONYAALTI', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (106, 'KORKUTELİ', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (107, 'KUMLUCA', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (108, 'MANAVGAT', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (109, 'MURATPAŞA', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (110, 'SERİK', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (111, 'ÇILDIR', 75);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (112, 'DAMAL', 75);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (113, 'GÖLE', 75);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (114, 'HANAK', 75);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (115, 'MERKEZ', 75);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (116, 'POSOF', 75);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (117, 'ARDANUÇ', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (118, 'ARHAVİ', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (119, 'BORÇKA', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (120, 'HOPA', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (121, 'KEMALPAŞA', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (122, 'MERKEZ', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (123, 'MURGUL', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (124, 'ŞAVŞAT', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (125, 'YUSUFELİ', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (126, 'BOZDOĞAN', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (127, 'BUHARKENT', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (128, 'ÇİNE', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (129, 'DİDİM', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (130, 'EFELER', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (131, 'GERMENCİK', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (132, 'İNCİRLİOVA', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (133, 'KARACASU', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (134, 'KARPUZLU', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (135, 'KOÇARLI', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (136, 'KÖŞK', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (137, 'KUŞADASI', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (138, 'KUYUCAK', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (139, 'NAZİLLİ', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (140, 'SÖKE', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (141, 'SULTANHİSAR', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (142, 'YENİPAZAR', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (143, 'ALTIEYLÜL', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (144, 'AYVALIK', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (145, 'BALYA', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (146, 'BANDIRMA', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (147, 'BİGADİÇ', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (148, 'BURHANİYE', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (149, 'DURSUNBEY', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (150, 'EDREMİT', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (151, 'ERDEK', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (152, 'GÖMEÇ', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (153, 'GÖNEN', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (154, 'HAVRAN', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (155, 'İVRİNDİ', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (156, 'KARESİ', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (157, 'KEPSUT', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (158, 'MANYAS', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (159, 'MARMARA', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (160, 'SAVAŞTEPE', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (161, 'SINDIRGI', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (162, 'SUSURLUK', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (163, 'AMASRA', 74);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (164, 'KURUCAŞİLE', 74);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (165, 'MERKEZ', 74);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (166, 'ULUS', 74);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (167, 'BEŞİRİ', 72);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (168, 'GERCÜŞ', 72);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (169, 'HASANKEYF', 72);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (170, 'KOZLUK', 72);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (171, 'MERKEZ', 72);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (172, 'SASON', 72);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (173, 'AYDINTEPE', 69);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (174, 'DEMİRÖZÜ', 69);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (175, 'MERKEZ', 69);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (176, 'BOZÜYÜK', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (177, 'GÖLPAZARI', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (178, 'İNHİSAR', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (179, 'MERKEZ', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (180, 'OSMANELİ', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (181, 'PAZARYERİ', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (182, 'SÖĞÜT', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (183, 'YENİPAZAR', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (184, 'ADAKLI', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (185, 'GENÇ', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (186, 'KARLIOVA', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (187, 'KİĞI', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (188, 'MERKEZ', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (189, 'SOLHAN', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (190, 'YAYLADERE', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (191, 'YEDİSU', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (192, 'ADİLCEVAZ', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (193, 'AHLAT', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (194, 'GÜROYMAK', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (195, 'HİZAN', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (196, 'MERKEZ', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (197, 'MUTKİ', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (198, 'TATVAN', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (199, 'DÖRTDİVAN', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (200, 'GEREDE', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (201, 'GÖYNÜK', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (202, 'KIBRISCIK', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (203, 'MENGEN', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (204, 'MERKEZ', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (205, 'MUDURNU', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (206, 'SEBEN', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (207, 'YENİÇAĞA', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (208, 'AĞLASUN', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (209, 'ALTINYAYLA', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (210, 'BUCAK', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (211, 'ÇAVDIR', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (212, 'ÇELTİKÇİ', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (213, 'GÖLHİSAR', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (214, 'KARAMANLI', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (215, 'KEMER', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (216, 'MERKEZ', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (217, 'TEFENNİ', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (218, 'YEŞİLOVA', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (219, 'BÜYÜKORHAN', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (220, 'GEMLİK', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (221, 'GÜRSU', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (222, 'HARMANCIK', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (223, 'İNEGÖL', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (224, 'İZNİK', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (225, 'KARACABEY', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (226, 'KELES', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (227, 'KESTEL', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (228, 'MUDANYA', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (229, 'MUSTAFAKEMALPAŞA', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (230, 'NİLÜFER', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (231, 'ORHANELİ', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (232, 'ORHANGAZİ', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (233, 'OSMANGAZİ', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (234, 'YENİŞEHİR', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (235, 'YILDIRIM', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (236, 'AYVACIK', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (237, 'BAYRAMİÇ', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (238, 'BİGA', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (239, 'BOZCAADA', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (240, 'ÇAN', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (241, 'ECEABAT', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (242, 'EZİNE', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (243, 'GELİBOLU', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (244, 'GÖKÇEADA', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (245, 'LAPSEKİ', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (246, 'MERKEZ', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (247, 'YENİCE', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (248, 'ATKARACALAR', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (249, 'BAYRAMÖREN', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (250, 'ÇERKEŞ', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (251, 'ELDİVAN', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (252, 'ILGAZ', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (253, 'KIZILIRMAK', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (254, 'KORGUN', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (255, 'KURŞUNLU', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (256, 'MERKEZ', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (257, 'ORTA', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (258, 'ŞABANÖZÜ', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (259, 'YAPRAKLI', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (260, 'ALACA', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (261, 'BAYAT', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (262, 'BOĞAZKALE', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (263, 'DODURGA', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (264, 'İSKİLİP', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (265, 'KARGI', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (266, 'LAÇİN', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (267, 'MECİTÖZÜ', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (268, 'MERKEZ', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (269, 'OĞUZLAR', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (270, 'ORTAKÖY', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (271, 'OSMANCIK', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (272, 'SUNGURLU', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (273, 'UĞURLUDAĞ', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (274, 'ACIPAYAM', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (275, 'BABADAĞ', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (276, 'BAKLAN', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (277, 'BEKİLLİ', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (278, 'BEYAĞAÇ', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (279, 'BOZKURT', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (280, 'BULDAN', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (281, 'ÇAL', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (282, 'ÇAMELİ', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (283, 'ÇARDAK', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (284, 'ÇİVRİL', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (285, 'GÜNEY', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (286, 'HONAZ', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (287, 'KALE', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (288, 'MERKEZEFENDİ', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (289, 'PAMUKKALE', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (290, 'SARAYKÖY', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (291, 'SERİNHİSAR', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (292, 'TAVAS', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (293, 'BAĞLAR', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (294, 'BİSMİL', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (295, 'ÇERMİK', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (296, 'ÇINAR', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (297, 'ÇÜNGÜŞ', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (298, 'DİCLE', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (299, 'EĞİL', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (300, 'ERGANİ', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (301, 'HANİ', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (302, 'HAZRO', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (303, 'KAYAPINAR', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (304, 'KOCAKÖY', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (305, 'KULP', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (306, 'LİCE', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (307, 'SİLVAN', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (308, 'SUR', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (309, 'YENİŞEHİR', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (310, 'AKÇAKOCA', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (311, 'CUMAYERİ', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (312, 'ÇİLİMLİ', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (313, 'GÖLYAKA', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (314, 'GÜMÜŞOVA', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (315, 'KAYNAŞLI', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (316, 'MERKEZ', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (317, 'YIĞILCA', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (318, 'ENEZ', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (319, 'HAVSA', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (320, 'İPSALA', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (321, 'KEŞAN', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (322, 'LALAPAŞA', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (323, 'MERİÇ', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (324, 'MERKEZ', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (325, 'SÜLOĞLU', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (326, 'UZUNKÖPRÜ', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (327, 'AĞIN', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (328, 'ALACAKAYA', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (329, 'ARICAK', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (330, 'BASKİL', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (331, 'KARAKOÇAN', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (332, 'KEBAN', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (333, 'KOVANCILAR', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (334, 'MADEN', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (335, 'MERKEZ', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (336, 'PALU', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (337, 'SİVRİCE', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (338, 'ÇAYIRLI', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (339, 'İLİÇ', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (340, 'KEMAH', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (341, 'KEMALİYE', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (342, 'MERKEZ', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (343, 'OTLUKBELİ', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (344, 'REFAHİYE', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (345, 'TERCAN', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (346, 'ÜZÜMLÜ', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (347, 'AŞKALE', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (348, 'AZİZİYE', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (349, 'ÇAT', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (350, 'HINIS', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (351, 'HORASAN', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (352, 'İSPİR', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (353, 'KARAÇOBAN', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (354, 'KARAYAZI', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (355, 'KÖPRÜKÖY', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (356, 'NARMAN', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (357, 'OLTU', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (358, 'OLUR', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (359, 'PALANDÖKEN', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (360, 'PASİNLER', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (361, 'PAZARYOLU', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (362, 'ŞENKAYA', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (363, 'TEKMAN', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (364, 'TORTUM', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (365, 'UZUNDERE', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (366, 'YAKUTİYE', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (367, 'ALPU', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (368, 'BEYLİKOVA', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (369, 'ÇİFTELER', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (370, 'GÜNYÜZÜ', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (371, 'HAN', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (372, 'İNÖNÜ', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (373, 'MAHMUDİYE', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (374, 'MİHALGAZİ', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (375, 'MİHALIÇÇIK', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (376, 'ODUNPAZARI', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (377, 'SARICAKAYA', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (378, 'SEYİTGAZİ', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (379, 'SİVRİHİSAR', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (380, 'TEPEBAŞI', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (381, 'ARABAN', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (382, 'İSLAHİYE', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (383, 'KARKAMIŞ', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (384, 'NİZİP', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (385, 'NURDAĞI', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (386, 'OĞUZELİ', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (387, 'ŞAHİNBEY', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (388, 'ŞEHİTKAMİL', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (389, 'YAVUZELİ', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (390, 'ALUCRA', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (391, 'BULANCAK', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (392, 'ÇAMOLUK', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (393, 'ÇANAKÇI', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (394, 'DERELİ', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (395, 'DOĞANKENT', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (396, 'ESPİYE', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (397, 'EYNESİL', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (398, 'GÖRELE', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (399, 'GÜCE', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (400, 'KEŞAP', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (401, 'MERKEZ', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (402, 'PİRAZİZ', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (403, 'ŞEBİNKARAHİSAR', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (404, 'TİREBOLU', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (405, 'YAĞLIDERE', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (406, 'KELKİT', 29);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (407, 'KÖSE', 29);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (408, 'KÜRTÜN', 29);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (409, 'MERKEZ', 29);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (410, 'ŞİRAN', 29);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (411, 'TORUL', 29);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (412, 'ÇUKURCA', 30);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (413, 'DERECİK', 30);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (414, 'MERKEZ', 30);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (415, 'ŞEMDİNLİ', 30);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (416, 'YÜKSEKOVA', 30);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (417, 'ALTINÖZÜ', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (418, 'ANTAKYA', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (419, 'ARSUZ', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (420, 'BELEN', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (421, 'DEFNE', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (422, 'DÖRTYOL', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (423, 'ERZİN', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (424, 'HASSA', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (425, 'İSKENDERUN', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (426, 'KIRIKHAN', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (427, 'KUMLU', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (428, 'PAYAS', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (429, 'REYHANLI', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (430, 'SAMANDAĞ', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (431, 'YAYLADAĞI', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (432, 'ARALIK', 76);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (433, 'KARAKOYUNLU', 76);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (434, 'MERKEZ', 76);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (435, 'TUZLUCA', 76);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (436, 'AKSU', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (437, 'ATABEY', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (438, 'EĞİRDİR', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (439, 'GELENDOST', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (440, 'GÖNEN', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (441, 'KEÇİBORLU', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (442, 'MERKEZ', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (443, 'SENİRKENT', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (444, 'SÜTÇÜLER', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (445, 'ŞARKİKARAAĞAÇ', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (446, 'ULUBORLU', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (447, 'YALVAÇ', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (448, 'YENİŞARBADEMLİ', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (449, 'ADALAR', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (450, 'ARNAVUTKÖY', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (451, 'ATAŞEHİR', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (452, 'AVCILAR', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (453, 'BAĞCILAR', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (454, 'BAHÇELİEVLER', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (455, 'BAKIRKÖY', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (456, 'BAŞAKŞEHİR', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (457, 'BAYRAMPAŞA', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (458, 'BEŞİKTAŞ', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (459, 'BEYKOZ', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (460, 'BEYLİKDÜZÜ', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (461, 'BEYOĞLU', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (462, 'BÜYÜKÇEKMECE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (463, 'ÇATALCA', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (464, 'ÇEKMEKÖY', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (465, 'ESENLER', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (466, 'ESENYURT', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (467, 'EYÜPSULTAN', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (468, 'FATİH', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (469, 'GAZİOSMANPAŞA', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (470, 'GÜNGÖREN', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (471, 'KADIKÖY', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (472, 'KAĞITHANE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (473, 'KARTAL', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (474, 'KÜÇÜKÇEKMECE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (475, 'MALTEPE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (476, 'PENDİK', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (477, 'SANCAKTEPE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (478, 'SARIYER', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (479, 'SİLİVRİ', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (480, 'SULTANBEYLİ', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (481, 'SULTANGAZİ', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (482, 'ŞİLE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (483, 'ŞİŞLİ', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (484, 'TUZLA', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (485, 'ÜMRANİYE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (486, 'ÜSKÜDAR', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (487, 'ZEYTİNBURNU', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (488, 'ALİAĞA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (489, 'BALÇOVA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (490, 'BAYINDIR', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (491, 'BAYRAKLI', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (492, 'BERGAMA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (493, 'BEYDAĞ', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (494, 'BORNOVA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (495, 'BUCA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (496, 'ÇEŞME', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (497, 'ÇİĞLİ', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (498, 'DİKİLİ', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (499, 'FOÇA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (500, 'GAZİEMİR', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (501, 'GÜZELBAHÇE', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (502, 'KARABAĞLAR', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (503, 'KARABURUN', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (504, 'KARŞIYAKA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (505, 'KEMALPAŞA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (506, 'KINIK', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (507, 'KİRAZ', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (508, 'KONAK', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (509, 'MENDERES', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (510, 'MENEMEN', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (511, 'NARLIDERE', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (512, 'ÖDEMİŞ', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (513, 'SEFERİHİSAR', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (514, 'SELÇUK', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (515, 'TİRE', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (516, 'TORBALI', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (517, 'URLA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (518, 'AFŞİN', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (519, 'ANDIRIN', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (520, 'ÇAĞLAYANCERİT', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (521, 'DULKADİROĞLU', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (522, 'EKİNÖZÜ', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (523, 'ELBİSTAN', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (524, 'GÖKSUN', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (525, 'NURHAK', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (526, 'ONİKİŞUBAT', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (527, 'PAZARCIK', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (528, 'TÜRKOĞLU', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (529, 'EFLANİ', 78);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (530, 'ESKİPAZAR', 78);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (531, 'MERKEZ', 78);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (532, 'OVACIK', 78);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (533, 'SAFRANBOLU', 78);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (534, 'YENİCE', 78);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (535, 'AYRANCI', 70);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (536, 'BAŞYAYLA', 70);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (537, 'ERMENEK', 70);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (538, 'KAZIMKARABEKİR', 70);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (539, 'MERKEZ', 70);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (540, 'SARIVELİLER', 70);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (541, 'AKYAKA', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (542, 'ARPAÇAY', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (543, 'DİGOR', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (544, 'KAĞIZMAN', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (545, 'MERKEZ', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (546, 'SARIKAMIŞ', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (547, 'SELİM', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (548, 'SUSUZ', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (549, 'ABANA', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (550, 'AĞLI', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (551, 'ARAÇ', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (552, 'AZDAVAY', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (553, 'BOZKURT', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (554, 'CİDE', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (555, 'ÇATALZEYTİN', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (556, 'DADAY', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (557, 'DEVREKANİ', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (558, 'DOĞANYURT', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (559, 'HANÖNÜ', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (560, 'İHSANGAZİ', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (561, 'İNEBOLU', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (562, 'KÜRE', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (563, 'MERKEZ', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (564, 'PINARBAŞI', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (565, 'SEYDİLER', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (566, 'ŞENPAZAR', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (567, 'TAŞKÖPRÜ', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (568, 'TOSYA', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (569, 'AKKIŞLA', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (570, 'BÜNYAN', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (571, 'DEVELİ', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (572, 'FELAHİYE', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (573, 'HACILAR', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (574, 'İNCESU', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (575, 'KOCASİNAN', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (576, 'MELİKGAZİ', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (577, 'ÖZVATAN', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (578, 'PINARBAŞI', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (579, 'SARIOĞLAN', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (580, 'SARIZ', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (581, 'TALAS', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (582, 'TOMARZA', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (583, 'YAHYALI', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (584, 'YEŞİLHİSAR', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (585, 'BAHŞILI', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (586, 'BALIŞEYH', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (587, 'ÇELEBİ', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (588, 'DELİCE', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (589, 'KARAKEÇİLİ', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (590, 'KESKİN', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (591, 'MERKEZ', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (592, 'SULAKYURT', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (593, 'YAHŞİHAN', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (594, 'BABAESKİ', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (595, 'DEMİRKÖY', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (596, 'KOFÇAZ', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (597, 'LÜLEBURGAZ', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (598, 'MERKEZ', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (599, 'PEHLİVANKÖY', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (600, 'PINARHİSAR', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (601, 'VİZE', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (602, 'AKÇAKENT', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (603, 'AKPINAR', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (604, 'BOZTEPE', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (605, 'ÇİÇEKDAĞI', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (606, 'KAMAN', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (607, 'MERKEZ', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (608, 'MUCUR', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (609, 'ELBEYLİ', 79);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (610, 'MERKEZ', 79);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (611, 'MUSABEYLİ', 79);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (612, 'POLATELİ', 79);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (613, 'BAŞİSKELE', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (614, 'ÇAYIROVA', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (615, 'DARICA', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (616, 'DERİNCE', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (617, 'DİLOVASI', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (618, 'GEBZE', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (619, 'GÖLCÜK', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (620, 'İZMİT', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (621, 'KANDIRA', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (622, 'KARAMÜRSEL', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (623, 'KARTEPE', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (624, 'KÖRFEZ', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (625, 'AHIRLI', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (626, 'AKÖREN', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (627, 'AKŞEHİR', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (628, 'ALTINEKİN', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (629, 'BEYŞEHİR', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (630, 'BOZKIR', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (631, 'CİHANBEYLİ', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (632, 'ÇELTİK', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (633, 'ÇUMRA', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (634, 'DERBENT', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (635, 'DEREBUCAK', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (636, 'DOĞANHİSAR', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (637, 'EMİRGAZİ', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (638, 'EREĞLİ', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (639, 'GÜNEYSINIR', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (640, 'HADİM', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (641, 'HALKAPINAR', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (642, 'HÜYÜK', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (643, 'ILGIN', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (644, 'KADINHANI', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (645, 'KARAPINAR', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (646, 'KARATAY', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (647, 'KULU', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (648, 'MERAM', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (649, 'SARAYÖNÜ', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (650, 'SELÇUKLU', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (651, 'SEYDİŞEHİR', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (652, 'TAŞKENT', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (653, 'TUZLUKÇU', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (654, 'YALIHÜYÜK', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (655, 'YUNAK', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (656, 'ALTINTAŞ', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (657, 'ASLANAPA', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (658, 'ÇAVDARHİSAR', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (659, 'DOMANİÇ', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (660, 'DUMLUPINAR', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (661, 'EMET', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (662, 'GEDİZ', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (663, 'HİSARCIK', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (664, 'MERKEZ', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (665, 'PAZARLAR', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (666, 'SİMAV', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (667, 'ŞAPHANE', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (668, 'TAVŞANLI', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (669, 'AKÇADAĞ', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (670, 'ARAPGİR', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (671, 'ARGUVAN', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (672, 'BATTALGAZİ', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (673, 'DARENDE', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (674, 'DOĞANŞEHİR', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (675, 'DOĞANYOL', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (676, 'HEKİMHAN', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (677, 'KALE', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (678, 'KULUNCAK', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (679, 'PÜTÜRGE', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (680, 'YAZIHAN', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (681, 'YEŞİLYURT', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (682, 'AHMETLİ', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (683, 'AKHİSAR', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (684, 'ALAŞEHİR', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (685, 'DEMİRCİ', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (686, 'GÖLMARMARA', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (687, 'GÖRDES', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (688, 'KIRKAĞAÇ', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (689, 'KÖPRÜBAŞI', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (690, 'KULA', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (691, 'SALİHLİ', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (692, 'SARIGÖL', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (693, 'SARUHANLI', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (694, 'SELENDİ', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (695, 'SOMA', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (696, 'ŞEHZADELER', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (697, 'TURGUTLU', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (698, 'YUNUSEMRE', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (699, 'ARTUKLU', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (700, 'DARGEÇİT', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (701, 'DERİK', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (702, 'KIZILTEPE', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (703, 'MAZIDAĞI', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (704, 'MİDYAT', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (705, 'NUSAYBİN', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (706, 'ÖMERLİ', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (707, 'SAVUR', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (708, 'YEŞİLLİ', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (709, 'AKDENİZ', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (710, 'ANAMUR', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (711, 'AYDINCIK', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (712, 'BOZYAZI', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (713, 'ÇAMLIYAYLA', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (714, 'ERDEMLİ', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (715, 'GÜLNAR', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (716, 'MEZİTLİ', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (717, 'MUT', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (718, 'SİLİFKE', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (719, 'TARSUS', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (720, 'TOROSLAR', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (721, 'YENİŞEHİR', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (722, 'BODRUM', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (723, 'DALAMAN', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (724, 'DATÇA', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (725, 'FETHİYE', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (726, 'KAVAKLIDERE', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (727, 'KÖYCEĞİZ', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (728, 'MARMARİS', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (729, 'MENTEŞE', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (730, 'MİLAS', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (731, 'ORTACA', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (732, 'SEYDİKEMER', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (733, 'ULA', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (734, 'YATAĞAN', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (735, 'BULANIK', 49);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (736, 'HASKÖY', 49);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (737, 'KORKUT', 49);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (738, 'MALAZGİRT', 49);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (739, 'MERKEZ', 49);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (740, 'VARTO', 49);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (741, 'ACIGÖL', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (742, 'AVANOS', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (743, 'DERİNKUYU', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (744, 'GÜLŞEHİR', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (745, 'HACIBEKTAŞ', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (746, 'KOZAKLI', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (747, 'MERKEZ', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (748, 'ÜRGÜP', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (749, 'ALTUNHİSAR', 51);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (750, 'BOR', 51);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (751, 'ÇAMARDI', 51);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (752, 'ÇİFTLİK', 51);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (753, 'MERKEZ', 51);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (754, 'ULUKIŞLA', 51);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (755, 'AKKUŞ', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (756, 'ALTINORDU', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (757, 'AYBASTI', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (758, 'ÇAMAŞ', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (759, 'ÇATALPINAR', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (760, 'ÇAYBAŞI', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (761, 'FATSA', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (762, 'GÖLKÖY', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (763, 'GÜLYALI', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (764, 'GÜRGENTEPE', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (765, 'İKİZCE', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (766, 'KABADÜZ', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (767, 'KABATAŞ', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (768, 'KORGAN', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (769, 'KUMRU', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (770, 'MESUDİYE', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (771, 'PERŞEMBE', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (772, 'ULUBEY', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (773, 'ÜNYE', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (774, 'BAHÇE', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (775, 'DÜZİÇİ', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (776, 'HASANBEYLİ', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (777, 'KADİRLİ', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (778, 'MERKEZ', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (779, 'SUMBAS', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (780, 'TOPRAKKALE', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (781, 'ARDEŞEN', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (782, 'ÇAMLIHEMŞİN', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (783, 'ÇAYELİ', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (784, 'DEREPAZARI', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (785, 'FINDIKLI', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (786, 'GÜNEYSU', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (787, 'HEMŞİN', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (788, 'İKİZDERE', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (789, 'İYİDERE', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (790, 'KALKANDERE', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (791, 'MERKEZ', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (792, 'PAZAR', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (793, 'ADAPAZARI', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (794, 'AKYAZI', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (795, 'ARİFİYE', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (796, 'ERENLER', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (797, 'FERİZLİ', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (798, 'GEYVE', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (799, 'HENDEK', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (800, 'KARAPÜRÇEK', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (801, 'KARASU', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (802, 'KAYNARCA', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (803, 'KOCAALİ', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (804, 'PAMUKOVA', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (805, 'SAPANCA', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (806, 'SERDİVAN', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (807, 'SÖĞÜTLÜ', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (808, 'TARAKLI', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (809, '19MAYIS', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (810, 'ALAÇAM', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (811, 'ASARCIK', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (812, 'ATAKUM', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (813, 'AYVACIK', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (814, 'BAFRA', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (815, 'CANİK', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (816, 'ÇARŞAMBA', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (817, 'HAVZA', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (818, 'İLKADIM', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (819, 'KAVAK', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (820, 'LADİK', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (821, 'SALIPAZARI', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (822, 'TEKKEKÖY', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (823, 'TERME', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (824, 'VEZİRKÖPRÜ', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (825, 'YAKAKENT', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (826, 'BAYKAN', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (827, 'ERUH', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (828, 'KURTALAN', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (829, 'MERKEZ', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (830, 'PERVARİ', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (831, 'ŞİRVAN', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (832, 'TİLLO', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (833, 'AYANCIK', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (834, 'BOYABAT', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (835, 'DİKMEN', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (836, 'DURAĞAN', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (837, 'ERFELEK', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (838, 'GERZE', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (839, 'MERKEZ', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (840, 'SARAYDÜZÜ', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (841, 'TÜRKELİ', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (842, 'AKINCILAR', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (843, 'ALTINYAYLA', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (844, 'DİVRİĞİ', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (845, 'DOĞANŞAR', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (846, 'GEMEREK', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (847, 'GÖLOVA', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (848, 'GÜRÜN', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (849, 'HAFİK', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (850, 'İMRANLI', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (851, 'KANGAL', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (852, 'KOYULHİSAR', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (853, 'MERKEZ', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (854, 'SUŞEHRİ', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (855, 'ŞARKIŞLA', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (856, 'ULAŞ', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (857, 'YILDIZELİ', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (858, 'ZARA', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (859, 'AKÇAKALE', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (860, 'BİRECİK', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (861, 'BOZOVA', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (862, 'CEYLANPINAR', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (863, 'EYYÜBİYE', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (864, 'HALFETİ', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (865, 'HALİLİYE', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (866, 'HARRAN', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (867, 'HİLVAN', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (868, 'KARAKÖPRÜ', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (869, 'SİVEREK', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (870, 'SURUÇ', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (871, 'VİRANŞEHİR', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (872, 'BEYTÜŞŞEBAP', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (873, 'CİZRE', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (874, 'GÜÇLÜKONAK', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (875, 'İDİL', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (876, 'MERKEZ', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (877, 'SİLOPİ', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (878, 'ULUDERE', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (879, 'ÇERKEZKÖY', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (880, 'ÇORLU', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (881, 'ERGENE', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (882, 'HAYRABOLU', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (883, 'KAPAKLI', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (884, 'MALKARA', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (885, 'MARMARAEREĞLİSİ', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (886, 'MURATLI', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (887, 'SARAY', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (888, 'SÜLEYMANPAŞA', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (889, 'ŞARKÖY', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (890, 'ALMUS', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (891, 'ARTOVA', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (892, 'BAŞÇİFTLİK', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (893, 'ERBAA', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (894, 'MERKEZ', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (895, 'NİKSAR', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (896, 'PAZAR', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (897, 'REŞADİYE', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (898, 'SULUSARAY', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (899, 'TURHAL', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (900, 'YEŞİLYURT', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (901, 'ZİLE', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (902, 'AKÇAABAT', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (903, 'ARAKLI', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (904, 'ARSİN', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (905, 'BEŞİKDÜZÜ', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (906, 'ÇARŞIBAŞI', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (907, 'ÇAYKARA', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (908, 'DERNEKPAZARI', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (909, 'DÜZKÖY', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (910, 'HAYRAT', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (911, 'KÖPRÜBAŞI', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (912, 'MAÇKA', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (913, 'OF', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (914, 'ORTAHİSAR', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (915, 'SÜRMENE', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (916, 'ŞALPAZARI', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (917, 'TONYA', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (918, 'VAKFIKEBİR', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (919, 'YOMRA', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (920, 'ÇEMİŞGEZEK', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (921, 'HOZAT', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (922, 'MAZGİRT', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (923, 'MERKEZ', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (924, 'NAZIMİYE', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (925, 'OVACIK', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (926, 'PERTEK', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (927, 'PÜLÜMÜR', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (928, 'BANAZ', 64);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (929, 'EŞME', 64);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (930, 'KARAHALLI', 64);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (931, 'MERKEZ', 64);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (932, 'SİVASLI', 64);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (933, 'ULUBEY', 64);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (934, 'BAHÇESARAY', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (935, 'BAŞKALE', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (936, 'ÇALDIRAN', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (937, 'ÇATAK', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (938, 'EDREMİT', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (939, 'ERCİŞ', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (940, 'GEVAŞ', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (941, 'GÜRPINAR', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (942, 'İPEKYOLU', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (943, 'MURADİYE', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (944, 'ÖZALP', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (945, 'SARAY', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (946, 'TUŞBA', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (947, 'ALTINOVA', 77);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (948, 'ARMUTLU', 77);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (949, 'ÇINARCIK', 77);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (950, 'ÇİFTLİKKÖY', 77);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (951, 'MERKEZ', 77);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (952, 'TERMAL', 77);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (953, 'AKDAĞMADENİ', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (954, 'AYDINCIK', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (955, 'BOĞAZLIYAN', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (956, 'ÇANDIR', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (957, 'ÇAYIRALAN', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (958, 'ÇEKEREK', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (959, 'KADIŞEHRİ', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (960, 'MERKEZ', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (961, 'SARAYKENT', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (962, 'SARIKAYA', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (963, 'SORGUN', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (964, 'ŞEFAATLİ', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (965, 'YENİFAKILI', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (966, 'YERKÖY', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (967, 'ALAPLI', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (968, 'ÇAYCUMA', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (969, 'DEVREK', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (970, 'EREĞLİ', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (971, 'GÖKÇEBEY', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (972, 'KİLİMLİ', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (973, 'KOZLU', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (974, 'MERKEZ', 67);


--
-- TOC entry 3393 (class 0 OID 16394)
-- Dependencies: 210
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.doctors (user_id, specialty, fullname, sex, birth_date, phone, city_id, district_id) VALUES (348, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 3397 (class 0 OID 16411)
-- Dependencies: 214
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3400 (class 0 OID 16433)
-- Dependencies: 217
-- Data for Name: labs; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3401 (class 0 OID 16436)
-- Dependencies: 218
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, city_id, district_id) VALUES (345, NULL, NULL, 'Erkek', 0, NULL, 0, '', '', NULL, NULL, NULL, '2022-04-09', NULL, NULL, NULL, 7, 94);
INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, city_id, district_id) VALUES (349, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, city_id, district_id) VALUES (350, NULL, NULL, NULL, 0, NULL, 0, NULL, 'dbdbg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 3399 (class 0 OID 16430)
-- Dependencies: 216
-- Data for Name: prescriptions; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3396 (class 0 OID 16408)
-- Dependencies: 213
-- Data for Name: privileges; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.privileges (role, id) OVERRIDING SYSTEM VALUE VALUES ('Yönetici', 1);
INSERT INTO public.privileges (role, id) OVERRIDING SYSTEM VALUE VALUES ('Doktor', 2);
INSERT INTO public.privileges (role, id) OVERRIDING SYSTEM VALUE VALUES ('Hasta', 3);


--
-- TOC entry 3409 (class 0 OID 16544)
-- Dependencies: 226
-- Data for Name: supervisors; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('dfgdfgdf', 261, true);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES (NULL, 347, false);


--
-- TOC entry 3394 (class 0 OID 16401)
-- Dependencies: 211
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (347, NULL, NULL, 1);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (348, NULL, NULL, 2);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (349, NULL, NULL, 3);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (350, 'dgbgdbgd', 'dgbgdbdg', 3);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (261, '123456', 'hatitech.app@gmail.com', 1);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (345, '123456', 'hatitech.app1@gmail.com', 3);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 224
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.appointments_id_seq', 0, false);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 223
-- Name: clinics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.clinics_id_seq', 0, false);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 229
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.districts_id_seq', 974, true);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 215
-- Name: file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.file_id_seq', 0, false);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 222
-- Name: labs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.labs_id_seq', 0, false);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 221
-- Name: prescriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.prescriptions_id_seq', 0, false);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 225
-- Name: privileges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.privileges_id_seq', 12, true);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 212
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_id_seq', 350, true);


--
-- TOC entry 3230 (class 2606 OID 16488)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 16710)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 3228 (class 2606 OID 16486)
-- Name: clinics clinics_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.clinics
    ADD CONSTRAINT clinics_pkey PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 16758)
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 2606 OID 16450)
-- Name: doctors doctors_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_user_id_key UNIQUE (user_id);


--
-- TOC entry 3226 (class 2606 OID 16457)
-- Name: patients patients_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_user_id_key UNIQUE (user_id);


--
-- TOC entry 3224 (class 2606 OID 16538)
-- Name: privileges privileges_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.privileges
    ADD CONSTRAINT privileges_pkey PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 16562)
-- Name: supervisors supervisors_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.supervisors
    ADD CONSTRAINT supervisors_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3220 (class 2606 OID 16415)
-- Name: users user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 16532)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3249 (class 2606 OID 16489)
-- Name: appointments appointments_clinic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_clinic_id_fkey FOREIGN KEY (clinic_id) REFERENCES public.clinics(id) NOT VALID;


--
-- TOC entry 3250 (class 2606 OID 16494)
-- Name: appointments appointments_dr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_dr_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(user_id) NOT VALID;


--
-- TOC entry 3251 (class 2606 OID 16499)
-- Name: appointments appointments_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(user_id) NOT VALID;


--
-- TOC entry 3248 (class 2606 OID 16509)
-- Name: clinics clinics_appointment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.clinics
    ADD CONSTRAINT clinics_appointment_id_fkey FOREIGN KEY (appointment_id) REFERENCES public.appointments(id) NOT VALID;


--
-- TOC entry 3247 (class 2606 OID 16504)
-- Name: clinics clinics_dr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.clinics
    ADD CONSTRAINT clinics_dr_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(user_id) NOT VALID;


--
-- TOC entry 3253 (class 2606 OID 16822)
-- Name: districts districts_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id) NOT VALID;


--
-- TOC entry 3237 (class 2606 OID 16421)
-- Name: doctors doctor_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctor_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3238 (class 2606 OID 16779)
-- Name: doctors doctors_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id) NOT VALID;


--
-- TOC entry 3239 (class 2606 OID 16784)
-- Name: doctors doctors_district_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_district_id_fkey FOREIGN KEY (district_id) REFERENCES public.districts(id) NOT VALID;


--
-- TOC entry 3243 (class 2606 OID 16472)
-- Name: labs labs_dr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.labs
    ADD CONSTRAINT labs_dr_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(user_id) NOT VALID;


--
-- TOC entry 3242 (class 2606 OID 16467)
-- Name: labs labs_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.labs
    ADD CONSTRAINT labs_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(user_id) NOT VALID;


--
-- TOC entry 3245 (class 2606 OID 16752)
-- Name: patients patients_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(id) NOT VALID;


--
-- TOC entry 3246 (class 2606 OID 16759)
-- Name: patients patients_district_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_district_id_fkey FOREIGN KEY (district_id) REFERENCES public.districts(id) NOT VALID;


--
-- TOC entry 3244 (class 2606 OID 16514)
-- Name: patients patients_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3240 (class 2606 OID 16451)
-- Name: prescriptions prescriptions_dr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_dr_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(user_id) NOT VALID;


--
-- TOC entry 3241 (class 2606 OID 16458)
-- Name: prescriptions prescriptions_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(user_id) NOT VALID;


--
-- TOC entry 3252 (class 2606 OID 16549)
-- Name: supervisors supervisors_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.supervisors
    ADD CONSTRAINT supervisors_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE appointments; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.appointments FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.appointments TO root;


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE clinics; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.clinics FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.clinics TO root;


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE doctors; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.doctors FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.doctors TO root;


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE files; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.files FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.files TO root;


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE labs; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.labs FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.labs TO root;


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE patients; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.patients FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.patients TO root;


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE prescriptions; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.prescriptions FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.prescriptions TO root;


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE privileges; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.privileges FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.privileges TO root;


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE supervisors; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.supervisors FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.supervisors TO root;


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE users; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.users FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.users TO root;


-- Completed on 2022-04-11 17:54:25

--
-- PostgreSQL database dump complete
--

