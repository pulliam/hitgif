CREATE TABLE users (
	id INTEGER PRIMARY KEY,
	name VARCHAR,
	email TEXT,
	username VARCHAR(20),
	password INTEGER
	);

CREATE TABLE categories (
	id INTEGER PRIMARY KEY,
	name VARCHAR,
	);

CREATE TABLE articles (
	id INTEGER PRIMARY KEY,
	name VARCHAR(200),
	content TEXT,
	user_id INTEGER,
	category_id INTEGER,
	time_created DATETIME, 
	);
