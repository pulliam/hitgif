require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'database.db'
)

Dir.glob("models/*.rb").each do |path|
  require_relative "../#{path}"
end 