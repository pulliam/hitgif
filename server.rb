module App

  class Server < Sinatra::Base
    set :method_override, true
    enable :sessions  

      def markdown(article)
         Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(article)
      end

   	get "/" do
   		erb :index
   	end

   	get "/articles" do
   		@articles = Article.all
         @articles = @articles.sort {|a,b| b[:time_created] <=> a[:time_created]}
   		erb :articles
   	end

      get "/articles/abc" do
         @articles = Article.all
         @articles = @articles.sort {|a,b| a[:name] <=> b[:name]}
         erb :articles
      end

   	get "/categories" do
   		@categories = Category.all
   		erb :categories
   	end

   	get "/article/:id" do
         @user = User.find(session[:user_id]) if session[:user_id]
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
   		erb :mypage
   	end

   	post "/postlogin" do
   		@user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
   		if @user
            session[:user_id] = @user.id
            session[:user_name] = @user.name
      		redirect to ("/articles/user/#{@user.id}")
         else
            redirect to "/login"
         end
   	end

   	get "/signup" do
   		erb :sign_up
   	end

   	post "/enroll" do
   		newuser = User.create(name: params["name"], email: params["email"], username: params["username"], password: params["password"], password_confirmation: params["password_confirmation"])
   		@myarticles = newuser.articles
         session[:user_id] = newuser.id
         session[:user_name] = newuser.name
   		redirect to ("/articles/user/#{newuser.id}")
   	end

   	get "/new" do
   		erb :articles_new
   	end

      post "/article" do
         Article.create(name: params["title"], content: params["content"], time_created: DateTime.now, category_id: params["category"], user_id: session[:user_id])
         redirect to '/articles'
      end

   	get "/edit/:id" do
         @article = Article.find(params[:id])
   		erb :articles_edit
   	end

      post "/edit/:id" do
         redirect to "/article/#{params[:id]}"
      end

      delete "/article/:id" do
         Article.find(params[:id]).destroy
         redirect to '/articles'
      end

      delete "/logout" do
         session[:user_id] = nil
         redirect to '/' 
      end
  end
end