Given(/^exists the following accounts$/) do |table|
  table.hashes.each do |account|
    Account.create(name: account['name'], balance: account['balance brought forward'])
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

Then(/^you will see all accounts as below$/) do |table|
  wait_for_element_exists "* id:'tabLayout'"
  table.hashes.each do |account|
    wait_for_text account['name']
    wait_for_text account['balance brought forward']
  end
end