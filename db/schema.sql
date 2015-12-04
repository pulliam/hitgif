DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS articles;
DROP TABLE IF EXISTS records;

CREATE TABLE users (
	id INTEGER PRIMARY KEY,
	name VARCHAR,
	email TEXT,
	username VARCHAR(20),
	password_digest VARCHAR
	);

CREATE TABLE categories (
	id INTEGER PRIMARY KEY,
	name VARCHAR
	);

CREATE TABLE articles (
	id INTEGER PRIMARY KEY,
	name VARCHAR,
	content TEXT,
	user_id INTEGER,
	category_id INTEGER,
	time_created DATETIME 
	);

CREATE TABLE records (
	id INTEGER PRIMARY KEY,
	name VARCHAR,
	content TEXT,
	user_id INTEGER,
	category_id INTEGER,
	time_created DATETIME,
	article_id INTEGER
	);
