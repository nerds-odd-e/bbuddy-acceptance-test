require 'active_record'
ActiveRecord::Base.pluralize_table_names = false
ActiveRecord::Base.establish_connection(
    adapter:  'mysql2',
    host:     'localhost',
    username: 'nerd',
    password: 'dbs3cr3t',
    database: 'bbuddytest'
)