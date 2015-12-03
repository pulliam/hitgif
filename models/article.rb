require 'active_record'
require_relative '../db/config.rb'

class Article < ActiveRecord::Base
  belongs_to :user 
  belongs_to :category 
end