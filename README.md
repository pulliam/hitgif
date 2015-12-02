# Wiki App
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

### Wiki App::Nouns
- Users (== Authors?)
- Articles
- Date/Time of Creations
- Categories
- E-mail/contact of user/username
- Passwords
- Forms for receiving informations

### Wiki App::Verbs
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

### Wiki App::Associations
- Users (Unique)
- Users have Articles
- Articles have Categories
- Articles have time/date
- Articles belongs to a user

### Wiki App::ERD
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

### Wiki App::DatabaseSchema

### Wiki App::ActiveRecordClasses

### Wiki App::ActiveRecordAssociations


