When(/^delete this account$/) do
  step 'show all accounts'
  AccountsPage.open.delete_account(@current_account)
end
