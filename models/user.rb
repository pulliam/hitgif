class User < ActiveRecord::Base
  has_many :articles, class_name: "Article", foreign_key: "user_id" 
end