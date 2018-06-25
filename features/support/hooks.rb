require_relative('../data/authentication')

# start_server
#
# at_exit do
#   stop_server
# end

Before do |scenario|
  DatabaseCleaner.clean!
end

Before ('@login') do
  user = {email: "joseph.yao.ruozhou@gmail.com", password: "123456"}
  Api.new.sign_up(user)
  LoginPage.open.login(OpenStruct.new(user))
end

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end

