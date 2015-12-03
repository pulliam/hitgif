require 'active_record'
require_relative '../db/config.rb'

class Article < ActiveRecord::Base
  belongs_to :user 
  belongs_to :category 
  has_and_belongs_to_many :records

  	def old_entries
		@old_entries = self.records
	end
end