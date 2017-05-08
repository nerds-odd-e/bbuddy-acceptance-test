Given(/^there is a user (email "[^"]*" and password "[^"]*")$/) do |user|
  user.save
end

When(/^login with user (email "[^"]*" and password "[^"]*")$/) do |user|
  LoginPage.open.login(user)
end

Then(/^login failed$/) do
  LoginPage.new.assert_login_failed
end

Then(/^there is an error message for empty email$/) do
  LoginPage.new.assert_message_showed('email may not be empty')
end

Then(/^there is an error message for empty password$/) do
end