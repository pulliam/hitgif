require_relative 'config'
require 'date'

users = [
	{
		name: 'Thais Pulliam', 
		email: 'thais@thais.co', 
		username: 'pulliam', 
		password: ''
	},
	{
		name: 'Chris Pulliam', 
		email: 'chris@appboy.com', 
		username: 'chris', 
		password: ''
	},
	{
		name: 'Spotty Puppy', 
		email: 'dogsdonthave@emails.com', 
		username: 'spotty', 
		password: ''
	}
]

User.create(users)

articles = [
	{
		name: 'American Football', 
		content: 'The Seattle Seahawks are a professional American football franchise based in Seattle, Washington. They are members of the West division of the National Football Conference (NFC) in the National Football League (NFL). The Seahawks joined the NFL in 1976 as an expansion team along with the Tampa Bay Buccaneers. The Seahawks are owned by Microsoft co-founder Paul Allen and are currently coached by Pete Carroll. Since 2002, the Seahawks have played their home games at CenturyLink Field (formerly Qwest Field), located south of downtown Seattle. The Seahawks previously played home games in the Kingdome (1976–1999) and Husky Stadium (1994, 2000–2001).', 
		user_id: 2, 
		category_id: 1, 
		time_created: DateTime.now
	},
	{
		name: 'Arachnophobia', 
		content: 'People (or DOGS?) with arachnophobia tend to feel uneasy in any area they believe could harbor spiders or that has visible signs of their presence, such as webs. If arachnophobics see a spider, they may not enter the general vicinity until they have overcome the panic attack that is often associated with their phobia. Some people scream, cry, jump from moving cars, experience trouble breathing, sweating or even heart palpitations when they come in contact with an area near spiders or their webs. In some extreme cases, even a picture or a realistic drawing of a spider can also trigger fear.', 
		user_id: 3, 
		category_id: 3, 
		time_created: DateTime.now
	},
	{
		name: 'How to learn SQL?', 
		content: 'SQL (pronounced ess-que-el) stands for Structured Query Language. SQL is used to communicate with a database. According to ANSI (American National Standards Institute), it is the standard language for relational database management systems. SQL statements are used to perform tasks such as update data on a database, or retrieve data from a database. Some common relational database management systems that use SQL are: Oracle, Sybase, Microsoft SQL Server, Access, Ingres, etc. Although most database systems use SQL, most of them also have their own additional proprietary extensions that are usually only used on their system. However, the standard SQL commands such as "Select", "Insert", "Update", "Delete", "Create", and "Drop" can be used to accomplish almost everything that one needs to do with a database. This tutorial will provide you with the instruction on the basics of each of these commands as well as allow you to put them to practice using the SQL Interpreter.', 
		user_id: 1, 
		category_id: 2, 
		time_created: DateTime.now
	}
]

Article.create(articles)

categories =  [
	{name: 'Sports'},
	{name: 'Education'},
	{name: 'Lifestyle'},
]

Category.create(categories)
