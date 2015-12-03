
module App

  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions  

   	get "/" do

   		erb :index
   	end

   	get "/articles" do
   		@articles = Article.all
   		erb :articles
   	end

   	get "/categories" do
   		@categories = Category.all
   		erb :categories
   	end

   	get "/article/:id" do
   		@article = Article.find(params[:id])
   		erb :article
   	end

   	get "/category/:id" do
   		@articles = Category.find(params[:id]).articles
   		erb :articles_at_category
   	end

   	get "/login" do
   		erb :login
   	end

   	post "/starter" do
   		user = User.find_by(username: params[:username])
   		session[:user_id] = user.id
   		redirect to ('/')
   	end

   	get "/signup" do

   		erb :sign_up
   	end

   	get "/new" do

   		erb :articles_new
   	end

   	get "/edit" do

   		erb :articles_edit
   	end


  end
end