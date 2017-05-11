Given(/^there is a user (email "[^"]*" and password "[^"]*")$/) do |user|
  user.save
end

When(/^login with user (email "[^"]*" and password "[^"]*")$/) do |user|
  LoginPage.open.login(user)
end

Then(/^login failed$/) do
  LoginPage.new.assert_login_failed
end

Then(/^there is an error message for empty ([^"]*)$/) do |field_name|
  wait_for_text("#{field_name} may not be empty")
end

Then(/^there is an error message for ([^"]*) can't be longer than ([^"]*)$/) do |field_name, max_size|
  wait_for_text("#{field_name} size must be between 0 and #{max_size}")
end
