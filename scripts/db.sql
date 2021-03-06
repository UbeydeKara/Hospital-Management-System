--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-05-24 20:08:08

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
-- TOC entry 3416 (class 0 OID 0)
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
    id smallint NOT NULL,
    name character varying(50)
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
-- TOC entry 3401 (class 0 OID 16442)
-- Dependencies: 220
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.appointments (id, date, clinic_id, doc_id, patient_id) OVERRIDING SYSTEM VALUE VALUES (3, '2022-04-21', 3, 360, 370);
INSERT INTO public.appointments (id, date, clinic_id, doc_id, patient_id) OVERRIDING SYSTEM VALUE VALUES (4, '2022-05-12', 2, 360, 372);


--
-- TOC entry 3408 (class 0 OID 16691)
-- Dependencies: 227
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.cities (id, name) VALUES (1, 'ADANA');
INSERT INTO public.cities (id, name) VALUES (4, 'A??RI');
INSERT INTO public.cities (id, name) VALUES (5, 'AMASYA');
INSERT INTO public.cities (id, name) VALUES (6, 'ANKARA');
INSERT INTO public.cities (id, name) VALUES (7, 'ANTALYA');
INSERT INTO public.cities (id, name) VALUES (10, 'BALIKES??R');
INSERT INTO public.cities (id, name) VALUES (11, 'B??LEC??K');
INSERT INTO public.cities (id, name) VALUES (12, 'B??NG??L');
INSERT INTO public.cities (id, name) VALUES (13, 'B??TL??S');
INSERT INTO public.cities (id, name) VALUES (14, 'BOLU');
INSERT INTO public.cities (id, name) VALUES (15, 'BURDUR');
INSERT INTO public.cities (id, name) VALUES (16, 'BURSA');
INSERT INTO public.cities (id, name) VALUES (17, '??ANAKKALE');
INSERT INTO public.cities (id, name) VALUES (18, '??ANKIRI');
INSERT INTO public.cities (id, name) VALUES (19, '??ORUM');
INSERT INTO public.cities (id, name) VALUES (20, 'DEN??ZL??');
INSERT INTO public.cities (id, name) VALUES (21, 'D??YARBAKIR');
INSERT INTO public.cities (id, name) VALUES (22, 'ED??RNE');
INSERT INTO public.cities (id, name) VALUES (23, 'ELAZI??');
INSERT INTO public.cities (id, name) VALUES (25, 'ERZURUM');
INSERT INTO public.cities (id, name) VALUES (26, 'ESK????EH??R');
INSERT INTO public.cities (id, name) VALUES (27, 'GAZ??ANTEP');
INSERT INTO public.cities (id, name) VALUES (29, 'G??M????HANE');
INSERT INTO public.cities (id, name) VALUES (30, 'HAKKAR??');
INSERT INTO public.cities (id, name) VALUES (31, 'HATAY');
INSERT INTO public.cities (id, name) VALUES (32, 'ISPARTA');
INSERT INTO public.cities (id, name) VALUES (33, '????EL');
INSERT INTO public.cities (id, name) VALUES (34, '??STANBUL');
INSERT INTO public.cities (id, name) VALUES (35, '??ZM??R');
INSERT INTO public.cities (id, name) VALUES (36, 'KARS');
INSERT INTO public.cities (id, name) VALUES (37, 'KASTAMONU');
INSERT INTO public.cities (id, name) VALUES (38, 'KAYSER??');
INSERT INTO public.cities (id, name) VALUES (39, 'KIRKLAREL??');
INSERT INTO public.cities (id, name) VALUES (40, 'KIR??EH??R');
INSERT INTO public.cities (id, name) VALUES (41, 'KOCAEL??');
INSERT INTO public.cities (id, name) VALUES (42, 'KONYA');
INSERT INTO public.cities (id, name) VALUES (43, 'K??TAHYA');
INSERT INTO public.cities (id, name) VALUES (44, 'MALATYA');
INSERT INTO public.cities (id, name) VALUES (45, 'MAN??SA');
INSERT INTO public.cities (id, name) VALUES (46, 'KAHRAMANMARA??');
INSERT INTO public.cities (id, name) VALUES (48, 'MU??LA');
INSERT INTO public.cities (id, name) VALUES (49, 'MU??');
INSERT INTO public.cities (id, name) VALUES (50, 'NEV??EH??R');
INSERT INTO public.cities (id, name) VALUES (51, 'N????DE');
INSERT INTO public.cities (id, name) VALUES (52, 'ORDU');
INSERT INTO public.cities (id, name) VALUES (53, 'R??ZE');
INSERT INTO public.cities (id, name) VALUES (54, 'SAKARYA');
INSERT INTO public.cities (id, name) VALUES (56, 'S????RT');
INSERT INTO public.cities (id, name) VALUES (57, 'S??NOP');
INSERT INTO public.cities (id, name) VALUES (58, 'S??VAS');
INSERT INTO public.cities (id, name) VALUES (59, 'TEK??RDA??');
INSERT INTO public.cities (id, name) VALUES (60, 'TOKAT');
INSERT INTO public.cities (id, name) VALUES (62, 'TUNCEL??');
INSERT INTO public.cities (id, name) VALUES (63, '??ANLIURFA');
INSERT INTO public.cities (id, name) VALUES (64, 'U??AK');
INSERT INTO public.cities (id, name) VALUES (66, 'YOZGAT');
INSERT INTO public.cities (id, name) VALUES (67, 'ZONGULDAK');
INSERT INTO public.cities (id, name) VALUES (68, 'AKSARAY');
INSERT INTO public.cities (id, name) VALUES (69, 'BAYBURT');
INSERT INTO public.cities (id, name) VALUES (71, 'KIRIKKALE');
INSERT INTO public.cities (id, name) VALUES (73, '??IRNAK');
INSERT INTO public.cities (id, name) VALUES (76, 'I??DIR');
INSERT INTO public.cities (id, name) VALUES (77, 'YALOVA');
INSERT INTO public.cities (id, name) VALUES (78, 'KARAB??K');
INSERT INTO public.cities (id, name) VALUES (79, 'K??L??S');
INSERT INTO public.cities (id, name) VALUES (80, 'OSMAN??YE');
INSERT INTO public.cities (id, name) VALUES (81, 'D??ZCE');
INSERT INTO public.cities (id, name) VALUES (2, 'ADIYAMAN');
INSERT INTO public.cities (id, name) VALUES (3, 'AFYON');
INSERT INTO public.cities (id, name) VALUES (8, 'ARTV??N');
INSERT INTO public.cities (id, name) VALUES (9, 'AYDIN');
INSERT INTO public.cities (id, name) VALUES (24, 'ERZ??NCAN');
INSERT INTO public.cities (id, name) VALUES (28, 'G??RESUN');
INSERT INTO public.cities (id, name) VALUES (47, 'MARD??N');
INSERT INTO public.cities (id, name) VALUES (55, 'SAMSUN');
INSERT INTO public.cities (id, name) VALUES (61, 'TRABZON');
INSERT INTO public.cities (id, name) VALUES (65, 'VAN');
INSERT INTO public.cities (id, name) VALUES (70, 'KARAMAN');
INSERT INTO public.cities (id, name) VALUES (72, 'BATMAN');
INSERT INTO public.cities (id, name) VALUES (74, 'BARTIN');
INSERT INTO public.cities (id, name) VALUES (75, 'ARDAHAN');


--
-- TOC entry 3400 (class 0 OID 16439)
-- Dependencies: 219
-- Data for Name: clinics; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (0, 'ALGOLOJ??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (2, 'BEY??N VE S??N??R CERRAH??S??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (3, '??OCUK ALERJ??S??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (4, '??OCUK CERRAH??S??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (5, '??OCUK ENDOKR??NOLOJ??S??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (6, '??OCUK ENFEKS??YON');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (7, '??OCUK G??????S HASTALIKLARI');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (8, '??OCUK HEMATOLOJ??S??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (9, '??OCUK KARD??YOLOJ??S??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (10, '??OCUK METABOL??ZMA');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (11, '??OCUK NEFROLOJ??S??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (12, '??OCUK N??ROLOJ??S??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (13, '??OCUK PS??K??YATR??S??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (14, '??OCUK SA??LI??I VE HASTALIKLARI');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (15, '??OCUK ??ROLOJ??S??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (16, 'DERMATOLOJ?? (C??LD??YE)');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (17, 'ENDOKR??NOLOJ?? VE METABOL??ZMA');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (18, 'ENFEKS??YON HASTALIKLARI');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (19, 'F??Z??KSEL TIP VE REHAB??L??TASYON');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (20, 'GASTROENTEROLOJ??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (21, 'GELENEKSEL VE TAMAMLAYICI TIP(GETAMER)');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (22, 'GENEL CERRAH??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (23, 'GER??ATR??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (24, 'G??????S CERRAH??S??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (25, 'G??????S HASTALIKLARI');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (26, 'G??Z HASTALIKLARI');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (27, 'HEMATOLOJ??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (28, '???? HASTALIKLARI');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (29, 'KADIN HASTALIKLARI VE DO??UM');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (30, 'KALP VE DAMAR CERRAH??S??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (31, 'KARD??YOLOJ??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (32, 'KEM??K YO??UNLU??U ??L????M??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (33, 'KULAK-BURUN-BO??AZ HASTALIKLARI');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (34, 'NEFROLOJ??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (35, 'N??ROLOJ??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (36, 'ORTOPED?? VE TRAVMATOLOJ??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (37, 'PLAST??K REKONSTR??KT??F VE ESTET??K CERRAH??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (38, 'PS??K??YATR??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (39, 'RADYASYON ONKOLOJ??S??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (40, 'TIBB?? GENET??K');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (41, 'TIBB?? PATOLOJ??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (42, '??ROLOJ??');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (1, 'BESLENME VE D??YET');
INSERT INTO public.clinics (id, name) OVERRIDING SYSTEM VALUE VALUES (44, 'deneme');


--
-- TOC entry 3409 (class 0 OID 16694)
-- Dependencies: 228
-- Data for Name: districts; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (2, 'ALADA??', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (3, 'CEYHAN', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (4, '??UKUROVA', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (5, 'FEKE', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (6, '??MAMO??LU', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (7, 'KARA??SALI', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (8, 'KARATA??', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (9, 'KOZAN', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (10, 'POZANTI', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (11, 'SA??MBEYL??', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (12, 'SARI??AM', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (13, 'SEYHAN', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (14, 'TUFANBEYL??', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (15, 'YUMURTALIK', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (16, 'Y??RE????R', 1);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (17, 'BESN??', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (18, '??EL??KHAN', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (19, 'GERGER', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (20, 'G??LBA??I', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (21, 'KAHTA', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (22, 'MERKEZ', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (23, 'SAMSAT', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (24, 'S??NC??K', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (25, 'TUT', 2);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (26, 'BA??MAK??I', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (27, 'BAYAT', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (28, 'BOLVAD??N', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (29, '??AY', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (30, '??OBANLAR', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (31, 'DAZKIRI', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (32, 'D??NAR', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (33, 'EM??RDA??', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (34, 'EVC??LER', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (35, 'HOCALAR', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (36, '??HSAN??YE', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (37, '??SCEH??SAR', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (38, 'KIZIL??REN', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (39, 'MERKEZ', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (40, 'SANDIKLI', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (41, 'S??NANPA??A', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (42, 'SULTANDA??I', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (43, '??UHUT', 3);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (44, 'D??YAD??N', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (45, 'DO??UBAYAZIT', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (46, 'ELE??K??RT', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (47, 'HAMUR', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (48, 'MERKEZ', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (49, 'PATNOS', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (50, 'TA??LI??AY', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (51, 'TUTAK', 4);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (52, 'A??A????REN', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (53, 'ESK??L', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (54, 'G??LA??A??', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (55, 'G??ZELYURT', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (56, 'MERKEZ', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (57, 'ORTAK??Y', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (58, 'SARIYAH????', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (59, 'SULTANHANI', 68);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (60, 'G??YN??CEK', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (61, 'G??M????HACIK??Y', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (62, 'HAMAM??Z??', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (63, 'MERKEZ', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (64, 'MERZ??FON', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (65, 'SULUOVA', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (66, 'TA??OVA', 5);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (67, 'AKYURT', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (68, 'ALTINDA??', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (69, 'AYA??', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (70, 'BALA', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (71, 'BEYPAZARI', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (72, '??AMLIDERE', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (73, '??ANKAYA', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (74, '??UBUK', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (75, 'ELMADA??', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (76, 'ET??MESGUT', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (77, 'EVREN', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (78, 'G??LBA??I', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (79, 'G??D??L', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (80, 'HAYMANA', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (81, 'KAHRAMANKAZAN', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (82, 'KALEC??K', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (83, 'KE??????REN', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (84, 'KIZILCAHAMAM', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (85, 'MAMAK', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (86, 'NALLIHAN', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (87, 'POLATLI', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (88, 'PURSAKLAR', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (89, 'S??NCAN', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (90, '??EREFL??KO??H??SAR', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (91, 'YEN??MAHALLE', 6);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (92, 'AKSEK??', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (93, 'AKSU', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (94, 'ALANYA', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (95, 'DEMRE', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (96, 'D????EMEALTI', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (97, 'ELMALI', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (98, 'F??N??KE', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (99, 'GAZ??PA??A', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (100, 'G??NDO??MU??', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (101, '??BRADI', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (102, 'KA??', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (103, 'KEMER', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (104, 'KEPEZ', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (105, 'KONYAALTI', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (106, 'KORKUTEL??', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (107, 'KUMLUCA', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (108, 'MANAVGAT', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (109, 'MURATPA??A', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (110, 'SER??K', 7);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (111, '??ILDIR', 75);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (112, 'DAMAL', 75);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (113, 'G??LE', 75);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (114, 'HANAK', 75);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (115, 'MERKEZ', 75);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (116, 'POSOF', 75);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (117, 'ARDANU??', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (118, 'ARHAV??', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (119, 'BOR??KA', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (120, 'HOPA', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (121, 'KEMALPA??A', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (122, 'MERKEZ', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (123, 'MURGUL', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (124, '??AV??AT', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (125, 'YUSUFEL??', 8);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (126, 'BOZDO??AN', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (127, 'BUHARKENT', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (128, '????NE', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (129, 'D??D??M', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (130, 'EFELER', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (131, 'GERMENC??K', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (132, '??NC??RL??OVA', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (133, 'KARACASU', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (134, 'KARPUZLU', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (135, 'KO??ARLI', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (136, 'K????K', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (137, 'KU??ADASI', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (138, 'KUYUCAK', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (139, 'NAZ??LL??', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (140, 'S??KE', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (141, 'SULTANH??SAR', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (142, 'YEN??PAZAR', 9);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (143, 'ALTIEYL??L', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (144, 'AYVALIK', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (145, 'BALYA', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (146, 'BANDIRMA', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (147, 'B??GAD????', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (148, 'BURHAN??YE', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (149, 'DURSUNBEY', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (150, 'EDREM??T', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (151, 'ERDEK', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (152, 'G??ME??', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (153, 'G??NEN', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (154, 'HAVRAN', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (155, '??VR??ND??', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (156, 'KARES??', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (157, 'KEPSUT', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (158, 'MANYAS', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (159, 'MARMARA', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (160, 'SAVA??TEPE', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (161, 'SINDIRGI', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (162, 'SUSURLUK', 10);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (163, 'AMASRA', 74);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (164, 'KURUCA????LE', 74);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (165, 'MERKEZ', 74);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (166, 'ULUS', 74);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (167, 'BE????R??', 72);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (168, 'GERC????', 72);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (169, 'HASANKEYF', 72);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (170, 'KOZLUK', 72);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (171, 'MERKEZ', 72);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (172, 'SASON', 72);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (173, 'AYDINTEPE', 69);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (174, 'DEM??R??Z??', 69);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (175, 'MERKEZ', 69);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (176, 'BOZ??Y??K', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (177, 'G??LPAZARI', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (178, '??NH??SAR', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (179, 'MERKEZ', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (180, 'OSMANEL??', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (181, 'PAZARYER??', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (182, 'S??????T', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (183, 'YEN??PAZAR', 11);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (184, 'ADAKLI', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (185, 'GEN??', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (186, 'KARLIOVA', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (187, 'K????I', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (188, 'MERKEZ', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (189, 'SOLHAN', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (190, 'YAYLADERE', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (191, 'YED??SU', 12);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (192, 'AD??LCEVAZ', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (193, 'AHLAT', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (194, 'G??ROYMAK', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (195, 'H??ZAN', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (196, 'MERKEZ', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (197, 'MUTK??', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (198, 'TATVAN', 13);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (199, 'D??RTD??VAN', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (200, 'GEREDE', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (201, 'G??YN??K', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (202, 'KIBRISCIK', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (203, 'MENGEN', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (204, 'MERKEZ', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (205, 'MUDURNU', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (206, 'SEBEN', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (207, 'YEN????A??A', 14);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (208, 'A??LASUN', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (209, 'ALTINYAYLA', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (210, 'BUCAK', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (211, '??AVDIR', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (212, '??ELT??K????', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (213, 'G??LH??SAR', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (214, 'KARAMANLI', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (215, 'KEMER', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (216, 'MERKEZ', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (217, 'TEFENN??', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (218, 'YE????LOVA', 15);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (219, 'B??Y??KORHAN', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (220, 'GEML??K', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (221, 'G??RSU', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (222, 'HARMANCIK', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (223, '??NEG??L', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (224, '??ZN??K', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (225, 'KARACABEY', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (226, 'KELES', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (227, 'KESTEL', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (228, 'MUDANYA', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (229, 'MUSTAFAKEMALPA??A', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (230, 'N??L??FER', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (231, 'ORHANEL??', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (232, 'ORHANGAZ??', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (233, 'OSMANGAZ??', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (234, 'YEN????EH??R', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (235, 'YILDIRIM', 16);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (236, 'AYVACIK', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (237, 'BAYRAM????', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (238, 'B??GA', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (239, 'BOZCAADA', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (240, '??AN', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (241, 'ECEABAT', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (242, 'EZ??NE', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (243, 'GEL??BOLU', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (244, 'G??K??EADA', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (245, 'LAPSEK??', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (246, 'MERKEZ', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (247, 'YEN??CE', 17);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (248, 'ATKARACALAR', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (249, 'BAYRAM??REN', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (250, '??ERKE??', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (251, 'ELD??VAN', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (252, 'ILGAZ', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (253, 'KIZILIRMAK', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (254, 'KORGUN', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (255, 'KUR??UNLU', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (256, 'MERKEZ', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (257, 'ORTA', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (258, '??ABAN??Z??', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (259, 'YAPRAKLI', 18);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (260, 'ALACA', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (261, 'BAYAT', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (262, 'BO??AZKALE', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (263, 'DODURGA', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (264, '??SK??L??P', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (265, 'KARGI', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (266, 'LA????N', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (267, 'MEC??T??Z??', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (268, 'MERKEZ', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (269, 'O??UZLAR', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (270, 'ORTAK??Y', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (271, 'OSMANCIK', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (272, 'SUNGURLU', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (273, 'U??URLUDA??', 19);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (274, 'ACIPAYAM', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (275, 'BABADA??', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (276, 'BAKLAN', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (277, 'BEK??LL??', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (278, 'BEYA??A??', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (279, 'BOZKURT', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (280, 'BULDAN', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (281, '??AL', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (282, '??AMEL??', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (283, '??ARDAK', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (284, '????VR??L', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (285, 'G??NEY', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (286, 'HONAZ', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (287, 'KALE', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (288, 'MERKEZEFEND??', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (289, 'PAMUKKALE', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (290, 'SARAYK??Y', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (291, 'SER??NH??SAR', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (292, 'TAVAS', 20);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (293, 'BA??LAR', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (294, 'B??SM??L', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (295, '??ERM??K', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (296, '??INAR', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (297, '????NG????', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (298, 'D??CLE', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (299, 'E????L', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (300, 'ERGAN??', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (301, 'HAN??', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (302, 'HAZRO', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (303, 'KAYAPINAR', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (304, 'KOCAK??Y', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (305, 'KULP', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (306, 'L??CE', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (307, 'S??LVAN', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (308, 'SUR', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (309, 'YEN????EH??R', 21);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (310, 'AK??AKOCA', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (311, 'CUMAYER??', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (312, '????L??ML??', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (313, 'G??LYAKA', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (314, 'G??M????OVA', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (315, 'KAYNA??LI', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (316, 'MERKEZ', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (317, 'YI??ILCA', 81);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (318, 'ENEZ', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (319, 'HAVSA', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (320, '??PSALA', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (321, 'KE??AN', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (322, 'LALAPA??A', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (323, 'MER????', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (324, 'MERKEZ', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (325, 'S??LO??LU', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (326, 'UZUNK??PR??', 22);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (327, 'A??IN', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (328, 'ALACAKAYA', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (329, 'ARICAK', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (330, 'BASK??L', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (331, 'KARAKO??AN', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (332, 'KEBAN', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (333, 'KOVANCILAR', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (334, 'MADEN', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (335, 'MERKEZ', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (336, 'PALU', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (337, 'S??VR??CE', 23);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (338, '??AYIRLI', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (339, '??L????', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (340, 'KEMAH', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (341, 'KEMAL??YE', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (342, 'MERKEZ', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (343, 'OTLUKBEL??', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (344, 'REFAH??YE', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (345, 'TERCAN', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (346, '??Z??ML??', 24);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (347, 'A??KALE', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (348, 'AZ??Z??YE', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (349, '??AT', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (350, 'HINIS', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (351, 'HORASAN', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (352, '??SP??R', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (353, 'KARA??OBAN', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (354, 'KARAYAZI', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (355, 'K??PR??K??Y', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (356, 'NARMAN', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (357, 'OLTU', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (358, 'OLUR', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (359, 'PALAND??KEN', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (360, 'PAS??NLER', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (361, 'PAZARYOLU', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (362, '??ENKAYA', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (363, 'TEKMAN', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (364, 'TORTUM', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (365, 'UZUNDERE', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (366, 'YAKUT??YE', 25);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (367, 'ALPU', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (368, 'BEYL??KOVA', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (369, '????FTELER', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (370, 'G??NY??Z??', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (371, 'HAN', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (372, '??N??N??', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (373, 'MAHMUD??YE', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (374, 'M??HALGAZ??', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (375, 'M??HALI????IK', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (376, 'ODUNPAZARI', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (377, 'SARICAKAYA', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (378, 'SEY??TGAZ??', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (379, 'S??VR??H??SAR', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (380, 'TEPEBA??I', 26);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (381, 'ARABAN', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (382, '??SLAH??YE', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (383, 'KARKAMI??', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (384, 'N??Z??P', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (385, 'NURDA??I', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (386, 'O??UZEL??', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (387, '??AH??NBEY', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (388, '??EH??TKAM??L', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (389, 'YAVUZEL??', 27);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (390, 'ALUCRA', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (391, 'BULANCAK', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (392, '??AMOLUK', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (393, '??ANAK??I', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (394, 'DEREL??', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (395, 'DO??ANKENT', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (396, 'ESP??YE', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (397, 'EYNES??L', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (398, 'G??RELE', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (399, 'G??CE', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (400, 'KE??AP', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (401, 'MERKEZ', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (402, 'P??RAZ??Z', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (403, '??EB??NKARAH??SAR', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (404, 'T??REBOLU', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (405, 'YA??LIDERE', 28);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (406, 'KELK??T', 29);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (407, 'K??SE', 29);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (408, 'K??RT??N', 29);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (409, 'MERKEZ', 29);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (410, '????RAN', 29);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (411, 'TORUL', 29);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (412, '??UKURCA', 30);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (413, 'DEREC??K', 30);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (414, 'MERKEZ', 30);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (415, '??EMD??NL??', 30);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (416, 'Y??KSEKOVA', 30);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (417, 'ALTIN??Z??', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (418, 'ANTAKYA', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (419, 'ARSUZ', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (420, 'BELEN', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (421, 'DEFNE', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (422, 'D??RTYOL', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (423, 'ERZ??N', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (424, 'HASSA', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (425, '??SKENDERUN', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (426, 'KIRIKHAN', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (427, 'KUMLU', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (428, 'PAYAS', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (429, 'REYHANLI', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (430, 'SAMANDA??', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (431, 'YAYLADA??I', 31);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (432, 'ARALIK', 76);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (433, 'KARAKOYUNLU', 76);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (434, 'MERKEZ', 76);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (435, 'TUZLUCA', 76);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (436, 'AKSU', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (437, 'ATABEY', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (438, 'E????RD??R', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (439, 'GELENDOST', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (440, 'G??NEN', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (441, 'KE????BORLU', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (442, 'MERKEZ', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (443, 'SEN??RKENT', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (444, 'S??T????LER', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (445, '??ARK??KARAA??A??', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (446, 'ULUBORLU', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (447, 'YALVA??', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (448, 'YEN????ARBADEML??', 32);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (449, 'ADALAR', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (450, 'ARNAVUTK??Y', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (451, 'ATA??EH??R', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (452, 'AVCILAR', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (453, 'BA??CILAR', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (454, 'BAH??EL??EVLER', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (455, 'BAKIRK??Y', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (456, 'BA??AK??EH??R', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (457, 'BAYRAMPA??A', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (458, 'BE????KTA??', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (459, 'BEYKOZ', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (460, 'BEYL??KD??Z??', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (461, 'BEYO??LU', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (462, 'B??Y??K??EKMECE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (463, '??ATALCA', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (464, '??EKMEK??Y', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (465, 'ESENLER', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (466, 'ESENYURT', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (467, 'EY??PSULTAN', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (468, 'FAT??H', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (469, 'GAZ??OSMANPA??A', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (470, 'G??NG??REN', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (471, 'KADIK??Y', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (472, 'KA??ITHANE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (473, 'KARTAL', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (474, 'K??????K??EKMECE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (475, 'MALTEPE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (476, 'PEND??K', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (477, 'SANCAKTEPE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (478, 'SARIYER', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (479, 'S??L??VR??', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (480, 'SULTANBEYL??', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (481, 'SULTANGAZ??', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (482, '????LE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (483, '??????L??', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (484, 'TUZLA', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (485, '??MRAN??YE', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (486, '??SK??DAR', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (487, 'ZEYT??NBURNU', 34);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (488, 'AL??A??A', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (489, 'BAL??OVA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (490, 'BAYINDIR', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (491, 'BAYRAKLI', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (492, 'BERGAMA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (493, 'BEYDA??', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (494, 'BORNOVA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (495, 'BUCA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (496, '??E??ME', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (497, '??????L??', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (498, 'D??K??L??', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (499, 'FO??A', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (500, 'GAZ??EM??R', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (501, 'G??ZELBAH??E', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (502, 'KARABA??LAR', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (503, 'KARABURUN', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (504, 'KAR??IYAKA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (505, 'KEMALPA??A', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (506, 'KINIK', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (507, 'K??RAZ', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (508, 'KONAK', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (509, 'MENDERES', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (510, 'MENEMEN', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (511, 'NARLIDERE', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (512, '??DEM????', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (513, 'SEFER??H??SAR', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (514, 'SEL??UK', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (515, 'T??RE', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (516, 'TORBALI', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (517, 'URLA', 35);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (518, 'AF????N', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (519, 'ANDIRIN', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (520, '??A??LAYANCER??T', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (521, 'DULKAD??RO??LU', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (522, 'EK??N??Z??', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (523, 'ELB??STAN', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (524, 'G??KSUN', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (525, 'NURHAK', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (526, 'ON??K????UBAT', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (527, 'PAZARCIK', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (528, 'T??RKO??LU', 46);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (529, 'EFLAN??', 78);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (530, 'ESK??PAZAR', 78);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (531, 'MERKEZ', 78);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (532, 'OVACIK', 78);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (533, 'SAFRANBOLU', 78);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (534, 'YEN??CE', 78);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (535, 'AYRANCI', 70);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (536, 'BA??YAYLA', 70);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (537, 'ERMENEK', 70);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (538, 'KAZIMKARABEK??R', 70);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (539, 'MERKEZ', 70);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (540, 'SARIVEL??LER', 70);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (541, 'AKYAKA', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (542, 'ARPA??AY', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (543, 'D??GOR', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (544, 'KA??IZMAN', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (545, 'MERKEZ', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (546, 'SARIKAMI??', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (547, 'SEL??M', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (548, 'SUSUZ', 36);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (549, 'ABANA', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (550, 'A??LI', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (551, 'ARA??', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (552, 'AZDAVAY', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (553, 'BOZKURT', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (554, 'C??DE', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (555, '??ATALZEYT??N', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (556, 'DADAY', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (557, 'DEVREKAN??', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (558, 'DO??ANYURT', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (559, 'HAN??N??', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (560, '??HSANGAZ??', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (561, '??NEBOLU', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (562, 'K??RE', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (563, 'MERKEZ', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (564, 'PINARBA??I', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (565, 'SEYD??LER', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (566, '??ENPAZAR', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (567, 'TA??K??PR??', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (568, 'TOSYA', 37);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (569, 'AKKI??LA', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (570, 'B??NYAN', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (571, 'DEVEL??', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (572, 'FELAH??YE', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (573, 'HACILAR', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (574, '??NCESU', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (575, 'KOCAS??NAN', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (576, 'MEL??KGAZ??', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (577, '??ZVATAN', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (578, 'PINARBA??I', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (579, 'SARIO??LAN', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (580, 'SARIZ', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (581, 'TALAS', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (582, 'TOMARZA', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (583, 'YAHYALI', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (584, 'YE????LH??SAR', 38);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (585, 'BAH??ILI', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (586, 'BALI??EYH', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (587, '??ELEB??', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (588, 'DEL??CE', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (589, 'KARAKE????L??', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (590, 'KESK??N', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (591, 'MERKEZ', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (592, 'SULAKYURT', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (593, 'YAH????HAN', 71);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (594, 'BABAESK??', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (595, 'DEM??RK??Y', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (596, 'KOF??AZ', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (597, 'L??LEBURGAZ', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (598, 'MERKEZ', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (599, 'PEHL??VANK??Y', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (600, 'PINARH??SAR', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (601, 'V??ZE', 39);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (602, 'AK??AKENT', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (603, 'AKPINAR', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (604, 'BOZTEPE', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (605, '??????EKDA??I', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (606, 'KAMAN', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (607, 'MERKEZ', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (608, 'MUCUR', 40);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (609, 'ELBEYL??', 79);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (610, 'MERKEZ', 79);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (611, 'MUSABEYL??', 79);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (612, 'POLATEL??', 79);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (613, 'BA????SKELE', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (614, '??AYIROVA', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (615, 'DARICA', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (616, 'DER??NCE', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (617, 'D??LOVASI', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (618, 'GEBZE', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (619, 'G??LC??K', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (620, '??ZM??T', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (621, 'KANDIRA', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (622, 'KARAM??RSEL', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (623, 'KARTEPE', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (624, 'K??RFEZ', 41);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (625, 'AHIRLI', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (626, 'AK??REN', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (627, 'AK??EH??R', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (628, 'ALTINEK??N', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (629, 'BEY??EH??R', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (630, 'BOZKIR', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (631, 'C??HANBEYL??', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (632, '??ELT??K', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (633, '??UMRA', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (634, 'DERBENT', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (635, 'DEREBUCAK', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (636, 'DO??ANH??SAR', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (637, 'EM??RGAZ??', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (638, 'ERE??L??', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (639, 'G??NEYSINIR', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (640, 'HAD??M', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (641, 'HALKAPINAR', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (642, 'H??Y??K', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (643, 'ILGIN', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (644, 'KADINHANI', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (645, 'KARAPINAR', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (646, 'KARATAY', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (647, 'KULU', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (648, 'MERAM', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (649, 'SARAY??N??', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (650, 'SEL??UKLU', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (651, 'SEYD????EH??R', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (652, 'TA??KENT', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (653, 'TUZLUK??U', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (654, 'YALIH??Y??K', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (655, 'YUNAK', 42);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (656, 'ALTINTA??', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (657, 'ASLANAPA', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (658, '??AVDARH??SAR', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (659, 'DOMAN????', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (660, 'DUMLUPINAR', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (661, 'EMET', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (662, 'GED??Z', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (663, 'H??SARCIK', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (664, 'MERKEZ', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (665, 'PAZARLAR', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (666, 'S??MAV', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (667, '??APHANE', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (668, 'TAV??ANLI', 43);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (669, 'AK??ADA??', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (670, 'ARAPG??R', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (671, 'ARGUVAN', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (672, 'BATTALGAZ??', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (673, 'DARENDE', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (674, 'DO??AN??EH??R', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (675, 'DO??ANYOL', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (676, 'HEK??MHAN', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (677, 'KALE', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (678, 'KULUNCAK', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (679, 'P??T??RGE', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (680, 'YAZIHAN', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (681, 'YE????LYURT', 44);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (682, 'AHMETL??', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (683, 'AKH??SAR', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (684, 'ALA??EH??R', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (685, 'DEM??RC??', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (686, 'G??LMARMARA', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (687, 'G??RDES', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (688, 'KIRKA??A??', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (689, 'K??PR??BA??I', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (690, 'KULA', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (691, 'SAL??HL??', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (692, 'SARIG??L', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (693, 'SARUHANLI', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (694, 'SELEND??', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (695, 'SOMA', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (696, '??EHZADELER', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (697, 'TURGUTLU', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (698, 'YUNUSEMRE', 45);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (699, 'ARTUKLU', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (700, 'DARGE????T', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (701, 'DER??K', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (702, 'KIZILTEPE', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (703, 'MAZIDA??I', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (704, 'M??DYAT', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (705, 'NUSAYB??N', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (706, '??MERL??', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (707, 'SAVUR', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (708, 'YE????LL??', 47);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (709, 'AKDEN??Z', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (710, 'ANAMUR', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (711, 'AYDINCIK', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (712, 'BOZYAZI', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (713, '??AMLIYAYLA', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (714, 'ERDEML??', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (715, 'G??LNAR', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (716, 'MEZ??TL??', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (717, 'MUT', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (718, 'S??L??FKE', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (719, 'TARSUS', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (720, 'TOROSLAR', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (721, 'YEN????EH??R', 33);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (722, 'BODRUM', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (723, 'DALAMAN', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (724, 'DAT??A', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (725, 'FETH??YE', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (726, 'KAVAKLIDERE', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (727, 'K??YCE????Z', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (728, 'MARMAR??S', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (729, 'MENTE??E', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (730, 'M??LAS', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (731, 'ORTACA', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (732, 'SEYD??KEMER', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (733, 'ULA', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (734, 'YATA??AN', 48);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (735, 'BULANIK', 49);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (736, 'HASK??Y', 49);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (737, 'KORKUT', 49);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (738, 'MALAZG??RT', 49);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (739, 'MERKEZ', 49);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (740, 'VARTO', 49);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (741, 'ACIG??L', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (742, 'AVANOS', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (743, 'DER??NKUYU', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (744, 'G??L??EH??R', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (745, 'HACIBEKTA??', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (746, 'KOZAKLI', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (747, 'MERKEZ', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (748, '??RG??P', 50);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (749, 'ALTUNH??SAR', 51);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (750, 'BOR', 51);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (751, '??AMARDI', 51);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (752, '????FTL??K', 51);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (753, 'MERKEZ', 51);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (754, 'ULUKI??LA', 51);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (755, 'AKKU??', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (756, 'ALTINORDU', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (757, 'AYBASTI', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (758, '??AMA??', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (759, '??ATALPINAR', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (760, '??AYBA??I', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (761, 'FATSA', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (762, 'G??LK??Y', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (763, 'G??LYALI', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (764, 'G??RGENTEPE', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (765, '??K??ZCE', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (766, 'KABAD??Z', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (767, 'KABATA??', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (768, 'KORGAN', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (769, 'KUMRU', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (770, 'MESUD??YE', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (771, 'PER??EMBE', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (772, 'ULUBEY', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (773, '??NYE', 52);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (774, 'BAH??E', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (775, 'D??Z??????', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (776, 'HASANBEYL??', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (777, 'KAD??RL??', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (778, 'MERKEZ', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (779, 'SUMBAS', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (780, 'TOPRAKKALE', 80);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (781, 'ARDE??EN', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (782, '??AMLIHEM????N', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (783, '??AYEL??', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (784, 'DEREPAZARI', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (785, 'FINDIKLI', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (786, 'G??NEYSU', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (787, 'HEM????N', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (788, '??K??ZDERE', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (789, '??Y??DERE', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (790, 'KALKANDERE', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (791, 'MERKEZ', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (792, 'PAZAR', 53);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (793, 'ADAPAZARI', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (794, 'AKYAZI', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (795, 'AR??F??YE', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (796, 'ERENLER', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (797, 'FER??ZL??', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (798, 'GEYVE', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (799, 'HENDEK', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (800, 'KARAP??R??EK', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (801, 'KARASU', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (802, 'KAYNARCA', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (803, 'KOCAAL??', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (804, 'PAMUKOVA', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (805, 'SAPANCA', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (806, 'SERD??VAN', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (807, 'S??????TL??', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (808, 'TARAKLI', 54);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (809, '19MAYIS', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (810, 'ALA??AM', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (811, 'ASARCIK', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (812, 'ATAKUM', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (813, 'AYVACIK', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (814, 'BAFRA', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (815, 'CAN??K', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (816, '??AR??AMBA', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (817, 'HAVZA', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (818, '??LKADIM', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (819, 'KAVAK', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (820, 'LAD??K', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (821, 'SALIPAZARI', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (822, 'TEKKEK??Y', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (823, 'TERME', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (824, 'VEZ??RK??PR??', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (825, 'YAKAKENT', 55);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (826, 'BAYKAN', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (827, 'ERUH', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (828, 'KURTALAN', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (829, 'MERKEZ', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (830, 'PERVAR??', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (831, '????RVAN', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (832, 'T??LLO', 56);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (833, 'AYANCIK', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (834, 'BOYABAT', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (835, 'D??KMEN', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (836, 'DURA??AN', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (837, 'ERFELEK', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (838, 'GERZE', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (839, 'MERKEZ', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (840, 'SARAYD??Z??', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (841, 'T??RKEL??', 57);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (842, 'AKINCILAR', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (843, 'ALTINYAYLA', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (844, 'D??VR??????', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (845, 'DO??AN??AR', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (846, 'GEMEREK', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (847, 'G??LOVA', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (848, 'G??R??N', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (849, 'HAF??K', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (850, '??MRANLI', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (851, 'KANGAL', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (852, 'KOYULH??SAR', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (853, 'MERKEZ', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (854, 'SU??EHR??', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (855, '??ARKI??LA', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (856, 'ULA??', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (857, 'YILDIZEL??', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (858, 'ZARA', 58);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (859, 'AK??AKALE', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (860, 'B??REC??K', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (861, 'BOZOVA', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (862, 'CEYLANPINAR', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (863, 'EYY??B??YE', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (864, 'HALFET??', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (865, 'HAL??L??YE', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (866, 'HARRAN', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (867, 'H??LVAN', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (868, 'KARAK??PR??', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (869, 'S??VEREK', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (870, 'SURU??', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (871, 'V??RAN??EH??R', 63);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (872, 'BEYT??????EBAP', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (873, 'C??ZRE', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (874, 'G????L??KONAK', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (875, '??D??L', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (876, 'MERKEZ', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (877, 'S??LOP??', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (878, 'ULUDERE', 73);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (879, '??ERKEZK??Y', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (880, '??ORLU', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (881, 'ERGENE', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (882, 'HAYRABOLU', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (883, 'KAPAKLI', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (884, 'MALKARA', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (885, 'MARMARAERE??L??S??', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (886, 'MURATLI', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (887, 'SARAY', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (888, 'S??LEYMANPA??A', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (889, '??ARK??Y', 59);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (890, 'ALMUS', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (891, 'ARTOVA', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (892, 'BA??????FTL??K', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (893, 'ERBAA', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (894, 'MERKEZ', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (895, 'N??KSAR', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (896, 'PAZAR', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (897, 'RE??AD??YE', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (898, 'SULUSARAY', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (899, 'TURHAL', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (900, 'YE????LYURT', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (901, 'Z??LE', 60);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (902, 'AK??AABAT', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (903, 'ARAKLI', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (904, 'ARS??N', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (905, 'BE????KD??Z??', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (906, '??AR??IBA??I', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (907, '??AYKARA', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (908, 'DERNEKPAZARI', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (909, 'D??ZK??Y', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (910, 'HAYRAT', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (911, 'K??PR??BA??I', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (912, 'MA??KA', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (913, 'OF', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (914, 'ORTAH??SAR', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (915, 'S??RMENE', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (916, '??ALPAZARI', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (917, 'TONYA', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (918, 'VAKFIKEB??R', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (919, 'YOMRA', 61);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (920, '??EM????GEZEK', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (921, 'HOZAT', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (922, 'MAZG??RT', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (923, 'MERKEZ', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (924, 'NAZIM??YE', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (925, 'OVACIK', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (926, 'PERTEK', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (927, 'P??L??M??R', 62);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (928, 'BANAZ', 64);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (929, 'E??ME', 64);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (930, 'KARAHALLI', 64);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (931, 'MERKEZ', 64);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (932, 'S??VASLI', 64);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (933, 'ULUBEY', 64);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (934, 'BAH??ESARAY', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (935, 'BA??KALE', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (936, '??ALDIRAN', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (937, '??ATAK', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (938, 'EDREM??T', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (939, 'ERC????', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (940, 'GEVA??', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (941, 'G??RPINAR', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (942, '??PEKYOLU', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (943, 'MURAD??YE', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (944, '??ZALP', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (945, 'SARAY', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (946, 'TU??BA', 65);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (947, 'ALTINOVA', 77);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (948, 'ARMUTLU', 77);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (949, '??INARCIK', 77);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (950, '????FTL??KK??Y', 77);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (951, 'MERKEZ', 77);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (952, 'TERMAL', 77);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (953, 'AKDA??MADEN??', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (954, 'AYDINCIK', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (955, 'BO??AZLIYAN', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (956, '??ANDIR', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (957, '??AYIRALAN', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (958, '??EKEREK', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (959, 'KADI??EHR??', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (960, 'MERKEZ', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (961, 'SARAYKENT', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (962, 'SARIKAYA', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (963, 'SORGUN', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (964, '??EFAATL??', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (965, 'YEN??FAKILI', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (966, 'YERK??Y', 66);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (967, 'ALAPLI', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (968, '??AYCUMA', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (969, 'DEVREK', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (970, 'ERE??L??', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (971, 'G??K??EBEY', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (972, 'K??L??ML??', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (973, 'KOZLU', 67);
INSERT INTO public.districts (id, name, city_id) OVERRIDING SYSTEM VALUE VALUES (974, 'MERKEZ', 67);


--
-- TOC entry 3391 (class 0 OID 16394)
-- Dependencies: 210
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.doctors (user_id, specialty, fullname, sex, birth_date, phone, city_id, district_id) VALUES (360, NULL, 'dfbdb', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.doctors (user_id, specialty, fullname, sex, birth_date, phone, city_id, district_id) VALUES (366, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 3395 (class 0 OID 16411)
-- Dependencies: 214
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3398 (class 0 OID 16433)
-- Dependencies: 217
-- Data for Name: labs; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3399 (class 0 OID 16436)
-- Dependencies: 218
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, city_id, district_id) VALUES (359, NULL, NULL, NULL, 0, NULL, 0, NULL, 'efgdgf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, city_id, district_id) VALUES (358, '20', '10', 'Erkek', 0, NULL, 0, '', '??lknno', NULL, '79855621614', NULL, '2022-04-13', NULL, NULL, NULL, 1, 2);
INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, city_id, district_id) VALUES (368, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, city_id, district_id) VALUES (369, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, city_id, district_id) VALUES (370, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, city_id, district_id) VALUES (367, '51', '51', NULL, 0, NULL, 0, NULL, NULL, NULL, '56165156156', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.patients (user_id, room, bed_no, sex, age, address, weight, phone, fullname, blood_type, identity_no, insurance_type, birth_date, birth_place, father, mother, city_id, district_id) VALUES (372, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 3397 (class 0 OID 16430)
-- Dependencies: 216
-- Data for Name: prescriptions; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 3394 (class 0 OID 16408)
-- Dependencies: 213
-- Data for Name: privileges; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.privileges (role, id) OVERRIDING SYSTEM VALUE VALUES ('Y??netici', 1);
INSERT INTO public.privileges (role, id) OVERRIDING SYSTEM VALUE VALUES ('Doktor', 2);
INSERT INTO public.privileges (role, id) OVERRIDING SYSTEM VALUE VALUES ('Hasta', 3);


--
-- TOC entry 3407 (class 0 OID 16544)
-- Dependencies: 226
-- Data for Name: supervisors; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('dfgdfgdf', 261, true);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('klnklnklnl', 364, false);
INSERT INTO public.supervisors (fullname, user_id, is_confirmed) VALUES ('dbdgbdgb', 365, false);


--
-- TOC entry 3392 (class 0 OID 16401)
-- Dependencies: 211
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (261, '123456', 'hatitech.app@gmail.com', 1);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (358, 'omkom', 'oknmokmn', 3);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (359, 'dfgdfg', 'dfgdfg', 3);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (360, 'dgbdg', 'dgbdgb', 2);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (364, 'lklkmlk', 'lknlknlk', 1);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (365, 'dsfsdf', 'dbgdgsf', 1);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (366, '123456', 'hatitech.app@gmail.com1', 2);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (367, '123456', 'hatitech.app@gmail.comx', 3);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (368, '123456', 'hatitech.app@gmail.coms', 3);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (369, NULL, NULL, 3);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (370, NULL, NULL, 3);
INSERT INTO public.users (id, password, email, role_id) OVERRIDING SYSTEM VALUE VALUES (372, '123456', 'hatitech.app@gmail.comxx', 3);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 224
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.appointments_id_seq', 4, true);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 223
-- Name: clinics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.clinics_id_seq', 44, true);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 229
-- Name: districts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.districts_id_seq', 974, true);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 215
-- Name: file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.file_id_seq', 0, false);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 222
-- Name: labs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.labs_id_seq', 0, false);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 221
-- Name: prescriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.prescriptions_id_seq', 0, false);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 225
-- Name: privileges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.privileges_id_seq', 12, true);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 212
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.user_id_seq', 372, true);


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
-- TOC entry 3228 (class 2606 OID 16865)
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
-- TOC entry 3249 (class 2606 OID 16866)
-- Name: appointments appointments_clinic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_clinic_id_fkey FOREIGN KEY (clinic_id) REFERENCES public.clinics(id) NOT VALID;


--
-- TOC entry 3247 (class 2606 OID 16494)
-- Name: appointments appointments_dr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_dr_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(user_id) NOT VALID;


--
-- TOC entry 3248 (class 2606 OID 16499)
-- Name: appointments appointments_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(user_id) NOT VALID;


--
-- TOC entry 3251 (class 2606 OID 16822)
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
-- TOC entry 3250 (class 2606 OID 16549)
-- Name: supervisors supervisors_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.supervisors
    ADD CONSTRAINT supervisors_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE appointments; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.appointments FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.appointments TO root;


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE clinics; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.clinics FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.clinics TO root;


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE doctors; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.doctors FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.doctors TO root;


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE files; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.files FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.files TO root;


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE labs; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.labs FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.labs TO root;


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE patients; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.patients FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.patients TO root;


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE prescriptions; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.prescriptions FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.prescriptions TO root;


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE privileges; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.privileges FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.privileges TO root;


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE supervisors; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.supervisors FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.supervisors TO root;


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE users; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.users FROM root;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.users TO root;


-- Completed on 2022-05-24 20:08:09

--
-- PostgreSQL database dump complete
--

