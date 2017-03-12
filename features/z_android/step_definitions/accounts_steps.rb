When(/^delete this account$/) do
  step 'show all accounts'
  AccountsPage.open.go_to_edit_account(@current_account).delete_account
end
