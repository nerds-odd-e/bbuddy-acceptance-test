require_relative('../data/authentication')
require_relative('../server/rails_server')
require_relative('../data/database_cleaner')

start_server

at_exit do
  stop_server
end

Before ('@login') do
  create_default_user
  wait_for_element_exists "* id:'email'"
  enter_text("* id:'email'", 'joseph.yao.ruozhou@gmail.com')
  wait_for_element_exists "* id:'password'"
  enter_text("* id:'password'", '123456')
  touch("* id:'email_sign_in_button'")
end