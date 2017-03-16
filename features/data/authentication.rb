Transform /^email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  User.new(email: email, password: password)
end
