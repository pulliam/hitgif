class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :records
end
