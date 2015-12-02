class Category < ActiveRecord::Base
  has_many :articles, class_name: "Article", foreign_key: "category_id"
end