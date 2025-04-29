--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: playlists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.playlists (
    id character varying NOT NULL,
    name character varying NOT NULL,
    owner character varying,
    track_count integer,
    image_url character varying,
    spotify_url character varying
);


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tracks (
    id character varying NOT NULL,
    name character varying NOT NULL,
    artist character varying,
    playlist_id character varying,
    popularity integer,
    duration_ms integer,
    album_image_url character varying
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    spotify_id character varying(255) NOT NULL,
    display_name character varying(255),
    email character varying(255)
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_spotify_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_spotify_id_key UNIQUE (spotify_id);


--
-- Name: tracks tracks_playlist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_playlist_id_fkey FOREIGN KEY (playlist_id) REFERENCES public.playlists(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5OiaAaIMYlCZONyDBxqk4G', 'First Day Of My Life', 'Bright Eyes', '10brSVg418XnVE0Of7nie2', 0, 188800, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('d490efb4', 'Hey There Delilah', 'Plain White T''s', '95481947', 80, 232533, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4RCWB3V8V0dignt99LZ8vH', 'Hey There Delilah', 'Plain White T''s', '10brSVg418XnVE0Of7nie2', 80, 232533, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4ofr8ORQ9w1QuxGLBwRiQk', 'Just A Little While', 'The 502s', '10brSVg418XnVE0Of7nie2', 4, 162608, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1IFRVS4t1olI0XG9RBWdKH', 'The Girl', 'City and Colour', '10brSVg418XnVE0Of7nie2', 52, 360106, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4RL77hMWUq35NYnPLXBpih', 'Skinny Love', 'Birdy', '10brSVg418XnVE0Of7nie2', 74, 201080, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('7tmtOEDxPN7CWaQWBsG1DY', 'Hold Back The River', 'James Bay', '10brSVg418XnVE0Of7nie2', 60, 238746, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5sF7hdYvhrcgNq8NZjfK8L', 'Not About Angels', 'Birdy', '10brSVg418XnVE0Of7nie2', 74, 189475, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6vECYJHxYmm3Ydt3fF01pE', 'Stolen Dance', 'Milky Chance', '10brSVg418XnVE0Of7nie2', 7, 313684, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('7IxVWmdabNVhfLBV3JD0nJ', 'The Cave', 'Mumford & Sons', '10brSVg418XnVE0Of7nie2', 2, 217986, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3d8y0t70g7hw2FOWl9Z4Fm', 'Ophelia', 'The Lumineers', '10brSVg418XnVE0Of7nie2', 10, 160097, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0W4Kpfp1w2xkY3PrV714B7', 'Ho Hey', 'The Lumineers', '10brSVg418XnVE0Of7nie2', 14, 163133, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2c62Xf5Po1YSa1N6LOjPHy', 'Hello My Old Heart', 'The Oh Hellos', '10brSVg418XnVE0Of7nie2', 1, 256006, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0TgaaBAEf84VqvdTshIdPw', 'Cold Is The Night', 'The Oh Hellos', '10brSVg418XnVE0Of7nie2', 0, 195011, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2BOof6lYrGfz6BojJ0aeJd', 'Paint', 'The Paper Kites', '10brSVg418XnVE0Of7nie2', 0, 191773, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2KhS0LVOw9ralhfbcIi7vL', 'Comes And Goes (In Waves)', 'Greg Laswell', '10brSVg418XnVE0Of7nie2', 51, 253546, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3G9ETaH55bMQx8hwNhAgbU', 'The Stable Song', 'Gregory Alan Isakov', '10brSVg418XnVE0Of7nie2', 68, 360933, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('41yIvlFgvGwxq8qTqAR7eG', 'Bloom - Bonus Track', 'The Paper Kites', '10brSVg418XnVE0Of7nie2', 5, 210080, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3RPerpXuNznZbCuWYEBz5i', 'All My Days', 'Alexi Murdoch', '10brSVg418XnVE0Of7nie2', 57, 297120, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5OjXCLAOyDiyZYM1SRWHNL', 'Night at Lake Unknown', 'Conor Oberst', '10brSVg418XnVE0Of7nie2', 29, 255586, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6MYDgkfu34kRRIdMfleVCV', 'The Circle Game', 'Joni Mitchell', '10brSVg418XnVE0Of7nie2', 50, 292600, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('05CwKXfxViGloskFJbdPe0', 'La Mar (The Ocean)', 'The Beautiful Girls', '10brSVg418XnVE0Of7nie2', 0, 237840, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3GSYWQNnSdovwC2H8HpziA', 'Almost Lover', 'A Fine Frenzy', '10brSVg418XnVE0Of7nie2', 48, 268800, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4y0GYqBSHEy7e1FOemdLjK', 'Please Don''t Say You Love Me', 'Gabrielle Aplin', '10brSVg418XnVE0Of7nie2', 28, 181400, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3H3r2nKWa3Yk5gt8xgmsEt', 'This City', 'Sam Fischer', '10brSVg418XnVE0Of7nie2', 70, 194853, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0pdKRp2sUthTPe7RLWpPqQ', 'You''re Somebody Else', 'flora cash', '10brSVg418XnVE0Of7nie2', 70, 218883, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1Db3RDS6mdsuD5ibO7Bo1F', 'More Than Life', 'Whitley', '10brSVg418XnVE0Of7nie2', 46, 175533, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0xOZTzwpERp1jrRk9Qly3Q', 'One Red Thread', 'Blind Pilot', '10brSVg418XnVE0Of7nie2', 48, 271000, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1XpAZlfENlrHalIvuhAp9R', 'Moon', 'Jonah Kagen', '10brSVg418XnVE0Of7nie2', 53, 220918, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2hKdd3qO7cWr2Jo0Bcs0MA', 'Drops of Jupiter (Tell Me)', 'Train', '10brSVg418XnVE0Of7nie2', 85, 259933, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6GgWI2t7G0bgUzVoZDlM6R', 'I Got You, Honey', 'Ocie Elliott', '10brSVg418XnVE0Of7nie2', 60, 161586, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4bXoVtbp6fN8FaSQvGQB41', 'Tortured Soul', 'Chord Overstreet', '10brSVg418XnVE0Of7nie2', 49, 246613, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2gRKq9rIC5i1zuxp06zJWH', 'What''s Left of You', 'Chord Overstreet', '10brSVg418XnVE0Of7nie2', 64, 178600, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3kZC0ZmFWrEHdUCmUqlvgZ', 'I Will Follow You into the Dark', 'Death Cab for Cutie', '10brSVg418XnVE0Of7nie2', 66, 189186, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('34N4miRYCGQwmQEXoCiuuL', 'Another Story', 'The Head And The Heart', '10brSVg418XnVE0Of7nie2', 67, 274200, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1D4XFKolp63mNqqMXJJL1V', 'Wings', 'Birdy', '10brSVg418XnVE0Of7nie2', 66, 252106, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5NSmVuhSf3JxrCewijurpf', 'The Giving Tree', 'Plain White T''s', '10brSVg418XnVE0Of7nie2', 49, 186433, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6HbxpoChDH9ThadFOSAnma', 'Autumn Town Leaves', 'Iron & Wine', '10brSVg418XnVE0Of7nie2', 61, 195200, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6dDxgfvM8pJm7AzmLZB1nN', 'Such Great Heights', 'Iron & Wine', '10brSVg418XnVE0Of7nie2', 60, 251280, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1B62o4CbdL9ckGvwsz2cgn', 'Where''s My Love', 'SYML', '10brSVg418XnVE0Of7nie2', 83, 202000, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('18ywhG9EvuMMUIdUWxEqp7', 'Go Solo', 'Tom Rosenthal', '10brSVg418XnVE0Of7nie2', 4, 142280, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0mnWNvwXRNu82bpfi2rsuz', 'San Luis', 'Gregory Alan Isakov', '10brSVg418XnVE0Of7nie2', 74, 272346, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('11i1ZadbMOxmAHanhcQonu', 'City on a Hill', 'Mon Rovîa', '10brSVg418XnVE0Of7nie2', 4, 170759, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1IUEz40wavYETWJgak8iI3', 'Ghost', 'Josiah and the Bonnevilles', '10brSVg418XnVE0Of7nie2', 5, 146250, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4I7nXv6iqKh60sWMJdpUbN', 'Tidal Wave - Acoustic', 'Old Sea Brigade', '10brSVg418XnVE0Of7nie2', 61, 155050, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('32XaqPVTVkkuOiOPQZ3SpA', 'midnight love', 'girl in red', '10brSVg418XnVE0Of7nie2', 69, 193928, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('76OGwb5RA9h4FxQPT33ekc', 'SNAP', 'Rosa Linn', '10brSVg418XnVE0Of7nie2', 20, 179551, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6QPqf4WqwZkxM68bGipzvP', 'Young Blood - Acoustic', 'Noah Kahan', '10brSVg418XnVE0Of7nie2', 61, 200613, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('25Syi9wnfn6ZGAmiOBypPq', 'Motion Sickness', 'Phoebe Bridgers', '10brSVg418XnVE0Of7nie2', 66, 229760, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0uLlFekr8nKMj960xHKPYx', 'No Face', 'Haley Heynderickx', '10brSVg418XnVE0Of7nie2', 54, 116483, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('32xm5clCZkPPc7hdQRZjYQ', 'Bathroom Light', 'Mt. Joy', '10brSVg418XnVE0Of7nie2', 66, 188266, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0eBryM7ePQH3Klt3jz8xZd', 'First Day of My Life', 'Bright Eyes', '10brSVg418XnVE0Of7nie2', 69, 188877, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4Vutl1Y7OJOBwIqVISNmzL', 'Down by the Water', 'Ocie Elliott', '10brSVg418XnVE0Of7nie2', 69, 178293, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3Kj2EWpIBnvETsYq4cq0IH', 'Big Black Car', 'Gregory Alan Isakov', '10brSVg418XnVE0Of7nie2', 77, 217466, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0fYVliAYKHuPmECRs1pbRf', 'Renegades', 'X Ambassadors', '10brSVg418XnVE0Of7nie2', 79, 195200, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5Vnny8AlKRnPZ3wQNouf2T', 'Don''t Let Me', 'Morningsiders', '10brSVg418XnVE0Of7nie2', 56, 183850, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3fKpSA5w8iqLe9sNdIDESW', 'Call Your Mom (with Lizzy McAlpine)', 'Noah Kahan', '10brSVg418XnVE0Of7nie2', 62, 278670, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3onPL6KjCPM0K8wZkDeU7y', 'A Troubled Mind', 'Noah Kahan', '10brSVg418XnVE0Of7nie2', 66, 181750, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('67q8yivDoOPXCYodi1zTix', 'Glue Myself Shut', 'Noah Kahan', '10brSVg418XnVE0Of7nie2', 72, 196201, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3Z2anmIVG8b1GelyeFQdnP', 'Maine', 'Noah Kahan', '10brSVg418XnVE0Of7nie2', 79, 232618, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4sDbdBjuYQVdNNB4PiHUPo', 'Coastline', 'Hollow Coves', '10brSVg418XnVE0Of7nie2', 79, 233973, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6VwAh8Z1d5YKoSWoEaV4db', 'Making All Things New', 'Aaron Espe', '10brSVg418XnVE0Of7nie2', 56, 159600, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3ee95f18', 'Skinny Love', 'Birdy', '95481947', 74, 201080, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2ToW7zhGCrVrLU4fiKj9U1', 'Cleopatra', 'The Lumineers', '10brSVg418XnVE0Of7nie2', 7, 201413, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3rTnGUeDrnZV22DvRuUuXr', 'Wait', 'M83', '10brSVg418XnVE0Of7nie2', 64, 343253, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5ihBtaVVMqO5VqJA5wnmfy', 'The View Between Villages - Extended', 'Noah Kahan', '10brSVg418XnVE0Of7nie2', 65, 292903, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2JTBNz8VZx7i38pcPROWuz', 'Kansas City', 'The New Basement Tapes', '10brSVg418XnVE0Of7nie2', 62, 244426, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0HEytGQM3bG1vKxER7IgVK', 'Spotless (feat. The Lumineers)', 'Zach Bryan', '10brSVg418XnVE0Of7nie2', 79, 169467, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5TgEJ62DOzBpGxZ7WRsrqb', 'Work Song', 'Hozier', '10brSVg418XnVE0Of7nie2', 82, 229720, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0GMs3jq70wmCo12pavj4st', 'Little Bit Better', 'Caleb Hearn', '10brSVg418XnVE0Of7nie2', 78, 227625, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0y1QJc3SJVPKJ1OvFmFqe6', 'Way down We Go', 'KALEO', '6d927lSLN3Daa6alDvZSPd', 84, 213706, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('aad0eac8', 'Hold Back The River', 'James Bay', '95481947', 60, 238746, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3RYxKgKrl0acbkN4AbQCdT', 'Nobody Knows', 'The Lumineers', '10brSVg418XnVE0Of7nie2', 0, 188728, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('07UFnnK3uPIuKv5Rs9TmXl', 'Orange Juice', 'Noah Kahan', '10brSVg418XnVE0Of7nie2', 78, 297103, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0QQIhT6PtJ5glyn4HKNKQ6', 'All the Pretty Girls', 'KALEO', '10brSVg418XnVE0Of7nie2', 70, 269893, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3p1kSUxsCux5Zf1CeKxpqh', 'Blame The Moon', 'Hazlett', '10brSVg418XnVE0Of7nie2', 68, 223723, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1SuNH8rKUtcjWJYvZ3bBGo', 'Please Don''t Be', 'Hazlett', '10brSVg418XnVE0Of7nie2', 68, 175201, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('66MXa8qDIQRtwuxuNtjNCu', 'Hello My Old Heart', 'The Oh Hellos', '10brSVg418XnVE0Of7nie2', 61, 256006, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1oWnDC5OoMPPosVY2cdXgT', 'Lavender Girl', 'Caamp', '10brSVg418XnVE0Of7nie2', 68, 203546, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6IPwKM3fUUzlElbvKw2sKl', 'we fell in love in october', 'girl in red', '10brSVg418XnVE0Of7nie2', 85, 184153, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1nHKI4L5pWrN5CUvW07nHP', 'Let Her Go (feat. Ed Sheeran) - Anniversary Edition', 'Passenger', '10brSVg418XnVE0Of7nie2', 66, 256986, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5PzWVmfzu7rePAuFkxPQf0', 'Repeat Until Death', 'Novo Amor', '10brSVg418XnVE0Of7nie2', 73, 234080, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2PYRqwROIlW4t4Gh0uDD3d', 'Cold', 'Novo Amor', '10brSVg418XnVE0Of7nie2', 60, 263045, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4ccYow5an64MRTuiSnSh2b', 'Sparkly Socks', 'Salt Tree', '10brSVg418XnVE0Of7nie2', 53, 163100, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6iWEhoALoBFnQMNVhYY0Sc', 'You''re Somebody Else', 'flora cash', '10brSVg418XnVE0Of7nie2', 69, 219013, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2R3I5DiDf8bLz2QjrPmUpk', 'Vagabond', 'Caamp', '10brSVg418XnVE0Of7nie2', 70, 129463, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4pqcPscDHP2pBg5wiYxIQ1', 'Missionary Feelings', 'Hazlett', '10brSVg418XnVE0Of7nie2', 63, 212297, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6T4eTkoARLnJIzWjAtyQe0', 'By and By', 'Caamp', '10brSVg418XnVE0Of7nie2', 73, 280794, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2tTFLd7fZCB2yCQM2fhJ8s', 'My Skin', 'Hazlett', '10brSVg418XnVE0Of7nie2', 60, 216963, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2mdEsXPu8ZmkHRRtAdC09e', 'Cinnamon Girl', 'Lana Del Rey', '10brSVg418XnVE0Of7nie2', 88, 300683, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3taCbWWTilb7eNMsAzOBq4', 'Radio', 'Lana Del Rey', '10brSVg418XnVE0Of7nie2', 76, 214573, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5VDPZfalNAXmR2XVT7Ty1n', 'Coffee Cups and Cigarettes', 'Tomo', '10brSVg418XnVE0Of7nie2', 55, 207598, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4iXSD0VOgqTcZqsVd8FdmK', 'Do Not Destroy', 'Cicada Rhythm', '10brSVg418XnVE0Of7nie2', 34, 322906, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6U63s4dcufvu0QnnXvO31Y', 'Shiver', 'Hazlett', '10brSVg418XnVE0Of7nie2', 60, 214808, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5JDLi91s9VNDHe8rkvTOdh', 'Coming Home to You', 'Salt Tree', '10brSVg418XnVE0Of7nie2', 56, 192396, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1ruHAFkWtW6sQ3sXVNvnC3', 'Dandelion', 'Oliver Hazard', '10brSVg418XnVE0Of7nie2', 61, 190654, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0qZTAhP1sfuLi61fG6at69', 'Part Time Lovers', 'Hazlett', '10brSVg418XnVE0Of7nie2', 56, 190961, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0mflMxspEfB0VbI1kyLiAv', 'Stick Season', 'Noah Kahan', '10brSVg418XnVE0Of7nie2', 88, 182346, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6BTAzOm96NwuGXhfHqWYM4', 'Paul Revere (with Gregory Alan Isakov)', 'Noah Kahan', '10brSVg418XnVE0Of7nie2', 64, 213313, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6vrUTGn5p8IrfTZ0J6sIVM', 'Iris', 'The Goo Goo Dolls', '10brSVg418XnVE0Of7nie2', 75, 289906, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0QZ5yyl6B6utIWkxeBDxQN', 'The Night We Met', 'Lord Huron', '10brSVg418XnVE0Of7nie2', 76, 208211, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('7myzdcGa6aTaXj3Wf1V55M', 'Strawberries', 'Caamp', '10brSVg418XnVE0Of7nie2', 62, 219344, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2RcEpOohSehGSfXnx9eA5k', 'Hesitate', 'Hazlett', '10brSVg418XnVE0Of7nie2', 60, 249598, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6ZrlXT6mUMEgomN128iekU', 'Lisztomania', 'Phoenix', '5DVFpXPBJkCR03AjSLVh83', 2, 241640, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6Spku8c8TA79nuAxOtlD61', 'it''s my turn', 'MisterWives', '5DVFpXPBJkCR03AjSLVh83', 28, 194373, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2YZrjrLRMfGdyue73N6BLY', 'Kiss & Tell', 'Angels & Airwaves', '5DVFpXPBJkCR03AjSLVh83', 0, 248165, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3mRLHiSHYtC8Hk7bzZdUs1', 'River', 'Bishop Briggs', '5DVFpXPBJkCR03AjSLVh83', 77, 216133, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1MSM3Fo2fvnwVqMcz8Jhjq', 'Cecilia And The Satellite', 'Andrew McMahon in the Wilderness', '5DVFpXPBJkCR03AjSLVh83', 58, 223879, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0vEVGIB0WqzWRD5D8dfxAw', 'Motorola', 'FILLY', '5DVFpXPBJkCR03AjSLVh83', 37, 133280, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3YcpHA5BNT66TgI1I00GfW', 'Sharon', 'Good San Juan', '5DVFpXPBJkCR03AjSLVh83', 24, 151579, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5FuTheVNMQgBISFAXHlK8i', 'object permanence', 'Sydney Sprague', '5DVFpXPBJkCR03AjSLVh83', 31, 139973, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('67YPjbcxUypwNOwYBZquq1', 'Superposition', 'Young the Giant', '5DVFpXPBJkCR03AjSLVh83', 70, 230959, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3ki2sYrrJ9bOW5hLF8oRI8', 'Tempt My Trouble', 'Bishop Briggs', '5DVFpXPBJkCR03AjSLVh83', 43, 193986, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('33247017', 'Not About Angels', 'Birdy', '95481947', 74, 189475, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3B0eFBbYwK7BMfNlGLG1TU', 'Loud', 'Feed The Biirds', '5DVFpXPBJkCR03AjSLVh83', 43, 206976, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1TzuE767L4h0IGEmtWHGtw', 'Veronica Mars', 'Blondshell', '5DVFpXPBJkCR03AjSLVh83', 0, 117850, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5huLMzIzFEdVcvEzt2hfk1', 'Peaches', 'The Presidents Of The United States Of America', '5DVFpXPBJkCR03AjSLVh83', 67, 171693, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('77vYwoC7e3pVoPq8BA9CuL', 'I Will Possess Your Heart', 'Death Cab for Cutie', '5DVFpXPBJkCR03AjSLVh83', 55, 505773, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2ZRQixbe1MCJxpcO96Zj1y', 'Daft Pretty Boys', 'Bad Suns', '5DVFpXPBJkCR03AjSLVh83', 62, 187013, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3aAuIvgJGdp4wWd60riWfB', 'Valerie', 'Steve Winwood', '5DVFpXPBJkCR03AjSLVh83', 71, 246666, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('17tDv8WA8IhqE8qzuQn707', 'My First Kiss (feat. Ke$ha)', '3OH!3', '5DVFpXPBJkCR03AjSLVh83', 64, 192440, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2i0AUcEnsDm3dsqLrFWUCq', 'Tonight Tonight', 'Hot Chelle Rae', '5DVFpXPBJkCR03AjSLVh83', 71, 200466, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4tsk3Rk7U7YFky0rzkyuOg', 'The Bongo Song', 'The Front Bottoms', '5DVFpXPBJkCR03AjSLVh83', 37, 174173, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1dxXQuExRVu77xF1r5YtRF', 'Roman Candles', 'Death Cab for Cutie', '5DVFpXPBJkCR03AjSLVh83', 38, 130106, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1ayNrehEkJw6tiN1e7OawW', 'Pepper - Acoustic', 'Death Cab for Cutie', '5DVFpXPBJkCR03AjSLVh83', 36, 173155, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('76Je5Wklky23mVoxiRszcN', 'Walk', 'Foo Fighters', '5DVFpXPBJkCR03AjSLVh83', 70, 255960, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4W4wYHtsrgDiivRASVOINL', 'Love Shack', 'The B-52''s', '5DVFpXPBJkCR03AjSLVh83', 73, 320680, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1280ebYtTct0ytDEZdrcvQ', 'Swoon', 'Beach Weather', '5DVFpXPBJkCR03AjSLVh83', 0, 221925, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1fBl642IhJOE5U319Gy2Go', 'Animal', 'Neon Trees', '5DVFpXPBJkCR03AjSLVh83', 74, 212293, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0CSTvWUps1YmpQoXXay9ol', 'Cosmic Love', 'Florence + The Machine', '5DVFpXPBJkCR03AjSLVh83', 67, 255133, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('7CH99b2i1TXS5P8UUyWtnM', 'Them Changes', 'Thundercat', '5DVFpXPBJkCR03AjSLVh83', 72, 188453, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3kXoKlD84c6OmIcOLfrfEs', 'September', 'Earth, Wind & Fire', '5DVFpXPBJkCR03AjSLVh83', 84, 216022, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4COleG16xBCkpofKHsJU2p', 'Ohio (Come Back To Texas)', 'Bowling For Soup', '5DVFpXPBJkCR03AjSLVh83', 56, 230560, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1S30kHvkkdMkcuCTGSgS41', 'Nine in the Afternoon - Single Mix', 'Panic! At The Disco', '5DVFpXPBJkCR03AjSLVh83', 66, 191560, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5lN1EH25gdiqT1SFALMAq1', 'Gold on the Ceiling', 'The Black Keys', '5DVFpXPBJkCR03AjSLVh83', 67, 224333, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('7i9763l5SSfOnqZ35VOcfy', 'Heavydirtysoul', 'Twenty One Pilots', '5DVFpXPBJkCR03AjSLVh83', 74, 234813, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6pqKbOiVd58jcnxqIB10Ra', 'Amerika', 'Young the Giant', '5DVFpXPBJkCR03AjSLVh83', 55, 240240, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5EYi2rH4LYs6M21ZLOyQTx', 'Loving Is Easy (feat. Benny Sings)', 'Rex Orange County', '5DVFpXPBJkCR03AjSLVh83', 8, 155720, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4dVbhS6OiYvFikshyaQaCN', 'My Hero', 'Foo Fighters', '5DVFpXPBJkCR03AjSLVh83', 78, 260026, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6Lto2Xj8y0U2bes2hmRMZu', 'Wonderful Nothing', 'Glass Animals', '6d927lSLN3Daa6alDvZSPd', 63, 264214, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('77KnJc8o5G1eKVwX5ywMeZ', 'Mind Over Matter (Reprise)', 'Young the Giant', '6d927lSLN3Daa6alDvZSPd', 79, 230866, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5FVd6KXrgO9B3JPmC8OPst', 'Do I Wanna Know?', 'Arctic Monkeys', '6d927lSLN3Daa6alDvZSPd', 89, 272394, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5XeFesFbtLpXzIVDNQP22n', 'I Wanna Be Yours', 'Arctic Monkeys', '6d927lSLN3Daa6alDvZSPd', 93, 183956, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2GxrNKugF82CnoRFbQfzPf', 'i like the way you kiss me', 'Artemas', '6d927lSLN3Daa6alDvZSPd', 85, 142514, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4IadxL6BUymXlh8RCJJu7T', 'Too Sweet', 'Hozier', '6d927lSLN3Daa6alDvZSPd', 79, 251424, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('7MlDNspYwfqnHxORufupwq', 'Sex, Drugs, Etc.', 'Beach Weather', '6d927lSLN3Daa6alDvZSPd', 85, 196784, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('086myS9r57YsLbJpU0TgK9', 'Why''d You Only Call Me When You''re High?', 'Arctic Monkeys', '6d927lSLN3Daa6alDvZSPd', 87, 161123, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4sebUbjqbcgDSwG6PbSGI0', 'Come a Little Closer', 'Cage The Elephant', '6d927lSLN3Daa6alDvZSPd', 75, 229346, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2QjOHCTQ1Jl3zawyYOpxh6', 'Sweater Weather', 'The Neighbourhood', '6d927lSLN3Daa6alDvZSPd', 92, 240400, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0yc6Gst2xkRu0eMLeRMGCX', 'Apocalypse', 'Cigarettes After Sex', '6d927lSLN3Daa6alDvZSPd', 68, 290616, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('593knnQN4REEshx8th9zgK', 'Strangers', 'Kenya Grace', '6d927lSLN3Daa6alDvZSPd', 72, 172964, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4Sfa7hdVkqlM8UW5LsSY3F', 'Take a Walk', 'Passion Pit', '6d927lSLN3Daa6alDvZSPd', 67, 264493, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5n0CTysih20NYdT2S0Wpe8', 'Trouble', 'Cage The Elephant', '6d927lSLN3Daa6alDvZSPd', 75, 225973, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3USxtqRwSYz57Ewm6wWRMp', 'Heat Waves', 'Glass Animals', '6d927lSLN3Daa6alDvZSPd', 88, 238805, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1e7EdcxkUPFZWfuY4VI3rh', 'Creatures in Heaven', 'Glass Animals', '6d927lSLN3Daa6alDvZSPd', 62, 221670, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6IbCvfmmICEEAyDwQ9zcbt', 'I Don''t Wanna Talk (I Just Wanna Dance)', 'Glass Animals', '6d927lSLN3Daa6alDvZSPd', 64, 195190, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6Bi1Y7TD70eWTCKn7jsQQm', 'A Tear in Space (Airlock)', 'Glass Animals', '6d927lSLN3Daa6alDvZSPd', 63, 203989, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('57RA3JGafJm5zRtKJiKPIm', 'Are You Bored Yet? (feat. Clairo)', 'Wallows', '6d927lSLN3Daa6alDvZSPd', 82, 178000, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('50v5onide6aSC1O3HgaaNz', 'LUNGS BURN', 'little image', '6d927lSLN3Daa6alDvZSPd', 41, 158426, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2AYEOC02WLhUiOoaig2SEH', 'Out of My League', 'Fitz and The Tantrums', '6d927lSLN3Daa6alDvZSPd', 79, 209386, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6K4t31amVTZDgR3sKmwUJJ', 'The Less I Know The Better', 'Tame Impala', '6d927lSLN3Daa6alDvZSPd', 88, 216320, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3Wrjm47oTz2sjIgck11l5e', 'Beggin''', 'Måneskin', '6d927lSLN3Daa6alDvZSPd', 86, 211560, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0rRjGruFonCGOt0S5zAJNQ', 'The Other Side Of Paradise', 'Glass Animals', '6d927lSLN3Daa6alDvZSPd', 71, 320654, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4vHNeBWDQpVCmGbaccrRzi', 'Goodie Bag', 'Still Woozy', '6d927lSLN3Daa6alDvZSPd', 73, 146390, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('74f0dpqHhTeTJzs4pmZ1yq', 'Pool House', 'The Backseat Lovers', '6d927lSLN3Daa6alDvZSPd', 74, 269411, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('04uR2cdkgiaLIzebPcs25m', 'Two Weeks', 'Grizzly Bear', '6d927lSLN3Daa6alDvZSPd', 71, 246213, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3qhlB30KknSejmIvZZLjOD', 'End of Beginning', 'Djo', '6d927lSLN3Daa6alDvZSPd', 91, 159245, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1rqqCSm0Qe4I9rUvWncaom', 'High Hopes', 'Panic! At The Disco', '6d927lSLN3Daa6alDvZSPd', 82, 190946, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2tpWsVSb9UEmDRxAl1zhX1', 'Counting Stars', 'OneRepublic', '6d927lSLN3Daa6alDvZSPd', 89, 257265, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0ct6r3EGTcMLPtrXHDvVjc', 'The Nights', 'Avicii', '6d927lSLN3Daa6alDvZSPd', 87, 176658, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2NvmNbDbHeQbxLOMEy1WkV', 'Give Me Some Time', 'Lola Marsh', '6d927lSLN3Daa6alDvZSPd', 27, 195746, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('297PYWIVLP38C1a92ND8Kv', 'So Cold', 'Balu Brigada', '6d927lSLN3Daa6alDvZSPd', 73, 201133, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6OiRh4kttAs1YWglvTcYkB', 'Alrighty Aphrodite', 'Peach Pit', '6d927lSLN3Daa6alDvZSPd', 68, 207813, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0cgyeBU54kjmI54TflMANg', 'Neon Pill', 'Cage The Elephant', '6d927lSLN3Daa6alDvZSPd', 59, 201240, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1170VohRSx6GwE6QDCHPPH', 'Kilby Girl', 'The Backseat Lovers', '6d927lSLN3Daa6alDvZSPd', 79, 282205, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2ghZbiC9CbdmrHkH5nIquF', 'Magpie', 'Peach Pit', '6d927lSLN3Daa6alDvZSPd', 48, 241290, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4O05ZiEmlfUFPhvafHqcIO', 'Show Pony', 'Glass Animals', '6d927lSLN3Daa6alDvZSPd', 63, 255636, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2f9ea6e2', 'This City', 'Sam Fischer', '95481947', 70, 194853, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('39702b67', 'You''re Somebody Else', 'flora cash', '95481947', 70, 218883, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3899e364', 'Moon', 'Jonah Kagen', '95481947', 53, 220918, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0MQtMtaxoXE5ybt6pOgqnw', 'Hotspot', 'NIGHT TRAVELER', '6d927lSLN3Daa6alDvZSPd', 43, 213000, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('72ce9c03', 'I Got You, Honey', 'Ocie Elliott', '95481947', 60, 161586, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0uI7yAKUf52Cn7y3sYyjiX', '3 Nights', 'Dominic Fike', '6d927lSLN3Daa6alDvZSPd', 79, 177666, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5R8dQOPq8haW94K7mgERlO', 'Poker Face', 'Lady Gaga', '6d927lSLN3Daa6alDvZSPd', 82, 237200, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('01wYbzcnWW6zjBRKOyIET0', 'safe haven', 'Babebee', '6d927lSLN3Daa6alDvZSPd', 29, 127714, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5v6rLrTb6JzqgXXuwGVevq', '7 minutes in heaven', 'Babebee', '6d927lSLN3Daa6alDvZSPd', 36, 291428, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6i0V12jOa3mr6uu4WYhUBr', 'Heathens', 'Twenty One Pilots', '6d927lSLN3Daa6alDvZSPd', 84, 195920, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2f0pn9DkEJwAzXApnFh5cr', 'Someone To You', 'BANNERS', '3DWk2zxuQWBNGMSreoJobW', 78, 219801, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0pqnGHJpmpxLKifKRmU6WP', 'Believer', 'Imagine Dragons', '3DWk2zxuQWBNGMSreoJobW', 89, 204346, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6Qn5zhYkTa37e91HC1D7lb', 'Whatever It Takes', 'Imagine Dragons', '3DWk2zxuQWBNGMSreoJobW', 84, 201240, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1yvMUkIOTeUNtNWlWRgANS', 'Unstoppable', 'Sia', '3DWk2zxuQWBNGMSreoJobW', 81, 217746, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0sBJA2OCEECMs0HsdIQhvR', 'West Coast', 'OneRepublic', '3DWk2zxuQWBNGMSreoJobW', 62, 192947, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('7uCBGNn991AM68fR4tSDco', 'Born For This', 'The Score', '3DWk2zxuQWBNGMSreoJobW', 69, 237375, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6NaBDHz9C7Uz9Z9CwLXQin', 'Bleeding Out', 'Imagine Dragons', '3DWk2zxuQWBNGMSreoJobW', 57, 221053, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2FY7b99s15jUprqC0M5NCT', 'Natural', 'Imagine Dragons', '3DWk2zxuQWBNGMSreoJobW', 82, 189466, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('15DrrIod12Tc2IoMaHiwlQ', 'I Bet My Life', 'Imagine Dragons', '3DWk2zxuQWBNGMSreoJobW', 61, 192706, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3CrsuTJomWZmeXIvKhV45l', 'Stronger', 'The Score', '3DWk2zxuQWBNGMSreoJobW', 65, 190048, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2s1sdSqGcKxpPr5lCl7jAV', 'Chandelier', 'Sia', '3DWk2zxuQWBNGMSreoJobW', 74, 216120, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('54ipXppHLA8U4yqpOFTUhr', 'Bones', 'Imagine Dragons', '3DWk2zxuQWBNGMSreoJobW', 83, 165264, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2bzitsPcImYC6DZWvvLCQi', 'Zero - From the Original Motion Picture "Ralph Breaks The Internet"', 'Imagine Dragons', '3DWk2zxuQWBNGMSreoJobW', 70, 210933, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0OI7AFifLSoGzpb8bdBLLV', 'Home (with Machine Gun Kelly, X Ambassadors & Bebe Rexha)', 'mgk', '3DWk2zxuQWBNGMSreoJobW', 71, 202804, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('60r6l0O6DME6CShNpFyUpQ', 'Code Name: Raven', 'House of Heroes', '3DWk2zxuQWBNGMSreoJobW', 33, 250173, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3UMrglJeju5yWyYIW6o99b', 'The Great War', 'Taylor Swift', '3DWk2zxuQWBNGMSreoJobW', 70, 240355, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('11C4y2Yz1XbHmaQwO06s9f', 'Dance The Night', 'Dua Lipa', '3DWk2zxuQWBNGMSreoJobW', 71, 176579, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('213x4gsFDm04hSqIUkg88w', 'On Top Of The World', 'Imagine Dragons', '3DWk2zxuQWBNGMSreoJobW', 79, 192280, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6lV2MSQmRIkycDScNtrBXO', 'Airplanes (feat. Hayley Williams of Paramore)', 'B.o.B', '3DWk2zxuQWBNGMSreoJobW', 78, 180480, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1zB4vmk8tFRmM9UULNzbLB', 'Thunder', 'Imagine Dragons', '3DWk2zxuQWBNGMSreoJobW', 87, 187146, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('aba1e35a', 'What''s Left of You', 'Chord Overstreet', '95481947', 64, 178600, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('723e749d', 'I Will Follow You into the Dark', 'Death Cab for Cutie', '95481947', 66, 189186, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('24bf6b9c', 'Autumn Town Leaves', 'Iron & Wine', '95481947', 61, 195200, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('d538babd', 'Where''s My Love', 'SYML', '95481947', 83, 202000, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('d67107e0', 'Tidal Wave - Acoustic', 'Old Sea Brigade', '95481947', 61, 155050, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('71e95175', 'midnight love', 'girl in red', '95481947', 69, 193928, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('76a37439', 'Young Blood - Acoustic', 'Noah Kahan', '95481947', 61, 200613, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1a1ef758', 'Motion Sickness', 'Phoebe Bridgers', '95481947', 66, 229760, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('c7e75892', 'No Face', 'Haley Heynderickx', '95481947', 54, 116483, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('f4ad0d8c', 'Bathroom Light', 'Mt. Joy', '95481947', 66, 188266, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('95d9ba9b', 'First Day of My Life', 'Bright Eyes', '95481947', 69, 188877, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('d9f5915f', 'Down by the Water', 'Ocie Elliott', '95481947', 69, 178293, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3f5c9787', 'Big Black Car', 'Gregory Alan Isakov', '95481947', 77, 217466, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('b2684a3b', 'Renegades', 'X Ambassadors', '95481947', 79, 195200, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('f8dabff4', 'Don''t Let Me', 'Morningsiders', '95481947', 56, 183850, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1849c9b9', 'A Troubled Mind', 'Noah Kahan', '95481947', 66, 181750, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('bd2a892c', 'Glue Myself Shut', 'Noah Kahan', '95481947', 72, 196201, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('70685007', 'Maine', 'Noah Kahan', '95481947', 79, 232618, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('165de413', 'Coastline', 'Hollow Coves', '95481947', 79, 233973, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('8013d0b0', 'Making All Things New', 'Aaron Espe', '95481947', 56, 159600, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0105b879', 'Spotless (feat. The Lumineers)', 'Zach Bryan', '95481947', 79, 169467, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('15a221d4', 'Work Song', 'Hozier', '95481947', 82, 229720, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('bc4667c4', 'Little Bit Better', 'Caleb Hearn', '95481947', 78, 227625, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('ee9eac50', 'Way down We Go', 'KALEO', '95481947', 84, 213706, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('809a5cef', 'Blame The Moon', 'Hazlett', '95481947', 68, 223723, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3e2342b1', 'Please Don''t Be', 'Hazlett', '95481947', 68, 175201, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('63af9892', 'Lavender Girl', 'Caamp', '95481947', 68, 203546, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('dcb98e06', 'we fell in love in october', 'girl in red', '95481947', 85, 184153, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0aea6a64', 'Repeat Until Death', 'Novo Amor', '95481947', 73, 234080, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3e7da274', 'Sparkly Socks', 'Salt Tree', '95481947', 53, 163100, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('925e658a', 'You''re Somebody Else', 'flora cash', '95481947', 69, 219013, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('51b95b4c', 'Vagabond', 'Caamp', '95481947', 70, 129463, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('32b1be59', 'Missionary Feelings', 'Hazlett', '95481947', 63, 212297, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5154e9f7', 'My Skin', 'Hazlett', '95481947', 60, 216963, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('87514cf5', 'Radio', 'Lana Del Rey', '95481947', 76, 214573, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0f3a35f9', 'Coffee Cups and Cigarettes', 'Tomo', '95481947', 55, 207598, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('fe223f6e', 'Shiver', 'Hazlett', '95481947', 60, 214808, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('e3555313', 'Coming Home to You', 'Salt Tree', '95481947', 56, 192396, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('04133760', 'Dandelion', 'Oliver Hazard', '95481947', 61, 190654, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('817dcded', 'Part Time Lovers', 'Hazlett', '95481947', 56, 190961, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2a57891a', 'Stick Season', 'Noah Kahan', '95481947', 88, 182346, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('643eec34', 'Paul Revere (with Gregory Alan Isakov)', 'Noah Kahan', '95481947', 64, 213313, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('c2d6672d', 'The Night We Met', 'Lord Huron', '95481947', 76, 208211, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('8141628d', 'Strawberries', 'Caamp', '95481947', 62, 219344, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('8e0d650d', 'River', 'Bishop Briggs', '95481947', 77, 216133, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('fa7027fd', 'Cecilia And The Satellite', 'Andrew McMahon in the Wilderness', '95481947', 58, 223879, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('662d6221', 'Superposition', 'Young the Giant', '95481947', 70, 230959, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('a9a4c216', 'Peaches', 'The Presidents Of The United States Of America', '95481947', 67, 171693, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0a30002a', 'Daft Pretty Boys', 'Bad Suns', '95481947', 62, 187013, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('46e399a6', 'My First Kiss (feat. Ke$ha)', '3OH!3', '95481947', 64, 192440, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('ac15b97a', 'Tonight Tonight', 'Hot Chelle Rae', '95481947', 71, 200466, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('f6970778', 'Animal', 'Neon Trees', '95481947', 74, 212293, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('95081b90', 'Them Changes', 'Thundercat', '95481947', 72, 188453, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('b7c7c40d', 'September', 'Earth, Wind & Fire', '95481947', 84, 216022, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('e0adc2b6', 'Ohio (Come Back To Texas)', 'Bowling For Soup', '95481947', 56, 230560, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('a634fb91', 'Nine in the Afternoon - Single Mix', 'Panic! At The Disco', '95481947', 66, 191560, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('da67a723', 'Gold on the Ceiling', 'The Black Keys', '95481947', 67, 224333, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('8a8bfa9e', 'Heavydirtysoul', 'Twenty One Pilots', '95481947', 74, 234813, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('384a0606', 'Mind Over Matter (Reprise)', 'Young the Giant', '95481947', 79, 230866, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('c48fce72', 'I Wanna Be Yours', 'Arctic Monkeys', '95481947', 93, 183956, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('f2ed4bc3', 'i like the way you kiss me', 'Artemas', '95481947', 85, 142514, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('08f4d9e0', 'Sex, Drugs, Etc.', 'Beach Weather', '95481947', 85, 196784, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('01cd45ae', 'Why''d You Only Call Me When You''re High?', 'Arctic Monkeys', '95481947', 87, 161123, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('ade8ae58', 'Come a Little Closer', 'Cage The Elephant', '95481947', 75, 229346, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('056a8a64', 'Strangers', 'Kenya Grace', '95481947', 72, 172964, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('013be43f', 'Trouble', 'Cage The Elephant', '95481947', 75, 225973, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('d2c925fa', 'Heat Waves', 'Glass Animals', '95481947', 88, 238805, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('964db4ed', 'Creatures in Heaven', 'Glass Animals', '95481947', 62, 221670, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('a68c138c', 'I Don''t Wanna Talk (I Just Wanna Dance)', 'Glass Animals', '95481947', 64, 195190, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('7c981e13', 'A Tear in Space (Airlock)', 'Glass Animals', '95481947', 63, 203989, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('3e40d60d', 'Are You Bored Yet? (feat. Clairo)', 'Wallows', '95481947', 82, 178000, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('ce385e54', 'Out of My League', 'Fitz and The Tantrums', '95481947', 79, 209386, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('77c2ee4c', 'The Less I Know The Better', 'Tame Impala', '95481947', 88, 216320, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('739be1cf', 'Beggin''', 'Måneskin', '95481947', 86, 211560, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('22a522ed', 'Goodie Bag', 'Still Woozy', '95481947', 73, 146390, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('f018885b', 'End of Beginning', 'Djo', '95481947', 91, 159245, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1dccbe3a', 'High Hopes', 'Panic! At The Disco', '95481947', 82, 190946, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('583471ba', 'The Nights', 'Avicii', '95481947', 87, 176658, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('b87139db', 'So Cold', 'Balu Brigada', '95481947', 73, 201133, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2625cf22', 'Alrighty Aphrodite', 'Peach Pit', '95481947', 68, 207813, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2bb39f5b', 'Neon Pill', 'Cage The Elephant', '95481947', 59, 201240, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('88bfe91c', '3 Nights', 'Dominic Fike', '95481947', 79, 177666, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('05a101aa', 'Poker Face', 'Lady Gaga', '95481947', 82, 237200, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('78311734', 'Heathens', 'Twenty One Pilots', '95481947', 84, 195920, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('45fae4f1', 'Someone To You', 'BANNERS', '95481947', 78, 219801, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('1076ba9c', 'Believer', 'Imagine Dragons', '95481947', 89, 204346, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('7cb6c7aa', 'Whatever It Takes', 'Imagine Dragons', '95481947', 84, 201240, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('afa57793', 'Unstoppable', 'Sia', '95481947', 81, 217746, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('d79d2d42', 'West Coast', 'OneRepublic', '95481947', 62, 192947, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('54122628', 'Born For This', 'The Score', '95481947', 69, 237375, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('840fb1db', 'Bleeding Out', 'Imagine Dragons', '95481947', 57, 221053, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('95aa1ffc', 'Natural', 'Imagine Dragons', '95481947', 82, 189466, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6dc946d9', 'I Bet My Life', 'Imagine Dragons', '95481947', 61, 192706, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('73635f9d', 'Stronger', 'The Score', '95481947', 65, 190048, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5c320912', 'Chandelier', 'Sia', '95481947', 74, 216120, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('e0a063e4', 'Bones', 'Imagine Dragons', '95481947', 83, 165264, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6031a0c5', 'Zero - From the Original Motion Picture "Ralph Breaks The Internet"', 'Imagine Dragons', '95481947', 70, 210933, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2aebdc71', 'Home (with Machine Gun Kelly, X Ambassadors & Bebe Rexha)', 'mgk', '95481947', 71, 202804, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('13d39028', 'Dance The Night', 'Dua Lipa', '95481947', 71, 176579, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('07d87998', 'On Top Of The World', 'Imagine Dragons', '95481947', 79, 192280, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('219d9822', 'Airplanes (feat. Hayley Williams of Paramore)', 'B.o.B', '95481947', 78, 180480, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('be42db59', 'Thunder', 'Imagine Dragons', '95481947', 87, 187146, NULL);
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('9d36c87f', 'Following the Sun', 'SUPER-Hi', '95481947', 76, 205000, 'https://i.scdn.co/image/ab67616d0000b2735486d91bd83f2c4e0b1669f5');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4cbcc7d7', 'Sunroof', 'Nicky Youre', '95481947', 83, 163025, 'https://i.scdn.co/image/ab67616d0000b273ecd970d1d2623b6c7fc6080c');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('591930bc', 'A Bar Song (Tipsy)', 'Shaboozey', '95481947', 85, 171291, 'https://i.scdn.co/image/ab67616d0000b27360df033c8f8b17384387666a');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('76245b0c', 'Nice To Meet You', 'Myles Smith', '95481947', 81, 176000, 'https://i.scdn.co/image/ab67616d0000b273ddc27435014111f4f59aaf75');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('72523cd3', 'Belong Together (Sped Up)', 'Lucky Socks', '95481947', 66, 128431, 'https://i.scdn.co/image/ab67616d0000b273e19a0ff42a9f0708f2d22ac9');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('671c9f38', 'Good To Be', 'Mark Ambor', '95481947', 73, 147166, 'https://i.scdn.co/image/ab67616d0000b273da33127f62acdb0aca585e92');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('a1f2a691', 'Green Green Grass', 'George Ezra', '95481947', 75, 167613, 'https://i.scdn.co/image/ab67616d0000b2739dd1a35ada9870dc879dfb9e');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('b5993d6c', 'Home', 'Good Neighbours', '95481947', 83, 157485, 'https://i.scdn.co/image/ab67616d0000b273a1cbd333da5cc7ae8f5981fb');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('a6a96a62', 'Ordinary', 'Alex Warren', '95481947', 90, 186964, 'https://i.scdn.co/image/ab67616d0000b2731648716c6562145bea491cb6');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5A5bLKdL5I3k3FTEQlAUw7', 'Following the Sun', 'SUPER-Hi', '1ONeEm52JYZ3VWJ3h0CXUd', 76, 205000, 'https://i.scdn.co/image/ab67616d0000b2735486d91bd83f2c4e0b1669f5');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('57l0zgPkDayvGF2NSYq0ms', 'The Getaway', 'The Strike', '1ONeEm52JYZ3VWJ3h0CXUd', 44, 274892, 'https://i.scdn.co/image/ab67616d0000b2732b6d449e21afb4243aced57b');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5YqEzk3C5c3UZ1D5fJUlXA', 'Sunroof', 'Nicky Youre', '1ONeEm52JYZ3VWJ3h0CXUd', 83, 163025, 'https://i.scdn.co/image/ab67616d0000b273ecd970d1d2623b6c7fc6080c');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('5fZJQrFKWQLb7FpJXZ1g7K', 'A Bar Song (Tipsy)', 'Shaboozey', '1ONeEm52JYZ3VWJ3h0CXUd', 85, 171291, 'https://i.scdn.co/image/ab67616d0000b27360df033c8f8b17384387666a');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('6eWAWHm0cuOaPGDWhoLJ7s', 'Nice To Meet You', 'Myles Smith', '1ONeEm52JYZ3VWJ3h0CXUd', 81, 176000, 'https://i.scdn.co/image/ab67616d0000b273ddc27435014111f4f59aaf75');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0XguQR7pMvTG1C6UlMPYN4', 'Belong Together (Sped Up)', 'Lucky Socks', '1ONeEm52JYZ3VWJ3h0CXUd', 66, 128431, 'https://i.scdn.co/image/ab67616d0000b273e19a0ff42a9f0708f2d22ac9');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2tnSBYJyGGYD0Gbn07tTHZ', 'Good To Be', 'Mark Ambor', '1ONeEm52JYZ3VWJ3h0CXUd', 73, 147166, 'https://i.scdn.co/image/ab67616d0000b273da33127f62acdb0aca585e92');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('4N5s8lPTsjI9EGP7K4SXzB', 'Green Green Grass', 'George Ezra', '1ONeEm52JYZ3VWJ3h0CXUd', 75, 167613, 'https://i.scdn.co/image/ab67616d0000b2739dd1a35ada9870dc879dfb9e');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('68mOSKT4uBkKddEAhlMO61', 'Home', 'Good Neighbours', '1ONeEm52JYZ3VWJ3h0CXUd', 83, 157485, 'https://i.scdn.co/image/ab67616d0000b273a1cbd333da5cc7ae8f5981fb');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('0mWw93IUmZoNx3lgARnrES', 'La Vie en Rose', 'The Catalina', '1ONeEm52JYZ3VWJ3h0CXUd', 43, 177714, 'https://i.scdn.co/image/ab67616d0000b273c4563ac252a8915dae86be05');
INSERT INTO public.tracks (id, name, artist, playlist_id, popularity, duration_ms, album_image_url) VALUES ('2RkZ5LkEzeHGRsmDqKwmaJ', 'Ordinary', 'Alex Warren', '1ONeEm52JYZ3VWJ3h0CXUd', 90, 186964, 'https://i.scdn.co/image/ab67616d0000b2731648716c6562145bea491cb6');


--
-- PostgreSQL database dump complete
--

