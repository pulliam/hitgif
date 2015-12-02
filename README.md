# Wekiwi
## Description
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus bibendum leo ac est vulputate, nec bibendum dui pulvinar. 
Vivamus euismod, massa at ullamcorper facilisis, nunc odio ullamcorper sem, vel faucibus massa odio quis augue. 
Cras tristique, dolor eget rhoncus congue, velit mi consectetur ligula, ut auctor orci metus eu justo. 
Sed laoreet, arcu consequat gravida fringilla, odio mi dignissim lectus, eget ornare orci nibh eget nibh.

## User Stories
- A user should be able to create and edit articles.
- A user should be able to see all articles that currently exist.
- All articles should be editable 
- All articles should display an author (and maybe his contact/email)
- If an article is updated, the time of that change should be shown.
- Articles should be written in markdown.
- Users can add a category to an article.
- Users can search by category.

## ERD
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

[View It Here](https://moqups.com/thaispulliam@gmail.com/iAkGwx6V/p:a9bd3c21b)
![1](https://cloud.githubusercontent.com/assets/14362520/11544577/9db850e6-9910-11e5-92de-e9eb0cd8a335.png)
![articleid 5](https://cloud.githubusercontent.com/assets/14362520/11544578/9db9f716-9910-11e5-8a1e-e578cf9c4c0a.png)
![articlescategory 4](https://cloud.githubusercontent.com/assets/14362520/11544579/9dbce642-9910-11e5-9755-8884c4921399.png)
![categories 3](https://cloud.githubusercontent.com/assets/14362520/11544582/9dc4806e-9910-11e5-90c6-dcf62057405e.png)
![edit 6](https://cloud.githubusercontent.com/assets/14362520/11544581/9dc2384a-9910-11e5-880e-eedcdd38c3f2.png)
![hello_person 2](https://cloud.githubusercontent.com/assets/14362520/11544580/9dbe1af8-9910-11e5-9cd9-73c86f7e3049.png)
![login 7](https://cloud.githubusercontent.com/assets/14362520/11544583/9dc4e3e2-9910-11e5-81c3-428341b3755d.png)

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
