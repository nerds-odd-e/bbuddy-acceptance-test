require 'active_record'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

module Database
  def self.prepare
    self.connect_db
    DatabaseCleaner.clean
  end

  def self.connect_db
    ActiveRecord::Base.pluralize_table_names = false
    unless ActiveRecord::Base.connected?
      ActiveRecord::Base.establish_connection(
        adapter: 'mysql2',
        host: '127.0.0.1',
        username: 'nerd',
        password: 'dbs3cr3t',
        database: 'bbuddytest'
      )
    end
  end

  def self.stop
  end
end