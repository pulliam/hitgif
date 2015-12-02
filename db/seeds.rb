require_relative 'config'

users = [
	{name: , email: , username: , password: },
	{name: , email: , username: , password: },
	{name: , email: , username: , password: }
]

User.create(users)

articles = [
	{name: , content: , user_id: , category_id: , time_created: },
	{name: , content: , user_id: , category_id: , time_created: },
	{name: , content: , user_id: , category_id: , time_created: }
]

Article.create(articles)

categories =  [
	{name: },
	{name: },
	{name: },
]

Category.create(categories)
