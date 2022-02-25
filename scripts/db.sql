--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-02-25 22:17:07

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
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16442)
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    date date,
    clinic_id integer,
    doc_id integer,
    patient_id integer
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16481)
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
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
-- TOC entry 220 (class 1259 OID 16439)
-- Name: clinics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clinics (
    id integer NOT NULL,
    doc_id integer,
    patient_id integer,
    name character varying(50),
    appointment_id integer
);


ALTER TABLE public.clinics OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16477)
-- Name: clinics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
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
-- TOC entry 210 (class 1259 OID 16394)
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.doctors OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16397)
-- Name: doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.doctors ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.doctor_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16411)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id smallint NOT NULL,
    path character varying(100)
);


ALTER TABLE public.files OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16426)
-- Name: file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
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
-- TOC entry 218 (class 1259 OID 16433)
-- Name: labs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.labs (
    id integer NOT NULL,
    lab_result character varying(100),
    result_date date,
    patient_id integer,
    doc_id integer
);


ALTER TABLE public.labs OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16463)
-- Name: labs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
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
-- TOC entry 219 (class 1259 OID 16436)
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.patients OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16430)
-- Name: prescriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescriptions (
    id integer NOT NULL,
    doc_id integer,
    patient_id integer,
    description character varying(100) NOT NULL,
    date date
);


ALTER TABLE public.prescriptions OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16445)
-- Name: prescriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
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
-- TOC entry 214 (class 1259 OID 16408)
-- Name: privileges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privileges (
    user_id integer,
    role character varying(25)
);


ALTER TABLE public.privileges OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16401)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    password character varying(50),
    email character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16404)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
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
-- TOC entry 3375 (class 0 OID 16442)
-- Dependencies: 221
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3374 (class 0 OID 16439)
-- Dependencies: 220
-- Data for Name: clinics; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3364 (class 0 OID 16394)
-- Dependencies: 210
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3369 (class 0 OID 16411)
-- Dependencies: 215
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3372 (class 0 OID 16433)
-- Dependencies: 218
-- Data for Name: labs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3373 (class 0 OID 16436)
-- Dependencies: 219
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3371 (class 0 OID 16430)
-- Dependencies: 217
-- Data for Name: prescriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3368 (class 0 OID 16408)
-- Dependencies: 214
-- Data for Name: privileges; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3366 (class 0 OID 16401)
-- Dependencies: 212
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 225
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_seq', 0, false);


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 224
-- Name: clinics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clinics_id_seq', 0, false);


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 211
-- Name: doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_id_seq', 0, false);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 216
-- Name: file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.file_id_seq', 0, false);


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 223
-- Name: labs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.labs_id_seq', 0, false);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 222
-- Name: prescriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prescriptions_id_seq', 0, false);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 213
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 0, false);


--
-- TOC entry 3212 (class 2606 OID 16488)
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 16486)
-- Name: clinics clinics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clinics
    ADD CONSTRAINT clinics_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 16450)
-- Name: doctors doctors_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_user_id_key UNIQUE (user_id);


--
-- TOC entry 3208 (class 2606 OID 16457)
-- Name: patients patients_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_user_id_key UNIQUE (user_id);


--
-- TOC entry 3206 (class 2606 OID 16415)
-- Name: users user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 16489)
-- Name: appointments appointments_clinic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_clinic_id_fkey FOREIGN KEY (clinic_id) REFERENCES public.clinics(id) NOT VALID;


--
-- TOC entry 3223 (class 2606 OID 16494)
-- Name: appointments appointments_dr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_dr_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(user_id) NOT VALID;


--
-- TOC entry 3224 (class 2606 OID 16499)
-- Name: appointments appointments_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(user_id) NOT VALID;


--
-- TOC entry 3221 (class 2606 OID 16509)
-- Name: clinics clinics_appointment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clinics
    ADD CONSTRAINT clinics_appointment_id_fkey FOREIGN KEY (appointment_id) REFERENCES public.appointments(id) NOT VALID;


--
-- TOC entry 3220 (class 2606 OID 16504)
-- Name: clinics clinics_dr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clinics
    ADD CONSTRAINT clinics_dr_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(user_id) NOT VALID;


--
-- TOC entry 3213 (class 2606 OID 16421)
-- Name: doctors doctor_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctor_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3218 (class 2606 OID 16472)
-- Name: labs labs_dr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labs
    ADD CONSTRAINT labs_dr_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(user_id) NOT VALID;


--
-- TOC entry 3217 (class 2606 OID 16467)
-- Name: labs labs_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labs
    ADD CONSTRAINT labs_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(user_id) NOT VALID;


--
-- TOC entry 3219 (class 2606 OID 16514)
-- Name: patients patients_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3215 (class 2606 OID 16451)
-- Name: prescriptions prescriptions_dr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_dr_id_fkey FOREIGN KEY (doc_id) REFERENCES public.doctors(user_id) NOT VALID;


--
-- TOC entry 3216 (class 2606 OID 16458)
-- Name: prescriptions prescriptions_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(user_id) NOT VALID;


--
-- TOC entry 3214 (class 2606 OID 16416)
-- Name: privileges privilege_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privileges
    ADD CONSTRAINT privilege_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


-- Completed on 2022-02-25 22:17:08

--
-- PostgreSQL database dump complete
--

