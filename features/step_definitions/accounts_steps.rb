Given(/^exists the following accounts$/) do |accounts|
  accounts.each do |account|
    @current_account = account
    account.save
  end
end

When(/^show all accounts$/) do
  DashboardPage.open.go_to_accounts
end

When(/^add account as below$/) do |accounts|
  step 'show all accounts'
  accounts.each { |account| AccountsPage.open.go_to_add_account.add_account(account) }
end

When(/^edit account as (name \w+ and balance \d+)$/) do |account|
  step 'show all accounts'
  AccountsPage.open.go_to_edit_account(@current_account).edit_account(account)
end

When(/^delete this account$/) do
  step 'show all accounts'
  AccountsPage.open.go_to_edit_account(@current_account).delete_account
end

Then(/^you will not see it in the list$/) do
  AccountsPage.open.assert_account_does_not_exist(@current_account)
end

Then(/^you will see all accounts as below$/) do |accounts|
  accounts.each { |account| AccountsPage.open.assert_account_exists(account) }
end