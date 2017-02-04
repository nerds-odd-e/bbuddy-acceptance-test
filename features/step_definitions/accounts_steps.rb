Given(/^exists the following accounts$/) do |table|
  table.hashes.each do |account|
    create_account(account)
    @current_account = account
  end
end

When(/^show all accounts$/) do
  page(DashboardPage).go_to_accounts
end

When(/^add account as below$/) do |table|
  step 'show all accounts'
  table.hashes.each do |account|
    page(AccountsPage).go_to_add_account.add_account(account)
  end
end

When(/^edit account as name "([^"]*)" and balance brought forward (\d+)$/) do |name, balance_brought_forward|
  step 'show all accounts'
  page(AccountsPage).go_to_edit_account(@current_account).edit_account(name, balance_brought_forward)
end

When(/^delete this account$/) do
  step 'show all accounts'
  page(AccountsPage).go_to_edit_account(@current_account).delete_account
end

Then(/^you will not see it in the list$/) do
  page(AccountsPage).assert_account_not_exists(@current_account)
end

Then(/^you will see all accounts as below$/) do |table|
  table.hashes.each do |account|
    page(AccountsPage).assert_account_exists(account)
  end
end