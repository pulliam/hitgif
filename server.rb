require 'pry'
require 'sinatra'
require 'byebug'

module App
  class Server < Sinatra::Base
    set :method_overide, true 
	enable :sessions # Enable sessions creation for logins

	def markdown(text) # Define method markdown with redcarpet gem
		Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text)
	end

	get "/" do # Request main page
		# Define if user is logged and which user
		erb :'main/index'
	end

	get "/articles" do # Request list of all articles
		@articles = Article.all.order(name: :asc)
		erb :'articles/index'
	end

	get "/articles/ordered/:order" do # Request all articles by order
		articles = Article.all
		@articles = articles.order(params[:order] => :desc) unless params[:order] == "name"
		@articles = articles.order(params[:order] => :asc) if params[:order] == "name"
		erb :'articles/index'
	end

	get "/articles/:id" do # Request specific article
		@article = Article.find(params[:id])
		@record = @article.records.last
		erb :'articles/show'
	end

	get "/articles/:id/record" do # Request all records of an article
		@article = Article.find(params[:id])
		@records = @article.records.order(time_created: :desc)
		erb :'articles/records/index'
	end

	get "/articles/:id/records/:id_record" do # Request specific record of an article
		@record = Record.find(params[:id_record])
		@article = Article.find(params[:id])
		erb :'articles/records/show'
	end

	get "/article/create" do # Request form to create new article
		erb :'articles/create/article'
	end

	post "/articles" do # Creates new article
		@new_article = Article.create({ name: params["title"], content: params["content"], time_created: DateTime.now, category_id: params["category"], user_id: session[:user_id] })
		Record.create({ name: params["title"], content: params["content"], time_created: DateTime.now, category_id: params["category"], user_id: session[:user_id], article_id: @new_article.id })
		redirect to "/articles"
	end

	get "/articles/update/:id" do # Request form to update an article
		@article = Article.find(params[:id].to_i)
		erb :'articles/update/article'
	end

	patch "/articles/:id" do # Updates a specific article
		article = Article.find(params["id"])
		@record = Record.create( {name: params["name"], content: params["content"], time_created: DateTime.now, category_id: params["category"], user_id: session[:user_id], article_id: article.id } )
		binding.pry
		redirect to "/articles/#{article.id}"
	end

	delete "/article/:id" do # Deletes an article only if creator of the same is the logged user
		article = Article.find(params[:id])
		article.destroy if article.user == $user
		redirect to "/articles"
	end

	get "/categories" do # Request a list of all categories
		@categories = Category.all
		erb :'categories/index'
	end

	get "/categories/articles/:id" do # Request a specific article inside a category
		category = Category.find(params[:id])
		@articles = category.articles
		erb :'categories/show'
	end

	get "/login" do # Request user information for login
		@message = params[:message]
		erb :'sessions/login'
	end

	post "/sessions" do # Log in a user or display error message
		user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
		if user # Authenticates user password
			session[:user_id] = user.id # Start session
			session[:user_name] = user.name
			redirect to "/login?message=Log%20In%20Successful"
		else
			redirect to "/login?message=Wrong%20Password%20Please%20Try%20Again."
		end
	end

	delete "/sessions" do # Deletes a session, logging out the user
		session[:user_id] = nil
		redirect to "/"
	end

	get "/users/articles/:id" do # Request page of logged user, with articles created by the same
		user = User.find(params[:id])
		@user_articles = user.articles
		erb :'sessions/user'
	end

	get "/register" do # Request form to register new user
		erb :'sessions/signup'
	end

	post "/users" do # Registers new user
		new_user = User.create( {name: params["name"], email: params["email"], username: params["username"], password: params["password"], password_confirmation: params["password_confirmation"]} )
		session[:user_id] = new_user.id #Logs in the new user
		session[:user_name] = new_user.name
		@user_articles = new_user.articles
		redirect to "/users/articles/#{new_user.id}" #Redirects to User Page
	end
  end
end
