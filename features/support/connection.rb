ActiveRecord::Base.establish_connection(
    adapter:  'mysql2',
    host:     'localhost',
    username: 'nerd',
    password: 'dbs3cr3t',
    database: 'bbuddy_api_test'
)