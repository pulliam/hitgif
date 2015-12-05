require_relative "../config"

class CreateUsers < ActiveRecord::Migration
	def up
		create_table :users do |t|
			t.string(:name)
			t.string(:email)
			t.string(:username)
			t.string(:password_digest)
		end
	end
	def down
		drop_table :users
	end
end

CreateUsers.migrate(:up)

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

CreateCategories.migrate(:up)

class CreateArticles < ActiveRecord::Migration
	def up
		create_table :articles do |t|
			t.string(:name)
			t.string(:content)
			t.integer(:user_id)
			t.integer(:category_id)
			t.datetime(:time_created)
		end
	end
	def down
		drop_table :articles
	end
end

CreateArticles.migrate(:up)

class CreateRecords < ActiveRecord::Migration
	def up
		create_table :records do |t|
			t.string(:name)
			t.string(:content)
			t.integer(:user_id)
			t.integer(:category_id)
			t.datetime(:time_created)
			t.integer(:article_id)
		end
	end
	def down
		drop_table :records
	end
end

CreateRecords.migrate(:up)

class CreateVisits < ActiveRecord::Migration
	def up
		create_table :visits do |t|
			t.integer(:visited_id)
			t.integer(:visitor_id)
			t.datetime(:created_at)
		end
	end

	def down
		drop_table :visits
	end
end

CreateVisits.migrate(:up)