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
