CREATE TABLE if not EXISTS genres(
	id SERIAL PRIMARY KEY,
	name VARCHAR (120) NOT null
);

CREATE TABLE if not EXISTS musicians(
	id SERIAL PRIMARY KEY,
	name VARCHAR (120) NOT NULL
);

CREATE TABLE if not EXISTS musician_genres(
	genre_id INTEGER REFERENCES genres(id),
	musucian_id INTEGER REFERENCES musicians(id),
	PRIMARY KEY (genre_id, musucian_id)
); 

CREATE TABLE if not EXISTS albums(
	id SERIAL PRIMARY KEY,
	name VARCHAR (120) NOT NULL,
	release_date DATE
);

CREATE TABLE if not EXISTS albums_musicians(
	album_id INTEGER references albums(id),
	musucian_id INTEGER references musicians(id),
	PRIMARY KEY (album_id, musucian_id)
);

CREATE TABLE if not EXISTS collections(
	id SERIAL PRIMARY KEY,
	name VARCHAR (120) NOT NULL,
	created_at DATE
);

CREATE TABLE if not EXISTS tracks(
	id SERIAL PRIMARY KEY,
	name VARCHAR (120) NOT null,
	duration_in_sec INTEGER, 
	album_id INTEGER references albums(id),
	collection_id INTEGER references collections(id)
);

CREATE TABLE if not EXISTS collections_tracks(
	collection_id INTEGER references collections(id),
	track_id INTEGER references tracks(id),
	PRIMARY KEY (collection_id, track_id)
);
