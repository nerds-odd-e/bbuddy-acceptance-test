require_relative('../data/authentication')
require_relative('../server/rails_server')
require_relative('../data/database_cleaner')

start_server

at_exit do
  stop_server
end

Before ('@login') do
  page(LoginPage).login(default_user.save)
end