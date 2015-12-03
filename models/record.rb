require 'active_record'
require_relative '../db/config.rb'

class Record < ActiveRecord::Base
  belongs_to :user 
  belongs_to :category 
  has_and_belongs_to_many :articles
end