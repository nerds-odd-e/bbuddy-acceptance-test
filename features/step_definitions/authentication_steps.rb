Given(/^there is a user (email "[^"]*" and password "[^"]*")$/) do |user|
  user.save
end

When(/^login with user (email "[^"]*" and password "[^"]*")$/) do |user|
  page(LoginPage).login(user)
end

Then(/^login successfully$/) do
  page(DashboardPage).assert_in_current_page
end

Then(/^login failed$/) do
  page(LoginPage).assert_login_failed
end