Given(/^exists the following accounts$/) do |table|
end

When(/^show all accounts$/) do
  touch("* marked:'Accounts'")
end

Then(/^you will see all accounts as below$/) do |table|
  table.hashes.each do |account|
    wait_for_text account['name']
    wait_for_text account['balance brought forward']
  end
end