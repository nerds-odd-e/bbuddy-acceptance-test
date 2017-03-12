require_relative('../data/authentication')
require_relative('../server/rails_server')

start_server

at_exit do
  stop_server
end

Before do |scenario|
  DatabaseCleaner.clean!
end

Before ('@login') do
  LoginPage.open.login(default_user.save)
end

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end

