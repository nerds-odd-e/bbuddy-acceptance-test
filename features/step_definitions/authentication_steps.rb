Given(/^there is a user (email "[^"]*" and password "[^"]*")$/) do |user|
  user.save
end

When(/^login with user (email "[^"]*" and password "[^"]*")$/) do |user|
  LoginPage.open.login(user)
end

Then(/^login successfully$/) do
  DashboardPage.assert_is_current_page
end

Then(/^login failed$/) do
  LoginPage.open.assert_login_failed
end