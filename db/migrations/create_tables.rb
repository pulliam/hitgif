require_relative "../config"

class CreateUsers < ActiveRecord::Migration
	def up
		create_table :users do |t|
			t.string(:name)
			t.string(:email)
			t.string(:username)
			t.string(:password_digest)
			t.string :about_me, :default => "empty"
		end
	end
	def down
		drop_table :users
	end
end



class CreateCategories < ActiveRecord::Migration
	def up
		create_table :categories do |t|
			t.string(:name)
		end
	end
	def down
		drop_table :categories
	end
end


class CreateArticles < ActiveRecord::Migration
	def up
		create_table :articles do |t|
			t.string(:name)
			t.string(:content)
			t.integer(:user_id)
			t.integer(:category_id)
			t.datetime(:time_created)
			t.string :gif, :default => "empty"
		end
	end
	def down
		drop_table :articles
	end
end



class CreateRecords < ActiveRecord::Migration
	def up
		create_table :records do |t|
			t.string(:name)
			t.string(:content)
			t.integer(:user_id)
			t.integer(:category_id)
			t.datetime(:time_created)
			t.integer(:article_id)
			t.string :gif, :default => "empty"
		end
	end
	def down
		drop_table :records
	end
end

