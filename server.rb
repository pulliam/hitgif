require 'sinatra'
require 'better_errors'
require 'pry'

module App
  class Server < Sinatra::Base
    set :method_overide, true 
	enable :sessions # Enable sessions creation for logins

	require "better_errors"
    	configure :development do
      	use BetterErrors::Middleware
      	BetterErrors.application_root = __dir__
    end

	def markdown(text) # Define method markdown with redcarpet gem
		Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text)
	end

	get "/" do # Request main page
		@message = params[:message]
		erb :'main/index'
	end

	get "/articles" do # Request list of all articles
		@articles = Article.all
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

	post "/article/update/:id" do # Updates a specific article
		article = Article.find(params["id"])
		article.update({ name: params["name"], content: params["content"], time_created: DateTime.now, category_id: params["category"], user_id: session[:user_id] })
		record = Record.create({ name: params["name"], content: params["content"], time_created: DateTime.now, category_id: params["category"], user_id: session[:user_id], article_id: article.id } )
		redirect to "/articles/#{article.id}"
	end

	post "/article/delete/:id" do # Deletes an article only if creator of the same is the logged user
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
			redirect to "/?message=Log%20In%20Successful"
		else
			redirect to "/login?message=Wrong%20Password%20Please%20Try%20Again."
		end
	end

	post "/sessions/delete" do # Deletes a session, logging out the user
		session[:user_id] = nil
		redirect to "/"
	end

	get "/users/articles/:id" do # Request page of logged user, with articles created by the same
		user = User.find(params[:id])
		@user_articles = user.articles
		erb :'sessions/user_account'
	end

	get "/users" do # Request page of all registered users.
		@users = User.all
		erb :'sessions/users'
	end

	get "/users/:id" do # Request page of all registered users.
		redirect to "/" if !session[:user_id]
      	Visit.create({ visited_id: params[:id], visitor_id: session[:user_id], created_at: DateTime.now})
      	@user = User.find(params[:id])
		erb :'sessions/user'
	end

	get "/users/visits" do # Request page of all registered users.
		@visits = User.find(session[:user_id]).visits
		@users = User.all
		erb :'sessions/visits'
	end

	get "/register" do # Request form to register new user
		@message = params[:message]
		erb :'sessions/signup'
	end

	post "/users" do # Registers new user
		if params["password"] == params["password_confirmation"] && !params["password"].empty?
		new_user = User.create( {name: params["name"], email: params["email"], username: params["username"], password: params["password"], password_confirmation: params["password_confirmation"]} )
		session[:user_id] = new_user.id #Logs in the new user
		session[:user_name] = new_user.name
		redirect to "/?message=Registered%20Successfully!%20Welcome!" #Redirects to User Page
		else 
		redirect to "/register?message=Wrong%20Password%20Confirmation" 
		end
	end
  end
end
