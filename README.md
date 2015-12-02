# Wekiwi

## User Stories
Welcome to Wikiwi.
We are a plataform where you can delight youself in cool articles written by anyone in the world. 
Whats cool about it? You can see all versions of the same articles, compare different points of view from the respective authors, and even create your own version, or better! Update an existing version, with your own improvements! 
To get started, all you need to do is sign up to our page by providing your name, your chosen username and password; Then you are ready to go! You can interact with other users by editing their articles, you can create a new article and select a category for it, and you can search through our huge library of collaborative articles and learn about all sorts of subjects!
And if you are a design oriented person and enjoy a well written, good looking text, you will love our markdown feature, where you can create articles that will look just as good as a kiwi! 
For any aditional information, you can loop through this documentation of the elaboration of the app. 
Welcome to Wekiwi!

## Description
Wikiwi is an article's sharing application. It's designed to have users that can login, logout, sign up, so when they are logged in (a session is existent), they are able to create new articles, edit existent ones and even delete it. The articles display which author (user) was it's creator, and the articles are separated in categories pre determinated. A time information should be created and stored when a new article is created or edited and associated with it. The users can acces old records of the same article, by clicking in older ones. The users should be able to create new articles in markdown language, and select the category of their article. 

## ERD
<img width="1201" alt="screen shot 2015-12-02 at 1 55 20 pm" src="https://cloud.githubusercontent.com/assets/14362520/11545213/f64fc2c2-9913-11e5-99f3-076e220956a6.png">
<img width="823" alt="screen shot 2015-12-02 at 3 02 56 pm" src="https://cloud.githubusercontent.com/assets/14362520/11545229/1ceb0784-9914-11e5-9ec5-41907fccff34.png">
<img width="686" alt="screen shot 2015-12-01 at 9 31 27 pm" src="https://cloud.githubusercontent.com/assets/14362520/11521840/89794df2-987e-11e5-9b96-68189d93b87d.png">

### Active Record Models
```
class User < ActiveRecord::Base
end

class Category < ActiveRecord::Base
end

class Article < ActiveRecord::Base
end
```

### Wireframes

[View It Here](https://moqups.com/thaispulliam@gmail.com/iAkGwx6V/p:a9bd3c21b)<br>
<img width="350" alt="screen shot 2015-12-01 at 9 31 27 pm" src="https://cloud.githubusercontent.com/assets/14362520/11544577/9db850e6-9910-11e5-92de-e9eb0cd8a335.png">
<img width="350" alt="screen shot 2015-12-01 at 9 31 27 pm" src="https://cloud.githubusercontent.com/assets/14362520/11544578/9db9f716-9910-11e5-8a1e-e578cf9c4c0a.png">
<img width="350" alt="screen shot 2015-12-01 at 9 31 27 pm" src="https://cloud.githubusercontent.com/assets/14362520/11544579/9dbce642-9910-11e5-9755-8884c4921399.png">
<img width="350" alt="screen shot 2015-12-01 at 9 31 27 pm" src="https://cloud.githubusercontent.com/assets/14362520/11544582/9dc4806e-9910-11e5-90c6-dcf62057405e.png">
<img width="350" alt="screen shot 2015-12-01 at 9 31 27 pm" src="https://cloud.githubusercontent.com/assets/14362520/11544581/9dc2384a-9910-11e5-880e-eedcdd38c3f2.png">
<img width="350" alt="screen shot 2015-12-01 at 9 31 27 pm" src="https://cloud.githubusercontent.com/assets/14362520/11544580/9dbe1af8-9910-11e5-9cd9-73c86f7e3049.png">
<img width="350" alt="screen shot 2015-12-01 at 9 31 27 pm" src="https://cloud.githubusercontent.com/assets/14362520/11544583/9dc4e3e2-9910-11e5-81c3-428341b3755d.png">

### Nouns
- Users (== Authors?)
- Articles
- Date/Time of Creations
- Categories
- E-mail/contact of user/username
- Passwords
- Forms for receiving informations

### Verbs
- Create new user (Sign Up)
- Check if user exists (Sign In) => enter page
- Log out
- Create (article)
- Associate this Article to an user
- Create & Associate Date & Time of Article
- Create a Category (or Associate)
- Show (read) all articles
- Show (read) all categories
- Show (read) all users
- Delete an article 
- Update an article 
- Update a Category

### Associations
- Users (Unique)
- Users have Articles
- Articles have Categories
- Articles have time/date
- Articles belongs to a user

### Database Schema
```
CREATE TABLE users (
	id INTEGER PRIMARY KEY,
	name VARCHAR,
	username VARCHAR(20),
	password INTEGER
	);

CREATE TABLE categories (
	id INTEGER PRIMARY KEY,
	name VARCHAR,
	articles_on_this INTEGER
	);

CREATE TABLE articles (
	id INTEGER PRIMARY KEY,
	name VARCHAR,
	content TEXT,
	time_created VARCHAR,
	day_created DATE,
	from_who INTEGER,
	category INTEGER
	);

CREATE TABLE articles_users (
	user_id INTEGER,
	articles_id INTEGER
	);

```
