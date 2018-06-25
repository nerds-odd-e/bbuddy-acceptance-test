Transform /^email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  {email: email, password: password}
end
