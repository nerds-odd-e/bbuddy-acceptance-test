require 'rest-client'

Given(/^there is a user email "([^"]*)" and password is "([^"]*)"$/) do |email, password|
  RestClient.post("http://localhost:4000/auth",
                  {
                      "email" => email,
                      "password" => password
                  }
  )
end

When(/^login with user email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  wait_for_element_exists "* id:'email'"
  enter_text("* id:'email'", email)
  wait_for_element_exists "* id:'password'"
  enter_text("* id:'password'", password)
  touch("* id:'email_sign_in_button'")
end

Then(/^login successfully$/) do
  wait_for_text "Accounts"
end

Then(/^login failed$/) do
  wait_for_text "failed"
end