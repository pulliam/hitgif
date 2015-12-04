require 'active_record'
require 'bcrypt'
require 'redcarpet'
require 'redcarpet/compat'
require 'byebug'

if ENV['RACK_ENV'] == "production"
  require 'uri'
   db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')
   ActiveRecord::Base.establish_connection({
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  })
else
ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'db/database.sqlite3'
)
end

Dir.glob('models/*.rb').each do |path|
  require_relative "../#{path}"
end
