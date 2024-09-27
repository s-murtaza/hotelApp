PGDMP     5    3                |            HotelApp    15.4    15.4 $               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    24627    HotelApp    DATABASE     �   CREATE DATABASE "HotelApp" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Pakistan.1252';
    DROP DATABASE "HotelApp";
                postgres    false            �            1259    24663    bookings    TABLE     �   CREATE TABLE public.bookings (
    booking_id integer NOT NULL,
    user_id integer,
    room_id integer,
    booking_start date,
    booking_end date,
    total_price integer
);
    DROP TABLE public.bookings;
       public         heap    postgres    false            �            1259    24662    bookings_booking_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bookings_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.bookings_booking_id_seq;
       public          postgres    false    221            !           0    0    bookings_booking_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.bookings_booking_id_seq OWNED BY public.bookings.booking_id;
          public          postgres    false    220            �            1259    24640    hotels    TABLE     �   CREATE TABLE public.hotels (
    hotel_id integer NOT NULL,
    hotel_name character varying(255),
    hotel_location character varying(255)
);
    DROP TABLE public.hotels;
       public         heap    postgres    false            �            1259    24639    hotels_hotel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hotels_hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.hotels_hotel_id_seq;
       public          postgres    false    217            "           0    0    hotels_hotel_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.hotels_hotel_id_seq OWNED BY public.hotels.hotel_id;
          public          postgres    false    216            �            1259    24649    rooms    TABLE     l  CREATE TABLE public.rooms (
    room_id integer NOT NULL,
    hotel_id integer,
    room_name character varying,
    room_category character varying,
    room_capacity integer,
    room_beds integer,
    room_baths integer,
    room_utilities text[],
    room_isavailable boolean,
    room_description text,
    room_price integer,
    s3_file_locations text[]
);
    DROP TABLE public.rooms;
       public         heap    postgres    false            �            1259    24648    rooms_room_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rooms_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.rooms_room_id_seq;
       public          postgres    false    219            #           0    0    rooms_room_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.rooms_room_id_seq OWNED BY public.rooms.room_id;
          public          postgres    false    218            �            1259    24629    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    is_admin boolean,
    user_name character varying(255),
    email character varying(254),
    password character varying(255),
    wish_list integer[],
    booking_list integer[]
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24628    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    215            $           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    214            w           2604    24666    bookings booking_id    DEFAULT     z   ALTER TABLE ONLY public.bookings ALTER COLUMN booking_id SET DEFAULT nextval('public.bookings_booking_id_seq'::regclass);
 B   ALTER TABLE public.bookings ALTER COLUMN booking_id DROP DEFAULT;
       public          postgres    false    220    221    221            u           2604    24643    hotels hotel_id    DEFAULT     r   ALTER TABLE ONLY public.hotels ALTER COLUMN hotel_id SET DEFAULT nextval('public.hotels_hotel_id_seq'::regclass);
 >   ALTER TABLE public.hotels ALTER COLUMN hotel_id DROP DEFAULT;
       public          postgres    false    217    216    217            v           2604    24652    rooms room_id    DEFAULT     n   ALTER TABLE ONLY public.rooms ALTER COLUMN room_id SET DEFAULT nextval('public.rooms_room_id_seq'::regclass);
 <   ALTER TABLE public.rooms ALTER COLUMN room_id DROP DEFAULT;
       public          postgres    false    218    219    219            t           2604    24632    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    214    215    215                      0    24663    bookings 
   TABLE DATA           i   COPY public.bookings (booking_id, user_id, room_id, booking_start, booking_end, total_price) FROM stdin;
    public          postgres    false    221   ()                 0    24640    hotels 
   TABLE DATA           F   COPY public.hotels (hotel_id, hotel_name, hotel_location) FROM stdin;
    public          postgres    false    217   �)                 0    24649    rooms 
   TABLE DATA           �   COPY public.rooms (room_id, hotel_id, room_name, room_category, room_capacity, room_beds, room_baths, room_utilities, room_isavailable, room_description, room_price, s3_file_locations) FROM stdin;
    public          postgres    false    219   &*                 0    24629    users 
   TABLE DATA           g   COPY public.users (user_id, is_admin, user_name, email, password, wish_list, booking_list) FROM stdin;
    public          postgres    false    215   6       %           0    0    bookings_booking_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.bookings_booking_id_seq', 15, true);
          public          postgres    false    220            &           0    0    hotels_hotel_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hotels_hotel_id_seq', 1, false);
          public          postgres    false    216            '           0    0    rooms_room_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.rooms_room_id_seq', 1, false);
          public          postgres    false    218            (           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 5, true);
          public          postgres    false    214            �           2606    24668    bookings bookings_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (booking_id);
 @   ALTER TABLE ONLY public.bookings DROP CONSTRAINT bookings_pkey;
       public            postgres    false    221            }           2606    24647    hotels hotels_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (hotel_id);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public            postgres    false    217                       2606    24656    rooms rooms_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (room_id);
 :   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_pkey;
       public            postgres    false    219            y           2606    24638    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    215            {           2606    24636    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    24674    bookings bookings_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(room_id);
 H   ALTER TABLE ONLY public.bookings DROP CONSTRAINT bookings_room_id_fkey;
       public          postgres    false    219    3199    221            �           2606    24669    bookings bookings_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 H   ALTER TABLE ONLY public.bookings DROP CONSTRAINT bookings_user_id_fkey;
       public          postgres    false    221    3195    215            �           2606    24657    rooms rooms_hotel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hotels(hotel_id);
 C   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_hotel_id_fkey;
       public          postgres    false    219    217    3197               O   x�}���0C�s�K�������s��"!���z2).���b�����"�M��ē��չe�"X�,2e�^�CU�;         �   x�-�M
�0@���)���Ђ,����L����d$�w�x�[�c:'�.1��'5��QxZL�P�������j����Y�2���XBf4�|��,К���p}	&��^*��b�� ���L�&��?�?W����6G         �  x��Z�r�8}V����}�K�u�b�I�d*�Ĺ־@$$!"	 ��S������/ك@���8���Qmլ#��}p��n���ǃw���<9Ke)���T�u�Nd|0����Q<���Ň��f�L�t*U�&�H�k���`tt4�cnL��y�8ŬV��,�\>��yU�~�fÝ߿H_O_|����GW�����x��A1y��=?�bu�������闧���FG�����>����x��fH���D)N�r�IRy���$+a�Ij�]
����s2^����}��Qx�rV&�XɻZ>8�,����_tct�r�k�C���J�Z'�^�%���H-�>�4~9?��(S�o�q�F����Z�ɩ�K��!J�t�*��}��v������%����2�����6�6�i͓�y�NYQ%S�8<�}���Lyb�<�pV�rJ�J�mP��\ �.K�e�3gL��I)�g�����[����ɤ6	˵L&�337la�d3���%3���V�K�t@����������/9�H�}���	+�dVsmt�,��*��T�6��E�Nd��)bcC�hn�n�K�9/�H;�M���z@�^<Z?0��㸎���D`�3D��;y��W�z�ж�^V6C-s��;�@����#�&Ysc���]G��xbȋM��&�!K2mpPr����(�r�4+��և�3��嵪O3�c��`����2��)��9ǣb�	���[�Ke��{��`wϔ:\���J��+��o{���t�p0��Iy>YNT�������`��j�8��|�,{8joqrL�w�r4�eP���7�gJ�%J���3ej�BH�J�%��6w�iAl���+� 8m�$�Z�Bϑ M�>���m�0y�Ք�6���k�k�n$��^�n=dvl�ܭ����/q*��Sd�������ïWR9��M$�a�O�_|��Y�w8˖a��"��sO�,M�6�\$�����������'��8V>�3n�
1��߃Y4�()�F���&�m�]�|�#�!��e
w�.�n�$���E��n�D�y��%X��Օp�j%2K���!2�Jҹ��13�ڪ_��5a���K���x�EyX2G���fk������r_P���Fʜ�S,�q��ve�C?腚�6pW@@F7�=���i����H$�ݾ����C��B�!9Sd4��'zۀg��)+�SN�4S�j�dx���D�H��Fu���d݁��_�H�O@��[�-��R�ʡ
q����y��YA�qH�>(�zt�����J�#@�nB!w�~'u�3����&�&�i�_(oj �J��:ű�6������`�8�*�]�݁-h���X� �EQ�V!?��ʮ^ "COTv�]�,�����T�G��6��v�d����Z�Ƚ3l���B-^��'�}��]0K\��ʆq��f�wC/5ur*{�^��h*��m�� A9���'�RZ�� RA��e���'�)8c�0�\E���0S�)�Vr|E�:$�:3=�D�(����Q{T � %��vJ	�`��ܱ"��Jس��B��x_�3*�p�q:7��>���"��6 �|ե�D��e�ԕP���{Ҝ#��8�SG�8Sg�D����&��H��S����"�%DpL�Z���z����}.��"e*4ϗ��GV�q�P@�R�񁨌c��з��}�tN�Ӫg�[���(���0�Mn���%?��v����	z�z�C��zsoO�wd��������v?�=j�FJ�v ]B2(?VO��w��O�K�_�<@	��,Bq�5��I��	v�%R-B���b�b��Kr��D��.I��.�p�dUᛚic�� �J�$���������'��}��47-����q�����M��:�:��atdnh�6e�_���E��SQ���=�&[-�Y�>QǴ��(��^���,]ש-�";�5�����4��>�$��Ζ���ßN`���ȧb:��}ig��b���E����� ^KY?� ��#Pݠs�nh�£`Wu�	���Ji,�j���.yH���iV#��d�>�R�u�/��[`ˌg�G������.4�u������su�뎵�{����>��>x0;��w� �k���?�['��0��;��P�LS����j:=�R9�L@�Z��Z�ꗺ�cL�`�i��n�ki�W��;�0���ހ�n}�\?�)fwP�Nn����Ȗ��B��q�a���ţ�=�{�|v|tv�'��P8�4�=��
C�X�o<c�ۭ&��I_�$�iȐA�����z�M�E����<��㗵������y*�(W[�jU8(9\�ʲ{�ݶg�n� |m�9��������~�{�e|wp?X�v(�־��K^���ޛ�Z����u����}ԝ溶�	��-.�	v�a��G?u�X[�,n�v���Ħ�[?���'�/����u�թ��Nw���@��p}ף
���;�)r U;�Ȝ�6h��4:���\��c��	�[4��0I&|��ޛ��5`�>��X������	�������r*�F_�a��Ѷ�o7��j�����n�ں�Xt�0u�b��wG��<��w��Q[�K���"�_
��ܘ�m�>�n�y2��Z6~m��aY�cö�Ѡ�;	��<��,]��8lk�kᆑs.��]7Q~P���b_�xXkf}��p��A���6�}�Z���k�W��9�F\�5��3N�
+{=����X�s2���.���|.��D=]���_���Sn[�LMA�-��$�V�Z��>g�_��x����<��q}u�?Q;�M����5q7�5sz�,���<�_l�]FՖ��|S��|������}���k�v�׾����~RT�����[�	n[$����y� �s���ӷ1��։;}����")C�߯k�DvUE�`O���z4�ٽ��}����E��A���r�hf��4�Ք����[���&�\\������B�_��n��/�p��           x�e�=s�@�~E
��	h��+2�����C�*��p
w舓��L��m�ф4<`�Pw��h3=�xe�v�Z��VRd�̐����M6��U�.	?;'��Hk"�����l����(�Y���y��+(oy�@s)TˡD���,���_QeaQ��T�s���8;]�=0�[��z��k]��8�Z�>��d	���+��� ��s�;��ʳ���ת��,[�Uͪ۱5�3�s|��84ͷ��鄢��}� J�ԜF�?����#�h     