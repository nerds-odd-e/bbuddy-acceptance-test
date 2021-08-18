module Database
  def self.connect_db
    unless ActiveRecord::Base.connected?
      ActiveRecord::Base.establish_connection(
        adapter: 'mysql2',
        host: '127.0.0.1',
        username: 'nerd',
        password: 'dbs3cr3t',
        database: 'bbuddy_api_test'
      )
    end
  end
end