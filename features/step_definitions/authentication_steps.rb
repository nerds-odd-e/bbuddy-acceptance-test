Given(/^there is a user email "([^"]*)" and password is "([^"]*)"$/) do |email, password|
end

When(/^login with user email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  wait_for_element_exists "* id:'email'"
  enter_text("* id:'email'", email)
  wait_for_element_exists "* id:'password'"
  enter_text("* id:'password'", password)
  touch("* id:'email_sign_in_button'")
end

Then(/^login successfully$/) do
  wait_for_text "success"
end