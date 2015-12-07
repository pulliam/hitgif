require_relative "migrations/create_articles"
require_relative "migrations/create_categories"
require_relative "migrations/create_records"
require_relative "migrations/create_users"

CreateUsers.migrate(ARGV[0])
CreateCategories.migrate(ARGV[0])
CreateArticles.migrate(ARGV[0])
CreateRecords.migrate(ARGV[0])