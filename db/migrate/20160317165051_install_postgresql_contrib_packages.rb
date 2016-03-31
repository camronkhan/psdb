# includes postgresql packages for full text search extensions - trigram, fuzzystrmatch
class InstallPostgresqlContribPackages < ActiveRecord::Migration
  def up
    execute "CREATE EXTENSION IF NOT EXISTS pg_trgm;"
    execute "CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;"
  end

  def down
  	execute "DROP EXTENSION IF EXISTS fuzzystrmatch;"
    execute "DROP EXTENSION IF EXISTS pg_trgm;"
  end
end
