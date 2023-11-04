CREATE TABLE IF NOT EXISTS track 
(
	track_id SERIAL PRIMARY KEY,
	NAME VARCHAR(60) NOT NULL,
	duration INTEGER CHECK (duration > 0),
	album INTEGER FOREIGN KEY
);

CREATE TABLE IF NOT EXISTS collection
(
	collection_id SERIAL PRIMARY KEY,
	NAME VARCHAR(60)NOT NULL UNIQUE,
	years_collection INTEGER NOT NULL CHECK (years_collection > 1900)
);

CREATE TABLE IF NOT EXISTS collection_track
(
	track_id INTEGER REFERENCES track(track_id),
	collection_id INTEGER REFERENCES collection(collection_id),
	CONSTRAINT pk PRIMARY KEY(track_id, collection_id)
);

CREATE TABLE IF NOT EXISTS album
(
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	years_album INTEGER
);

CREATE TABLE IF NOT EXISTS artist
(
	artist_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL UNIQUE,
);

CREATE TABLE IF NOT EXISTS style
(
	style_id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	artist_list VARCHAR REFERENCES artist_id
);

CREATE TABLE IF NOT EXISTS album_artist
(
	album_id INTEGER REFERENCES album(album_id),
	artist_id INTEGER REFERENCES artist(artist_id),
	CONSTRAINT pk PRIMARY KEY(album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS artist_style
(
	artist_id INTEGER REFERENCES artist(artist_id),
	style_id INTEGER REFERENCES Style(style_id),
	CONSTRAINT pk PRIMARY KEY(artist_id, style_id)
);