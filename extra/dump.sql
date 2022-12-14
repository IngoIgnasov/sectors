PGDMP     3    4                z            mydb    15.1 (Debian 15.1-1.pgdg110+1)    15.0 $    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            .           1262    16384    mydb    DATABASE     o   CREATE DATABASE mydb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE mydb;
                helmes    false            ?            1259    24582    databasechangelog    TABLE     Y  CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);
 %   DROP TABLE public.databasechangelog;
       public         heap    helmes    false            ?            1259    24577    databasechangeloglock    TABLE     ?   CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);
 )   DROP TABLE public.databasechangeloglock;
       public         heap    helmes    false            ?            1259    24616    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public          helmes    false            ?            1259    24594    sector    TABLE        CREATE TABLE public.sector (
    id bigint NOT NULL,
    name character varying(250) NOT NULL,
    group_id bigint NOT NULL
);
    DROP TABLE public.sector;
       public         heap    helmes    false            ?            1259    24587    sector_group    TABLE     ?   CREATE TABLE public.sector_group (
    id bigint NOT NULL,
    name character varying(250) NOT NULL,
    parent_group_id bigint
);
     DROP TABLE public.sector_group;
       public         heap    helmes    false            ?            1259    24612    sector_group_id_seq    SEQUENCE     |   CREATE SEQUENCE public.sector_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.sector_group_id_seq;
       public          helmes    false    216            /           0    0    sector_group_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.sector_group_id_seq OWNED BY public.sector_group.id;
          public          helmes    false    220            ?            1259    24614    sector_id_seq    SEQUENCE     v   CREATE SEQUENCE public.sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.sector_id_seq;
       public          helmes    false    217            0           0    0    sector_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.sector_id_seq OWNED BY public.sector.id;
          public          helmes    false    221            ?            1259    24601 	   user_data    TABLE     ?   CREATE TABLE public.user_data (
    id bigint NOT NULL,
    name character varying(250) NOT NULL,
    agreed_to_terms boolean DEFAULT true
);
    DROP TABLE public.user_data;
       public         heap    helmes    false            ?            1259    24607    user_sector    TABLE     x   CREATE TABLE public.user_sector (
    id bigint NOT NULL,
    sector_id bigint NOT NULL,
    user_id bigint NOT NULL
);
    DROP TABLE public.user_sector;
       public         heap    helmes    false                       2604    24615 	   sector id    DEFAULT     f   ALTER TABLE ONLY public.sector ALTER COLUMN id SET DEFAULT nextval('public.sector_id_seq'::regclass);
 8   ALTER TABLE public.sector ALTER COLUMN id DROP DEFAULT;
       public          helmes    false    221    217            ~           2604    24613    sector_group id    DEFAULT     r   ALTER TABLE ONLY public.sector_group ALTER COLUMN id SET DEFAULT nextval('public.sector_group_id_seq'::regclass);
 >   ALTER TABLE public.sector_group ALTER COLUMN id DROP DEFAULT;
       public          helmes    false    220    216            !          0    24582    databasechangelog 
   TABLE DATA           ?   COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
    public          helmes    false    215   |)                  0    24577    databasechangeloglock 
   TABLE DATA           R   COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
    public          helmes    false    214   g*       #          0    24594    sector 
   TABLE DATA           4   COPY public.sector (id, name, group_id) FROM stdin;
    public          helmes    false    217   ?*       "          0    24587    sector_group 
   TABLE DATA           A   COPY public.sector_group (id, name, parent_group_id) FROM stdin;
    public          helmes    false    216   ?*       $          0    24601 	   user_data 
   TABLE DATA           >   COPY public.user_data (id, name, agreed_to_terms) FROM stdin;
    public          helmes    false    218   ?*       %          0    24607    user_sector 
   TABLE DATA           =   COPY public.user_sector (id, sector_id, user_id) FROM stdin;
    public          helmes    false    219   ?*       1           0    0    hibernate_sequence    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);
          public          helmes    false    222            2           0    0    sector_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.sector_group_id_seq', 2, true);
          public          helmes    false    220            3           0    0    sector_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.sector_id_seq', 1, false);
          public          helmes    false    221            ?           2606    24581 0   databasechangeloglock databasechangeloglock_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.databasechangeloglock DROP CONSTRAINT databasechangeloglock_pkey;
       public            helmes    false    214            ?           2606    24591    sector_group sector_group_id_pk 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sector_group
    ADD CONSTRAINT sector_group_id_pk PRIMARY KEY (id);
 I   ALTER TABLE ONLY public.sector_group DROP CONSTRAINT sector_group_id_pk;
       public            helmes    false    216            ?           2606    24593 "   sector_group sector_group_name_unq 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sector_group
    ADD CONSTRAINT sector_group_name_unq UNIQUE (name);
 L   ALTER TABLE ONLY public.sector_group DROP CONSTRAINT sector_group_name_unq;
       public            helmes    false    216            ?           2606    24598    sector sector_id_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public.sector
    ADD CONSTRAINT sector_id_pk PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.sector DROP CONSTRAINT sector_id_pk;
       public            helmes    false    217            ?           2606    24600    sector sector_name_unq 
   CONSTRAINT     Q   ALTER TABLE ONLY public.sector
    ADD CONSTRAINT sector_name_unq UNIQUE (name);
 @   ALTER TABLE ONLY public.sector DROP CONSTRAINT sector_name_unq;
       public            helmes    false    217            ?           2606    24606    user_data user_data_id_pk 
   CONSTRAINT     W   ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_id_pk PRIMARY KEY (id);
 C   ALTER TABLE ONLY public.user_data DROP CONSTRAINT user_data_id_pk;
       public            helmes    false    218            ?           2606    24611    user_sector user_sector_id_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.user_sector
    ADD CONSTRAINT user_sector_id_pk PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.user_sector DROP CONSTRAINT user_sector_id_pk;
       public            helmes    false    219            ?           2606    24617 #   sector sector_to_sector_group_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.sector
    ADD CONSTRAINT sector_to_sector_group_id_fk FOREIGN KEY (group_id) REFERENCES public.sector_group(id);
 M   ALTER TABLE ONLY public.sector DROP CONSTRAINT sector_to_sector_group_id_fk;
       public          helmes    false    216    3204    217            ?           2606    24622 '   user_sector user_sector_to_sector_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.user_sector
    ADD CONSTRAINT user_sector_to_sector_id_fk FOREIGN KEY (sector_id) REFERENCES public.sector(id);
 Q   ALTER TABLE ONLY public.user_sector DROP CONSTRAINT user_sector_to_sector_id_fk;
       public          helmes    false    217    219    3208            ?           2606    24627 %   user_sector user_sector_to_user_id_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY public.user_sector
    ADD CONSTRAINT user_sector_to_user_id_fk FOREIGN KEY (user_id) REFERENCES public.user_data(id);
 O   ALTER TABLE ONLY public.user_sector DROP CONSTRAINT user_sector_to_user_id_fk;
       public          helmes    false    218    3212    219            !   ?   x????j?0D????Ԋ${-??Ci}?%???C H??-XR?e??7)??
?2þ]F?.L??&L4?i?,??7K?ľ??KY	YqU
????eZc?kп??o??t????*???H??Q?Ѻ?&?4?0$2???T???O?9?Ӕ???-?1???B??L6w????Ӛ?.?YO!?C?W~?O?p????e^c ?=4L ?wo?ƺEl?#+??????             x?3?L???"?=... U?      #      x?????? ? ?      "   )   x?3??M?+MKL.?/??K????2?L,-??4?????? ?-	F      $      x?????? ? ?      %      x?????? ? ?     