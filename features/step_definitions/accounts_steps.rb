Given(/^exists the following accounts$/) do |table|
  table.hashes.each do |account|
    Account.create(name: account['name'], balance: account['balance brought forward'])
    @current_name = account['name']
    @current_balance_brought_forward = account['balance brought forward']
  end
end

When(/^show all accounts$/) do
  touch("* marked:'Accounts'")
end

When(/^add account as below$/) do |table|
  step 'show all accounts'
  table.hashes.each do |account|
    touch("* marked:'Add'")
    enter_text("* id:'name'", account['name'])
    enter_text("* id:'balanceBroughtForward'", account['balance brought forward'])
    touch("* marked:'Confirm'")
  end
end

When(/^edit account as name "([^"]*)" and balance brought forward (\d+)$/) do |name, balance_brought_forward|
  step 'show all accounts'
  touch("* marked:'#{@current_name} #{@current_balance_brought_forward}'")
  touch("* id:'name'")
  clear_text("* id:'name'")
  enter_text("* id:'name'", name)
  touch("* id:'balanceBroughtForward'")
  clear_text("* id:'balanceBroughtForward'")
  enter_text("* id:'balanceBroughtForward'", balance_brought_forward)
  touch("* marked:'Update'")
end

Then(/^you will see all accounts as below$/) do |table|
  wait_for_element_exists "* id:'tabLayout'"
  table.hashes.each do |account|
    wait_for_text account['name']
    wait_for_text account['balance brought forward']
  end
end