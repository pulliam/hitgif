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

   	get "/articles/user/:id" do
   		user = User.find(params[:id])
   		@myarticles = user.articles 
   		erb :myarticles
   	end

   	post "/starter" do
   		user = User.find_by(username: params[:username])
   		session[:user_id] = user.id
   		redirect to ("/articles/user/#{user.id}")
   	end

   	get "/signup" do
   		erb :sign_up
   	end

   	post "/enroll" do
   		newuser = User.create(name: params["name"], email: params["email"], username: params["username"], password: params["password"])
   		@myarticles = newuser.articles
   		redirect to ("/articles/user/#{newuser.id}")
   	end

   	get "/new" do
   		erb :articles_new
   	end

      post "/article" do
         Article.create(name: params["title"], content: params["content"], time_created: DateTime.now, category_id: params["category"], user_id: session[:user_id])
         erb :articles_new
      end

   	get "/edit" do
   		erb :articles_edit
   	end

      post "/editarticle" do
         erb :articles_edit
      end

      delete "/article" do
         erb :articles_edit
      end


  end
end