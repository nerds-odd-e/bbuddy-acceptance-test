Given(/^there is a user email "([^"]*)" and password is "([^"]*)"$/) do |email, password|
  create_user(email, password)
end

When(/^login with user email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  page(LoginPage).login(User.new(email, password))
end

Then(/^login successfully$/) do
  page(DashboardPage).assert_in_current_page
end

Then(/^login failed$/) do
  page(LoginPage).assert_login_failed
end