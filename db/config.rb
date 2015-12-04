require 'active_record'
require 'bcrypt'
require 'redcarpet'
require 'redcarpet/compat'
require 'byebug'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'db/database.sqlite3'
)

Dir.glob('models/*.rb').each do |path|
  require_relative "../#{path}"
end
