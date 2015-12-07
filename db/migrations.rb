require_relative "migrations/create_tables"

CreateUsers.migrate(ARGV[0])
CreateCategories.migrate(ARGV[0])
CreateArticles.migrate(ARGV[0])
CreateRecords.migrate(ARGV[0])