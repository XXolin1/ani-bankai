DROP TABLE IF EXISTS contient_;
DROP TABLE IF EXISTS contient;
DROP TABLE IF EXISTS creer;
DROP TABLE IF EXISTS manga_link;
DROP TABLE IF EXISTS anime_link;
DROP TABLE IF EXISTS manga;
DROP TABLE IF EXISTS anime;
DROP TABLE IF EXISTS status;
DROP TABLE IF EXISTS media;
DROP TABLE IF EXISTS studios;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS personnalisation;
DROP TABLE IF EXISTS users;

# Creation des tables

CREATE TABLE users(
   id_users INT AUTO_INCREMENT,
   mail VARCHAR(200),
   first_name VARCHAR(200),
   last_name VARCHAR(200),
   password VARCHAR(200),
   birthday DATE,
   PRIMARY KEY(id_users)
);

CREATE TABLE personnalisation(
   id_personnalisation INT AUTO_INCREMENT,
   profile_picture VARCHAR(2048),
   banner VARCHAR(2048),
   wallpaper VARCHAR(2048),
   color_ani_page VARCHAR(50),
   bio VARCHAR(2048),
   description TEXT,
   id_users INT NOT NULL,
   PRIMARY KEY(id_personnalisation),
   FOREIGN KEY(id_users) REFERENCES users(id_users) ON DELETE CASCADE
);

CREATE TABLE genres(
   id_genre INT AUTO_INCREMENT,
   name VARCHAR(500),
   PRIMARY KEY(id_genre)
);

CREATE TABLE studios(
   id_studio INT AUTO_INCREMENT,
   name_studio VARCHAR(500),
   PRIMARY KEY(id_studio)
);

CREATE TABLE media(
   id_media INT AUTO_INCREMENT,
   name_media VARCHAR(200),
   PRIMARY KEY(id_media)
);

CREATE TABLE status(
   id_status INT AUTO_INCREMENT,
   name_status VARCHAR(200),
   PRIMARY KEY(id_status)
);

CREATE TABLE anime(
   id_anime INT AUTO_INCREMENT,
   title VARCHAR(200),
   medium_picture VARCHAR(2048),
   large_picture VARCHAR(2048),
   japan_name VARCHAR(500),
   english_name VARCHAR(500),
   start_date DATE,
   end_date DATE,
   synopsis TEXT,
   rank_ INT,
   popularity INT,
   nsfw INT,
   updated_at DATE,
   status VARCHAR(100),
   nbr_episode INT,
   season_start_season DATE,
   broadcast VARCHAR(1000),
   source VARCHAR(500),
   average_episode_duration DECIMAL(15,2),
   id_status INT NOT NULL,
   id_media INT NOT NULL,
   PRIMARY KEY(id_anime),
   FOREIGN KEY(id_status) REFERENCES status(id_status) ON DELETE CASCADE,
   FOREIGN KEY(id_media) REFERENCES media(id_media) ON DELETE CASCADE
);

CREATE TABLE manga(
   id_manga INT AUTO_INCREMENT,
   title VARCHAR(200),
   medium_picture VARCHAR(2048),
   large_picture VARCHAR(2048),
   japan_name VARCHAR(500),
   english_name VARCHAR(500),
   start_date DATE,
   end_date DATE,
   synopsis TEXT,
   rank_ INT,
   popularity INT,
   nsfw INT,
   updated_at DATE,
   id_status INT NOT NULL,
   id_media INT NOT NULL,
   PRIMARY KEY(id_manga),
   FOREIGN KEY(id_status) REFERENCES status(id_status) ON DELETE CASCADE,
   FOREIGN KEY(id_media) REFERENCES media(id_media) ON DELETE CASCADE
);

CREATE TABLE anime_link(
   id_link INT AUTO_INCREMENT,
   personnal_status VARCHAR(200),
   score DECIMAL(15,2),
   total_rewatches INT,
   episode_progress INT,
   start_date DATE,
   end_date DATE,
   commentary TEXT,
   favorite INT,
   status VARCHAR(200),
   id_anime INT NOT NULL,
   id_users INT NOT NULL,
   PRIMARY KEY(id_link),
   FOREIGN KEY(id_anime) REFERENCES anime(id_anime) ON DELETE CASCADE,
   FOREIGN KEY(id_users) REFERENCES users(id_users) ON DELETE CASCADE
);

CREATE TABLE manga_link(
   id_link INT AUTO_INCREMENT,
   personnal_status VARCHAR(200),
   score DECIMAL(15,2),
   commentary TEXT,
   favorite INT,
   status VARCHAR(200),
   id_users INT NOT NULL,
   id_manga INT NOT NULL,
   PRIMARY KEY(id_link),
   FOREIGN KEY(id_users) REFERENCES users(id_users) ON DELETE CASCADE,
   FOREIGN KEY(id_manga) REFERENCES manga(id_manga) ON DELETE CASCADE
);

CREATE TABLE creer(
   id_anime INT,
   id_studio INT,
   PRIMARY KEY(id_anime, id_studio),
   FOREIGN KEY(id_anime) REFERENCES anime(id_anime) ON DELETE CASCADE,
   FOREIGN KEY(id_studio) REFERENCES studios(id_studio) ON DELETE CASCADE
);

CREATE TABLE contient(
   id_anime INT,
   id_genre INT,
   PRIMARY KEY(id_anime, id_genre),
   FOREIGN KEY(id_anime) REFERENCES anime(id_anime) ON DELETE CASCADE,
   FOREIGN KEY(id_genre) REFERENCES genres(id_genre) ON DELETE CASCADE
);

CREATE TABLE contient_(
   id_genre INT,
   id_manga INT,
   PRIMARY KEY(id_genre, id_manga),
   FOREIGN KEY(id_genre) REFERENCES genres(id_genre) ON DELETE CASCADE,
   FOREIGN KEY(id_manga) REFERENCES manga(id_manga) ON DELETE CASCADE
);



# Ajout des données de test

-- Insert into users table, no need to insert id_users
INSERT INTO users (mail, first_name, last_name, password, birthday) VALUES
('alice.smith@gmail.com', 'Alice', 'Smith', 'password123', '1995-06-12'),
('bob.jones@yahoo.com', 'Bob', 'Jones', 'securepass456', '1990-02-25'),
('charlie.brown@outlook.com', 'Charlie', 'Brown', 'mypassword789', '1988-11-05'),
('dana.williams@hotmail.com', 'Dana', 'Williams', 'strongpass001', '1992-08-19'),
('eve.johnson@gmail.com', 'Eve', 'Johnson', 'pass4321', '1997-03-30');


-- Insert into personnalisation, no need to insert id_personnalisation
INSERT INTO personnalisation (profile_picture, banner, wallpaper, color_ani_page, bio, description, id_users) VALUES
('https://profile.com/alice.jpg', 'https://banner.com/alice.jpg', 'https://wallpaper.com/alice.jpg', 'blue', 'Anime enthusiast', 'Loves watching classic animes', 1),
('https://profile.com/bob.jpg', 'https://banner.com/bob.jpg', 'https://wallpaper.com/bob.jpg', 'red', 'Studio Ghibli fan', 'Enjoys artistic storytelling', 2),
('https://profile.com/charlie.jpg', 'https://banner.com/charlie.jpg', 'https://wallpaper.com/charlie.jpg', 'green', 'Shonen lover', 'Passionate about action-packed series', 3),
('https://profile.com/dana.jpg', 'https://banner.com/dana.jpg', 'https://wallpaper.com/dana.jpg', 'purple', 'Romantic anime addict', 'Enjoys heartwarming stories', 4),
('https://profile.com/eve.jpg', 'https://banner.com/eve.jpg', 'https://wallpaper.com/eve.jpg', 'black', 'Manga collector', 'Collects rare manga series', 5);


-- Insert into genres table, no need to insert id_genre
INSERT INTO genres (name) VALUES
('Action'),
('Adventure'),
('Comedy'),
('Drama'),
('Fantasy');


-- Insert into studios table, no need to insert id_studio
INSERT INTO studios (name_studio) VALUES
('Madhouse'),
('Studio Ghibli'),
('Toei Animation'),
('Bones'),
('A-1 Pictures');


-- Insert into media table, no need to insert id_media
INSERT INTO media (name_media) VALUES
('TV'),
('Movie'),
('OVA'),
('ONA'),
('Special');


-- Insert into status table, no need to insert id_status
INSERT INTO status (name_status) VALUES
('Airing'),
('Completed'),
('Upcoming'),
('On-Hold'),
('Dropped');


-- Insert into anime table, no need to insert id_anime
INSERT INTO anime (title, medium_picture, large_picture, japan_name, english_name, start_date, end_date, synopsis, rank_, popularity, nsfw, updated_at, status, nbr_episode, season_start_season, broadcast, source, average_episode_duration, id_status, id_media) VALUES
('Attack on Titan', 'https://medium.com/aot.jpg', 'https://large.com/aot.jpg', '進撃の巨人', 'Attack on Titan', '2013-04-07', '2023-03-28', 'Humanity fights titans to survive.', 1, 100, FALSE, '2023-09-01', 'Completed', 87, '2013-04-07', 'Sunday 22:00', 'Manga', 24.5, 2, 1),
('Spirited Away', 'https://medium.com/spirited.jpg', 'https://large.com/spirited.jpg', '千と千尋の神隠し', 'Spirited Away', '2001-07-20', NULL, 'A girl trapped in a spirit world.', 5, 98, FALSE, '2023-09-01', 'Completed', 1, '2001-07-20', 'Friday 20:00', 'Original', 124.0, 2, 2),
('My Hero Academia', 'https://medium.com/mha.jpg', 'https://large.com/mha.jpg', '僕のヒーローアカデミア', 'My Hero Academia', '2016-04-03', NULL, 'A boy without powers enrolls in a hero academy.', 12, 90, FALSE, '2023-09-01', 'Airing', 137, '2016-04-03', 'Saturday 17:00', 'Manga', 23.4, 1, 1),
('Fullmetal Alchemist: Brotherhood', 'https://medium.com/fma.jpg', 'https://large.com/fma.jpg', '鋼の錬金術師', 'Fullmetal Alchemist: Brotherhood', '2009-04-05', '2010-07-04', 'Two brothers seek the Philosopher\'s Stone.', 4, 95, FALSE, '2023-09-01', 'Completed', 64, '2009-04-05', 'Sunday 17:00', 'Manga', 24.1, 2, 1),
('One Piece', 'https://medium.com/op.jpg', 'https://large.com/op.jpg', 'ワンピース', 'One Piece', '1999-10-20', NULL, 'Pirates search for the One Piece treasure.', 2, 100, FALSE, '2023-09-01', 'Airing', 1076, '1999-10-20', 'Sunday 09:30', 'Manga', 22.8, 1, 1);


-- Insert into manga table, no need to insert id_manga
INSERT INTO manga (title, medium_picture, large_picture, japan_name, english_name, start_date, end_date, synopsis, rank_, popularity, nsfw, updated_at, id_status, id_media) VALUES
('Naruto', 'https://medium.com/naruto.jpg', 'https://large.com/naruto.jpg', 'ナルト', 'Naruto', '1999-09-21', '2014-11-10', 'A boy with a demon fox seeks to become the Hokage.', 6, 98, FALSE, '2023-09-01', 2, 1),
('Bleach', 'https://medium.com/bleach.jpg', 'https://large.com/bleach.jpg', 'ブリーチ', 'Bleach', '2001-08-07', '2016-08-22', 'A boy gains powers to fight evil spirits.', 9, 85, FALSE, '2023-09-01', 2, 1),
('Attack on Titan', 'https://medium.com/aot_manga.jpg', 'https://large.com/aot_manga.jpg', '進撃の巨人', 'Attack on Titan', '2009-09-09', '2021-04-09', 'Humans vs Titans.', 2, 99, FALSE, '2023-09-01', 2, 1),
('Tokyo Ghoul', 'https://medium.com/tokyo_ghoul.jpg', 'https://large.com/tokyo_ghoul.jpg', '東京喰種', 'Tokyo Ghoul', '2011-09-08', '2014-09-18', 'A boy becomes half-ghoul and struggles with his new identity.', 10, 90, TRUE, '2023-09-01', 2, 1),
('Demon Slayer', 'https://medium.com/ds.jpg', 'https://large.com/ds.jpg', '鬼滅の刃', 'Demon Slayer', '2016-02-15', '2020-05-18', 'A boy seeks revenge against demons.', 3, 97, FALSE, '2023-09-01', 2, 1);


-- Insert into anime_link table, no need to insert id_link
INSERT INTO anime_link (personnal_status, score, total_rewatches, episode_progress, start_date, end_date, commentary, favorite, status, id_anime, id_users) VALUES
('Watching', 9.5, 1, 12, '2023-05-01', NULL, 'Amazing so far!', TRUE, 'Airing', 1, 1),
('Completed', 10.0, 3, 87, '2016-07-01', '2023-06-30', 'One of the best animes ever.', TRUE, 'Completed', 4, 2),
('On-Hold', 8.0, 0, 20, '2022-01-01', NULL, 'Will get back to it later.', FALSE, 'On-Hold', 5, 3),
('Completed', 9.0, 2, 64, '2018-05-10', '2019-04-15', 'Epic adventure.', TRUE, 'Completed', 4, 4),
('Dropped', 5.0, 0, 15, '2020-09-01', '2021-01-01', 'Not my style.', FALSE, 'Dropped', 3, 5);


-- Insert into manga_link table, no need to insert id_link
INSERT INTO manga_link (personnal_status, score, commentary, favorite, status, id_users, id_manga) VALUES
('Completed', 9.0, 'Great story!', TRUE, 'Completed', 1, 1),
('Reading', 8.5, 'Still going strong.', TRUE, 'Reading', 2, 3),
('On-Hold', 7.0, 'Will continue later.', FALSE, 'On-Hold', 3, 2),
('Completed', 10.0, 'Masterpiece!', TRUE, 'Completed', 4, 5),
('Dropped', 4.5, 'Not my favorite.', FALSE, 'Dropped', 5, 4);


-- Insert into creer table, no need to insert id_creer
INSERT INTO creer (id_anime, id_studio) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 4),
(5, 3);


-- Insert into contient table, no need to insert id_contient
INSERT INTO contient (id_anime, id_genre) VALUES
(1, 1),
(2, 4),
(3, 1),
(4, 1),
(5, 2);





