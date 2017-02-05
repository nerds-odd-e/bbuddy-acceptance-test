Given(/^there is a user (email "[^"]*" and password "[^"]*")$/) do |user|
  user.save
end

When(/^login with user (email "[^"]*" and password "[^"]*")$/) do |user|
  open(LoginPage).login(user)
end

Then(/^login successfully$/) do
  open(DashboardPage).assert_in_current_page
end

Then(/^login failed$/) do
  open(LoginPage).assert_login_failed
end